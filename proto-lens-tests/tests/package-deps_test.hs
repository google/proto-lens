module Main where

import Data.ProtoLens (def)
import Lens.Family2 ((&), (.~), (^.))
import Test.Framework.Providers.HUnit (testCase)
import Test.HUnit ((@=?))

import Data.ProtoLens.TestUtil (Test, testMain)
import Proto.PackageDeps (Bar)
import Proto.PackageDeps'Fields (foo)
import Proto.TestDep.Foo'Fields (value)

main :: IO ()
main = testMain [testWrapper]

testWrapper :: Test
testWrapper = testCase "testWrapper" $
    42 @=? (def & foo . value .~ 42 :: Bar) ^. foo . value
