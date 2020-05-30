module Main where

import Data.ProtoLens (defMessage)
import Lens.Family2 ((&), (.~), (^.))
import Test.Tasty.HUnit (testCase, (@=?))

import Data.ProtoLens.TestUtil (TestTree, testMain)
import Proto.PackageDeps (Bar)
import Proto.PackageDeps_Fields (foo)
import Proto.TestDep.Foo_Fields (value)

main :: IO ()
main = testMain [testWrapper]

testWrapper :: TestTree
testWrapper = testCase "testWrapper" $
    42 @=? (defMessage & foo . value .~ 42 :: Bar) ^. foo . value
