-- | A custom parsing monad, optimized for speed.
{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Data.ProtoLens.Encoding.Parser
    ( Parser
    , runParser
    , atEnd
    , getWord8
    , getWord32le
    , getBytes
    , (<?>)
    ) where

import Data.Bits (shiftL, (.|.))
import Foreign.Ptr
import Foreign.Storable
import Control.Monad.Trans.Except
import Data.Word (Word8, Word32)
import qualified Data.ByteString as B
import qualified Data.ByteString.Unsafe as B
import Data.ByteString (ByteString)
import Control.Monad (ap)
import Control.Monad.IO.Class
import System.IO.Unsafe

-- | A monad for parsing an input buffer.
newtype Parser a = Parser
    { unParser :: Ptr Word8 -- End position of the input
               -> Ptr Word8 -- Current position in the input
               -> ExceptT String IO (ParserResult a) }

data ParserResult a = ParserResult
    { _newPos :: !(Ptr Word8) -- ^ New position in the input
    , unParserResult :: a
    }

instance Functor ParserResult where
    fmap f (ParserResult p x) = ParserResult p (f x)

instance Functor Parser where
    fmap f (Parser g) = Parser $ \end cur -> fmap (fmap f) $ g end cur

instance Applicative Parser where
    pure x = Parser $ \_ cur -> return $ ParserResult cur x
    (<*>) = ap

instance Monad Parser where
    fail s = Parser $ \_ _ -> throwE s
    return = pure
    Parser f >>= g = Parser $ \end pos -> do
        ParserResult pos' x <- f end pos
        unParser (g x) end pos'

-- | Evaluates a parser on the given input.
--
-- If the parser does not consume all of the input, the rest of the
-- input is discarded and the parser still succeeds.
runParser :: Parser a -> ByteString -> Either String a
runParser (Parser m) b = unsafePerformIO $ B.unsafeUseAsCStringLen b $ \(p, len)
    -> runExceptT $ fmap unParserResult $ m (p `plusPtr` len) (castPtr p)

-- | Returns True if there is no more input left to consume.
atEnd :: Parser Bool
atEnd = Parser $ \end pos -> return $ ParserResult pos (pos == end)

-- | Parse a one-byte word.
getWord8 :: Parser Word8
getWord8 = withSized 1 "getWord8: Unexpected end of input" peek

-- | Parser a 4-byte word in little-endian order.
getWord32le :: Parser Word32
getWord32le = withSized 4 "getWord32le: Unexpected end of input" $ \pos -> do
    b1 <- peek pos
    b2 <- peek $ pos `plusPtr'` 1
    b3 <- peek $ pos `plusPtr'` 2
    b4 <- peek $ pos `plusPtr'` 3
    return $ ((fromIntegral b4 `shiftL` 8 .|. fromIntegral b3)
                `shiftL` 8 .|. fromIntegral b2) `shiftL` 8 .|. fromIntegral b1

-- | Parse a 'B.ByteString' of the given length.
getBytes :: Int -> Parser B.ByteString
getBytes n = withSized n "getBytes: Unexpected end of input" $ \pos ->
    B.packCStringLen (castPtr pos, n)

-- | Helper function for reading bytes from the current position and
-- advancing the pointer.
withSized :: Int -> String -> (Ptr Word8 -> IO a) -> Parser a
withSized len message f = Parser $ \end pos ->
    let pos' = pos `plusPtr'` len
    in if pos' > end
        then throwE $ message
        else liftIO $ ParserResult pos' <$> f pos
{-# INLINE withSized #-}

-- | If the parser fails, prepend an error message.
(<?>) :: Parser a -> String -> Parser a
Parser m <?> msg = Parser $ \end p -> withExceptT (\s -> msg ++ ": " ++ s) $ m end p

-- | Advance a pointer.  Unlike 'plusPtr', preserves the type of the input.
plusPtr' :: Ptr a -> Int -> Ptr a
plusPtr' = plusPtr
