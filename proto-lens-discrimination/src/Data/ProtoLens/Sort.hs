-- | This module implements discriminators of protobufs generically.

{-# LANGUAGE GADTs #-}
{-# LANGUAGE Rank2Types #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Data.ProtoLens.Sort
    -- * Comparing Protobuf Messages
    ( compareMessage

    -- * 'Sort's for Messages
    , sortingMessage
    , sortingDescriptor
    , sortingField

    , sortingFieldValue
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
import Data.Discrimination.IEEE754 (sortingFloat, sortingDouble)
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
import Data.ProtoLens.Discrimination
    ( discDescriptor
    , discField
    , discText
    , discByteString
    )
import Data.ProtoLens.Group (groupingMessage)

-- Used to adapt 'sortingCompare' to protobuf types without adding an orphan
-- instance for Sorting.
newtype MessageSorting a = MessageSorting { getMessageSorting :: a }
instance Message a => Grouping (MessageSorting a) where
    grouping = getMessageSorting >$< groupingMessage
instance Message a => Sorting (MessageSorting a) where
    sorting = getMessageSorting >$< sortingMessage

-- | Compare protobuf message values according to their Message instance.
compareMessage :: Message a => a -> a -> Ordering
compareMessage x y = sortingCompare (MessageSorting x) (MessageSorting y)

-- | Sort protobuf message values according to their Message instance.
sortingMessage :: Message a => Sort a
sortingMessage = sortingDescriptor descriptor

-- | Sort values according to a MessageDescriptor for their type.
sortingDescriptor :: MessageDescriptor a -> Sort a
sortingDescriptor = discDescriptor sortingFieldValue sorting1 sorting1

-- | Sort values on a single field.
--
-- Note that if you don't need the ability to sort on different fields
-- dynamically, you can probably 'contramap' a specific Sort instead.
-- For example, a Sort by a message or group field:
-- >>> view mySubmessage >$< sortingMessage
--
-- Or to sort by an integer field:
-- >>> sortWith (view myIntField) protos
sortingField :: FieldDescriptor a -> Sort a
sortingField = discField sortingFieldValue sorting1 sorting1

-- | Sort values of a single field of a protobuf according to their 'Message'
-- or 'Sorting' instances.
sortingFieldValue :: FieldTypeDescriptor v -> Sort v
sortingFieldValue ty = case ty of
    MessageField  -> sortingMessage
    GroupField    -> sortingMessage
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
    FloatField    -> sortingFloat
    DoubleField   -> sortingDouble
    BoolField     -> sorting
    StringField   -> discText sorting
    BytesField    -> discByteString sorting sorting
