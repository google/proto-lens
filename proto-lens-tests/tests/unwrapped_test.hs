-- | These are duplicates of labels_test.hs.
-- They have been updated to use Lens.Family via Lens.Labels.Unwrapped
{-# LANGUAGE OverloadedLabels #-}
module Main where

import Prelude
import Lens.Family ((&), (.~), (^.))
import Lens.Labels.Unwrapped ()
import Proto.Canonical (Test3)

import Data.ProtoLens (build, defMessage)
import Data.ProtoLens.TestUtil
import Test.HUnit ((@?=))
import Test.Framework.Providers.HUnit (testCase)

main :: IO ()
main = testMain
    [ testCase "inside" inside
    , testCase "outside" outside
    , testCase "fromBuild" fromBuild
    ]

inside :: IO ()
inside = let msg = (defMessage :: Test3) & #c . #a .~ 42
         in 42 @?= msg ^. #c . #a

outside :: IO ()
outside = let msg = defMessage & #c . #a .~ 42 :: Test3
          in 42 @?= msg ^. #c . #a

fromBuild :: IO ()
fromBuild = let msg = build (#c . #a .~ 42) :: Test3
            in 42 @?= msg ^. #c . #a
