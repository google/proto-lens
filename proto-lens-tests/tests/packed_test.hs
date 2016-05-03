-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

module Main where

import Proto.Packed
import Lens.Family2 ((&), (.~))
import Data.ProtoLens
import Data.Monoid (mconcat, mempty, (<>))

import TestUtil

defFoo :: Foo
defFoo = def

-- TODO: currently packed fields are *always* set in the encoding; see
-- empty "tagged 2" in the below tests.  Should we instead omit them
-- when they're empty?

main = testMain
    [ serializeTo "default" defFoo mempty $ tagged 2 $ Lengthy mempty
    , serializeTo "repeated unpacked"
          (defFoo & a .~ [1..3])
          (vcat [keyed "a" x | x <- [1..3]])
          $ mconcat [tagged 1 $ VarInt x | x <- [1..3]]
            <> tagged 2 (Lengthy mempty)
    , serializeTo "repeated packed"
          (defFoo & b .~ [1..3])
          (vcat [keyed "b" x | x <- [1..3]])
          $ tagged 2 $ Lengthy $ mconcat [varInt x | x <- [1..3]]
    , runTypedTest (roundTripTest "roundtrip" :: TypedTest Foo)
    ]
