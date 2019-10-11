-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# LANGUAGE CPP #-}
{-# LANGUAGE OverloadedStrings #-}
module Main where

#if !MIN_VERSION_base(4,11,0)
import Data.Semigroup ((<>))
#endif
import Data.ProtoLens (defMessage)
import Data.Proxy (Proxy(..))
import Lens.Family ((&), (.~))
import Proto.Required (Foo, Bar)
import Proto.Required_Fields (a, b)
import Test.Tasty (testGroup)

import Data.ProtoLens.TestUtil

defFoo :: Foo
defFoo = defMessage

failedFoo :: Maybe Foo
failedFoo = Nothing

main :: IO ()
main = testMain
    [ empty
    , onlyRequired
    , onlyOptional
    , both
    , multipleRequired
    ]

empty, onlyRequired, onlyOptional, both,
    multipleRequired :: TestTree

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

multipleRequired = testGroup "multiple"
    [ deserializeFromExpectingError "both missing"
        (Proxy :: Proxy Bar)
        "\"first_reqd\",\"second_reqd\""
        mempty
    , deserializeFromExpectingError "first missing"
        (Proxy :: Proxy Bar)
        "first_reqd"
        $ tagged 2 (VarInt 42)
    , deserializeFromExpectingError "second missing"
        (Proxy :: Proxy Bar)
        "second_reqd"
        $ tagged 1 (VarInt 42)
    ]
