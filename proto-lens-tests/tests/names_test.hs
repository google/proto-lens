-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

-- This module checks our translation from proto names (fields and messages)
-- into Haskell names.
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE Rank2Types #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Main where

import Data.Int (Int32)
import Data.ProtoLens (def, Message)
import Lens.Family2 (Lens', (&), (.~), (^.))
import Prelude hiding (Maybe, maybe, map, head, span)
import qualified Prelude
import Test.Framework (Test, testGroup)
import Test.Framework.Providers.HUnit (testCase)
import Test.HUnit ((@=?))

import Proto.Names
import Data.ProtoLens.TestUtil
    ( TypedTest
    , readFrom
    , roundTripTest
    , runTypedTest
    , testMain
    )

main :: IO ()
main = testMain
    [ testNames
    , testPreludeType
    , testHaskellKeywords
    , testProtoKeywords
    , testProtoKeywordTypes
    , testReadReservedName
    ]

testNames, testPreludeType, testHaskellKeywords, testProtoKeywords,
    testProtoKeywordTypes, testReadReservedName :: Test

-- | Test that we can get/set each individual field.
testFields :: forall a . (Show a, Message a, Eq a)
           => String -> a
           -> [SomeLens a Int32]
           -> Test
testFields name defValue fields = testGroup name
    [ testCase "fields" $ mapM_ testField fields
    , runTypedTest (roundTripTest "roundTrip" :: TypedTest a)
    ]
  where
    testField (SomeLens f) = 1 @=? (defValue & f .~ 1) ^. f

-- | Wraps a Lens' (which is a higher-order type) so it can be used in a list
-- without ImpredicativeTypes.
newtype SomeLens a b = SomeLens (Lens' a b)

testNames = testFields "names" (def :: Names)
    [ SomeLens head
    , SomeLens span
    , SomeLens multiWordName
    , SomeLens fooMultiWORDName
    , SomeLens _multiWordName
    , SomeLens camelCasedName
    ]

testPreludeType = testFields "preludeType" (def :: Maybe) [SomeLens maybe]

testHaskellKeywords = testFields "haskellKeywords" (def :: HaskellKeywords)
    [ SomeLens case'
    , SomeLens class'
    , SomeLens data'
    , SomeLens default'
    , SomeLens deriving'
    , SomeLens do'
    , SomeLens else'
    , SomeLens foreign'
    , SomeLens if'
    , SomeLens import'
    , SomeLens in'
    , SomeLens infix'
    , SomeLens infixl'
    , SomeLens infixr'
    , SomeLens instance'
    , SomeLens let'
    , SomeLens module'
    , SomeLens newtype'
    , SomeLens of'
    , SomeLens then'
    , SomeLens type'
    , SomeLens where'
    , SomeLens mdo'
    , SomeLens rec'
    , SomeLens proc'
    -- Haskell keywords that shouldn't get an apostrophe (since they're valid
    -- as variable names):
    , SomeLens as
    , SomeLens forall
    , SomeLens hiding
    ]

testProtoKeywords = testFields "protoKeywords" (def :: ProtoKeywords)
    [ SomeLens required
    , SomeLens message
    , SomeLens enum
    , SomeLens optional
    , SomeLens repeated
    , SomeLens map
    , SomeLens oneof
    , SomeLens syntax
    , SomeLens package
    , SomeLens option
    , SomeLens import'
    ]

testProtoKeywordTypes = testFields "protoKeywordTypes" (def :: ProtoKeywordTypes)
    [ SomeLens (syntax . foo)
    , SomeLens (package . foo)
    , SomeLens (import' . foo)
    ]


-- For fields with names like "import'" that need the extra apostrophe,
-- make sure we don't expect that apostrophe when parsing TextFormat.
-- "import" field.
testReadReservedName = readFrom "testReadReservedName"
      (Just $ def & import' .~ 1 :: Prelude.Maybe HaskellKeywords)
      "import: 1"
