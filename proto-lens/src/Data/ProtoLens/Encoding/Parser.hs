{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE BangPatterns #-}
module Data.ProtoLens.Encoding.Parser
    ( Parser
    , runParser
    , isEnd
    , anyWord8
    , takeN
    , (<?>)
    , pFail
    ) where

import Control.Monad.Trans.Class
import Control.Monad.Trans.Reader
import Foreign.Ptr
import Foreign.Storable
import Control.Monad.Trans.State
import Control.Monad.Trans.Except
import Data.Word (Word8)
import qualified Data.ByteString as B
import qualified Data.ByteString.Unsafe as B
import Data.ByteString (ByteString)
import System.IO.Unsafe
import Control.Monad.IO.Class

newtype Parser a = Parser { unParser :: ReaderT (Ptr Word8) (StateT (Ptr Word8) (ExceptT String IO)) a}
    deriving (Functor, Applicative)

instance Monad Parser where
    fail = Parser . lift . lift . throwE
    Parser f >>= g = Parser $ f >>= unParser . g
    Parser f >> Parser g = Parser $ f >> g

runParser :: Parser a -> ByteString -> Either String a
runParser (Parser m) b = unsafePerformIO $ B.unsafeUseAsCStringLen b $ \(p, len)
    -> runExceptT (evalStateT (runReaderT m (p `plusPtr` len)) (castPtr p))

pFail :: String -> Parser a
pFail = Parser . lift . lift . throwE

isEnd :: Parser Bool
isEnd = Parser $ do
    x <- lift get
    y <- ask
    return (x==y)

anyWord8 :: Parser Word8
anyWord8 = Parser $ do
    p <- lift get
    end <- ask
    if p == end
        then lift $ lift $ throwE "anyWord8: Unexpected EOF"
        else do
            b <- liftIO $ peek p
            lift $ put $! p `plusPtr` 1
            return b

takeN :: Int -> Parser B.ByteString
takeN n = Parser $ do
    p <- lift get
    end <- ask
    let p' = p `plusPtr` n
    if p' > end
        then lift $ lift $ throwE $ 
                "takeN: Unexpected EOF" ++ show (end `minusPtr` p, end `minusPtr` p', n)
        else do
            b <- liftIO $ B.packCStringLen (castPtr p, n)
            lift $ put $! p'
            return b

-- TODO: I'm not convinced this works...
(<?>) :: Parser a -> String -> Parser a
Parser p <?> msg = Parser $ mapReaderT (mapStateT (withExceptT (\s -> msg ++ ": " ++ s))) p
