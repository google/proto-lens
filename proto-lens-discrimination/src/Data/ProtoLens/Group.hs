-- | This module implements discriminators of protobufs generically.

{-# LANGUAGE GADTs #-}
{-# LANGUAGE Rank2Types #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Data.ProtoLens.Group
    (
    -- * 'Group's for Messages
      groupingMessage
    , groupingKnownFields

    -- ** 'Group'ing on a subset of fields
    , groupingFields
    , groupingField
    , groupingUnknownFields

    -- * Comparing Protobuf Messages
    , eqMessage

    -- * 'Group' for individual field values
    , groupingFieldValue
    , groupingFieldSet
    ) where

import Data.Functor.Contravariant ((>$<))
import Data.Discrimination
    ( Group
    , Grouping(grouping)
    , Grouping1(grouping1)
    , groupingEq
    )
import Data.Discrimination.IEEE754 (groupingFloat, groupingDouble)
import Lens.Family2 (view)

import Data.ProtoLens.Message
    ( Message(fieldsByTag, unknownFields)
    , FieldDescriptor
    , FieldSet
    , FieldTypeDescriptor(..)
    , ScalarField(..)
    )
import Data.ProtoLens.Discrimination
    ( discFields
    , discField
    , discFieldSet
    , discText
    , discByteString
    )

-- Used internally to adapt 'groupingEq' to protobuf types without adding an
-- orphan instance for Grouping.
newtype MessageGrouping a = MessageGrouping { getMessageGrouping :: a }
    deriving Eq
instance (Message a, Eq a) => Grouping (MessageGrouping a) where
    grouping = getMessageGrouping >$< groupingMessage

-- | Check whether two protobufs are equal according to their Message instance.
--
-- This should be equivalent to the generated @Eq@ instances.
eqMessage :: (Message a, Eq a) => a -> a -> Bool
eqMessage x y = groupingEq (MessageGrouping x) (MessageGrouping y)

-- | Group protobuf message values according to their Message instance.
groupingMessage :: Message a => Group a
groupingMessage = groupingKnownFields <> groupingUnknownFields

-- | Group protobuf message values ignoring unknown fields.
groupingKnownFields :: Message a => Group a
groupingKnownFields = groupingFields fieldsByTag

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

-- | Group any message type according to its unknown fields.
groupingUnknownFields :: Message a => Group a
groupingUnknownFields = view unknownFields >$< groupingFieldSet

-- | Group 'FieldSet's.
groupingFieldSet :: Group FieldSet
groupingFieldSet =
    discFieldSet grouping1 grouping grouping (discByteString grouping grouping)
        grouping

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
