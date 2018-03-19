-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# LANGUAGE OverloadedStrings #-}
module Main where

import Data.Default.Class (def)
import Data.Monoid ((<>))
import Lens.Family ((&), (.~))
import Proto.Required (Foo)
import Proto.Required_Fields (a, b)
import Test.Framework (testGroup)

import Data.ProtoLens.TestUtil

defFoo :: Foo
defFoo = def

failedFoo :: Maybe Foo
failedFoo = Nothing

main :: IO ()
main = testMain
    [ empty
    , onlyRequired
    , onlyOptional
    , both
    ]

empty, onlyRequired, onlyOptional, both :: Test

empty = testGroup "empty"
    [ deserializeFrom "wire" failedFoo mempty
    , readFrom "text" failedFoo ""
    ]

onlyRequired = testGroup "only-required"
    [ deserializeFrom "wire" target $ tagged 1 $ VarInt 42
    , readFrom "text-by-name" target "a: 42"
    , readFrom "text-by-tag" target "1: 42"
    ]
  where
    target = Just $ defFoo & a .~ 42

onlyOptional = testGroup "only-optional"
    [ deserializeFrom "wire" failedFoo $ tagged 2 $ VarInt 42
    , readFrom "text-by-name" failedFoo "b: 42"
    , readFrom "text-by-tag" failedFoo "2: 42"
    ]

both = testGroup "both"
    [ deserializeFrom "wire" target
        $ tagged 1 (VarInt 42) <> tagged 2 (VarInt 17)
    , readFrom "text-by-name" target "a: 42  b: 17"
    , readFrom "text-by-tag" target "1: 42  2: 17"
    ]
  where
    target = Just $ defFoo & a .~ 42 & b .~ 17
