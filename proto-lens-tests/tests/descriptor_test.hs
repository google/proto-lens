{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
module Main where

import Data.ProtoLens.Labels ()
import Lens.Family2 (view, toListOf)
import Test.Tasty.HUnit (testCase, (@=?))

import Data.ProtoLens.TestUtil (TestTree, testMain)
import qualified Proto.Descriptor as PB
import Data.ProtoLens.Descriptor

main :: IO ()
main = testMain
  [ testDescriptor
  , testFileDescriptor
  ]

testDescriptor :: TestTree
testDescriptor = testCase "testDescriptor" $ do
  "DescriptorTest" @=? view #name d
  ["a_string", "some_ints", "inner"] @=? toListOf (#field . traverse . #name) d

  where
    d = messageDescriptor @PB.DescriptorTest

testFileDescriptor :: TestTree
testFileDescriptor = testCase "testFileDescriptor" $ do
  "descriptor.proto" @=? view #name d
  "descriptor" @=? view #package d
  ["DescriptorTest", "DescriptorTest2"] @=? toListOf (#messageType . traverse . #name) d
  ["a_string", "some_ints", "inner", "another_string", "some_ints"] @=?
    toListOf (#messageType . traverse . #field . traverse . #name) d

  where
    d = fileDescriptor @PB.DescriptorTest
