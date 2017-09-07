-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
module Main where

import qualified Data.Map as M
import Data.ProtoLens
import Data.ProtoLens.Arbitrary
import Data.ProtoLens.Compare (partial)
import Lens.Family2 ((&), (.~))
import Test.Framework (testGroup)
import Test.Framework.Providers.HUnit (testCase)
import Test.HUnit.Base (assertBool)

import Data.ProtoLens.TestUtil
import Proto.Partial
import Proto.Partial'Fields

defFoo :: Foo
defFoo = def

main :: IO ()
main = testMain
    [ testAlwaysMatchDefault
    , testAlwaysMatchSame
    , testMatchRequired
    , testMatchOptional
    , testMatchRepeated
    ]

makeTestCase :: Message a => String -> a -> a -> Test
makeTestCase testName against match = testCase testName $ do
    assertBool "matched"         $ partial against match
    assertBool "not const" . not $ partial match against


testMatchRequired = makeTestCase "required"
    (def @FooReq & bar . deep . name .~ "deeper")
    (def @FooReq & ok .~ 5
                 & bar . name .~ "hello"
                 & bar . deep . name .~ "deeper")

testMatchOptional = makeTestCase "optional"
    (def @Foo & ok .~ 5)
    (def @Foo & ok .~ 5
              & bar . name .~ "hello"
              & bar . deep . name .~ "deeper")

testMatchRepeated = makeTestCase "repeated"
    (def @Foo & rep .~ [ def & name .~ "1"
                       , def & name .~ "3"
                             & another .~ 3
                       ])
    (def @Foo & rep .~ [ def & name .~ "3"
                             & another .~ 3
                       , def & name .~ "2"
                             & another .~ 2
                       , def & name .~ "1"
                             & another .~ 1
                       ])

testMatchMap = makeTestCase "map"
    (def @Foo & mapped .~ M.fromList
                          [ ("a", def & name .~ "1")
                          , ("c", def & name .~ "3"
                                      & another .~ 3)
                          ])
    (def @Foo & mapped .~ M.fromList
                          [ ("a", def & name .~ "1"
                                      & another .~ 2)
                          , ("b", def & name .~ "2"
                                      & another .~ 2)
                          , ("c", def & name .~ "3"
                                      & another .~ 3)
                          ])



testAlwaysMatchDefault = testGroup "always match default"
    [ testProperty "def" alwaysMatchDefaultProperty
    ]
  where
    alwaysMatchDefaultProperty :: ArbitraryMessage Foo -> Bool
    alwaysMatchDefaultProperty (ArbitraryMessage foo)  =
      partial def foo


testAlwaysMatchSame = testGroup "always match same"
    [ testProperty "same" alwaysMatchSameProperty
    ]
  where
    alwaysMatchSameProperty :: ArbitraryMessage Foo -> Bool
    alwaysMatchSameProperty (ArbitraryMessage foo)  =
      partial foo foo
