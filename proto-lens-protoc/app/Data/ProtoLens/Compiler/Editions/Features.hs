-- Copyright 2024 Google LLC. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE OverloadedStrings #-}

{-|
Module: Data.ProtoLens.Compiler.Editions.Features
Description: Resolves a feature set for a particular edition with Protobuf Editions.
Copyright: Copyright (c) 2024 Google LLC
License: BSD3
-}
module Data.ProtoLens.Compiler.Editions.Features
  ( featuresForEdition
  , featuresForEditionFromDefaults
  , mergedInto
  ) where

import Control.Applicative ((<|>))
import Data.ProtoLens (defMessage)
import Data.ProtoLens.Compiler.Editions.Defaults (nativeDefaults)
import Data.ProtoLens.Labels ()
import qualified Data.Text as T
import Data.Text (Text)
import Lens.Family2 ((^.), (.~), (&))
import Proto.Google.Protobuf.Descriptor
  ( Edition
  , FeatureSet
  , FeatureSetDefaults)

{-|
Returns the native feature set defaults for the given edition.

Native features refer to the fields directly defined by 'FeatureSet'.
Features defined as extensions of 'FeatureSet' would be custom features.
-}
featuresForEdition :: Edition -> Either Text FeatureSet
featuresForEdition = featuresForEditionFromDefaults nativeDefaults

{-|
Given the feature set defaults for multiple editions,
return the feature set defaults for the given edition.

If extensions were supported, this could be used directly
to resolve custom features defined as extensions of 'FeatureSet'
for a particular edition.
-}
featuresForEditionFromDefaults
  :: FeatureSetDefaults
  -> Edition
  -> Either Text FeatureSet
featuresForEditionFromDefaults defaults edition
  | (d : _) <- candidates =
      Right $ (d ^. #overridableFeatures) `mergedInto` (d ^. #fixedFeatures)
  | otherwise =
      Left $ "Unsupported edition.  Tag number: " <> (T.pack . show . fromEnum) edition
  where
    candidates = dropWhile (\d -> d ^. #edition > edition) recentFirst

    -- #defaults is supposed to be in ascending order of editions
    recentFirst = reverse $ defaults ^. #defaults

{-|
Returns the result of merging a 'FeatureSet' message into another 'FeatureSet' message.

The semantics are the same as @MergeFrom@ in C++.
When merging a message A into a message B, then any field that has a value in A
will override the value of the same field in B,
otherwise the field in B is used as is.

Consider using this function as an infix operator.
For example,

>>> let c = a `mergedInto` b

could be read like "message C is the message A merged into message B".

If merging was generally supported for all messages,
we would use it directly instead of using this custom implementation for 'FeatureSet'.
This does not support merging extensions or unknown fields.
-}
mergedInto :: FeatureSet  -- ^ Feature set to merge from.
           -> FeatureSet  -- ^ Feature set to merge into.
           -> FeatureSet  -- ^ The merged feature set.
mergedInto a b = defMessage
  & #maybe'fieldPresence .~ (a ^. #maybe'fieldPresence <|> b ^. #maybe'fieldPresence)
  & #maybe'enumType .~ (a ^. #maybe'enumType <|> b ^. #maybe'enumType)
  & #maybe'repeatedFieldEncoding .~ (a ^. #maybe'repeatedFieldEncoding <|> b ^. #maybe'repeatedFieldEncoding)
  & #maybe'utf8Validation .~ (a ^. #maybe'utf8Validation <|> b ^. #maybe'utf8Validation)
  & #maybe'messageEncoding .~ (a ^. #maybe'messageEncoding <|> b ^. #maybe'messageEncoding)
  & #maybe'jsonFormat .~ (a ^. #maybe'jsonFormat <|> b ^. #maybe'jsonFormat)
