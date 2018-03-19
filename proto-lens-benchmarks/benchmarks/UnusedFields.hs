-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

-- | A benchmark to measure the overhead of including a lot of unused fields
-- in a proto message. Because protos are modeled as Haskell records, decoding
-- will involve repeatedly updating a record, which will require copying all
-- the fields that remain unchanged. Extra fields in the proto will also
-- produce more overhead when looking up fields in the descriptor.
module Main where

import Data.ProtoLens.BenchmarkUtil (protoBenchmark, benchmarkMain)
import GHC.Generics (Generic)
import Control.DeepSeq (NFData)
import Criterion.Main (Benchmark)
import Lens.Family2 ((&), (.~))
import Data.Int (Int32)
import Data.ProtoLens.Message (def)
import Proto.UnusedFields
import Proto.UnusedFields_Fields

-- These instances are required by Criterion to benchmark proto decoding.
deriving instance Generic Foo

deriving instance Generic FooWithUnusedFields

deriving instance NFData Foo

deriving instance NFData FooWithUnusedFields

defaultNumInt32s :: Int
defaultNumInt32s = 10000

populateFoo :: Int -> Int32 -> Foo
populateFoo n k = def & field .~ replicate n k

populateFooWithUnusedFields :: Int -> Int32 -> FooWithUnusedFields
populateFooWithUnusedFields n k = def & field .~ replicate n k

benchmaker :: Int -> [Benchmark]
benchmaker size =
    [ protoBenchmark "no-unused" (populateFoo size 5)
    , protoBenchmark "with-unused" (populateFooWithUnusedFields size 5)
    ]

main :: IO ()
main = benchmarkMain defaultNumInt32s benchmaker
