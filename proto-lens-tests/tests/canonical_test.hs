-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# LANGUAGE OverloadedStrings #-}
-- This module tests the examples described in the documentation at
-- https://developers.google.com/protocol-buffers/docs/encoding
--
-- These tests compare directly to byte sequences, rather than using
-- Data.ProtoLens.TestUtil.tagged, to sanity-check that tagged is implemented
-- correctly.
module Main where

import Lens.Family2 ((&), (.~))
import Proto.Canonical (Test1, Test2, Test3, Test4)
import Proto.Canonical_Fields (a, b, c, d)
import Test.Framework (testGroup)
import Data.ProtoLens
import qualified Data.ByteString as B
import Data.ByteString.Builder (word8)
import Data.Word (Word8)

import Data.ProtoLens.TestUtil

main :: IO ()
main = testMain
           [int32Test, stringTest, embeddedTest, packedIntsTest, roundTripTests]

canonicalTest :: (Show a, Eq a, Message a)
              => String -> a -> Doc -> [Word8] -> Test
canonicalTest name val text bytes
    = testGroup name [serializeTo "bytes" val text $ mconcat $ map word8 bytes]

int32Test, stringTest, embeddedTest, packedIntsTest, roundTripTests :: Test
int32Test = canonicalTest
    "int32"
    (def & a .~ 150 :: Test1)
    "a: 150"
    [0x08, 0x96, 0x01]

stringTest = canonicalTest
    "string"
    (def & b .~ "testing" :: Test2)
    "b: \"testing\""
    ([0x12, 0x07] ++ B.unpack "testing")

embeddedTest = canonicalTest
    "embedded"
    (def & c.a .~ 150 :: Test3)
    "c {\n  a: 150\n}"
    [0x1a, 0x03, 0x08, 0x96, 0x01]

packedIntsTest = canonicalTest
    "packed-ints"
    (def & d .~ [3,270,86942] :: Test4)
    "d: 3\nd: 270\nd: 86942"
    [0x22, 0x06, 0x03, 0x8e, 0x02, 0x9e, 0xa7, 0x05]

roundTripTests = testGroup "roundtrip"
    [ runTypedTest (roundTripTest "test1" :: TypedTest Test1)
    , runTypedTest (roundTripTest "test2" :: TypedTest Test2)
    , runTypedTest (roundTripTest "test3" :: TypedTest Test3)
    , runTypedTest (roundTripTest "test4" :: TypedTest Test4)
    ]
