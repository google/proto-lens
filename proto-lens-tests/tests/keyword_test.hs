-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

-- This module tests that keywords can be used as ids in contexts where they are
-- not valid as keywords.
{-# LANGUAGE OverloadedStrings #-}
module Main where

import Data.ProtoLens (def)
import Lens.Family2 ((&), (.~), (^.))
import Prelude hiding (map)
import Test.Framework (testGroup)
import Test.Framework.Providers.HUnit (testCase)
import Test.HUnit ((@=?))

import Proto.Keyword
import TestUtil

main = testMain
    [ testKeywordFields
    , testKeywordTypes
    , testReadReservedName
    , testRoundTrip
    ]

testKeywordFields = testCase "testKeywordFields" $ do
    1 @=? (def & required .~ 1 :: TestKeywordFields) ^. required
    1 @=? (def & message .~ 1 :: TestKeywordFields) ^. message
    1 @=? (def & enum .~ 1 :: TestKeywordFields) ^. enum
    1 @=? (def & repeated .~ 1 :: TestKeywordFields) ^. repeated
    1 @=? (def & map .~ 1 :: TestKeywordFields) ^. map
    1 @=? (def & oneof .~ 1 :: TestKeywordFields) ^. oneof
    1 @=? (def & syntax .~ 1 :: TestKeywordFields) ^. syntax
    1 @=? (def & package .~ 1 :: TestKeywordFields) ^. package
    1 @=? (def & option .~ 1 :: TestKeywordFields) ^. option
    1 @=? (def & import' .~ 1 :: TestKeywordFields) ^. import'

testKeywordTypes = testCase "testKeywordTypes" $ do
    1 @=? (def & syntax.foo .~ 1 :: TestKeywordTypes) ^. syntax.foo
    1 @=? (def & package.foo .~ 1 :: TestKeywordTypes) ^. package.foo
    1 @=? (def & import'.foo .~ 1 :: TestKeywordTypes) ^. import'.foo

-- For fields with names like "import'" that need the extra apostrophe,
-- make sure we don't expect that apostrophe when parsing TextFormat.
-- "import" field.
testReadReservedName = readFrom "testReadReservedName"
      (Just $ def & import' .~ 1 :: Maybe TestKeywordFields)
      "import: 1"

testRoundTrip = testGroup "roundtrip"
    [ runTypedTest (roundTripTest "keywords" :: TypedTest TestKeywordFields)
    , runTypedTest (roundTripTest "keywordtypes" :: TypedTest TestKeywordTypes)
    ]
