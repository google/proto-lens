{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}

module Main where

import Data.ByteString.Builder (Builder)
import Data.ProtoLens
import qualified Data.ProtoLens.Encoding.Wire as Wire
import Lens.Family2 ((&), (.~))
import Test.Tasty.HUnit (testCase, (@=?))

import Proto.MessageSet
import Proto.MessageSet_Fields
import Data.ProtoLens.TestUtil

main :: IO ()
main = testMain 
    [ testMessageSetSerialization "default" (defMessage @Foo) mempty
    , testMessageSetSerialization "with extension"
        (defMessage @Foo & unknownFields .~ 
            [ TaggedValue 10 (Wire.Lengthy $ encodeMessage $ defMessage @Bar & bar .~ "hello") ])
        (mconcat [tagged 1 GroupStart, tagged 2 $ VarInt 10, tagged 3 $ Lengthy (tagged 1 $ Lengthy "hello"), tagged 1 GroupEnd])
    , testMessageSetSerialization "with multiple extensions"
        (defMessage @Foo & unknownFields .~ 
            [ TaggedValue 10 (Wire.Lengthy $ encodeMessage $ defMessage @Bar & bar .~ "hello")
            , TaggedValue 11 (Wire.Lengthy $ encodeMessage $ defMessage @Baz & baz .~ "world") ])
        (mconcat [ tagged 1 GroupStart, tagged 2 $ VarInt 10, tagged 3 $ Lengthy (tagged 1 $ Lengthy "hello"), tagged 1 GroupEnd
                 , tagged 1 GroupStart, tagged 2 $ VarInt 11, tagged 3 $ Lengthy (tagged 1 $ Lengthy "world"), tagged 1 GroupEnd])
    , deserializeFrom "empty" (Just $ defMessage @Foo) mempty
    , deserializeFrom "with bar extension"
        (Just $ defMessage @Foo & unknownFields .~ 
            [ TaggedValue 10 (Wire.Lengthy $ encodeMessage $ defMessage @Bar & bar .~ "hello") ])
        (mconcat [tagged 1 GroupStart, tagged 2 $ VarInt 10, tagged 3 $ Lengthy (tagged 1 $ Lengthy "hello"), tagged 1 GroupEnd])
    , deserializeFrom "with reversed tag and message (unsupported)"
        (Nothing :: Maybe Foo)
        (mconcat [tagged 1 GroupStart, tagged 3 $ Lengthy (tagged 1 $ Lengthy "hello"), tagged 2 $ VarInt 10, tagged 1 GroupEnd])
    ]

testMessageSetSerialization
    :: forall msg . (Eq msg, Show msg, Message msg)
    => String -> msg -> Builder -> TestTree
testMessageSetSerialization name msg bs = testCase name $ do
    let bs' = toStrictByteString bs
    bs' @=? encodeMessage msg
    Right msg @=? decodeMessage bs'
