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
    ) where

#if !GENERATED_ENCODING
import qualified Data.ProtoLens.Encoding.Reflected as Reflected
#endif

import Data.ProtoLens.Message (Message(..))
import Data.ProtoLens.Encoding.Bytes (getVarInt, putVarInt)

import qualified Data.Attoparsec.ByteString as Parse
import qualified Data.ByteString as B
import Data.ByteString.Lazy.Builder as Builder
import qualified Data.ByteString.Lazy as L
import Data.Semigroup ((<>))

-- | Decode a message from its wire format.  Returns 'Left' if the decoding
-- fails.
decodeMessage :: Message msg => B.ByteString -> Either String msg
decodeMessage = Parse.parseOnly parseMessage

-- | Decode a message from its wire format.  Throws an error if the decoding
-- fails.
decodeMessageOrDie :: Message msg => B.ByteString -> msg
decodeMessageOrDie bs = case decodeMessage bs of
    Left e -> error $ "decodeMessageOrDie: " ++ e
    Right x -> x

parseMessage :: Message msg => Parse.Parser msg
#if GENERATED_ENCODING
parseMessage = unfinishedParseMessage
#else
parseMessage = Reflected.parseMessage
#endif

buildMessage :: Message msg => msg -> Builder
#if GENERATED_ENCODING
buildMessage = unfinishedBuildMessage
#else
buildMessage = Reflected.buildMessage
#endif

-- | Encode a message to the wire format as a strict 'ByteString'.
encodeMessage :: Message msg => msg -> B.ByteString
encodeMessage = L.toStrict . toLazyByteString . buildMessage

-- | Encode a message to the wire format, prefixed by its size as a VarInt,
-- as part of a 'Builder'.
--
-- This can be used to build up streams of messages in the size-delimited
-- format expected by some protocols.
buildMessageDelimited :: Message msg => msg -> Builder
buildMessageDelimited msg =
  let b = L.toStrict . toLazyByteString $ buildMessage msg in
    putVarInt (fromIntegral $ B.length b) <> byteString b

parseMessageDelimited :: Message msg => Parse.Parser msg
parseMessageDelimited = do
    len <- getVarInt
    bytes <- Parse.take $ fromIntegral len
    either fail return $ decodeMessage bytes
