-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

-- | Adapting proto-lens to optparse-applicative ReadMs.
-- This gives an easy way to define options and arguments for
-- text-format protobuf types.
module Data.ProtoLens.Optparse
    ( -- * Messages
      proto
    , protoOption
    , protoArgument
      -- * Enums
    , protoEnum
    , enumOption
    , enumArgument
    ) where

import Control.Applicative ((<|>))
import Control.Monad ((<=<))
import Data.ProtoLens.Message (Message, MessageEnum(readEnum, maybeToEnum))
import Data.ProtoLens.TextFormat (readMessage)
import qualified Data.Text.Lazy as TL
import Options.Applicative
  ( ArgumentFields
  , Mod
  , ReadM
  , OptionFields
  , Parser
  , argument
  , eitherReader
  , option
  )
import Text.Read (readMaybe)

-- | An optparse-applicative 'ReadM' for a text-format protobuf.  This lets you
-- have flags or arguments with protobuf values.
proto :: Message a => ReadM a
proto = eitherReader (readMessage . TL.pack)

-- | Shorthand for a text-format protobuf option.
protoOption :: Message a => Mod OptionFields a -> Parser a
protoOption = option proto

-- | Shorthand for a text-format protobuf argument.
protoArgument :: Message a => Mod ArgumentFields a -> Parser a
protoArgument = argument proto

-- We define our own maybeReader to preserve compatibility with versions of
-- optparse-applicative that don't provide it (< 0.13.0.0).
maybeReader :: (String -> Maybe a) -> ReadM a
maybeReader = eitherReader . fmap (maybe (Left "No parse") Right)

-- | An optparse-applicative 'ReadM' for an enum name or number.
protoEnum :: MessageEnum a => ReadM a
protoEnum = maybeReader readEnum <|> maybeReader (maybeToEnum <=< readMaybe)

-- | Shorthand for a text-format enumbuf option.
enumOption :: MessageEnum a => Mod OptionFields a -> Parser a
enumOption = option protoEnum

-- | Shorthand for a text-format enumbuf argument.
enumArgument :: MessageEnum a => Mod ArgumentFields a -> Parser a
enumArgument = argument protoEnum
