{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Main (main) where

import Data.ProtoLens
import Data.ProtoLens.Any
import Data.ProtoLens.Arbitrary (ArbitraryMessage(..))
import Proto.Google.Protobuf.Any (typeUrl, value)
import Lens.Family2 ((&), (.~), (^.))
import Test.Framework.Providers.HUnit (testCase)
import Test.HUnit ((@=?))
import qualified Data.Text as Text
import Test.QuickCheck ((===), counterexample, listOf, elements)

import Data.ProtoLens.TestUtil
import Proto.Any

main :: IO ()
main = testMain
    [ testCase "pack/unpack" $ do
          let foo = def & a .~ 42 & b .~ "hello" :: Foo
          let any1 = pack foo
          "type.googleapis.com/test.any.Foo" @=? (any1 ^. typeUrl)
          encodeMessage foo @=? (any1 ^. value)
          -- Unpacking to the right type succeeds
          Right foo @=? unpack any1
          -- Unpacking to the wrong type fails
          Left DifferentType{} <- return (unpack any1 :: Either UnpackError Bar)
          -- Unpacking with the wrong package name fails
          let any2 = any1 & typeUrl .~ "type.googleapis.com/blah.Foo"
          Left DifferentType{} <- return (unpack any2 :: Either UnpackError Foo)
          -- Unpacking with invalid byte data fails
          -- Foo expects a string for field #2
          let any3 = any1 & value .~ toStrictByteString (tagged 2 (VarInt 42))
          Left (DecodingError _) <- return (unpack any3 :: Either UnpackError Foo)
          return ()
    , testProperty "packWithPrefix/unpack" $ \(ArbitraryMessage (foo :: Foo)) -> do
          -- Generate a random prefix containing in particular URL separation
          -- characters.  Make sure that no matter the prefix, "unpack"
          -- recognizes the message name.
          prefix <- Text.pack <$> listOf (elements "abc12./")
          return $ counterexample ("prefix=" ++ show prefix) $
              Right foo === unpack (packWithPrefix prefix foo)
    ]
