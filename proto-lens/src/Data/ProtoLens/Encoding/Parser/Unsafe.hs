module Data.ProtoLens.Encoding.Parser.Unsafe
    ( unsafeLiftIO ) where

import Control.Monad.Trans.Class (lift)
import Data.ProtoLens.Encoding.Parser.Internal

-- | Runs an arbitrary @IO@ action inside a @Parser@.
-- The generated code uses this function to construct vectors
-- efficiently by incrementally building up mutable vectors.
--
-- NOTE: This is unsafe since @runParser@
-- is a pure function, which lets us lift arbitrary IO into
-- pure operations.
-- However, here are some guarantees that we do get:
--
-- - For each individual call to 'runParser', the action
--   wrapped by 'unsafeLiftIO' will be called exactly once.
-- - Different calls to 'unsafeLiftIO' within the same call to
--   'runParser' will be sequenced according to their order in the Parser
--   monad.
unsafeLiftIO :: IO a -> Parser a
unsafeLiftIO m = Parser $ \_ p -> ParserResult p <$> lift m
