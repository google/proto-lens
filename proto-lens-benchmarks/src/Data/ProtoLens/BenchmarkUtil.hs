-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# LANGUAGE CPP #-}
{-# LANGUAGE ScopedTypeVariables #-}

-- | A utility library for writing proto-lens benchmarks.
module Data.ProtoLens.BenchmarkUtil (protoBenchmark, benchmarkMain) where

import Control.DeepSeq (NFData)
import Criterion.Main
import qualified Criterion.Main.Options as Criterion
import qualified Data.ByteString as BS
import Data.Maybe (fromMaybe)
import qualified Options.Applicative as Options
#if !MIN_VERSION_base(4,11,0)
import Data.Semigroup ((<>))
#endif

import Data.ProtoLens (Message, encodeMessage, decodeMessageOrDie)
-- | Generate a group of benchmarks for encoding and decoding the given proto
-- message. Includes benchmarks for decoding to both weak head normal form and
-- normal form (i.e. all fields fully forced.) There is only one encoding
-- benchmark because protos are encoded as strict ByteStrings, so there is no
-- difference between normal form and weak head normal form.
protoBenchmark
    :: forall a.
       (NFData a, Message a)
    => String
    -- ^ Benchmark name.
    -> a
    -- ^ Protocol buffer message to encode/decode.
    -> Benchmark
protoBenchmark groupName proto =
    bgroup fullGroupName
        [ bench "encode" $ whnf encodeMessage proto
        , bgroup "decode"
            [ bench "whnf" $ whnf decodeMessageOrDie' encodedProto
            , bench "nf" $ nf decodeMessageOrDie' encodedProto
            ]
        ]
  where
    -- We must indicate to the compiler that we want to decode to the same
    -- message type as the input proto.
    -- We use `decodeMessageOrDie` here so that if a bug is introduced that
    -- causes decoding to fail, the benchmark will fail with an error, instead of
    -- silently reporting a misleading value (the amount of time required to
    -- determine that proto decoding failed).
    decodeMessageOrDie' :: BS.ByteString -> a
    decodeMessageOrDie' = decodeMessageOrDie
    encodedProto = encodeMessage proto
    fullGroupName =
        groupName ++ "(" ++ prettySize (BS.length encodedProto) ++ ")"

prettySize :: Int -> String
prettySize b
  | b < 10240 = show b ++ "B"
  | k < 10240 = show k ++ "kB"
  | otherwise = show m ++ "MB"
  where
    k = b `div` 1024
    m = k `div` 1024

-- | Main function for a benchmark suite with an optional 'size' parameter.
benchmarkMain
    :: Int
    -- ^ Default benchmark size if one is not provided.
    -> (Int -> [Benchmark])
    -- ^ Function to generate a set of benchmarks from a provided 'size'.
    -> IO ()
benchmarkMain defaultSize benchmaker = do
    (maybeSize, criterionMode)
        <- Options.execParser $ Options.info (Options.helper <*> options) mempty
    runMode criterionMode $ benchmaker (fromMaybe defaultSize maybeSize)

options :: Options.Parser (Maybe Int, Criterion.Mode)
options =
    (,) <$>
    Options.optional
        (Options.option
             Options.auto
             (Options.help "Benchmark data size" <>
                Options.metavar "N" <>
                Options.short 's' <>
                Options.long "size")) <*>
    Criterion.parseWith Criterion.defaultConfig
