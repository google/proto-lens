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
    (defMessage :: GenericMessage) @=? defMessage
    ((to . from) (defMessage :: GenericMessage)) @=? (defMessage :: GenericMessage)
