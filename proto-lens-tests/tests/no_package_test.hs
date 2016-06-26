{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE OverloadedStrings #-}
module Main where

import Data.ProtoLens
import Lens.Family2 ((&), (.~), (^.))
import Test.Framework.Providers.HUnit (testCase)
import Test.HUnit ((@=?))

import Data.ProtoLens.TestUtil (testMain)
import Proto.NoPackage

main = testMain [testNames]

testNames = testCase "testNoPackage" $ do
    42 @=? (def & c . a .~ 42 :: Foo) ^. c . a
    42 @=? (def & d . e .~ 42 :: Foo) ^. d . e
    [(42, "answer")] @=? (def & b .~ [(42, "answer")] :: Foo) ^. b
    
