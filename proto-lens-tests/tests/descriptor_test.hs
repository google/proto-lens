{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
module Main where

import Data.ProtoLens.Labels ()
import Lens.Family2 (view, toListOf)
import Test.Tasty.HUnit (testCase)
import Test.HUnit ((@=?))

import Data.ProtoLens.TestUtil (TestTree, testMain)
import qualified Proto.Descriptor as PB
import Data.ProtoLens.Descriptor

main :: IO ()
main = testMain
  [ testDescriptor
  ]

testDescriptor :: TestTree
testDescriptor = testCase "testDescriptor" $ do
  "DescriptorTest" @=? view #name d
  ["a_string", "some_ints", "inner"] @=? toListOf (#field . traverse . #name) d

  where
    d = messageDescriptor @PB.DescriptorTest
