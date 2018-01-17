-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

-- | This module defines the 'Prism' type and combinators. Used for building
--   'Prism's for oneof fields.
{-# LANGUAGE RankNTypes #-}

module Lens.Labels.Prism
    ( Prism
    , Prism'
    , AReview
    , (#)
    , prism
    , prism'
    , _Left
    , _Right
    , _Just
    , _Nothing
    ) where

import  Data.Tagged (Tagged (..))
import  Data.Functor.Identity (Identity (..))
import  Data.Profunctor (dimap)
import  Data.Profunctor.Choice
import  Data.Profunctor.Unsafe ((#.), (.#))


------------------------------------------------------------------------------
-- Prism Internals
------------------------------------------------------------------------------
type Prism s t a b = forall p f. (Choice p, Applicative f) => p a (f b) -> p s (f t)

type Prism' s a = Prism s s a a

type Optic p f s t a b = p a (f b) -> p s (f t)

type Optic' p f s a = Optic p f s s a a

type AReview t b = Optic' Tagged Identity t b

-- | Used for constructing 'Prism' values.
--
-- @'_Just' '#' 5 == 'Just' 5@
( # ) :: AReview t b -> b -> t
( # ) p = runIdentity #. unTagged #. p .# Tagged .# Identity
infixr 8 #


------------------------------------------------------------------------------
-- Prism Combinators
------------------------------------------------------------------------------

-- | Build a 'Control.Lens.Prism.Prism'.
--
-- @'Either' t a@ is used instead of @'Maybe' a@ to permit the types of @s@ and @t@ to differ.
--
prism :: (b -> t) -> (s -> Either t a) -> Prism s t a b
prism bt seta = dimap seta (either pure (fmap bt)) . right'
{-# INLINE prism #-}

-- | This is usually used to build a 'Prism'', when you have to use an operation like
-- 'Data.Typeable.cast' which already returns a 'Maybe'.
prism' :: (b -> s) -> (s -> Maybe a) -> Prism s s a b
prism' bs sma = prism bs (\s -> maybe (Left s) Right (sma s))
{-# INLINE prism' #-}

_Left :: Prism (Either a c) (Either b c) a b
_Left = prism Left $ either Right (Left . Right)

_Right :: Prism (Either c a) (Either c b) a b
_Right = prism Right $ either (Left . Left) Right

_Just :: Prism (Maybe a) (Maybe b) a b
_Just = prism Just $ maybe (Left Nothing) Right

_Nothing :: Prism' (Maybe a) ()
_Nothing = prism' (const Nothing) $ maybe (Just ()) (const Nothing)
