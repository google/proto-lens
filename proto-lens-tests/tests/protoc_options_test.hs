module Main where

import Data.ProtoLens
import GHC.Generics
import Test.Tasty.HUnit (testCase, (@=?))

import Data.ProtoLens.TestUtil

import Proto.ProtocOptions

main :: IO ()
main = testMain [testNames]

testNames :: TestTree
testNames = testCase "testNoPackage" $ do
    -- This will not compile if Generic was not derived.
    ((to . from) (defMessage :: GenericMessage)) @=? (defMessage :: GenericMessage)
