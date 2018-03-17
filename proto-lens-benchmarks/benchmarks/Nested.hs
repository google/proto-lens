-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

-- | A benchmark to measure the difference between nesting fields in a repeated
-- submessage vs. putting repeated fields directly in the top-level message.
module Main (main) where

import Data.Int (Int32)
import Data.ProtoLens.BenchmarkUtil (protoBenchmark, benchmarkMain)
import GHC.Generics (Generic)
import Control.DeepSeq (NFData)
import Criterion.Main (Benchmark)
import Data.Text (Text)
import Lens.Family ((&), (.~))
import Data.ProtoLens.Message (def)
import Proto.Nested
import Proto.Nested_Fields

-- These instances are required by Criterion to benchmark proto decoding.
deriving instance Generic FooFlat

deriving instance Generic FooNested

deriving instance Generic FooNested'Sub

deriving instance NFData FooFlat

deriving instance NFData FooNested

deriving instance NFData FooNested'Sub

defaultNumValues :: Int
defaultNumValues = 10000

intValue :: Int32
intValue = 5

strValue :: Text
strValue = "foo"

populateFlat :: Int -> FooFlat
populateFlat n =
    def & (intField .~ replicate n intValue) .
    (strField .~ replicate n strValue)

populateNested :: Int -> FooNested
populateNested n = def & sub .~ replicate n subMessage
  where
    subMessage = def & (intField .~ intValue) . (strField .~ strValue)

benchmaker :: Int -> [Benchmark]
benchmaker size =
    [ protoBenchmark "flat" (populateFlat size)
    , protoBenchmark "nested" (populateNested size)
    ]

main :: IO ()
main = benchmarkMain defaultNumValues benchmaker
