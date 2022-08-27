-- | A custom parsing monad, optimized for speed.
{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Data.ProtoLens.Encoding.Parser
    ( Parser
    , runParser
    , atEnd
    , isolate
    , getWord8
    , getWord32le
    , getBytes
    , getText
    , (<?>)
    ) where

import Data.Bits (shiftL, (.|.))
import Data.Word (Word8, Word32)
import Data.ByteString (ByteString, packCStringLen)
import qualified Data.ByteString.Unsafe as B
import Data.Text (Text)
import Data.Text.Encoding (decodeUtf8')
import Foreign.Ptr
import Foreign.Storable
import System.IO.Unsafe (unsafePerformIO)

import Data.ProtoLens.Encoding.Parser.Internal

-- | Evaluates a parser on the given input.
--
-- If the parser does not consume all of the input, the rest of the
-- input is discarded and the parser still succeeds.  Parsers may use
-- 'atEnd' to detect whether they are at the end of the input.
--
-- Values returned from actions in this monad will not hold onto the original
-- ByteString, but rather make immutable copies of subsets of its bytes.
runParser :: Parser a -> ByteString -> Either String a
runParser (Parser m) b =
    case unsafePerformIO $ B.unsafeUseAsCStringLen b
            $ \(p, len) -> m (p `plusPtr` len) (castPtr p) of
        ParseSuccess _ x -> Right x
        ParseFailure s -> Left s

-- | Returns True if there is no more input left to consume.
atEnd :: Parser Bool
atEnd = Parser $ \end pos -> return $ ParseSuccess pos (pos == end)

-- | Parse a one-byte word.
getWord8 :: Parser Word8
getWord8 = withSized 1 "getWord8: Unexpected end of input" peek

-- | Parser a 4-byte word in little-endian order.
getWord32le :: Parser Word32
getWord32le = withSized 4 "getWord32le: Unexpected end of input" $ \pos -> do
    b1 <- fromIntegral <$> peek pos
    b2 <- fromIntegral <$> peek (pos `plusPtr'` 1)
    b3 <- fromIntegral <$> peek (pos `plusPtr'` 2)
    b4 <- fromIntegral <$> peek (pos `plusPtr'` 3)
    let f b b' = b `shiftL` 8 .|. b'
    return $! f (f (f b4 b3) b2) b1

-- | Parse a sequence of zero or more bytes of the given length.
--
-- The new ByteString is an immutable copy of the bytes in the input
-- and will be managed separately on the Haskell heap from the original
-- input 'ByteString'.
--
-- Fails the parse if given a negative length.
getBytes :: Int -> Parser ByteString
getBytes n = withSized n "getBytes: Unexpected end of input"
                    $ \pos -> packCStringLen (castPtr pos, n)

getText :: Int -> Parser Text
getText n = do
  r <- withSized n "getText: Unexpected end of input" $ \pos ->
          decodeUtf8' <$> B.unsafePackCStringLen (castPtr pos, n)
  either (fail . show) pure r

-- | Helper function for reading bytes from the current position and
-- advancing the pointer.
--
-- Fails the parse if given a negative length.  (GHC will elide the check
-- if the length is a nonnegative constant.)
--
-- It is only safe for @f@ to peek between its argument @p@ and
-- @p `plusPtr` (len - 1)@, inclusive.
withSized :: Int -> String -> (Ptr Word8 -> IO a) -> Parser a
withSized len message f
    | len >= 0 = Parser $ \end pos ->
        let pos' = pos `plusPtr'` len
        in if pos' > end
            then return $ ParseFailure message
            else ParseSuccess pos' <$> f pos
    | otherwise = fail "withSized: negative length"
{-# INLINE withSized #-}

-- | Run the given parsing action as if there are only
-- @len@ bytes remaining.  That is, once @len@ bytes have been
-- consumed, 'atEnd' will return 'True' and other actions
-- like 'getWord8' will act like there is no input remaining.
--
-- Fails the parse if given a negative length.
isolate :: Int -> Parser a -> Parser a
isolate len (Parser m)
    | len >= 0 = Parser $ \end pos ->
        let end' = pos `plusPtr` len
        in if end' > end
            then return $ ParseFailure "isolate: unexpected end of input"
            else m end' pos
    | otherwise = fail "isolate: negative length"

-- | If the parser fails, prepend an error message.
(<?>) :: Parser a -> String -> Parser a
Parser m <?> msg = Parser $ \end p -> wrap <$> m end p
  where
    wrap (ParseFailure s) = ParseFailure (msg ++ ": " ++ s)
    wrap r = r

-- | Advance a pointer.  Unlike 'plusPtr', preserves the type of the input.
plusPtr' :: Ptr a -> Int -> Ptr a
plusPtr' = plusPtr
