-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.ProtoLens
import Proto.Group
import Proto.Group_Fields
import Lens.Family2 ((&), (.~))
import Test.Tasty (testGroup)

import Data.ProtoLens.TestUtil

main :: IO ()
main = testMain
           [ serializeSimple
           , deserializeEndMismatch
           , roundTripSimple
           , roundTripComplicated
           ]

serializeSimple, deserializeEndMismatch, roundTripSimple,
    roundTripComplicated :: TestTree

serializeSimple = serializeTo
    "serialize Simple"
    (defMessage & (grp . int) .~ 12 :: Simple)
    (braced "Grp" (keyedInt "int" 12))
    (tagged 1 GroupStart <> tagged 2 (VarInt 12) <> tagged 1 GroupEnd)

deserializeEndMismatch = testGroup "end mismatch"
    [ deserializeFrom
        "bad field number"
        (Nothing :: Maybe Simple)
        $ tagged 1 GroupStart <> tagged 2 (VarInt 12) <> tagged 5 GroupEnd
    , deserializeFrom
        "bad field numbers aren't skipped"
        (Nothing :: Maybe Simple)
        $ tagged 1 GroupStart <> tagged 2 (VarInt 12)
            -- An incorrect field number for the group-end should cause a
            -- failure, rather than being ignored.
            <> tagged 5 GroupEnd
            <> tagged 1 GroupEnd
    ]

roundTripSimple = runTypedTest
    (roundTripTest "roundtrip Simple" :: TypedTest Simple)
roundTripComplicated = runTypedTest
    (roundTripTest "roundtrip Complicated" :: TypedTest Complicated)
