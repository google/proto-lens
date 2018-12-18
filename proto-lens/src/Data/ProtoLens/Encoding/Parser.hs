{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE RankNTypes #-}
module Data.ProtoLens.Encoding.Parser
    ( Parser
    , runParser
    , atEnd
    , anyWord8
    , takeN
    , isolate
    , (<?>)
    , pFail
    ) where

import Foreign.Ptr
import Foreign.Storable
import Control.Applicative (Alternative(..))
import Data.Word (Word8)
import qualified Data.ByteString as B
import qualified Data.ByteString.Unsafe as B
import Data.ByteString (ByteString)
import System.IO.Unsafe
import Control.Monad (ap)
import Control.Monad.IO.Class

newtype Parser a = Parser { unParser :: forall r . Ptr Word8 -- end
                                     -> Ptr Word8 -- current position
                                     -> (String -> r)
                                     -> (Ptr Word8 -> a -> IO r)
                                     -> IO r }

-- TODO: remove this
instance Alternative Parser where
    empty = fail "empty"
    _ <|> _ = undefined {- Parser $ \end cur ->
        unParser f end cur <|> unParser g end cur -}

-- data ParserResult a = ParserResult !(Ptr Word8) !a

-- todo: kill?
pFail :: String -> Parser a
pFail = fail

instance Functor Parser where
    fmap f (Parser g) = Parser $ \end cur failure success
            -> g end cur failure (\cur' x -> success cur' (f x))

instance Applicative Parser where
    pure x = Parser $ \_ cur _ success -> success cur x
    (<*>) = ap

instance Monad Parser where
    fail s = Parser $ \_ _ failure _-> return $ failure s
    return = pure
    Parser f >>= g = Parser $ \end cur failure success ->
        f end cur failure $ \cur' x -> unParser (g x) end cur' failure success

-- TODO: internal only?  Or do we want this?
instance MonadIO Parser where
    liftIO m = Parser $ \_ cur _ success -> do
        x <- m
        success cur x

-- TODO: use ST?

-- | Evaluates a parser on the given input.
--
-- If the parser does not consume all of the input, the rest of the
-- input is discarded and the parser still succeeds.
runParser :: Parser a -> ByteString -> Either String a
runParser (Parser m) b = unsafePerformIO $ B.unsafeUseAsCStringLen b $ \(p, len)
    -> m (p `plusPtr` len) (castPtr p) Left $ \_ -> return . Right

-- TODO: names
-- gets the current
get :: Parser (Ptr Word8)
get = Parser $ \_ p _ success -> success p p

-- Gets the end
ask :: Parser (Ptr Word8)
ask = Parser $ \end p _ success -> success p end

put :: Ptr Word8 -> Parser ()
put !p = Parser $ \_ _ _ success -> success p ()

atEnd :: Parser Bool
atEnd = do
    x <- get
    y <- ask
    return (x==y)

anyWord8 :: Parser Word8
anyWord8 = do
    p <- get
    end <- ask
    if p == end
        then fail $ "anyWord8: Unexpected EOF"
        else do
            b <- liftIO $ peek p
            put $ p `plusPtr` 1
            return b

takeN :: Int -> Parser B.ByteString
takeN n = do
    p <- get
    end <- ask
    let p' = p `plusPtr` n
    if p' > end
        then fail $ "takeN: Unexpected EOF" ++ show (end `minusPtr` p, end)
        else liftIO (B.packCStringLen (castPtr p, n)) <* put p'

isolate :: Int -> Parser a -> Parser a
isolate n (Parser m) = do
    p <- get
    end <- ask
    let p' = p `plusPtr` n
    if p' > end
        then fail $ "isolate: Unexpected EOF"
        else Parser (\_ _ -> m p p') <* put p'

-- TODO: I'm not convinced this works...
(<?>) :: Parser a -> String -> Parser a
Parser m <?> msg = Parser $ \end p failure success ->
    -- TODO: the concat is probably inefficient
    m end p (\s -> failure $ s ++ ":" ++ msg) success
