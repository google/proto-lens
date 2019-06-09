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
    ) where

import System.IO (Handle)

import Data.ProtoLens.Message (Message(..))
import Data.ProtoLens.Encoding.Bytes (Parser, Builder)
import qualified Data.ProtoLens.Encoding.Bytes as Bytes

import Control.Monad.IO.Class (liftIO)
import Control.Monad.Trans.Except (runExceptT, ExceptT(..))
import qualified Data.ByteString as B
import Data.Semigroup ((<>))

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

-- | Same as @decodeMessage@ but for delimited messages read through a Handle
decodeMessageDelimitedH :: Message msg => Handle -> IO (Either String msg)
decodeMessageDelimitedH h = runExceptT $
    Bytes.getVarIntH h >>=
    liftIO . B.hGet h . fromIntegral >>=
    ExceptT . return . decodeMessage
