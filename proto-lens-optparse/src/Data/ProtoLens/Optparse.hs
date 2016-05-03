-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

-- | Adapting proto-lens to optparse-applicative ReadMs.
-- This gives an easy way to define options and arguments for
-- text-format protobuf types.
module Data.ProtoLens.Optparse
    ( proto
    , protoOption
    , protoArgument
    ) where

import Data.ProtoLens.Message (Message)
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
