-- | A compatibility layer for older code to create default protocol buffer messages.
--
-- In older versions of @proto-lens@, messages could be constructed with
-- @Data.Default.Class.def@.  However, for @proto-lens >= 0.4@, that is
-- no longer the case and @Data.ProtoLens.defMessage@ should be used instead.
--
-- This module provides a compatibility layer that may be used to upgrade
-- older code without substantial code changes.
module Data.ProtoLens.Default
    ( def
    , Message
    ) where

import Data.ProtoLens.Message (Message(defMessage))

-- | A message with all fields set to their default values.
--
-- For new code, prefer `defMessage`.
def :: Message a => a
def = defMessage
