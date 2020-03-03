-- | This module implements discriminators of protobufs generically.

{-# LANGUAGE GADTs #-}
{-# LANGUAGE Rank2Types #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Data.ProtoLens.Discrimination
    ( discFields
    , discField
    , discText
    , discByteString
    , discProtoMapAssocs
    , discFieldSet
    ) where

import Data.Bits ((.|.), shift)
import qualified Data.ByteString as B
import qualified Data.ByteString.Unsafe as B (unsafeIndex)
import Data.Functor.Contravariant
    ( Contravariant(contramap)
    , (>$<)
    )
import Data.Functor.Contravariant.Divisible
    ( chosen
    , conquered
    , divided
    , Decidable(choose)
    , Divisible(conquer)
    )
import qualified Data.IntMap as IM
import Data.Map (Map)
import Data.Word (Word8, Word16, Word32, Word64)
import qualified Data.Map as M
import qualified Data.Text as T
import Lens.Family2 ((&), (.~), Lens', view)

import Data.ProtoLens.Encoding.Wire
    ( Tag(..), TaggedValue(..), WireValue(..)
    )
import Data.ProtoLens.Message
    ( FieldDescriptor(FieldDescriptor)
    , FieldTypeDescriptor(..)
    , FieldAccessor(..)
    , Message
    , defMessage
    )

-- | Sort values according to a Foldable of field descriptors.
discFields
    :: (Foldable t, Contravariant f, Monoid (f a))
    => (forall v. FieldTypeDescriptor v -> f v)
    -> (forall b. f b -> f [b])
    -> (forall b. f b -> f (Maybe b))
    -> t (FieldDescriptor a)
    -> f a
discFields discFieldValue discList discMaybe =
    foldMap (discField discFieldValue discList discMaybe)

-- | Sort values on a single field.
--
-- Note that if you don't need the ability to compare on different fields
-- dynamically, you can probably 'contramap' a specific comparison instead.
-- For example, to sort by a message or group field:
-- >>> sortBy (getComparison $ view mySubmessage >$< messageComparison) protos
--
-- Or to sort by an integer field:
-- >>> sortOn (view myIntField) protos
discField
    :: Contravariant f
    => (forall v. FieldTypeDescriptor v -> f v)
    -> (forall b. f b -> f [b])
    -> (forall b. f b -> f (Maybe b))
    -> FieldDescriptor a
    -> f a
discField discFieldValue discList discMaybe (FieldDescriptor _ ty accessor) =
    discFieldAccessor discList discMaybe (discFieldValue ty) accessor

-- Sort a map by sorting its associations in ascending key order.
discMapAssocs
    :: Contravariant f
    => (forall a. f a -> f [a])
    -> f (k, v)
    -> f (Map k v)
discMapAssocs discList kv = M.toAscList >$< discList kv

-- Sort an unknown-fields set by treating it as a map from tag to [WireValue].
discFieldSet
    :: Decidable f
    => (forall a. f a -> f [a])
    -> f Word32
    -> f Word64
    -> f B.ByteString
    -> f Int
    -> f [TaggedValue]
discFieldSet discList disc32 disc64 discBS discInt =
    IM.toAscList . toIntMap >$<
    discList (divided discInt (discList discWireValue))
  where
    toIntMap =
        fmap ($[]) . IM.fromListWith (flip (.)) .
        fmap (\ (TaggedValue (Tag t) v) -> (t, (v:)))

    discWireValue = contramap toEithers $ chosen
        (chosen disc64 (chosen disc64 disc32))
        (chosen discBS (chosen conquer conquer))

    toEithers
      :: WireValue
      -> Either
          (Either Word64 (Either Word64 Word32))
          (Either B.ByteString (Either () ()))
    toEithers v = case v of
      VarInt     x -> Left (Left x)
      Fixed64    x -> Left (Right (Left x))
      Fixed32    x -> Left (Right (Right x))
      Lengthy    x -> Right (Left x)
      StartGroup -> Right (Right (Left ()))
      EndGroup -> Right (Right (Right ()))

-- | Sort a map by converting its associations to @entry@ and sorting that as a
-- protobuf.
--
-- This is necessary because 'MapField' gives no information about the values
-- of the map except that they're part of a protobuf @entry@.  So we use the
-- 'Message' instance of @entry@ to sort the map's associations.
--
-- This should be identical to sorting @Map key value@s using the 'Ord' of
-- @key@ and the 'Message' of value.
discProtoMapAssocs
    :: forall f entry key value. (Contravariant f, Message entry)
    => (forall a. f a -> f [a])
    -> f entry
    -> Lens' entry key
    -> Lens' entry value
    -> f (Map key value)
discProtoMapAssocs discList c key value =
    discMapAssocs discList sortAssocViaProtobuf
  where
    sortAssocViaProtobuf =
      (\(k, v) -> (defMessage :: entry) & key .~ k & value .~ v) >$< c

-- Sort on a field given a Sort of that field and an accessor for it.
discFieldAccessor
    :: forall f a b. Contravariant f
    => (forall c. f c -> f [c])
    -> (forall c. f c -> f (Maybe c))
    -> f b
    -> FieldAccessor a b
    -> f a
discFieldAccessor discList discMaybe c f = case f of
    PlainField _ l    -> view l >$< c
    OptionalField l   -> view l >$< discMaybe c
    RepeatedField _ l -> view l >$< discList c
    MapField k v l    -> view l >$< discProtoMapAssocs discList c k v

-- Unpack a ByteString into a Word16 and the remainder, or the leftover 0 or 1
-- bytes at the end.
unconsWord16BS ::
    B.ByteString -> Either (Either () Word8) (Word16, B.ByteString)
unconsWord16BS bs = case B.length bs of
    0 -> Left (Left ())
    1 -> Left (Right (B.unsafeIndex bs 0))
    _ -> Right $ (,)
           (shift (fromIntegral $ B.unsafeIndex bs 0) 8 .|.
            fromIntegral (B.unsafeIndex bs 1))
           (B.drop 2 bs)

discByteString :: Decidable f => f Word8 -> f Word16 -> f B.ByteString
discByteString discWord8 discWord16 = choose unconsWord16BS
    (chosen conquered discWord8)
    (divided discWord16 (discByteString discWord8 discWord16))

discText :: Decidable f => f Char -> f T.Text
discText discChar =
    choose unconsEither conquered (divided discChar (discText discChar))
  where
    unconsEither = maybe (Left ()) Right . T.uncons
