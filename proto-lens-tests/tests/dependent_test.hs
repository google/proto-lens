module Main (main) where

import Data.ProtoLens (defMessage)
import Test.Framework (defaultMain)
import Test.Framework.Providers.HUnit (testCase)
import Test.HUnit ((@=?))

import Proto.Dependent (Dependent)
import Proto.Lib (LibMessage)

main :: IO ()
main = defaultMain
    [ testCase "LibMessage" $ (defMessage :: LibMessage) @=? defMessage
    , testCase "Dependent" $ (defMessage :: Dependent) @=? defMessage
    ]
