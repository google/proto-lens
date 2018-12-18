{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE BangPatterns #-}
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
import Control.Monad.Trans.Except
import Data.Word (Word8)
import qualified Data.ByteString as B
import qualified Data.ByteString.Unsafe as B
import Data.ByteString (ByteString)
import System.IO.Unsafe
import Control.Monad (ap)
import Control.Monad.IO.Class

newtype Parser a = Parser { unParser :: Ptr Word8 -- end
                                     -> Ptr Word8 -- current position
                                     -> ExceptT String IO (ParserResult a) }

-- TODO: remove this
instance Alternative Parser where
    empty = Parser $ \_ _ -> fail "empty"
    f <|> g = Parser $ \end cur ->
        unParser f end cur <|> unParser g end cur

data ParserResult a = ParserResult !(Ptr Word8) !a

-- todo: kill?
pFail :: String -> Parser a
pFail = fail

unParserResult :: ParserResult a -> a
unParserResult (ParserResult _ x) = x

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
    Parser f >>= g = Parser $ \end cur -> do
        ParserResult p x <- f end cur
        unParser (g x) end p

-- TODO: internal only?  Or do we want this?
instance MonadIO Parser where
    liftIO m = Parser $ \_ p -> ParserResult p <$> liftIO m

-- TODO: use ST?

-- | Evaluates a parser on the given input.
--
-- If the parser does not consume all of the input, the rest of the
-- input is discarded and the parser still succeeds.
runParser :: Parser a -> ByteString -> Either String a
runParser (Parser m) b = unsafePerformIO $ B.unsafeUseAsCStringLen b $ \(p, len)
    -> runExceptT $ fmap unParserResult $ m (p `plusPtr` len) (castPtr p)

get :: Parser (Ptr Word8)
get = Parser $ \_ p -> return $ ParserResult p p

ask :: Parser (Ptr Word8)
ask = Parser $ \end p -> return $ ParserResult p end

put :: Ptr Word8 -> Parser ()
put p = Parser $ \_ _ -> return $ ParserResult p ()

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
Parser m <?> msg = Parser $ \end p -> withExceptT (\s -> msg ++ ": " ++ s) $ m end p
