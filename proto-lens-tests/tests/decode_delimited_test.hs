{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import Control.Monad (replicateM)
import qualified Data.ByteString as B
import Data.Int (Int32)
import Data.List (isInfixOf)
import qualified Data.Text as T
import Data.Word (Word64)
import Data.ProtoLens
import Data.ProtoLens.Encoding.Bytes (runBuilder)
import Lens.Family2 ((&), (.~))
import Test.Tasty (testGroup)
import Test.Tasty.HUnit (Assertion, testCase, (@=?), assertBool, assertFailure)

import Data.ProtoLens.TestUtil
import Proto.DecodeDelimited
import Proto.DecodeDelimited_Fields

import System.IO (Handle, IOMode(ReadMode), hClose, hSetBinaryMode, withBinaryFile)
import System.IO.Temp (withSystemTempFile)

filenameTemplate :: String
filenameTemplate = "test_decode_delimited"

oneTiB :: Word64
oneTiB = 1024 * 1024 * 1024 * 1024

main :: IO ()
main = testMain
    [ testGroup "round-trips" testRoundTrips
    , testGroup "limits" testLimits
    , testGroup "errors" testErrors
    ]

withTempBytes :: B.ByteString -> (Handle -> IO r) -> IO r
withTempBytes bs action =
    withSystemTempFile filenameTemplate $ \fname h -> do
        hSetBinaryMode h True
        B.hPut h bs
        hClose h
        withBinaryFile fname ReadMode action

testWithMessage :: (Eq msg, Show msg, Message msg) => msg -> IO ()
testWithMessage msg =
    withTempBytes (runBuilder (buildMessageDelimited msg)) $ \h -> do
        any1 <- decodeMessageDelimitedH h
        Right msg @=? any1

-- | Construct a 'Foo' whose encoded wire representation has the exact
-- requested byte length (valid for 0 or >= 3).
fooWithWireLength :: Int -> Char -> Foo
fooWithWireLength 0 _ = defMessage
fooWithWireLength targetLen ch =
    defMessage & b .~ T.replicate (targetLen - headerLen targetLen) (T.singleton ch)
  where
    -- Field 2 tag byte (1) + varint length of UTF-8 ASCII string.
    headerLen n
        | n - 2 < 128 = 2
        | n - 3 < 16384 = 3
        | n - 4 < 2097152 = 4
        | otherwise = error "fooWithWireLength: unsupported target length"

varIntBytes :: Word64 -> B.ByteString
varIntBytes = toStrictByteString . varInt

assertLeftContaining :: String -> Either String Foo -> Assertion
assertLeftContaining needle result = case result of
    Left err ->
        assertBool
            ("Expected error containing " ++ show needle ++ ", got: " ++ show err)
            (needle `isInfixOf` err)
    Right msg ->
        assertFailure ("Expected Left containing " ++ show needle ++ ", got Right: " ++ show msg)

testRoundTrips :: [TestTree]
testRoundTrips =
    [ testCase "empty" (testWithMessage (defMessage :: Foo))
    , testCase "short" (testWithMessage foo1)
    , testCase "long" (testWithMessage foo2)
    , testCase "multi-chunk sequential (4095, 4096, 4097, 200 KiB)" testMultiChunkSequential
    ]
  where
    foo1 = defMessage & a .~ 42 & b .~ "hello" :: Foo
    foo2 = defMessage
        & a .~ 43
        & b .~ (T.pack . replicate 300 $ 'x') :: Foo

testMultiChunkSequential :: Assertion
testMultiChunkSequential = do
    let sizes = [4095, 4096, 4097, 200 * 1024]
        msgs = zipWith fooWithWireLength sizes ['a' ..]
        wire = runBuilder (foldMap buildMessageDelimited msgs)
    sizes @=? map (B.length . encodeMessage) msgs
    withTempBytes wire $ \h -> do
        results <- replicateM (length msgs) (decodeMessageDelimitedH h)
        map Right msgs @=? results
        eofRes <- decodeMessageDelimitedH h :: IO (Either String Foo)
        Left "Unexpected end of file" @=? eofRes

testLimits :: [TestTree]
testLimits =
    [ testGroup "decodeMessageDelimitedH (default 2 GiB - 1)" testDefaultLimit
    , testGroup "decodeMessageDelimitedHWithLimit" testExplicitLimit
    ]

testDefaultLimit :: [TestTree]
testDefaultLimit =
    [ testCase "rejects 2 GiB" $ do
        let twoGiB = fromIntegral (maxBound :: Int32) + 1 :: Word64
        withTempBytes (varIntBytes twoGiB) $ \h -> do
            res <- decodeMessageDelimitedH h :: IO (Either String Foo)
            assertLeftContaining "exceeds limit" res
    , testCase "rejects 1 TiB" $
        withTempBytes (varIntBytes oneTiB) $ \h -> do
            res <- decodeMessageDelimitedH h :: IO (Either String Foo)
            assertLeftContaining "exceeds limit" res
    , testCase "rejects maxBound :: Word64" $
        withTempBytes (varIntBytes maxBound) $ \h -> do
            res <- decodeMessageDelimitedH h :: IO (Either String Foo)
            assertLeftContaining "exceeds limit" res
    ]

testExplicitLimit :: [TestTree]
testExplicitLimit =
    [ testCase "accepts empty with limit 0" $ do
        let msg = defMessage :: Foo
            wire = runBuilder (buildMessageDelimited msg)
        withTempBytes wire $ \h -> do
            res <- decodeMessageDelimitedHWithLimit 0 h
            Right msg @=? res
    , testCase "rejects non-empty with limit 0" $ do
        let msg = fooWithWireLength 3 'z'
            wire = runBuilder (buildMessageDelimited msg)
        withTempBytes wire $ \h -> do
            res <- decodeMessageDelimitedHWithLimit 0 h :: IO (Either String Foo)
            assertLeftContaining "exceeds limit of 0" res
    , testCase "accepts length == limit" $ do
        let msg = fooWithWireLength 64 'z'
            wire = runBuilder (buildMessageDelimited msg)
        64 @=? B.length (encodeMessage msg)
        withTempBytes wire $ \h -> do
            res <- decodeMessageDelimitedHWithLimit 64 h
            Right msg @=? res
    , testCase "rejects length == limit + 1 without consuming payload" $ do
        let msg = fooWithWireLength 64 'z'
            wire = runBuilder (buildMessageDelimited msg)
        withTempBytes wire $ \h -> do
            res <- decodeMessageDelimitedHWithLimit 63 h :: IO (Either String Foo)
            assertLeftContaining "exceeds limit of 63" res
            -- Verify the payload bytes were left unread on the Handle.
            remaining <- B.hGetContents h
            64 @=? B.length remaining
    , testCase "rejects length > maxBound :: Int" $ do
        let overflowLen = fromIntegral (maxBound :: Int) + 1 :: Word64
        withTempBytes (varIntBytes overflowLen) $ \h -> do
            res <- decodeMessageDelimitedHWithLimit maxBound h :: IO (Either String Foo)
            assertLeftContaining "exceeds maximum supported ByteString size" res
    ]

testErrors :: [TestTree]
testErrors =
    [ testCase "clean EOF on empty handle" $
        withTempBytes B.empty $ \h -> do
            res <- decodeMessageDelimitedH h :: IO (Either String Foo)
            Left "Unexpected end of file" @=? res
    , testCase "premature EOF (0 of 100 bytes)" $
        withTempBytes (varIntBytes 100) $ \h -> do
            res <- decodeMessageDelimitedH h :: IO (Either String Foo)
            Left "Unexpected end of file" @=? res
    , testCase "premature EOF (10 of 100 bytes)" $
        withTempBytes (varIntBytes 100 <> B.replicate 10 0x58) $ \h -> do
            res <- decodeMessageDelimitedH h :: IO (Either String Foo)
            Left "Unexpected end of file" @=? res
    , testCase "premature EOF mid-stream (5000 of 10000 bytes)" $
        withTempBytes (varIntBytes 10000 <> B.replicate 5000 0x59) $ \h -> do
            res <- decodeMessageDelimitedH h :: IO (Either String Foo)
            Left "Unexpected end of file" @=? res
    , testCase "premature EOF with 1 GiB length prefix (bounded allocation)" $ do
        -- 5-byte varint encoding 2^30 = 1073741824 (within 2 GiB default limit).
        let oneGiBPrefix = B.pack [0x80, 0x80, 0x80, 0x80, 0x04]
        withTempBytes oneGiBPrefix $ \h -> do
            res <- decodeMessageDelimitedH h :: IO (Either String Foo)
            Left "Unexpected end of file" @=? res
    , testCase "premature EOF with 1 TiB length prefix and maxBound limit (bounded allocation)" $
        withTempBytes (varIntBytes oneTiB) $ \h -> do
            res <- decodeMessageDelimitedHWithLimit maxBound h :: IO (Either String Foo)
            if toInteger oneTiB <= toInteger (maxBound :: Int)
                then Left "Unexpected end of file" @=? res
                else assertLeftContaining "exceeds maximum supported ByteString size" res
    , testCase "malformed protobuf payload" $ do
        -- Length 1, payload 0x0f (field 1, invalid wire type 7).
        let wire = varIntBytes 1 <> B.pack [0x0f]
        withTempBytes wire $ \h -> do
            res <- decodeMessageDelimitedH h :: IO (Either String Foo)
            assertLeftContaining "Unknown wire type 7" res
    ]
