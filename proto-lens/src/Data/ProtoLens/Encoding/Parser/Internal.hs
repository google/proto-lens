-- | Definition of the parsing monad, plus internal
-- unsafe functions.
module Data.ProtoLens.Encoding.Parser.Internal
    ( Parser(..)
    , ParserResult(..)
    ) where

import Control.Monad (ap)
import Control.Monad.Trans.Except
import Data.Word (Word8)
import Foreign.Ptr

-- | A monad for parsing an input buffer.
newtype Parser a = Parser
    { unParser :: Ptr Word8 -- End position of the input
               -> Ptr Word8 -- Current position in the input
               -> ExceptT String IO (ParserResult a)
    }

data ParserResult a = ParserResult
    { _newPos :: !(Ptr Word8) -- ^ New position in the input
    , unParserResult :: a
    }

instance Functor ParserResult where
    fmap f (ParserResult p x) = ParserResult p (f x)

instance Functor Parser where
    fmap f (Parser g) = Parser $ \end cur -> fmap f <$> g end cur

instance Applicative Parser where
    pure x = Parser $ \_ cur -> return $ ParserResult cur x
    (<*>) = ap

instance Monad Parser where
    fail s = Parser $ \_ _ -> throwE s
    return = pure
    Parser f >>= g = Parser $ \end pos -> do
        ParserResult pos' x <- f end pos
        unParser (g x) end pos'
