-- | Module defining the individual base wire types (e.g. VarInt, Fixed64).
--
-- TODO: separate out this definition from the Encoding implementation.
-- Also consider moving away from a GADT to a simpler sum type.
module Data.ProtoLens.Encoding.Wire
    ( Tag(..)
    , TaggedValue(..)
    , WireType(..)
    , WireValue(..)
    ) where

import Data.ProtoLens.Encoding.Reflected.Wire
