-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd
{-# LANGUAGE OverloadedStrings #-}
module Main where

import Proto.Optional
import Proto.Optional_Fields
import Data.ProtoLens
import Lens.Family2 ((&), (.~), (^.))
import Test.Framework (testGroup)
import Test.Framework.Providers.HUnit (testCase)
import Test.HUnit ((@=?))

import Data.ProtoLens.TestUtil

defFoo :: Foo
defFoo = def

main :: IO ()
main = testMain
    [ testGroup "serialize"
        [ serializeTo "default" defFoo "" mempty
        , serializeTo "different-from-implicit-default" (defFoo & a .~ 17)
              (keyed "a" "17")
              $ tagged 1 $ VarInt 17
        , serializeTo "different-from-explicit-default" (defFoo & b .~ 17)
              (keyed "b" "17")
              $ tagged 2 $ VarInt 17
        , serializeTo "same-as-implicit-default" (defFoo & a .~ 0)
              (keyed "a" "0")
              $ tagged 1 $ VarInt 0
        , serializeTo "same-as-explicit-default" (defFoo & b .~ 42)
              (keyed "b" "42")
              $ tagged 2 $ VarInt 42
        ]
    , testGroup "lens"
        [ testCase "implicit-default" $ defFoo ^. a @=? 0
        , testCase "explicit-default" $ defFoo ^. b @=? 42
        , testCase "implicit-nondefault" $ (defFoo & a .~ 17) ^. a @=? 17
        , testCase "explicit-nondefault" $ (defFoo & b .~ 17) ^. b @=? 17
        ]
    , testGroup "maybe'lens"
        [ testCase "implicit-default" $ defFoo ^. maybe'a @=? Nothing
        , testCase "explicit-default" $ defFoo ^. maybe'b @=? Nothing
        , testCase "implicit-nondefault" $ do
            let x = defFoo & maybe'a .~ Just 17
            x ^. maybe'a @=? Just 17
            x ^. a @=? 17
        , testCase "explicit-nondefault" $ do
            let x = defFoo & maybe'b .~ Just 17
            x ^. maybe'b @=? Just 17
            x ^. b @=? 17
        ]
    , testGroup "broken-lens-laws"
        -- Codify the fact that if x does not have field "a" set,
        -- then (x & a .~ (x ^. a)) != x
        -- since in the LHS the optional field *is* set.
        [ testCase "implicit" $ (defFoo & a .~ 0) ^. maybe'a @=? Just 0
        , testCase "explicit" $ (defFoo & b .~ 42) ^. maybe'b @=? Just 42
        ]
    , runTypedTest (roundTripTest "roundtrip" :: TypedTest Foo)
    ]

