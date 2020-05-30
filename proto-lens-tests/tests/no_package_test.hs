{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE OverloadedStrings #-}
module Main where

import Data.ProtoLens
import Lens.Family2 ((&), (.~), (^.))
import Test.Tasty.HUnit (testCase, (@=?))

import Data.ProtoLens.TestUtil (TestTree, testMain)
import Proto.NoPackage
import Proto.NoPackage_Fields

main :: IO ()
main = testMain [testNames]

testNames :: TestTree
testNames = testCase "testNoPackage" $ do
    42 @=? (defMessage & c . a .~ 42 :: Foo) ^. c . a
    42 @=? (defMessage & d . e .~ 42 :: Foo) ^. d . e
    [(42, "answer")] @=? (defMessage & b .~ [(42, "answer")] :: Foo) ^. b

