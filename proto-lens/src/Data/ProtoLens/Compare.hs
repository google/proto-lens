-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# LANGUAGE GADTs #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}
-- | Matchers for comparing protocol buffer messages.
module Data.ProtoLens.Compare (
    -- * Matchers
    partial,
    ) where

import Data.Constraint (Dict (..))
import qualified Data.Map as Map
import Lens.Family2 (Lens', over, set, view)
import Lens.Family2.Unchecked (lens)
import Data.ProtoLens.Message

-- | Perform a partial match on a protobuffer. This corresponds to equality for
-- primitive fields, (recursive) partial equality for required 'Message'
-- fields, partial equality if both are set for optional fields, and partial
-- equality of subsets for repeated and map fields.
partial
    :: forall a. Message a
    => a  -- ^ The value to partially match against.
    -> a  -- ^ The value to match.
    -> Bool
partial against match =
  and . flip fmap (Map.elems (fieldsByTag $ descriptor @a))
      $ \(FieldDescriptor _ ftd acc) ->
      case acc of
        PlainField _    l ->
          eq ftd (view l against) (view l match)

        OptionalField   l ->
          compareMaybe (eq ftd) (view l against) (view l match)

        RepeatedField _ l ->
          and . fmap (\a -> any (eq ftd a) $ view l match) $ view l against

        MapField k v l    ->
          let entriesMatch   = toRepeatedEntry k v $ view l match
              entriesAgainst = toRepeatedEntry k v $ view l against
           in and $ fmap (\a -> any (eq ftd a) entriesMatch) entriesAgainst
  where
    toRepeatedEntry :: (Ord key, Message entry)
                    => Lens' entry key
                    -> Lens' entry value
                    -> Map.Map key value
                    -> [entry]
    toRepeatedEntry keyL valL = fmap (\(k, v) -> set keyL k $ set valL v def)
                              . Map.toList

    compareMaybe :: (v -> v -> Bool) -> Maybe v -> Maybe v -> Bool
    compareMaybe _ Nothing _         = True
    compareMaybe f (Just a) (Just b) = f a b
    compareMaybe _ _ _               = False


    getMessage :: FieldTypeDescriptor v -> Maybe (Dict (Message v))
    getMessage = \case
      MessageField -> Just Dict
      GroupField   -> Just Dict
      _            -> Nothing

    getMessageEnum :: FieldTypeDescriptor v -> Maybe (Dict (MessageEnum v))
    getMessageEnum = \case
      EnumField    -> Just Dict
      _            -> Nothing

    getEq :: FieldTypeDescriptor v -> Maybe (Dict (Eq v))
    getEq = \case
      MessageField  -> Nothing
      GroupField    -> Nothing
      EnumField     -> Nothing
      Int32Field    -> Just Dict
      Int64Field    -> Just Dict
      UInt32Field   -> Just Dict
      UInt64Field   -> Just Dict
      SInt32Field   -> Just Dict
      SInt64Field   -> Just Dict
      Fixed32Field  -> Just Dict
      Fixed64Field  -> Just Dict
      SFixed32Field -> Just Dict
      SFixed64Field -> Just Dict
      FloatField    -> Just Dict
      DoubleField   -> Just Dict
      BoolField     -> Just Dict
      StringField   -> Just Dict
      BytesField    -> Just Dict

    eq :: FieldTypeDescriptor v -> v -> v -> Bool
    eq fd a b =
      case getMessage fd of
        Just Dict -> partial a b
        Nothing ->
          case getEq fd of
            Just Dict -> a == b
            Nothing ->
              case getMessageEnum fd of
                Just Dict -> fromEnum a == fromEnum b
                Nothing -> False

