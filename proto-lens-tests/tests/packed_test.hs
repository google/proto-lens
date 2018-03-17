-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd
{-# LANGUAGE OverloadedStrings #-}
module Main where

import Proto.Packed
import Proto.Packed_Fields
import Lens.Family2 ((&), (.~))
import Data.ProtoLens

import Data.ProtoLens.TestUtil

defFoo :: Foo
defFoo = def

main :: IO ()
main = testMain
    [ serializeTo "default" defFoo mempty mempty
    , serializeTo "unpacked"
          (defFoo & a .~ [1..3])
          (vcat [keyedInt "a" x | x <- [1..3]])
          $ mconcat [tagged 1 $ VarInt x | x <- [1..3]]
    , serializeTo "packed"
          (defFoo & b .~ [1..3])
          (vcat [keyedInt "b" x | x <- [1..3]])
          $ tagged 2 $ Lengthy $ mconcat [varInt x | x <- [1..3]]
    , deserializeFrom "unpacked-as-packed"
          (Just $ defFoo & a .~ [1..3])
          $ tagged 1 $ Lengthy $ mconcat [varInt x | x <- [1..3]]
    , deserializeFrom "packed-as-unpacked"
          (Just $ defFoo & b .~ [1..3])
          $ mconcat [tagged 2 $ VarInt x | x <- [1..3]]
    , runTypedTest (roundTripTest "roundtrip" :: TypedTest Foo)
    ]
