-- | This module implements discriminators of protobufs generically.

{-# LANGUAGE GADTs #-}
{-# LANGUAGE Rank2Types #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Data.ProtoLens.Group
    (
    -- * Comparing Protobuf Messages
      eqMessage

    -- * 'Group's for Messages
    , groupingMessage
    , groupingFields
    , groupingField

    -- * 'Group' for individual field values
    , groupingFieldValue
    ) where

import Data.Default (Default(def))
import Data.Foldable (foldMap)
import Data.Functor.Contravariant ((>$<))
import Data.Functor.Contravariant.Divisible (divide)
import Data.Discrimination
    ( Group
    , Grouping(grouping)
    , Grouping1(grouping1)
    , groupingEq
    )
import Data.Discrimination.IEEE754 (groupingFloat, groupingDouble)
import Data.Functor.Contravariant.Divisible
    ( chosen
    , conquered
    , divided
    , Decidable(choose)
    )
import Data.Map (Map)
import qualified Data.Map as M
import qualified Data.Text as T
import Lens.Family2 ((&), (.~), Lens', view)


import Data.ProtoLens.Message
    ( Message(fieldsByTag)
    , FieldDescriptor(FieldDescriptor)
    , FieldTypeDescriptor(..)
    , ScalarField(..)
    , FieldAccessor(..)
    )
import Data.ProtoLens.Discrimination
    ( discFields
    , discField
    , discText
    , discByteString
    )

-- Used internally to adapt 'groupingEq' to protobuf types without adding an
-- orphan instance for Grouping.
newtype MessageGrouping a = MessageGrouping { getMessageGrouping :: a }
instance Message a => Grouping (MessageGrouping a) where
    grouping = getMessageGrouping >$< groupingMessage

-- | Check whether two protobufs are equal according to their Message instance.
--
-- This should be equivalent to the generated @Eq@ instances.
eqMessage :: Message a => a -> a -> Bool
eqMessage x y = groupingEq (MessageGrouping x) (MessageGrouping y)

-- | Group protobuf message values according to their Message instance.
groupingMessage :: Message a => Group a
groupingMessage = groupingFields fieldsByTag

-- | Group values according to a Foldable of field descriptors.
groupingFields :: Foldable t => t (FieldDescriptor a) -> Group a
groupingFields = discFields groupingFieldValue grouping1 grouping1

-- | Group values on a single field.
--
-- Note that if you don't need the ability to group on different fields
-- dynamically, you can probably 'contramap' a specific Group instead.
-- For example, a Group by a message or group field:
-- >>> view mySubmessage >$< groupingMessage
--
-- Or to group by an integer field:
-- >>> runGroup grouping $ map (view myIntField &&& id) protos
groupingField :: FieldDescriptor a -> Group a
groupingField = discField groupingFieldValue grouping1 grouping1

-- | Group values of a single field of a protobuf according to their 'Message'
-- or 'Grouping' instances.
groupingFieldValue :: FieldTypeDescriptor v -> Group v
groupingFieldValue ty = case ty of
    MessageField _ -> groupingMessage
    ScalarField  f -> case f of
        EnumField     -> fromEnum >$< grouping
        Int32Field    -> grouping
        Int64Field    -> grouping
        UInt32Field   -> grouping
        UInt64Field   -> grouping
        SInt32Field   -> grouping
        SInt64Field   -> grouping
        Fixed32Field  -> grouping
        Fixed64Field  -> grouping
        SFixed32Field -> grouping
        SFixed64Field -> grouping
        FloatField    -> groupingFloat
        DoubleField   -> groupingDouble
        BoolField     -> grouping
        StringField   -> discText grouping
        BytesField    -> discByteString grouping grouping
