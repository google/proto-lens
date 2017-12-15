-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# LANGUAGE ScopedTypeVariables #-}
-- This module tests a large recursive proto that makes can cause
-- an OOM error by allowing the shrinker to create a giant arbitrary structure.
-- This tests the fix in 'Data.ProtoLens.Arbitrary' by adding @size (`div` 2) to
-- enforce a shrinking structure.

module Main (main) where

import Data.ProtoLens.TestUtil (testMain, runTypedTest, roundTripTest, TypedTest)
import Proto.Pathological

main :: IO ()
main = testMain $
  [ runTypedTest (roundTripTest "pathological_foo" :: TypedTest Foo) ]
