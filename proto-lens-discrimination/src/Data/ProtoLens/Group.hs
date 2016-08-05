-- | This module implements discriminators of protobufs generically.

{-# LANGUAGE GADTs #-}
{-# LANGUAGE Rank2Types #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Data.ProtoLens.Group
  -- * Comparing Protobuf Messages
  ( eqMessage

  -- * 'Group's for Messages
  , messageGroup
  , descriptorGroup
  , fieldGroup
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
import Data.Discrimination.IEEE754 (groupFloat, groupDouble)
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
  ( Message(descriptor)
  , MessageDescriptor(fieldsByTag)
  , FieldDescriptor(FieldDescriptor)
  , FieldTypeDescriptor(..)
  , FieldAccessor(..)
  )
import Data.ProtoLens.Discrimination (fDescriptor, fField, fText, fByteString)

-- Used internally to adapt 'groupingEq' to protobuf types without adding an
-- orphan instance for Grouping.
newtype MessageGrouping a = MessageGrouping { getMessageGrouping :: a }
instance Message a => Grouping (MessageGrouping a) where
  grouping = getMessageGrouping >$< messageGroup

-- | Check whether two protobufs are equal according to their Message instance.
--
-- This should be equivalent to the generated @Eq@ instances.
eqMessage :: Message a => a -> a -> Bool
eqMessage x y = groupingEq (MessageGrouping x) (MessageGrouping y)

-- | Group protobuf message values according to their Message instance.
messageGroup :: Message a => Group a
messageGroup = descriptorGroup descriptor

-- | Group values according to a MessageDescriptor for their type.
descriptorGroup :: MessageDescriptor a -> Group a
descriptorGroup = fDescriptor fieldValueGroup grouping1 grouping1

-- | Group values on a single field.
--
-- Note that if you don't need the ability to compare on different fields
-- dynamically, you can probably 'contramap' a specific comparison instead.
-- For example, to sort by a message or group field:
-- >>> sortBy (getComparison $ view mySubmessage >$< messageComparison) protos
--
-- Or to sort by an integer field:
-- >>> sortOn (view myIntField) protos
fieldGroup :: FieldDescriptor a -> Group a
fieldGroup = fField fieldValueGroup grouping1 grouping1

-- | Group values of a single field of a protobuf according to their
-- 'Message' or 'Grouping' instances.
fieldValueGroup :: FieldTypeDescriptor v -> Group v
fieldValueGroup ty = case ty of
    MessageField  -> messageGroup
    GroupField    -> messageGroup
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
    FloatField    -> groupFloat
    DoubleField   -> groupDouble
    BoolField     -> grouping
    StringField   -> fText grouping
    BytesField    -> fByteString grouping grouping
