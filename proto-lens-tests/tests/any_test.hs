{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Main (main) where

import qualified Data.ByteString as B
import Data.ProtoLens
import Data.ProtoLens.Any
import Data.ProtoLens.Arbitrary (ArbitraryMessage(..))
import Proto.Google.Protobuf.Any_Fields (typeUrl, value)
import Lens.Family2 ((&), (.~), (^.))
import Test.Tasty.HUnit (testCase, (@=?))
import qualified Data.Text as Text
import Test.QuickCheck ((===), counterexample, listOf, elements)

import Data.ProtoLens.TestUtil
import Proto.Any
import Proto.Any_Fields

isDifferentType, isDecodingError :: Either UnpackError a -> Bool
isDifferentType (Left DifferentType{}) = True
isDifferentType _ = False
isDecodingError (Left DecodingError{}) = True
isDecodingError _ = False

main :: IO ()
main = testMain
    [ testCase "pack/unpack" $ do
          let foo = defMessage & a .~ 42 & b .~ "hello" :: Foo
          let any1 = pack foo
          "type.googleapis.com/test.any.Foo" @=? (any1 ^. typeUrl)
          encodeMessage foo @=? (any1 ^. value)
          -- Unpacking to the right type succeeds
          Right foo @=? unpack any1
          -- Unpacking to the wrong type fails
          satisfies isDifferentType (unpack any1 :: Either UnpackError Bar)
          -- Unpacking with the wrong package name fails
          let any2 = any1 & typeUrl .~ "type.googleapis.com/blah.Foo"
          satisfies isDifferentType (unpack any2 :: Either UnpackError Foo)
          -- Unpacking with invalid message data fails
          let any3 = any1 & value .~ B.pack [255] -- Invalid protobuf message
          satisfies isDecodingError (unpack any3 :: Either UnpackError Foo)
    , testProperty "packWithPrefix/unpack" $ \(ArbitraryMessage (foo :: Foo)) -> do
          -- Generate a random prefix containing in particular URL separation
          -- characters.  Make sure that no matter the prefix, "unpack"
          -- recognizes the message name.
          prefix <- Text.pack <$> listOf (elements "abc12./")
          return $ counterexample ("prefix=" ++ show prefix) $
              Right foo === unpack (packWithPrefix prefix foo)
    ]
