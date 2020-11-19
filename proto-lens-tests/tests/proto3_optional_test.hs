-- Copyright 2020 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd
{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import Proto.TestProto3Optional
import Proto.TestProto3Optional_Fields
import Data.ProtoLens
import Lens.Family2 ((&), (.~), (^.))
import Test.Tasty (testGroup)
import Test.Tasty.HUnit (testCase, (@=?))

import Data.ProtoLens.TestUtil

defFoo :: Foo
defFoo = defMessage

main :: IO ()
main = testMain
    [ testGroup "serialize"
        [ serializeTo "unset" defFoo "" mempty
        , serializeTo "tracked-default" (defFoo & tracked .~ 0)
              (keyed "tracked" "0")
              $ tagged 2 $ VarInt 0
        , serializeTo "tracked-nondefault" (defFoo & tracked .~ 17)
              (keyed "tracked" "17")
              $ tagged 2 $ VarInt 17
        , serializeTo "untracked-default" (defFoo & untracked .~ 0) "" mempty
        , serializeTo "alternative-default" (defFoo & alternative .~ 0)
              (keyed "alternative" "0")
              $ tagged 3 $ VarInt 0
        ]
    , testGroup "lens"
        [ testCase "unset" $ defFoo ^. tracked @=? 0
        , testCase "default" $ (defFoo & tracked .~ 0) ^. tracked @=? 0
        ]
    , testGroup "maybe'lens"
        [ testCase "unset" $ defFoo ^. maybe'tracked @=? Nothing
        , testCase "default" $ (defFoo & tracked .~ 0) ^. maybe'tracked
          @=? Just 0
        ]
    -- TODO(gagern): Check that the generated file doesn't contain
    -- code for a oneof. Not sure what the best way is to do this.
    ]


