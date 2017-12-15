-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# LANGUAGE ScopedTypeVariables #-}
-- This module tests a large recursive proto that can cause an OOM error by
-- allowing the arbitrary generator to create a giant data structure.
-- This tests the fix in 'Data.ProtoLens.Arbitrary' by adding @size (`div` 2)@ to
-- the recrusive case to ensure that the generated structure is limited in size.

module Main (main) where

import Data.ProtoLens.TestUtil (testMain, runTypedTest, roundTripTest, TypedTest)
import Proto.Pathological

main :: IO ()
main = testMain $
  [ runTypedTest (roundTripTest "pathological_foo" :: TypedTest Foo) ]
