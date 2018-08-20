-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NegativeLiterals #-}
{-# LANGUAGE Rank2Types #-}

module Main where

import Control.Arrow (second)
import Proto.RawFields
import Proto.RawFields_Fields
import Data.ProtoLens
import Lens.Family2 (Lens', (&), (.~))
import Data.Int (Int32, Int64)
import Data.Word (Word32, Word64)
import Data.String (fromString)
import Test.Framework (testGroup)
import qualified Data.ByteString as B
import Data.Text (Text)
import qualified Data.Text as Text
import qualified Data.Text.Lazy as LT
import Data.Text.Encoding (encodeUtf8)
import Data.ByteString.Builder (Builder, byteString)

import Data.ProtoLens.TestUtil

deserializeFails :: String -> Bad -> Test
deserializeFails name bad = deserializeFrom name expected $ buildMessage bad
  where
    expected :: Maybe Raw
    expected = Nothing

readFails :: String -> LT.Text -> Test
readFails name = readFrom name (Nothing :: Maybe Raw)

readSucceeds :: String -> Raw -> LT.Text -> Test
readSucceeds name value = readFrom name (Just value)

main :: IO ()
main = testMain
    [ serializeTo "default" (def :: Raw) mempty mempty
    , testInt32
    , testInt64
    , testUInt32
    , testUInt64
    , testSInt32
    , testSInt64
    , testFixed32
    , testFixed64
    , testSFixed32
    , testSFixed64
    , testFloat
    , testDouble
    , testBool
    , testString
    , testUnicode
    , testBytes
    , testFailedDecoding
    ]

testInt32, testInt64, testUInt32, testUInt64, testSInt32, testSInt64,
    testFixed32, testFixed64, testSFixed32, testSFixed64, testFloat,
    testDouble, testBool, testString, testUnicode, testBytes,
    testFailedDecoding :: Test

testRawValues :: String -> Lens' Raw a -> (a -> Doc)
              -> (a -> Builder) -> [(String, a)] -> Test
testRawValues groupName access showMsg encode values
    = testRawValuePairs groupName access showMsg encode
        [(name, x, x) | (name, x) <- values]

testRawValuePairs :: String -> Lens' Raw a -> (a -> Doc)
                  -> (b -> Builder) -> [(String, a, b)] -> Test
testRawValuePairs groupName access showMsg encode values
    = testGroup groupName
          [ serializeTo name (def & access .~ x) (showMsg x)
                      (encode y)
          | (name, x, y) <- values
          ]

-- Some test cases for Haskell integer types that are shared between multiple
-- proto types (e.g., Word32 vs uint32/fixed32).
-- We put explicit types to help ensure that (1) that fields were generated
-- with the right type, and (2) the test is referring to the correct field.

int32Values :: [(String, Int32)]
int32Values =
    [ ("zero", 0)
    , ("simple", 27)
    , ("large", 1234567)
    , ("negative", -1234567)
    , ("maxBound", maxBound)
    , ("minBound", minBound)
    ]

testInt32 = testRawValues "int32" a
                (keyedShow "a")
                (tagged 1 . VarInt . fromIntegral)
                int32Values

testSInt32 = testRawValues "sint32" l
                (keyedShow "l")
                (tagged 12 . VarInt . signed)
                int32Values

-- | A simpler specification of "zig-zag" encoding without using explicit
-- bitwise ops.
signed :: (Integral a, Num b) => a -> b
signed x
    | x >= 0 = 2 * fromIntegral x
    | otherwise = 1 + 2 * fromIntegral (negate $ x + 1)

testSFixed32 = testRawValues "sfixed32" n
                  (keyedShow "n")
                  (tagged 14 . Fixed32 . fromIntegral)
                  int32Values

int64Values :: [(String, Int64)]
int64Values =
    [ ("zero", 0)
    , ("simple", 27)
    , ("large", 1234567)
    , ("more-than-int32", fromIntegral (maxBound :: Int32) * 7)
    , ("negative", -1234567)
    , ("neg-more-than-int32", fromIntegral (maxBound :: Int32) * (-7))
    , ("maxBound", maxBound)
    , ("minBound", minBound)
    ]

testInt64 = testRawValues "int64" b
                (keyedShow "b")
                (tagged 2 . VarInt . fromIntegral)
                int64Values

testSInt64 = testRawValues "sint64" m
                (keyedShow "m")
                (tagged 13 . VarInt . signed)
                int64Values

testSFixed64 = testRawValues "sfixed64" o
                  (keyedShow "o")
                  (tagged 15 . Fixed64 . fromIntegral)
                  int64Values

word32Values :: [(String, Word32)]
word32Values =
    [ ("zero", 0)
    , ("simple", 27)
    , ("large", 1234567)
    , ("maxBound", maxBound)
    ]

testUInt32 = testRawValues "uint32" j
                (keyedShow "j")
                (tagged 10 . VarInt . fromIntegral)
                word32Values

testFixed32 = testRawValues "fixed32" c
                (keyedShow "c")
                (tagged 3 . Fixed32)
                word32Values

word64Values :: [(String, Word64)]
word64Values =
    [ ("zero", 0)
    , ("simple", 27)
    , ("large", 1234567)
    , ("more-than-word32", fromIntegral (maxBound :: Word32) * 7)
    , ("maxBound", maxBound)
    ]

testUInt64 = testRawValues "uint64" k
                (keyedShow "k")
                (tagged 11 . VarInt)
                word64Values

testFixed64 = testRawValues "fixed64" d
                (keyedShow "d")
                (tagged 4 . Fixed64)
                word64Values

testFloat = testRawValuePairs "float" e
    (keyedShow "e")
    (tagged 5 . Fixed32)
    ([ ("zero", 0, 0x0)
     , ("simple", 27, 0x41d80000)
     , ("negative", -27, 0xc1d80000)
     -- Use denominators that aren't divisible by 2, to fill out the
     -- bits.
     , ("fractional", 20 / 3, 0x40d55555)
     , ("negative fractional", -(20/3), 0xc0d55555)
     ] :: [(String, Float, Word32)])
testDouble = testRawValuePairs "double" f
    (keyedShow "f")
    (tagged 6 . Fixed64)
    ([ ("zero", 0, 0x0)
     , ("simple", 27, 0x403b000000000000)
     , ("negative", -27, 0xc03b000000000000)
     -- Use denominators that aren't divisible by 2, to fill out the
     -- bits.
     , ("fractional", 20 / 3, 0x401aaaaaaaaaaaab)
     , ("negative fractional", -(20/3), 0xc01aaaaaaaaaaaab)
     ] :: [(String, Double, Word64)])

testBool = testGroup "bool"
    [ testRawValuePairs "named" g
        (keyed "g" . (\t -> if t then "true" else "false"))
        (tagged 7 . VarInt)
        [ ("true", True, 1)
        , ("false", False, 0)
        ]
    , readFails "invalid string" "g: blah"
    , readSucceeds "int true" (def & g .~ True) "g: 1"
    , readSucceeds "int false" (def & g .~ False) "g: 0"
    , readFails "invalid int" "g: 3"
    ]

testString = testRawValues "string" h
    (keyedShow "h")
    (tagged 8 . Lengthy . byteString . encodeUtf8)
    ([ ("empty", "")
     , ("one-char", "x")
     , ("longer", "abcde")
     -- stress-test the encoding of the length
     , ("very long", Text.replicate 12345 "x")
     ] :: [(String, Text)])

testUnicode = testGroup "unicode"
    [ test "unicode-char"   "α"       "h: \"\\316\\261\""
    , test "unicode-string" "aαbβcαβ"
           "h: \"a\\316\\261b\\316\\262c\\316\\261\\316\\262\""
    ]
  where
     test name value text =
         serializeTo name ((def :: Raw) & h .~ value) text
                     ((tagged 8 . Lengthy . byteString . encodeUtf8) value)


testBytes = testRawValues "bytes" i
    (keyedShow "i")
    (tagged 9 . Lengthy . byteString)
    (fmap (second B.pack)
        [ ("empty", [])
        , ("small", [42])       -- Chosen to be ASCII.
        , ("longer", [42..52])  -- Chosen to be ASCII.
        -- stress-test the encoding of the length
        , ("very long", replicate 12345 42)
        ])

testFailedDecoding = testGroup "failedDecoding"
    [ deserializeFails "different types" (def & a .~ fromString "foo")
    ]
