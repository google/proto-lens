-- | These are duplicates of labels_test.hs.
-- They have been updated to use Lens.Family via Lens.Labels.Unwrapped
{-# LANGUAGE OverloadedLabels #-}
module Main where

import Prelude
import Lens.Family ((&), (.~), (^.), set)
import Lens.Labels.Unwrapped ()
import Proto.Canonical (Test1, Test3)

import Data.Default.Class (def)
import Data.ProtoLens (build)
import Data.ProtoLens.TestUtil
import Test.HUnit ((@?=))
import Test.Framework.Providers.HUnit (testCase)

main :: IO ()
main = testMain
    [ testCase "inside" inside
    , testCase "outside" outside
    , testCase "fromBuild" fromBuild
    , testCase "lensFamilyCore" lensFamilyCore
    ]

inside :: IO ()
inside = let msg = (def :: Test3) & #c . #a .~ 42
         in 42 @?= msg ^. #c . #a

outside :: IO ()
outside = let msg = def & #c . #a .~ 42 :: Test3
          in 42 @?= msg ^. #c . #a

fromBuild :: IO ()
fromBuild = let msg = build (#c . #a .~ 42) :: Test3
            in 42 @?= msg ^. #c . #a

lensFamilyCore :: IO ()
lensFamilyCore = let
    msg1 = def & set #a 42 :: Test1
    msg2 = def & Lens.Family.set #a 42
    in msg1 @?= msg2
