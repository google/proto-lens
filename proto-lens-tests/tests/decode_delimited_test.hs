{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import qualified Data.ByteString as B
import qualified Data.Text as T
import Data.ProtoLens
import Data.ProtoLens.Encoding.Bytes (runBuilder)
import Lens.Family2 ((&), (.~))
import Test.Tasty.HUnit (testCase, (@=?))

import Data.ProtoLens.TestUtil
import Proto.DecodeDelimited
import Proto.DecodeDelimited_Fields

import System.IO (openBinaryFile, hClose, IOMode(ReadMode))
import System.IO.Temp (withSystemTempFile)

filename_template :: String
filename_template = "test_decode_delimited"

main :: IO ()
main = testMain
    [ testCase "buildDelimited/decodeDelimited-short" (testWithMessage foo1)
    , testCase "buildDelimited/decodeDelimited-long" (testWithMessage foo2)
    ]
  where
    foo1 = defMessage & a .~ 42 & b .~ "hello" :: Foo
    foo2 = defMessage
        & a .~ 43
        & b .~ (T.pack . take 300 . repeat $ 'x') :: Foo

testWithMessage :: (Eq msg, Show msg, Message msg) => msg -> IO ()
testWithMessage msg =
  let bs = runBuilder . buildMessageDelimited $ msg
  in
    withSystemTempFile filename_template $ \fname h -> do
        B.hPut h bs
        hClose h
        h' <- openBinaryFile fname ReadMode
        any1 <- decodeMessageDelimitedH h'
        Right msg @=? any1
