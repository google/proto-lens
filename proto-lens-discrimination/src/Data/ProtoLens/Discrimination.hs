-- | This module implements discriminators of protobufs generically.

{-# LANGUAGE GADTs #-}
{-# LANGUAGE Rank2Types #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Data.ProtoLens.Discrimination
  ( fDescriptor
  , fField
  , fText
  , fByteString

  , protoMapAssocs
  ) where

import Data.Bits ((.|.), shift)
import qualified Data.ByteString as B
import qualified Data.ByteString.Unsafe as B (unsafeIndex)
import Data.Default (Default(def))
import Data.Foldable (foldMap)
import Data.Functor.Contravariant
  ( Contravariant
  , (>$<)
  )
import Data.Discrimination (Group, Sort)
import Data.Functor.Contravariant.Divisible
  ( chosen
  , conquered
  , divided
  , Decidable(choose)
  , Divisible
  )
import Data.Map (Map)
import Data.Word (Word8, Word16)
import qualified Data.Map as M
import qualified Data.Text as T
import Lens.Family2 ((&), (.~), Lens', view)


import Data.ProtoLens.Message
  ( Message(descriptor)
  , MessageDescriptor(fieldsByTag)
  , FieldDescriptor(FieldDescriptor)
  , FieldTypeDescriptor(..)
  , FieldAccessor(..)
  )

-- | Sort values according to a MessageDescriptor for their type.
fDescriptor :: (Contravariant f, Monoid (f a))
            => (forall v. FieldTypeDescriptor v -> f v)
            -> (forall a. f a -> f [a])
            -> (forall a. f a -> f (Maybe a))
            -> MessageDescriptor a
            -> f a
fDescriptor fFieldValue fList fMaybe =
  foldMap (fField fFieldValue fList fMaybe) . fieldsByTag

-- | Sort values on a single field.
--
-- Note that if you don't need the ability to compare on different fields
-- dynamically, you can probably 'contramap' a specific comparison instead.
-- For example, to sort by a message or group field:
-- >>> sortBy (getComparison $ view mySubmessage >$< messageComparison) protos
--
-- Or to sort by an integer field:
-- >>> sortOn (view myIntField) protos
fField :: Contravariant f
       => (forall v. FieldTypeDescriptor v -> f v)
       -> (forall a. f a -> f [a])
       -> (forall a. f a -> f (Maybe a))
       -> FieldDescriptor a
       -> f a
fField fFieldValue fList fMaybe (FieldDescriptor _ ty accessor) =
  fFieldAccessor fList fMaybe (fFieldValue ty) accessor

-- Sort a map by sorting its associations in ascending key order.
mapAssocs :: Contravariant f
          => (forall a. f a -> f [a])
          -> f (k, v)
          -> f (Map k v)
mapAssocs fList kv = M.toAscList >$< fList kv

-- | Sort a map by converting its associations to @entry@ and sorting that as a
-- protobuf.
--
-- This is necessary because 'MapField' gives no information about the values
-- of the map except that they're part of a protobuf @entry@.  So we use the
-- 'Message' instance of @entry@ to sort the map's associations.
--
-- This should be identical to sorting @Map key value@s using the 'Ord' of
-- @key@ and the 'Message' of value.
protoMapAssocs :: forall f entry key value. (Contravariant f, Default entry)
               => (forall a. f a -> f [a])
               -> f entry
               -> Lens' entry key
               -> Lens' entry value
               -> f (Map key value)
protoMapAssocs fList c key value = mapAssocs fList sortAssocViaProtobuf
  where
    sortAssocViaProtobuf =
      (\(k, v) -> (def :: entry) & key .~ k & value .~ v) >$< c

-- Sort on a field given a Sort of that field and an accessor for it.
fFieldAccessor :: forall f a b. Contravariant f
               => (forall a. f a -> f [a])
               -> (forall a. f a -> f (Maybe a))
               -> f b
               -> FieldAccessor a b
               -> f a
fFieldAccessor fList fMaybe c f = case f of
    PlainField _ l    -> view l >$< c
    OptionalField l   -> view l >$< fMaybe c
    RepeatedField _ l -> view l >$< fList c
    MapField k v l    -> view l >$< protoMapAssocs fList c k v

-- Unpack a ByteString into a Word16 and the remainder, or the leftover 0 or 1
-- bytes at the end.
unconsWord16BS :: B.ByteString -> Either (Either () Word8) (Word16, B.ByteString)
unconsWord16BS bs = case B.length bs of
  0 -> Left (Left ())
  1 -> Left (Right (B.unsafeIndex bs 0))
  _ -> Right $ (,)
           (shift (fromIntegral $ B.unsafeIndex bs 0) 8 .|.
            fromIntegral (B.unsafeIndex bs 1))
           (B.drop 2 bs)

fByteString :: (Decidable f, Divisible f) => f Word8 -> f Word16 -> f B.ByteString
fByteString fWord8 fWord16 = choose unconsWord16BS
    (chosen conquered fWord8)
    (divided fWord16 (fByteString fWord8 fWord16))

fText :: (Decidable f, Divisible f) => f Char -> f T.Text
fText fChar = choose unconsEither conquered (divided fChar (fText fChar))
  where unconsEither = maybe (Left ()) Right . T.uncons
