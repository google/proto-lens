{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE CPP #-}
module Data.ProtoLens.Encoding (
    encodeMessage,
    buildMessage,
    decodeMessage,
    parseMessage,
    decodeMessageOrDie,
    -- ** Delimited messages
    buildMessageDelimited,
    parseMessageDelimited,
    decodeMessageDelimitedH,
    decodeMessageDelimitedHWithLimit,
    ) where

import System.IO (Handle)

import Data.ProtoLens.Message (Message(..))
import Data.ProtoLens.Encoding.Bytes (Parser, Builder)
import qualified Data.ProtoLens.Encoding.Bytes as Bytes

import Control.Monad (when)
import Control.Monad.Trans.Except (ExceptT(..), except, runExceptT, throwE)
import qualified Data.ByteString as B
import Data.Int (Int32)
import Data.Word (Word64)
#if !MIN_VERSION_base(4,11,0)
import Data.Semigroup ((<>))
#endif

-- | Decode a message from its wire format.  Returns 'Left' if the decoding
-- fails.
decodeMessage :: Message msg => B.ByteString -> Either String msg
decodeMessage = Bytes.runParser parseMessage

-- | Decode a message from its wire format.  Throws an error if the decoding
-- fails.
decodeMessageOrDie :: Message msg => B.ByteString -> msg
decodeMessageOrDie bs = case decodeMessage bs of
    Left e -> error $ "decodeMessageOrDie: " ++ e
    Right x -> x

-- | Encode a message to the wire format as a strict 'ByteString'.
encodeMessage :: Message msg => msg -> B.ByteString
encodeMessage = Bytes.runBuilder . buildMessage

-- | Encode a message to the wire format, prefixed by its size as a VarInt,
-- as part of a 'Builder'.
--
-- This can be used to build up streams of messages in the size-delimited
-- format expected by some protocols.
buildMessageDelimited :: Message msg => msg -> Builder
buildMessageDelimited msg =
    let b = encodeMessage msg
    in Bytes.putVarInt (fromIntegral $ B.length b) <> Bytes.putBytes b

parseMessageDelimited :: Message msg => Parser msg
parseMessageDelimited = do
    len <- Bytes.getVarInt
    bytes <- Bytes.getBytes $ fromIntegral len
    either fail return $ decodeMessage bytes

-- | Same as 'decodeMessage', but for delimited messages read through a
-- 'Handle'.
--
-- Enforces a default maximum message size of @maxBound :: Int32@
-- (2 GiB - 1, matching the Protocol Buffers wire-format limit and C++/Java
-- defaults) and reads the payload in bounded chunks so that an untrusted
-- length prefix cannot trigger a large upfront allocation before data arrives.
-- Callers reading from untrusted streams should prefer
-- 'decodeMessageDelimitedHWithLimit' with a tighter limit.
decodeMessageDelimitedH :: Message msg => Handle -> IO (Either String msg)
decodeMessageDelimitedH =
    decodeMessageDelimitedHWithLimit (fromIntegral (maxBound :: Int32))

-- | Same as 'decodeMessageDelimitedH', but with an explicit maximum message
-- size in bytes. Returns 'Left' without reading the payload if the decoded
-- varint length prefix exceeds the limit (or @maxBound :: Int@).
decodeMessageDelimitedHWithLimit
    :: Message msg
    => Word64
    -> Handle
    -> IO (Either String msg)
decodeMessageDelimitedHWithLimit maxLen h = runExceptT $ do
    n <- Bytes.getVarIntH h
    when (n > maxLen) $
        throwE $ "Delimited message length " ++ show n
              ++ " exceeds limit of " ++ show maxLen
    when (toInteger n > toInteger (maxBound :: Int)) $
        throwE $ "Delimited message length " ++ show n
              ++ " exceeds maximum supported ByteString size"
    bytes <- ExceptT $ hGetExactChunked h (fromIntegral n)
    except (decodeMessage bytes)

-- | Read exactly @total@ bytes (>= 0) from @h@ in bounded chunks, returning
-- 'Left' if EOF is reached early.
hGetExactChunked :: Handle -> Int -> IO (Either String B.ByteString)
hGetExactChunked h total
    | total == 0 = return (Right B.empty)
    | total < 0  = return (Left "Negative delimited message length")
    | otherwise  = go [] initialChunkSize total
  where
    initialChunkSize :: Int
    initialChunkSize = 4096

    maxChunkSize :: Int
    maxChunkSize = 65536

    go :: [B.ByteString] -> Int -> Int -> IO (Either String B.ByteString)
    go chunks _ 0 = return $! Right $! B.concat (reverse chunks)
    go chunks !chunkSz !remaining = do
        let !toRead = min chunkSz remaining
        chunk <- B.hGet h toRead
        if B.length chunk < toRead
            then return (Left "Unexpected end of file")
            else go (chunk : chunks)
                    (min maxChunkSize (chunkSz * 2))
                    (remaining - toRead)
