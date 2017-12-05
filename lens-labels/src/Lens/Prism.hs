{-# LANGUAGE RankNTypes #-}

module Lens.Prism where

import  Lens.Prism.Market
import  Data.Functor.Identity (Identity)
import  Data.Profunctor (dimap)
import  Data.Profunctor.Choice

------------------------------------------------------------------------------
-- Prism Internals
------------------------------------------------------------------------------
type Prism s t a b = forall p f. (Choice p, Applicative f) => p a (f b) -> p s (f t)

type Prism' s a = Prism s s a a

-- | If you see this in a signature for a function, the function is expecting a 'Prism'.
type APrism s t a b = Market a b a (Identity b) -> Market a b s (Identity t)

-- | @
-- type APrism' = 'Simple' 'APrism'
-- @
type APrism' s a = APrism s s a a

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
