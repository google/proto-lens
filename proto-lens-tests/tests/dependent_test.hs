module Main (main) where

import Data.ProtoLens (defMessage)
import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (testCase, (@=?))

import Proto.Dependent (Dependent)
import Proto.Lib (LibMessage)

main :: IO ()
main = defaultMain $ testGroup "tests"
    [ testCase "LibMessage" $ (defMessage :: LibMessage) @=? defMessage
    , testCase "Dependent" $ (defMessage :: Dependent) @=? defMessage
    ]
