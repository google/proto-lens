module Main where

import Data.ProtoLens (defMessage)
import Lens.Family2 ((&), (.~), (^.))
import Test.Framework.Providers.HUnit (testCase)
import Test.HUnit ((@=?))

import Data.ProtoLens.TestUtil (Test, testMain)
import Proto.PackageDeps (Bar)
import Proto.PackageDeps_Fields (foo)
import Proto.TestDep.Foo_Fields (value)

main :: IO ()
main = testMain [testWrapper]

testWrapper :: Test
testWrapper = testCase "testWrapper" $
    42 @=? (defMessage & foo . value .~ 42 :: Bar) ^. foo . value
