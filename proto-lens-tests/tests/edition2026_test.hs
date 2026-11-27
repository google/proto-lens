-- Copyright 2026 Google LLC. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

-- Tests that proto-lens-protoc supports files in edition 2026, whose
-- defaults for the features that proto-lens supports are the same as in
-- edition 2023.
{-# LANGUAGE OverloadedStrings #-}
module Main where

import Data.ProtoLens (defMessage)
import Lens.Family2 ((&), (.~), (^.))
import Test.Tasty.HUnit (testCase, (@=?))

import Proto.Edition2026 (Simple)
import Proto.Edition2026_Fields
    ( foo
    , intField
    , maybe'intField
    , packedField
    , stringField
    , sub
    )

import Data.ProtoLens.TestUtil

defSimple :: Simple
defSimple = defMessage

main :: IO ()
main = testMain
  [ serializeTo "int_field"
      (defSimple & intField .~ 5)
      (keyedInt "int_field" 5)
      (tagged 1 $ VarInt 5)

  , serializeTo "string_field"
      (defSimple & stringField .~ "abc")
      (keyedStr "string_field" "abc")
      (tagged 2 $ Lengthy "abc")

  -- message_encoding is LENGTH_PREFIXED by default.
  , serializeTo "sub"
      (defSimple & sub . foo .~ 7)
      (braced "sub" $ keyedInt "foo" 7)
      (tagged 3 $ Lengthy $ tagged 1 $ VarInt 7)

  -- repeated_field_encoding is PACKED by default.
  , serializeTo "packed_field"
      (defSimple & packedField .~ [1, 2])
      (vcat [keyedInt "packed_field" x | x <- [1, 2]])
      (tagged 4 $ Lengthy $ mconcat [varInt x | x <- [1, 2]])

  -- field_presence is EXPLICIT by default.
  , testCase "explicit presence" $ do
      Nothing @=? (defSimple ^. maybe'intField)
      Just 0 @=? ((defSimple & intField .~ 0) ^. maybe'intField)
  ]
