-- | This module implements discriminators of protobufs generically.

{-# LANGUAGE GADTs #-}
{-# LANGUAGE Rank2Types #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Data.ProtoLens.Sort
  -- * Comparing Protobuf Messages
  ( compareMessage

  -- * 'Sort's for Messages
  , messageSort
  , descriptorSort
  , fieldSort

  , fieldValueSort

  , protoMapAssocs
  ) where

import Data.Default (Default(def))
import Data.Foldable (foldMap)
import Data.Functor.Contravariant
  ( (>$<)
  )
import Data.Discrimination
  ( Group
  , Grouping(grouping)
  , Sort
  , Sorting(sorting)
  , Sorting1(sorting1)
  , sortingCompare
  )
import Data.Discrimination.IEEE754 (sortFloat, sortDouble)
import Data.Functor.Contravariant.Divisible
  ( conquered
  , divided
  , divide
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
import Data.ProtoLens.Discrimination (fDescriptor, fField, fText, fByteString, protoMapAssocs)
import Data.ProtoLens.Group (messageGroup)

-- Used to adapt 'sortingCompare' to protobuf types without adding an orphan
-- instance for Sorting.
newtype MessageSorting a = MessageSorting { getMessageSorting :: a }
instance Message a => Grouping (MessageSorting a) where
  grouping = getMessageSorting >$< messageGroup
instance Message a => Sorting (MessageSorting a) where
  sorting = getMessageSorting >$< messageSort

-- | Compare protobuf message values according to their Message instance.
compareMessage :: Message a => a -> a -> Ordering
compareMessage x y = sortingCompare (MessageSorting x) (MessageSorting y)

-- | Sort protobuf message values according to their Message instance.
messageSort :: Message a => Sort a
messageSort = descriptorSort descriptor

-- | Sort values according to a MessageDescriptor for their type.
descriptorSort :: MessageDescriptor a -> Sort a
descriptorSort = fDescriptor fieldValueSort sorting1 sorting1

-- | Sort values on a single field.
--
-- Note that if you don't need the ability to sort on different fields
-- dynamically, you can probably 'contramap' a specific Sort instead.
-- For example, a Sort by a message or group field:
-- >>> view mySubmessage >$< messageSort
--
-- Or to sort by an integer field:
-- >>> sortWith (view myIntField) protos
fieldSort :: FieldDescriptor a -> Sort a
fieldSort = fField fieldValueSort sorting1 sorting1

-- | Sort values of a single field of a protobuf according to their
-- 'Message' or 'Ord' instances.
fieldValueSort :: FieldTypeDescriptor v -> Sort v
fieldValueSort ty = case ty of
    MessageField  -> messageSort
    GroupField    -> messageSort
    EnumField     -> fromEnum >$< sorting
    Int32Field    -> sorting
    Int64Field    -> sorting
    UInt32Field   -> sorting
    UInt64Field   -> sorting
    SInt32Field   -> sorting
    SInt64Field   -> sorting
    Fixed32Field  -> sorting
    Fixed64Field  -> sorting
    SFixed32Field -> sorting
    SFixed64Field -> sorting
    FloatField    -> sortFloat
    DoubleField   -> sortDouble
    BoolField     -> sorting
    StringField   -> fText sorting
    BytesField    -> fByteString sorting sorting
