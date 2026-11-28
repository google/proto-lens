-- Copyright 2026 Google LLC. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

-- | Tests the code generated for the Protobuf Editions feature
-- @message_encoding@.  The expected wire format matches the C++
-- implementation.
module Main (main) where

import qualified Data.ByteString as B
import Data.Int (Int32)
import Data.List (isInfixOf)
import qualified Data.Map as Map
import qualified Data.Text.Lazy as LT
import Data.Word (Word8)
import Data.ProtoLens
    ( Message
    , decodeMessage
    , defMessage
    , encodeMessage
    , readMessage
    , showMessage
    )
import Lens.Family2 ((&), (.~), (^.))
import Test.Tasty (TestTree)
import Test.Tasty.HUnit (assertBool, assertFailure, testCase, (@?=))

import Proto.MessageEncoding (Encodings, Encodings'Group, Inner)
import qualified Proto.MessageEncoding_Fields as F
import qualified Proto.MessageEncodingDep_Fields as D

import Data.ProtoLens.TestUtil (testMain)

main :: IO ()
main = testMain
    [ wireTest "inherited DELIMITED"
        (defMessage & F.delimited .~ inner 150 :: Encodings)
        [0x0b, 0x08, 0x96, 0x01, 0x0c]
    , wireTest "field-level LENGTH_PREFIXED override"
        (defMessage & F.lengthPrefixed .~ inner 150 :: Encodings)
        [0x12, 0x03, 0x08, 0x96, 0x01]
    , wireTest "repeated DELIMITED"
        (defMessage & F.repeatedDelimited .~ [inner 1, inner 2] :: Encodings)
        [0x1b, 0x08, 0x01, 0x1c, 0x1b, 0x08, 0x02, 0x1c]
    , wireTest "oneof DELIMITED"
        (defMessage & F.oneofDelimited .~ inner 1 :: Encodings)
        [0x23, 0x08, 0x01, 0x24]
    , wireTest "map fields stay LENGTH_PREFIXED"
        (defMessage & F.innerMap .~ Map.singleton 1 (inner 2) :: Encodings)
        [0x32, 0x06, 0x08, 0x01, 0x12, 0x02, 0x08, 0x02]
    , wireTest "DELIMITED type from another file"
        (defMessage & F.otherFile .~ (defMessage & D.foo .~ 3) :: Encodings)
        [0x3b, 0x08, 0x03, 0x3c]
    , wireTest "group-like DELIMITED field"
        (defMessage & F.group .~ (defMessage & F.b .~ 4) :: Encodings)
        [0x43, 0x08, 0x04, 0x44]
    -- The types of non-group-like DELIMITED fields encode normally on their
    -- own.
    , wireTest "standalone shared type" (inner 150) [0x08, 0x96, 0x01]
    -- Group-like fields generate the same code as proto2 groups (so that
    -- migrating to Editions doesn't change behavior), including the END_GROUP
    -- tag in the group type's own encoding.
    , wireTest "standalone group-like type"
        (defMessage & F.b .~ 4 :: Encodings'Group)
        [0x08, 0x04, 0x44]
    , testCase "skips nested unknown groups" $ do
        -- The nested group (field 5) contains an unknown field 2.
        let bytes = B.pack [0x0b, 0x08, 0x01, 0x2b, 0x10, 0x07, 0x2c, 0x0c]
        case decodeMessage bytes :: Either String Encodings of
            Left e -> assertFailure e
            Right m -> m ^. F.delimited . F.a @?= 1
    , testCase "rejects mismatched end-group tag" $
        assertLeft (decodeMessage (B.pack [0x0b, 0x08, 0x01, 0x14])
                        :: Either String Encodings)
    , testCase "rejects missing end-group tag" $
        assertLeft (decodeMessage (B.pack [0x0b, 0x08, 0x01])
                        :: Either String Encodings)
    , testCase "text format" $ do
        let m = defMessage
                    & F.delimited .~ inner 1
                    & F.group .~ (defMessage & F.b .~ 2) :: Encodings
            s = showMessage m
        assertBool s $ "delimited {" `isInfixOf` s
        assertBool s $ "Group {" `isInfixOf` s
        readMessage (LT.pack s) @?= Right m
    ]

inner :: Int32 -> Inner
inner x = defMessage & F.a .~ x

-- | Checks that a message encodes to the given bytes, and decodes back.
wireTest :: (Message msg, Eq msg, Show msg) => String -> msg -> [Word8] -> TestTree
wireTest name m bytes = testCase name $ do
    B.unpack (encodeMessage m) @?= bytes
    decodeMessage (B.pack bytes) @?= Right m

assertLeft :: Show a => Either String a -> IO ()
assertLeft (Left _) = return ()
assertLeft (Right x) = assertFailure $ "Expected a parse failure, got: " ++ show x
