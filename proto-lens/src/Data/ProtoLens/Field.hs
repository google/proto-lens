-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE TypeFamilies #-}

-- | A simple interface supporting overloaded record fields.
--
-- An example instance:
--
-- > data Foo = Foo { _bar :: Bool }
-- > type instance Field "bar" Foo = Bool
-- >
-- > instance HasField "bar" Foo Foo where
-- >     field _ = lens _bar (\f x -> f { _bar = x })
-- >
-- > bar :: HasField "bar" a a => Lens a b Bool Bool
-- > bar = field (ProxySym :: ProxySym "bar")
--
-- The proto compiler defines separate instances of 'HasField' for each field
-- of each record.  It defines the accessors (e.g., the lens @bar@ above) once
-- per unique field name, shared between different message types within the
-- same module.
module Data.ProtoLens.Field
    ( -- * Overloaded fields
     Field
    , HasField(..)
    , ProxySym(..)
    -- * Helper lenses
    , maybeLens
    ) where

import Data.Maybe (fromMaybe)
import GHC.TypeLits (Symbol)
import Lens.Family2 (Lens, Lens')
import Lens.Family2.Unchecked (lens)

-- | A \"proxy\" value for a type-level string (i.e., a type of kind 'Symbol').
data ProxySym (s :: Symbol) = ProxySym

-- | The type of the field 's' in a message of type 'a'.
type family Field (s :: Symbol) a

-- | A class for overloaded fields.
--
-- - 's' is a 'Symbol' representing the field name.
-- - 'a' is the message type for getting this field
-- - 'b' is the message type after setting this field.
--
-- Currently 'a' and 'b' are the same in all generated instances.  In the
-- future, when we support type-checking of required fields we'll need
-- different 'a' and 'b'; for more details see <go/proto-lens>.
class HasField (s :: Symbol) a b | a -> b, b -> a where
    field :: ProxySym s -> Lens a b (Field s a) (Field s b)

-- | A helper lens for accessing optional fields.
-- This is used as part of code generation, and should generally not be needed
-- explicitly.
--
-- Note that 'maybeLens' does not satisfy the lens laws, which expect that @set
-- l (view l x) == x@.  For example,
--
-- > set (maybeLens 'a') (view (maybeLens 'a') Nothing) == Just 'a'
--
-- However, this is the behavior generally expected by users, and only matters
-- if we're explicitly checking whether a field is set.
maybeLens :: b -> Lens' (Maybe b) b
maybeLens x = lens (fromMaybe x) $ const Just
