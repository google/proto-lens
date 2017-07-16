{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Data.ProtoLens.Any
    ( Any
    , pack
    , packWithPrefix
    , unpack
    , UnpackError(..)
    ) where

import Control.Exception (Exception(..))
import Data.Monoid ((<>))
import qualified Data.Text as Text
import Data.Text (Text)
import Data.Typeable (Typeable)
import Data.ProtoLens
    ( decodeMessage
    , def
    , encodeMessage
    , Message(..)
    , MessageDescriptor(..)
    )
import Lens.Family2 ((&), (.~), (^.))
import Proto.Google.Protobuf.Any

-- | Packs the given message into an 'Any' using the default type URL prefix
-- "type.googleapis.com".
pack :: forall a . Message a => a -> Any
pack = packWithPrefix googleApisPrefix

googleApisPrefix :: Text
googleApisPrefix = "type.googleapis.com"

-- | Packs the given message into an 'Any' using the given type URL prefix.
packWithPrefix :: forall a . Message a => Text -> a -> Any
packWithPrefix prefix x =
    def & typeUrl .~ (prefix <> "/" <> name)
        & value .~ encodeMessage x
  where
    name = messageName (descriptor :: MessageDescriptor a)

-- | A description of a failure during `unpack` to decode an `Any` message
-- into the expected type.
data UnpackError
    = DifferentType
        { expectedMessageType :: Text -- ^ The expected @packagename.messagename@
        , actualUrl :: Text -- ^ The typeUrl in the 'Any' being unpacked
        }
    | DecodingError Text  -- ^ The error from decodeMessage
    deriving (Show, Eq, Typeable)

instance Exception UnpackError

-- | Unpacks the given 'Any' into the given message type.  Returns 'Nothing'
-- if the type doesn't match or parsing the payload has failed.
--
-- Ignores the type URL prefix.
unpack :: forall a . Message a => Any -> Either UnpackError a
unpack a
    | expectedName /= snd (Text.breakOnEnd "/" $ a ^. typeUrl)
        = Left DifferentType
              { expectedMessageType = expectedName
              , actualUrl = a ^. typeUrl
              }
    | otherwise = case decodeMessage (a ^. value) of
        Left e -> Left $ DecodingError $ Text.pack e
        Right x -> Right x
  where
    expectedName = messageName (descriptor :: MessageDescriptor a)
