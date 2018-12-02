-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# LANGUAGE RankNTypes #-}
-- | An assorted collection of functions useful when working with ProtoLens
-- protocol buffers.  These functions are inspired by functionality found in
-- the protobuf implementation in other languages.
module Data.ProtoLens.Combinators
    ( has
    , clear
    , make
    , modifyInState
    ) where

import Control.Monad.Trans.State (State, execState)
import Data.ProtoLens (Message(..))
import Data.Maybe (isJust)
import Lens.Family2 (LensLike, Phantom, Setter, to, (.~))

-- | Turns a 'LensLike' getting a 'Maybe' into a 'Getter' of a 'Bool'
-- that returns @True@ when the 'Maybe' is @Just@ something.
--
-- I.e., makes a getter for a 'Maybe' field that returns whether it's set.
has :: Phantom f => LensLike f a a' (Maybe b) b' -> LensLike f a a' Bool b''
has = (. to isJust)

-- | Sets the provided lens in @a@ to @Nothing@.
clear :: Setter a a' b (Maybe b') -> a -> a'
clear = (.~ Nothing)

-- | Creates a 'Default' and then applies the provided `State` to it.  This is
-- convenient for creating complicated structures.
make :: Message msg => State msg a -> msg
make = modifyInState defMessage

-- | Allows one to modify a value in the 'State' monad.  Note that this is
-- just for syntactic convenience with @do@ blocks, e.g.
--
-- @
--    newThing = modifyInState thing $ do
--        ...
-- @
modifyInState :: s -> State s a -> s
modifyInState = flip execState
