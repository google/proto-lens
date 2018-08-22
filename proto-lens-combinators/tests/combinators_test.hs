-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# LANGUAGE OverloadedStrings #-}
module Main where

import Data.ProtoLens (defMessage)
import Data.ProtoLens.Combinators
import Lens.Family ((^.), (.~), (&))
import Lens.Family.State ((.=), (<~), use, zoom)
import Proto.Combinators
import Proto.Combinators_Fields
import Test.Framework (defaultMain)
import Test.Framework.Providers.HUnit (hUnitTestToTests)
import Test.HUnit ((~:), (~?=))

main :: IO ()
main = defaultMain $ hUnitTestToTests $ "" ~:
    [ let proto = defMessage & quux .~ 1 & foo .~ defMessage :: Foo
      in "has" ~:
          [ "True" ~: proto ^. has maybe'quux ~?= True
          , "False" ~: proto ^. has maybe'bar ~?= False
          , "Nested" ~:
              [ "True" ~: proto ^. has maybe'foo ~?= True
              , "False" ~: proto ^. has (foo . maybe'buzz) ~?= False
              ]
          ]
    , let proto = defMessage & quux .~ 2 & foo . fizz .~ 3 :: Foo
      in "clear" ~:
          [ "no-op" ~: clear maybe'bar proto ~?= proto
          , "scalar" ~: clear maybe'quux proto ~?= (defMessage & foo . fizz .~ 3)
          , "group" ~: clear maybe'foo proto ~?= (defMessage & quux .~ 2)
          , "nested" ~: clear (foo . maybe'fizz) proto ~?=
              (defMessage & quux .~ 2 & foo .~ defMessage)
          ]
    , let actual :: Foo
          actual = make $ do
              quux .= 4
              foo . buzz .= "A"
              zoom bar $ do
                  fizz .= 5
                  buzz .= "B"
              zoom baz $ return ()
          expected = defMessage & quux .~ 4 & foo . buzz .~ "A" &
              bar .~ (defMessage & fizz .~ 5 & buzz .~ "B") & baz .~ defMessage
      in "make" ~: actual ~?= expected
    , let original = defMessage & quux .~ 6 & baz . fizz .~ 7 :: Foo
          actual = modifyInState original $ do
              bar . fizz <~ use quux
              quux .= 8
          expected = defMessage & quux .~ 8 & bar . fizz .~ 6 & baz . fizz .~ 7
      in "modifyInState" ~: actual ~?= expected
    ]
