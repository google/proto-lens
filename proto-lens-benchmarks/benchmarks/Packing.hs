-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

-- | A benchmark to measure the performance difference between packed and
-- unpacked integer data.
module Main (main) where

import Data.ProtoLens.BenchmarkUtil (protoBenchmark, benchmarkMain)
import Criterion.Main (Benchmark)
import Lens.Family ((&), (.~))
import Data.ProtoLens (defMessage)
import Proto.Packing
import Proto.Packing_Fields

defaultNumValues :: Int
defaultNumValues = 1000

benchmaker :: Int -> [Benchmark]
benchmaker size =
    -- Run the packing benchmark first; criterion graphs look better
    -- (less likely for the legend to overlap results) if smaller results
    -- are first.
    [ protoBenchmark "int32-packed"
        (defMessage & num .~ replicate size 5 :: Int32Packed)
    , protoBenchmark "int32-unpacked"
        (defMessage & num .~ replicate size 5 :: Int32Unpacked)
    , protoBenchmark "fixed32-packed"
        (defMessage & num .~ replicate size 5 :: Fixed32Packed)
    , protoBenchmark "fixed32-unpacked"
        (defMessage & num .~ replicate size 5 :: Fixed32Unpacked)
    , protoBenchmark "float-packed"
        (defMessage & num .~ replicate size 5 :: FloatPacked)
    , protoBenchmark "float-unpacked"
        (defMessage & num .~ replicate size 5 :: FloatUnpacked)
    ]

main :: IO ()
main = benchmarkMain defaultNumValues benchmaker
