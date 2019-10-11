{-# LANGUAGE CPP #-}
{-# LANGUAGE LambdaCase #-}
-- | Definition of the parsing monad, plus internal
-- unsafe functions.
module Data.ProtoLens.Encoding.Parser.Internal
    ( Parser(..)
    , ParseResult(..)
    ) where

import Control.Monad (ap)
import qualified Control.Monad.Fail as Fail
import Data.Word (Word8)
import Foreign.Ptr

-- | A monad for parsing an input buffer.
newtype Parser a = Parser
    { unParser :: Ptr Word8 -- End position of the input
               -> Ptr Word8 -- Current position in the input
               -> IO (ParseResult a)
    }

data ParseResult a
    = ParseSuccess
        { _newPos :: !(Ptr Word8) -- ^ New position in the input
        , unParserResult :: a
        }
    | ParseFailure String

instance Functor ParseResult where
    fmap f (ParseSuccess p x) = ParseSuccess p (f x)
    fmap _ (ParseFailure s) = ParseFailure s

instance Functor Parser where
    fmap f (Parser g) = Parser $ \end cur -> fmap f <$> g end cur

instance Applicative Parser where
    pure x = Parser $ \_ cur -> return $ ParseSuccess cur x
    (<*>) = ap

instance Monad Parser where
#if !MIN_VERSION_base(4,13,0)
    fail = Fail.fail
#endif
    return = pure
    Parser f >>= g = Parser $ \end pos -> f end pos >>= \case
        ParseSuccess pos' x -> unParser (g x) end pos'
        ParseFailure s -> return $ ParseFailure s

instance Fail.MonadFail Parser where
    fail s = Parser $ \_ _ -> return $ ParseFailure s
