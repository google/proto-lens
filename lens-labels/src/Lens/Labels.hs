{- | A lens library that integrates with OverloadedLabels.

Unlike the `lens` package (and others), lenses are defined as a newtype
instead of a type synonym, to avoid overlapping with other IsLabel
instances.  However, the `LensFn` and `runLens` functions allow converting
between the two types; for example:

> LensFn :: Control.Lens.LensLike f s t a b -> Lens.Labels.LensLike f s t a b
> runLens :: Lens.Labels.LensLike f s t a b -> Control.Lens.LensLike f s t a b

TODO: support more general optic types (e.g., prisms).
-}
{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE ExplicitNamespaces #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}
#if __GLASGOW_HASKELL__ >= 802
{-# LANGUAGE ScopedTypeVariables #-}
#endif
module Lens.Labels (
    -- * Lenses
    LensFn(..),
    LensLike,
    LensLike',
    (&),
    (Category..),
    Lens,
    -- * HasLens
    HasLens(..),
    Proxy#,
    proxy#,
    -- * Setters
    ASetter,
    (.~),
    (%~),
    set,
    over,
    -- * Getters
    Const(..),
    Getting,
    (^.),
    view,
    ) where

import qualified Control.Category as Category
import GHC.Prim (Proxy#, proxy#)
#if __GLASGOW_HASKELL__ >= 800
import GHC.OverloadedLabels (IsLabel(..))
#endif
import GHC.TypeLits (Symbol)

import Data.Function ((&))
#if __GLASGOW_HASKELL__ >= 800
import Data.Functor.Const (Const(..))
#else
import Control.Applicative (Const(..))
#endif
import Data.Functor.Identity(Identity(..))


-- | A newtype for defining lenses.  Can be composed using
-- `(Control.Category..)` (also exported from this module).
newtype LensFn a b = LensFn {runLens :: a -> b}
                        deriving Category.Category

type LensLike f s t a b = LensFn (a -> f b) (s -> f t)
type LensLike' f s a = LensLike f s s a a
type Lens s t a b = forall f . Functor f => LensLike f s t a b

-- | A type class for lens fields.
class HasLens (x :: Symbol) f s t a b
        | x s -> a, x t -> b, x s b -> t, x t a -> s where
    lensOf :: Proxy# x -> (a -> f b) -> s -> f t

#if __GLASGOW_HASKELL__ >= 800
instance
    (p ~ (a -> f b), q ~ (s -> f t), HasLens x f s t a b)
    => IsLabel x (LensFn p q) where
#if __GLASGOW_HASKELL__ >= 802
    fromLabel = LensFn $ lensOf (proxy# :: Proxy# x)
#else
    fromLabel p = LensFn $ lensOf p
#endif
#endif

type ASetter s t a b = LensLike Identity s t a b

(.~), set :: ASetter s t a b -> b -> s -> t
f .~ x = f %~ const x
set = (.~)

infixr 4 .~

(%~), over :: ASetter s t a b -> (a -> b) -> s -> t
f %~ g = \s -> runIdentity $ runLens f (Identity . g) s
over = (%~)

infixr 4 %~

type Getting r s t a b = LensLike (Const r) s t a b

(^.), view :: s -> Getting a s t a b -> a
s ^. f = getConst $ runLens f Const s
view = (^.)

infixl 8 ^.
