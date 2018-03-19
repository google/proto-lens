-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.ProtoLens
import Data.Monoid ((<>))
import Proto.Group
import Proto.Group_Fields
import Lens.Family2 ((&), (.~))

import Data.ProtoLens.TestUtil

main :: IO ()
main = testMain
           [ serializeSimple
           , deserializeEndMismatch
           , roundTripSimple
           , roundTripComplicated
           ]

serializeSimple, deserializeEndMismatch, roundTripSimple,
    roundTripComplicated :: Test

serializeSimple = serializeTo
    "serialize Simple"
    (def & (grp . int) .~ 12 :: Simple)
    (braced "Grp" (keyedInt "int" 12))
    (tagged 1 GroupStart <> tagged 2 (VarInt 12) <> tagged 1 GroupEnd)

deserializeEndMismatch = deserializeFrom
    "end mismatch"
    (Nothing :: Maybe Simple)
    (tagged 1 GroupStart <> tagged 2 (VarInt 12) <> tagged 5 GroupEnd)

roundTripSimple = runTypedTest
    (roundTripTest "roundtrip Simple" :: TypedTest Simple)
roundTripComplicated = runTypedTest
    (roundTripTest "roundtrip Complicated" :: TypedTest Complicated)
