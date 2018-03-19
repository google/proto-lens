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
import qualified Data.ProtoLens.Any as Any
import Data.ProtoLens (
    def, Message, showMessage, showMessageShort, pprintMessage, register,
    showMessageWithRegistry )
import Data.Proxy (Proxy(..))
import Lens.Family2 ((&), (.~))
import Proto.TextFormat
import Proto.TextFormat_Fields
import Test.Framework.Providers.HUnit (testCase)
import Test.HUnit ((@=?))
import Text.PrettyPrint (renderStyle, style, lineLength)

import Data.ProtoLens.TestUtil

def1 :: Test1
def1 = def

def2 :: Test2
def2 = def

def3 :: AnyHolder
def3 = def

failed1 :: Maybe Test1
failed1 = Nothing

showMessageWithLineLength :: Message a => Int -> a -> String
showMessageWithLineLength n = renderStyle style {lineLength=n} . pprintMessage

main :: IO ()
main = testMain
    [ readFrom "spaces" (Just $ def1 & a .~ 5) "  a: \n5  "
    , readFrom "string concat" (Just $ def1 & b .~ "abcdef")
          "b: \"a\"\"bcd\" \n   \"ef\""
    , readFrom "bad char" failed1 "a: 5="
    , readFrom "same line" (Just $ def1 & d .~ [1, 2, 3])
          "d: 1 d: 2    d: 3   "
    , readFrom "int field" (Just $ def1 & a .~ 5) "4: 5"
    , readFrom "bad int field" failed1 "1: 5"
    , readFrom "braces" (Just $ def2 & c.a .~ 5) "c { a: 5 }"
    , readFrom "bracesColon" (Just $ def2 & c.a .~ 5) "c: {  a: 5\n}"
    , readFrom "angles" (Just $ def2 & c.a .~ 5) "c < a: 5 >"
    , readFrom "anglesMultiLine" (Just $ def2 & c.a .~ 5) "c \n<  a: 5\n>"
    -- TODO: Note that this test currently fails either way since
    -- extensions aren't implemented yet.  Keeping it around to make
    -- sure the test case still fails when they are.
    , readFrom "empty extension" failed1 "[]: 5"
    , testCase "Render same line" $
        "d: 1 d: 2 d: 3" @=? showMessage (def1 & d .~ [1, 2, 3])
    , testCase "Render multiple lines" $
        "d: 1\nd: 2\nd: 3" @=?
            showMessageWithLineLength 3 (def1 & d .~ [1, 2, 3])
    , testCase "Field order" $
        "b: \"xyz\" d: 1 d: 2 a: 3" @=?
            showMessage (def1 & b .~ "xyz"
                              & d .~ [1,2]
                              & a .~ 3)
    , readFrom
         ("Parse string with numeric escape sequences"
             ++ " (including ones we do not emit)")
          -- '\o172' == '\x7a' == 'z'
         (Just $ def1 & b .~ "\o1\o12\o123\x2\o172z3z3")
         (Data.Text.Lazy.pack "b: \"\\001\\012\\123\\002\\172\\x7a3\\1723\"")
    , readFrom
         ("Parse string with non-numeric escape sequences"
             ++ " (including ones we do not emit)")
         (Just $ def1 & b .~ "\a\b\f\n\r\t\v\\\'\"")
         (Data.Text.Lazy.pack "b: \"\a\b\f\n\r\t\v\\\\\\\'\\\"\"")
    , testCase "Render string with escape sequences" $
        escapeRendered @=? showMessageShort escapeMessage
    , readFrom "Parse rendered string with escape sequences"
               (Just escapeMessage) (Data.Text.Lazy.pack escapeRendered)
    , testCase "Render bytes" $
         invalidUTF8BytesRendered @=? showMessage invalidUTF8BytesMessage
    , readFrom "Parse single-quote-delimited string"
         (Just $ def1 & b .~ "ab\o2") "b: \'ab\2\'"
    , readFrom "Non-UTF8 bytes"
         (Just invalidUTF8BytesMessage)
         (Data.Text.Lazy.pack invalidUTF8BytesRendered)
    , readFromWithRegistry
         anyRegistry
         "Parse any"
         (Just anyExpProto)
         anyExpText
    , readFromWithRegistry
         anyRegistry
         "Parse any (explicit)"
         (Just anyExpProto)
         explicitAnyExpText
    , testCase "Render any" $
        Data.Text.Lazy.unpack anyExpText @=? (showMessageWithRegistry anyRegistry anyExpProto <> "\n")
    , testCase "Render any unknown" $
        Data.Text.Lazy.unpack explicitAnyExpText @=? (showMessageWithRegistry test1Registry anyExpProto <> "\n")
    , let kNums = [0..99]  -- The default line limit is 100 so we exceed it.
          kExpected = unwords $ map (("d: " ++) . show) kNums
      in testCase "Render single line for debugString" $
          kExpected @=? showMessageShort (def1 & d .~ kNums)
    ]
  where
    escapeMessage  = def1 & b
        .~ ("a\r\n\t\"\'\\" <> "bc\o030" <> "1" <> "\o109" <> "¢" <> "\o1")
    escapeRendered =
        -- 'a' followed by all the non-numeric escapes we emit:
        "b: \"a\\r\\n\\t\\\"\\\'\\\\"
        ++ "bc\\0301"      -- The last digit is a separate character, not part
                           -- of the escape.
        ++ "\\010" ++ "9"  -- Note that the 9 is a separate character
        ++ "\\302\\242"    -- UTF-8 for the cent symbol, '¢'.
        ++ "\\001"         -- Works fine at EOL.
        ++ "\""
    invalidUTF8BytesMessage =
        def1 & e .~ Data.ByteString.pack (map (fromIntegral . ord) "abc"
            ++ [0xC0, 0xC0, 0x0])  -- Invalid UTF8.
    invalidUTF8BytesRendered = "e: \"abc\\300\\300\\000\""

    anyRegistry =
      register (Proxy :: Proxy Test1) <>
      register (Proxy :: Proxy Test2)
    test1Registry =
      register (Proxy :: Proxy Test1)

    anyExpProto =
        def3 & thing1 .~ Any.pack (def1 & a .~ 3
                                        & b .~ "test"
                                        & d .~ [1,2,4,9]
                                        & e .~ "\0\0\0")
             & sub    .~ (def & thing2 .~
                          Any.pack (def2 & c . a .~ 35
                                         & c . b .~ "hello world"
                                         & c . d .~ [1,3,5]
                                         & c . e .~ "\n\n\n"))
    anyExpText =
      Data.Text.Lazy.unlines
        [ "thing1 {"
        , "  [type.googleapis.com/text_format.Test1] {"
        , "    b: \"test\" d: 1 d: 2 d: 4 d: 9 e: \"\\000\\000\\000\" a: 3"
        , "  }"
        , "}"
        , "sub {"
        , "  thing2 {"
        , "    [type.googleapis.com/text_format.Test2] {"
        , "      c { b: \"hello world\" d: 1 d: 3 d: 5 e: \"\\n\\n\\n\" a: 35 }"
        , "    }"
        , "  }"
        , "}"
        ]
    explicitAnyExpText =
      Data.Text.Lazy.unlines
        [ "thing1 {"
        , "  [type.googleapis.com/text_format.Test1] {"
        , "    b: \"test\" d: 1 d: 2 d: 4 d: 9 e: \"\\000\\000\\000\" a: 3"
        , "  }"
        , "}"
        , "sub {"
        , "  thing2 {"
        , "    type_url: \"type.googleapis.com/text_format.Test2\""
        , "    value: \"\\n\\031\\n\\013hello world\\022\\003\\001\\003\\005\\032\\003\\n\\n\\n #\""
        , "  }"
        , "}"
        ]
