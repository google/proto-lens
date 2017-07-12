-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# LANGUAGE OverloadedStrings #-}
module Main where

import Data.ProtoLens
import Lens.Family2 ((&), (.~), (^.))
import qualified Data.ByteString.Builder as Builder
import Data.Monoid ((<>))
import Proto.Proto3
    ( Foo
    , Foo'FooEnum(..)
    , Foo'Sub(..)
    , Strings
    , a
    , b
    , c
    , d
    , e
    , f
    , s
    , sub
    , maybe'c
    , maybe'sub
    , maybe's
    , enum
    , bytes
    , string
    )
import Test.Framework (testGroup)
import Test.Framework.Providers.HUnit (testCase)
import Test.HUnit ((@=?))

import Data.ProtoLens.TestUtil

main :: IO ()
main = testMain
  [ testGroup "Foo"
    [ serializeTo "int32"
        (def & a .~ 150 :: Foo)
        "a: 150"
        $ tagged 1 $ VarInt 150
    , serializeTo "repeated-string"
        (def & b .~ ["one", "two"] :: Foo)
        (vcat $ map (keyedStr "b") ["one", "two"])
        $ mconcat (map (tagged 2 . Lengthy) ["one", "two"])
    , testGroup "oneof"
        [ serializeTo "float"
            -- Use denominators that aren't divisible by 2, to fill out the bits.
            (def & c .~ (20 / 3) :: Foo)
            "c: 6.6666665"
            $ tagged 3 $ Fixed32 0x40d55555
        , serializeTo "bytes"
            (def & d .~ "a\0b" :: Foo)
            "d: \"a\\000b\""
            $ tagged 4 $ Lengthy "a\0b"
        , serializeTo "overridden value"
            (def & d .~ "a\0b" & c .~ (20 / 3) :: Foo)
            "c: 6.6666665"
            $ tagged 3 $ Fixed32 0x40d55555
        -- Scalar "oneof" fields should have a "maybe" selector.
        , testCase "maybe" $ do
            Nothing @=? (def :: Foo) ^. maybe'c
            Just 42 @=? ((def :: Foo) & c .~ 42) ^. maybe'c
            Nothing @=? (def :: Foo) ^. maybe's
        , testCase "message" $ do
            Just 42 @=? ((def :: Foo) & s .~ (def :: Foo'Sub) & c .~ 42) ^. maybe'c
            Nothing @=? ((def :: Foo) & s .~ (def :: Foo'Sub) & c .~ 42) ^. maybe's
            17 @=? ((def :: Foo) & s . e .~ 17) ^. s . e
            let val = (def :: Foo'Sub) & e .~ 17
            Just val @=? ((def :: Foo) & s .~ val) ^. maybe's
        ]
    -- Repeated scalar fields in proto3 should serialize as "packed" by default.
    , serializeTo "packed-by-default"
        (def & f .~ [1,2,3] :: Foo)
        (vcat [keyedInt "f" x | x <- [1..3]])
        $ tagged 7 $ Lengthy $ mconcat [varInt x | x <- [1..3]]
    , runTypedTest (roundTripTest "foo" :: TypedTest Foo)
    ]
  , testGroup "Strings"
    [ deserializeFrom "bytes"
        (Just $ def & bytes .~ toStrictByteString invalidUtf8 :: Maybe Strings)
        $ tagged 1 $ Lengthy invalidUtf8
    , deserializeFrom "string"
        (Nothing :: Maybe Strings)
        $ tagged 2 $ Lengthy invalidUtf8
    ]
  -- Scalar field defaults are indistinguishable from unset fields.
  , testGroup "defaulting"
      [ testCase "int" $ (def :: Foo) @=? (def & a .~ 0)
      , testCase "bytes" $ (def :: Strings) @=? (def & bytes .~ "")
      , testCase "string" $ (def :: Strings) @=? (def & string .~ "")
      , testCase "enum" $ (def :: Foo) @=? (def & enum .~ Foo'Enum1)
      ]
  -- Unset proto3 messages are different than the default value.
  , testGroup "submessage"
      [ testCase "Nothing" $ Nothing @=? ((def :: Foo) ^. maybe'sub)
      , testCase "Just" $ do
          let val = (def :: Foo'Sub) & e .~ 3
          Just val @=? ((def :: Foo) & sub .~ val) ^. maybe'sub
      ]
  ]


invalidUtf8 :: Builder.Builder
invalidUtf8 = Builder.word8 0xc3 <> Builder.word8 0x28
