{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Main (main) where

import Data.ByteString.Builder (Builder)
import Data.Either (isLeft)
import Data.ProtoLens
import qualified Data.ProtoLens.Encoding.Wire as Wire
import qualified Data.Text.Lazy as LT
import Lens.Family2 ((&), (.~))
import Test.Tasty.HUnit (testCase, (@=?))

import Data.ProtoLens.TestUtil
import Proto.UnknownFields
import Proto.UnknownFields_Fields

main :: IO ()
main = testMain
    [ testPreserveUnknownFields
    , testPreserveMismatchedFields
    , testUnknownGroup
    ]


testPreserveUnknownFields :: TestTree
testPreserveUnknownFields =
    let sub = tagged 50 (VarInt 43) <> tagged 51 (Lengthy $ tagged 52 (Fixed32 44))
    in testUnknownSerialization
        "unknown fields"
        ((defMessage :: Raw)
            & a .~ 42
              & b .~ 17
              & unknownFields .~
                  [ TaggedValue 100 $ Wire.VarInt 101
                  , TaggedValue 150 $ Wire.Lengthy
                                    $ toStrictByteString sub
                  , TaggedValue 200 $ Wire.Lengthy "abcde"
                  -- Make sure we allow multiple values for the same tag
                  -- (in particular, to support unknown repeated fields):
                  , TaggedValue 100 $ Wire.VarInt 102
                  ])
        (vcat [ keyedInt "a" 42
              , keyedInt "b" 17
              , keyedInt "100" 101
              , braced "150" $ keyedInt "50" 43
                    $+$ braced "51" (keyedInt "52" 44)
              , keyedStr "200" "abcde"
              , keyedInt "100" 102
              ])
        (mconcat
              [ tagged 1 $ VarInt 42
              , tagged 2 $ Fixed32 17
              , tagged 100 $ VarInt 101
              , tagged 150 $ Lengthy sub
              , tagged 200 $ Lengthy "abcde"
              , tagged 100 $ VarInt 102
              ])

testPreserveMismatchedFields :: TestTree
testPreserveMismatchedFields =
    testUnknownSerialization
        "mismatched fields"
        ((defMessage :: Raw)
              & unknownFields .~
                  [ TaggedValue 1 $ Wire.Fixed32 42
                  , TaggedValue 2 $ Wire.Lengthy "abcde"
                  ])
        (vcat [ keyedInt "1" 42
              , keyedStr "2" "abcde"
              ])
        (mconcat
              [ tagged 1 $ Fixed32 42 -- expects a varint
              , tagged 2 $ Lengthy "abcde" -- expects a fixed32
              ])



-- TODO: The way that we display groups is somewhat hacky.
testUnknownGroup :: TestTree
testUnknownGroup =
    testUnknownSerialization "unknown group"
          ((defMessage :: Raw)
              & a .~ 42
              & b .~ 17
              & unknownFields .~
                  [ TaggedValue 100 Wire.StartGroup
                  , TaggedValue 150 $ Wire.VarInt 5
                  , TaggedValue 100 Wire.EndGroup
                  ])
          (vcat [ keyedInt "a" 42
                , keyedInt "b" 17
                , keyed "100" "start_group"
                , keyedInt "150" 5
                , keyed "100" "end_group"
                ])
          (mconcat
                [ tagged 1 $ VarInt 42
                , tagged 2 $ Fixed32 17
                , tagged 100 GroupStart
                , tagged 150 $ VarInt 5
                , tagged 100 GroupEnd
                ])

testUnknownSerialization
    :: forall msg . (Eq msg, Show msg, Message msg)
    => String -> msg -> Doc -> Builder -> TestTree
testUnknownSerialization name msg ts bs = testCase name $ do
    let bs' = toStrictByteString bs
    bs' @=? encodeMessage msg
    Right msg @=? decodeMessage bs'
    renderIndenting ts @=? renderIndenting (pprintMessage msg)
    -- Can't decode unknown fields from text format
    satisfies isLeft (readMessage $ LT.pack $ show ts :: Either String msg)
