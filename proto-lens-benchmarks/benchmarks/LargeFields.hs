{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import           Criterion.Main               (Benchmark)
import           Data.Int                     (Int32)
import           Data.ProtoLens.BenchmarkUtil (benchmarkMain, protoBenchmark)
import           Data.ProtoLens.Message       (defMessage)
import           Data.Text                    (Text)
import qualified Data.Text                    as Text
import           Lens.Family                  ((&), (.~))

import           Proto.LargeFields
import           Proto.LargeFields_Fields

defaultNumValues :: Int
defaultNumValues = 1024

strValue :: Text
strValue = "x"

populateFoo :: Int -> Foo
populateFoo n = defMessage & (strField .~ Text.replicate n strValue)

benchmaker :: Int -> [Benchmark]
benchmaker size =
    [ protoBenchmark "10K" (populateFoo $ 10 * size)
    , protoBenchmark "100K" (populateFoo $ 100 * size)
    , protoBenchmark "1M" (populateFoo $ 1024 * size)
    , protoBenchmark "10M" (populateFoo $ 10240 * size)
    ]

main :: IO ()
main = benchmarkMain defaultNumValues benchmaker
