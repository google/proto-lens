{-# LANGUAGE ScopedTypeVariables #-}

module Main (main) where

import Data.ProtoLens.Arbitrary
import Test.Hspec
import Test.QuickCheck
import Data.ProtoLens (decodeMessage, encodeMessage)
import Proto.Arbitrary

main :: IO ()
main = hspec $
  describe "roundtrip" $ do
    it "should actually work" $
     forAllShrink arbitraryMessage shrinkMessage $ \(msg :: Multi) ->
     decodeMessage (encodeMessage msg) === pure msg
