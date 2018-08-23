{-# LANGUAGE OverloadedLabels #-}
module Main where

import Data.Int (Int32)
import Prelude hiding ((.))
import Lens.Labels ((&), (.~), (^.), (.), runLens, set)
import qualified Lens.Family2
import qualified Lens.Family
import Proto.Canonical (Test1, Test3)

import Data.ProtoLens (build, defMessage)
import Data.ProtoLens.TestUtil
import Test.HUnit ((@?=))
import Test.Framework.Providers.HUnit (testCase)

main :: IO ()
main = testMain
    [ testCase "inside" inside
    , testCase "outside" outside
    , testCase "fromBuild" fromBuild
    , testCase "lensFamily" lensFamily
    , testCase "lensFamilyCore" lensFamilyCore
    ]

-- Test that type inference works in both directions compatibly with
-- `defMessage :: Message a => a`.
inside :: IO ()
inside = let msg = (defMessage :: Test3) & #c . #a .~ 42
         in 42 @?= msg ^. #c . #a

outside :: IO ()
outside = let msg = defMessage & #c . #a .~ 42 :: Test3
          in 42 @?= msg ^. #c . #a

fromBuild :: IO ()
fromBuild = let msg = build (#c . #a .~ 42) :: Test3
            in 42 @?= msg ^. #c . #a

-- Test the integration with lens-family and lens-family-core.
-- Unfortunately, "lens-family"'s setter functions such as (.~)
-- are higher-rank and don't always do type inference well with lens-labels'
-- HasLens instances.  Luckily 'lens-family-core' doesn't have that problem
-- (see below), and neither do the 'lens' or 'microlens' packages.
lensFamily :: IO ()
lensFamily = do
    let msg1 = defMessage & set #a 42 :: Test1
    let msg2 = defMessage & Lens.Family2.set
                        (runLens #a :: Lens.Family2.Lens' Test1 Int32)
                        42
    let msg3 = defMessage & Lens.Family2.set (runLens #a) 42 :: Test1
    msg1 @?= msg2
    msg1 @?= msg3

-- | lens-family-core doesn't need any extra annotations to infer the type
-- of `msg2`.
lensFamilyCore :: IO ()
lensFamilyCore = let
    msg1 = defMessage & set #a 42 :: Test1
    msg2 = defMessage & Lens.Family.set (runLens #a) 42
    in msg1 @?= msg2
