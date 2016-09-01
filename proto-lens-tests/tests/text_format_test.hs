-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# LANGUAGE OverloadedStrings #-}
module Main where

import qualified Data.ByteString
import Data.Char (ord)
import Data.Monoid ((<>))
import qualified Data.Text.Lazy
import Data.Word (Word8)
import Data.ProtoLens (
    def, Message, showMessage, showMessageShort, pprintMessage)
import Lens.Family2 ((&), (.~))
import Proto.Canonical
import Test.Framework.Providers.HUnit (testCase)
import Test.HUnit ((@=?))
import Text.PrettyPrint (renderStyle, style, lineLength)

import Data.ProtoLens.TestUtil

def1 :: Test1
def1 = def

def2 :: Test2
def2 = def

def3 :: Test3
def3 = def

def4 :: Test4
def4 = def

def5 :: Test5
def5 = def

failed1 :: Maybe Test1
failed1 = Nothing

showMessageWithLineLength :: Message a => Int -> a -> String
showMessageWithLineLength n = renderStyle style {lineLength=n} . pprintMessage

main = testMain
    [ readFrom "spaces" (Just $ def1 & a .~ 5) "  a: \n5  "
    , readFrom "string concat" (Just $ def2 & b .~ "abcdef")
          "b: \"a\"\"bcd\" \n   \"ef\""
    , readFrom "bad char" failed1 "a: 5="
    , readFrom "same line" (Just $ def4 & d .~ [1, 2, 3])
          "d: 1 d: 2    d: 3   "
    , readFrom "int field" (Just $ def1 & a .~ 5) "1: 5"
    , readFrom "bad int field" failed1 "4: 5"
    , readFrom "braces" (Just $ def3 & c.a .~ 5) "c { a: 5 }"
    , readFrom "bracesColon" (Just $ def3 & c.a .~ 5) "c: {  a: 5\n}"
    , readFrom "angles" (Just $ def3 & c.a .~ 5) "c < a: 5 >"
    , readFrom "anglesMultiLine" (Just $ def3 & c.a .~ 5) "c \n<  a: 5\n>"
    -- TODO: Note that this test currently fails either way since
    -- extensions aren't implemented yet.  Keeping it around to make
    -- sure the test case still fails when they are.
    , readFrom "empty extension" failed1 "[]: 5"
    , testCase "Render same line" $
        "d: 1 d: 2 d: 3" @=? showMessage (def4 & d .~ [1, 2, 3])
    , testCase "Render multiple lines" $
        "d: 1\nd: 2\nd: 3" @=?
            showMessageWithLineLength 3 (def4 & d .~ [1, 2, 3])
    , testCase "Render string with escape sequences" $
        escapeRendered @=? showMessageShort escapeMessage
    , readFrom "String with escape sequences"
               (Just escapeMessage) (Data.Text.Lazy.pack escapeRendered)
    , testCase "Render bytes" $
         invalidUTF8BytesRendered @=? showMessage invalidUTF8BytesMessage
    , readFrom "Non-UTF8 bytes"
         (Just invalidUTF8BytesMessage)
         (Data.Text.Lazy.pack invalidUTF8BytesRendered)
    , let kNums = [0..99]  -- The default line limit is 100 so we exceed it.
          kExpected = unwords $ map (("d: " ++) . show) kNums
      in testCase "Render single line for debugString" $
          kExpected @=? showMessageShort (def4 & d .~ kNums)
    ]
  where
    escapeMessage  = def2 & b .~ ("abc\x12" <> "a\x1\x0")
    escapeRendered = "b: \"abc\\x12\" \"a\\x1\" \"\\x0\" \"\""
    invalidUTF8BytesMessage =
        def5 & e .~ Data.ByteString.pack (map (fromIntegral . ord) "abc\x0G\x1"
            ++ [0x80::Word8])
    invalidUTF8BytesRendered = "e: \"abc\\x0\" \"G\\x1\" \"\\x80\" \"\""
