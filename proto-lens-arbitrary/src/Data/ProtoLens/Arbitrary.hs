-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE RankNTypes #-}
-- | An Arbitrary instance for protocol buffer Messages to use with QuickCheck.
module Data.ProtoLens.Arbitrary
    ( ArbitraryMessage(..)
    , arbitraryMessage
    ) where

import Data.ProtoLens.Message

import Control.Arrow ((&&&))
import Control.Monad (foldM)
import qualified Data.ByteString as BS
import Data.Map (Map)
import qualified Data.Map as M
import Data.Maybe (isJust, fromJust)
import qualified Data.Text as T
import Lens.Family2 (Lens', view, set)
import Lens.Family2.Unchecked (lens)
import Test.QuickCheck (Arbitrary(..), Gen, suchThat, frequency, listOf,
                        shrinkList)


-- | A newtype wrapper that provides an Arbitrary instance for the underlying
-- message.
newtype ArbitraryMessage a =
    ArbitraryMessage { unArbitraryMessage :: a } deriving (Eq, Show, Functor)

instance Message a => Arbitrary (ArbitraryMessage a) where
    arbitrary = ArbitraryMessage <$> arbitraryMessage
    shrink (ArbitraryMessage a) = ArbitraryMessage <$> shrinkMessage a

arbitraryMessage :: Message a => Gen a
arbitraryMessage = foldM (flip arbitraryField) def fields
  where
    fields = M.elems (fieldsByTag descriptor)

-- | Imitation of the (Arbitrary a => Arbitrary (Maybe a)) instance from
-- QuickCheck.
maybeGen :: Gen a -> Gen (Maybe a)
maybeGen gen = frequency [ (1, pure Nothing), (3, Just <$> gen) ]

mapGen :: (Ord key, Message entry) => Lens' entry key -> Lens' entry value ->
          Gen entry -> Gen (Map key value)
mapGen keyLens valueLens entryGen =
    mapEntriesLens keyLens valueLens (const $ listOf entryGen) M.empty

setGen :: Lens' msg a -> Gen a -> msg -> Gen msg
setGen l gen = l (const gen)

arbitraryField :: FieldDescriptor msg -> msg -> Gen msg
arbitraryField (FieldDescriptor _ ftd fa) = case fa of
    PlainField _ l -> setGen l fieldGen
    OptionalField l -> setGen l (maybeGen fieldGen)
    RepeatedField _ l -> setGen l (listOf fieldGen)
    MapField keyLens valueLens mapLens ->
        setGen mapLens (mapGen keyLens valueLens fieldGen)
  where
    fieldGen = arbitraryFieldValue ftd

arbitraryFieldValue :: FieldTypeDescriptor value -> Gen value
arbitraryFieldValue ftd = case ftd of
    MessageField -> arbitraryMessage
    GroupField -> arbitraryMessage
    -- For enum fields, all we know is that the value is an instance of
    -- MessageEnum, meaning we can only use fromEnum, toEnum, or maybeToEnum. So
    -- we must rely on the instance of Arbitrary for Int and filter out only the
    -- cases that can actually be converted to one of the enum values.
    --
    -- 'fromJust' is okay here because 'suchThat' will ensure that all generated
    -- values are 'Just _'.
    EnumField -> fromJust <$> (maybeToEnum <$> arbitrary) `suchThat` isJust
    Int32Field -> arbitrary
    Int64Field -> arbitrary
    UInt32Field -> arbitrary
    UInt64Field -> arbitrary
    SInt32Field -> arbitrary
    SInt64Field -> arbitrary
    Fixed32Field -> arbitrary
    Fixed64Field -> arbitrary
    SFixed32Field -> arbitrary
    SFixed64Field -> arbitrary
    FloatField -> arbitrary
    DoubleField -> arbitrary
    BoolField -> arbitrary
    StringField -> T.pack <$> arbitrary
    BytesField -> BS.pack <$> arbitrary

-- | Shrink each field individually and append all shrinks together into
-- a single list.
shrinkMessage :: Message a => a -> [a]
shrinkMessage msg = concatMap (`shrinkField` msg) fields
  where
    fields = M.elems (fieldsByTag descriptor)

shrinkMaybe :: (a -> [a]) -> Maybe a -> [Maybe a]
shrinkMaybe f (Just v) = Nothing : (Just <$> f v)
shrinkMaybe _ Nothing  = []

shrinkMap :: (Ord key, Message entry) => Lens' entry key -> Lens' entry value
          -> (entry -> [entry]) -> Map key value -> [Map key value]
shrinkMap keyLens valueLens f = mapEntriesLens keyLens valueLens (shrinkList f)

shrinkField :: FieldDescriptor msg -> msg -> [msg]
shrinkField (FieldDescriptor _ ftd fa) = case fa of
    PlainField _ l -> l fieldShrinker
    OptionalField l -> l (shrinkMaybe fieldShrinker)
    RepeatedField _ l -> l (shrinkList fieldShrinker)
    MapField keyLens valueLens mapLens ->
        mapLens (shrinkMap keyLens valueLens fieldShrinker)
  where
    fieldShrinker = shrinkFieldValue ftd

shrinkFieldValue :: FieldTypeDescriptor value -> value -> [value]
shrinkFieldValue ftd = case ftd of
    MessageField -> shrinkMessage
    GroupField -> map unArbitraryMessage . shrink . ArbitraryMessage
    -- Shrink to the 0-equivalent Enum value if it's both a valid Enum value
    -- and the value isn't already 0.
    EnumField -> case maybeToEnum 0 of
        Nothing -> const []
        Just zeroVal -> \val -> case fromEnum val of
          0 -> []
          _ -> [zeroVal]
    Int32Field -> shrink
    Int64Field -> shrink
    UInt32Field -> shrink
    UInt64Field -> shrink
    SInt32Field -> shrink
    SInt64Field -> shrink
    Fixed32Field -> shrink
    Fixed64Field -> shrink
    SFixed32Field -> shrink
    SFixed64Field -> shrink
    FloatField -> shrink
    DoubleField -> shrink
    BoolField -> shrink
    StringField -> map T.pack . shrink . T.unpack
    BytesField -> map BS.pack . shrink . BS.unpack

mapToEntries :: Message entry =>
                Lens' entry key -> Lens' entry value -> Map key value -> [entry]
mapToEntries keyLens valueLens m = makeEntry <$> M.toList m
  where
    makeEntry (k, v) = (set keyLens k . set valueLens v) def

entriesToMap :: Ord key =>
                Lens' entry key -> Lens' entry value -> [entry] -> Map key value
entriesToMap keyLens valueLens entries = M.fromList kvs
  where
    kvs = (view keyLens &&& view valueLens) <$> entries

-- This isn't a true lens because it doesn't obey the lens laws. Specifically,
-- view l (set l entries) /= entries because the input list of entries may
-- contain duplicate keys that would become de-duped inside the Map. It's only
-- included here to make it easy to convert from a list of entry Messages to
-- a Map.
mapEntriesLens :: (Ord key, Message entry) =>
        Lens' entry key -> Lens' entry value -> Lens' (Map key value) [entry]
mapEntriesLens kl vl = lens (mapToEntries kl vl) (const (entriesToMap kl vl))
