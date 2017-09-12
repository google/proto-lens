-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

module Main where

import Proto.Memory
import Lens.Family2 ((&), (.~), (^.))
import Data.ProtoLens
import Data.Monoid (mconcat, mempty, (<>))
import Test.Framework.Providers.HUnit (testCase)

import Data.ProtoLens.TestUtil

defMemory :: Memory
defMemory = def

main =
  testMain $ (: []) $ testCase "memory" $ do
    let value = defMemory & data' .~ replicate 100000000 pi
    let msg = encodeMessage value
    let output = (decodeMessageOrDie msg :: Memory) ^. data'
    output `seq` return ()
