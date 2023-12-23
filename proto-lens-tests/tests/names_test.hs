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
import Data.ProtoLens (Message(defMessage))
import Lens.Family2 (Lens', (&), view, set)
import Prelude hiding (Maybe, maybe, map, head, span)
import qualified Prelude
import Test.Tasty (TestTree, testGroup)
import Test.Tasty.HUnit (testCase, (@=?))

import Proto.Names
import Proto.Names_Fields
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
    , testOddCasedMessage
    , testProtoKeywords
    , testProtoKeywordTypes
    , testReadReservedName
    , testMessageEnumOverlap
    ]

testNames, testPreludeType, testHaskellKeywords, testProtoKeywords,
    testOddCasedMessage, testProtoKeywordTypes, testReadReservedName,
    testMessageEnumOverlap :: TestTree

-- | Test that we can get/set each individual field.
testFields :: forall a . (Show a, Message a, Eq a)
           => String -> a
           -> [SomeLens a Int32]
           -> TestTree
testFields name defValue fields = testGroup name
    [ testCase "fields" $ mapM_ testField fields
    , runTypedTest (roundTripTest "roundTrip" :: TypedTest a)
    ]
  where
    testField (SomeLens f) = verifyLens defValue f 1

verifyLens :: (Show b, Eq b) => a -> Lens' a b -> b -> IO ()
verifyLens x f y = y @=? view f (set f y x)

-- | Wraps a Lens' (which is a higher-order type) so it can be used in a list
-- without ImpredicativeTypes.
newtype SomeLens a b = SomeLens (Lens' a b)

testNames = testFields "names" (defMessage :: Names)
    [ SomeLens head
    , SomeLens span
    , SomeLens multiWordName
    , SomeLens fooMultiWORDName
    , SomeLens _multiWordName
    , SomeLens camelCasedName
    ]

testPreludeType = testFields "preludeType" (defMessage :: Maybe) [SomeLens maybe]

testHaskellKeywords = testFields "haskellKeywords" (defMessage :: HaskellKeywords)
    [ SomeLens case'
    , SomeLens class'
    , SomeLens data'
    , SomeLens default'
    , SomeLens deriving'
    , SomeLens do'
    , SomeLens else'
    , SomeLens forall'
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
    , SomeLens hiding
    ]

-- Don't change the name of messages and enums.  However, do still camel-case
-- the generated oneof datatypes and constructors.
testOddCasedMessage = testGroup "oddCasedMessage"
    [ runTypedTest (roundTripTest "roundTrip" :: TypedTest Odd_CAsed_message)
    , runTypedTest (roundTripTest "roundTrip abbrev" :: TypedTest ABBREVName)
    , testCase "oneofField" $ do
          verifyLens defMsg maybe'oneofField $ Just
                    (Odd_CAsed_message'OneofCase 42
                        :: Odd_CAsed_message'OneofField)
          verifyLens defMsg oneofCase 42
          verifyLens defMsg maybe'oneofCase (Just 42)
    , testCase "enums" $ do
          trivial (Odd_CAsed_message'DeFA_ult :: Odd_CAsed_message'Odd_CAsed_enum)
          trivial (DeFA_ult :: Odd_CAsed_enum)
          trivial (Odd_CAsed_message'Xunder_scored :: Odd_CAsed_message'Odd_CAsed_enum)
          trivial (Xunder_scored :: Odd_CAsed_enum)
          trivial (Odd_CAsed_message'Lower_case :: Odd_CAsed_message'Odd_CAsed_enum)
          trivial (Lower_case :: Odd_CAsed_enum)
    , testCase "submessage" $ trivial (defMessage :: Odd_CAsed_message'Sub_message)
    ]
  where
    defMsg = defMessage :: Odd_CAsed_message

trivial :: (Show a, Eq a) => a -> IO ()
trivial a = a @=? a

testProtoKeywords = testFields "protoKeywords" (defMessage :: ProtoKeywords)
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

testProtoKeywordTypes = testFields "protoKeywordTypes" (defMessage :: ProtoKeywordTypes)
    [ SomeLens (syntax . foo)
    , SomeLens (package . foo)
    , SomeLens (import' . foo)
    ]


-- For fields with names like "import'" that need the extra apostrophe,
-- make sure we don't expect that apostrophe when parsing TextFormat.
-- "import" field.
testReadReservedName = readFrom "testReadReservedName"
      (Just $ defMessage & set import' 1 :: Prelude.Maybe HaskellKeywords)
      "import: 1"

testMessageEnumOverlap = testCase "messageEnumOverlap" $ do
    trivial (defMessage :: MessageEnumOverlap)
    trivial (MessageEnumOverlap :: OverlapEnum)
