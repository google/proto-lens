-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# LANGUAGE OverloadedStrings #-}

module Main where

import Proto.Group
import Data.ProtoLens
import Lens.Family2 ((&), (.~))

import Data.ProtoLens.TestUtil

main = testMain
           [ serializeSimple
           , deserializeSimple
           , roundTripSimple
           , roundTripComplicated
           ]

serializeSimple = serializeTo
    "serialize Simple"
    (def & (grp . int) .~ 12 :: Simple)
    (braced "Grp" (keyed "int" 12))
    (tagged 1 $ Group [(2, VarInt 12)])

deserializeSimple = deserializeFrom
    "Simple"
    (Just (def & (grp . int) .~ 12 :: Simple))
    (tagged 1 $ Group [(2, VarInt 12)])

roundTripSimple = runTypedTest
    (roundTripTest "roundtrip Simple" :: TypedTest Simple)
roundTripComplicated = runTypedTest
    (roundTripTest "roundtrip Complicated" :: TypedTest Complicated)
