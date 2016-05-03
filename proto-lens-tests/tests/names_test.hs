-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

-- This module tests that we can use various edge-case field names.
module Main where

import Data.ProtoLens (def)
import Lens.Family2 ((&), (.~), (^.))
import Prelude hiding (Maybe, maybe, head, span)
import Test.Framework.Providers.HUnit (testCase)
import Test.HUnit ((@=?))

import Proto.Names
import TestUtil (testMain)

main = testMain [testNames]

testNames = testCase "testPreludeNames" $ do
    1 @=? (def & head .~ 1 :: Names) ^. head
    1 @=? (def & span .~ 1 :: Names) ^. span
    1 @=? (def & multiWordName .~ 1 :: Names) ^. multiWordName
    1 @=? (def & fooMultiWORDName .~ 1 :: Names) ^. fooMultiWORDName
    1 @=? (def & _multiWordName .~ 1 :: Names) ^. _multiWordName
    1 @=? (def & type' .~ 1 :: Names) ^. type'
    1 @=? (def & maybe .~ 1 :: Maybe) ^. maybe
