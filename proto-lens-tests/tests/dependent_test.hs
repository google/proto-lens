module Main (main) where

import Data.ProtoLens (def)
import Test.Framework (defaultMain)
import Test.Framework.Providers.HUnit (testCase)
import Test.HUnit ((@=?))

import Proto.Dependent (Dependent)
import Proto.Lib (LibMessage)

main :: IO ()
main = defaultMain
    [ testCase "LibMessage" $ (def :: LibMessage) @=? def
    , testCase "Dependent" $ (def :: Dependent) @=? def
    ]
