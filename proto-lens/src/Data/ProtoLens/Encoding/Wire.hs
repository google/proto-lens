-- | Module defining the individual base wire types (e.g. VarInt, Fixed64).
--
-- TODO: separate out this definition from the Encoding implementation.
-- Also consider moving away from a GADT to a simpler sum type.
module Data.ProtoLens.Encoding.Wire
    ( Tag(..)
    , TaggedValue(..)
    , WireType(..)
    , WireValue(..)
    , SomeWireType(..)
    , parseTaggedValue
    , buildTaggedValue
    ) where

import Data.Word (Word64)

import Data.ProtoLens.Encoding.Bytes
import Data.ProtoLens.Encoding.Reflected.Wire

-- | Parse an unknown WireValue, given that the type+number has
-- already been parsed.
parseTaggedValue :: Word64 -> Parser TaggedValue
parseTaggedValue w = do
    (SomeWireType wt, tag) <- runEither $ splitTypeAndTag w
    value <- getWireValue wt
    return $ TaggedValue tag (WireValue wt value)

buildTaggedValue :: TaggedValue -> Builder
buildTaggedValue = putTaggedValue
