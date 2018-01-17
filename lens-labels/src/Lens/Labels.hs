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
    Lens',
    -- * HasLens
    HasLens(..),
    Proxy#,
    proxy#,
    HasLens'(..),
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
import GHC.OverloadedLabels (IsLabel(..))
import GHC.TypeLits (Symbol)

import Data.Function ((&))
import Data.Functor.Const (Const(..))
import Data.Functor.Identity(Identity(..))


-- | A newtype for defining lenses.  Can be composed using
-- '(Control.Category..)', which is exported from this module.
newtype LensFn a b = LensFn {runLens :: a -> b}
                        deriving Category.Category

type LensLike f s t a b = LensFn (a -> f b) (s -> f t)
type LensLike' f s a = LensLike f s s a a
type Lens s t a b = forall f . Functor f => LensLike f s t a b
type Lens' s a = Lens s s a a

-- | A type class for lens fields.
class HasLens f s t (x :: Symbol) a b
        | x s -> a, x t -> b, x s b -> t, x t a -> s where
    lensOf :: Proxy# x -> (a -> f b) -> s -> f t

instance
    (p ~ (a -> f b), q ~ (s -> f t), HasLens f s t x a b)
    => IsLabel x (LensFn p q) where
#if __GLASGOW_HASKELL__ >= 802
    fromLabel = LensFn $ lensOf (proxy# :: Proxy# x)
#else
    fromLabel p = LensFn $ lensOf p
#endif

-- | A type class for lens fields of monomorphic types (i.e., where the lens
-- doesn't change the outer type).
--
-- This class can be used to simplify instance declarations and type
-- errors, by "forwarding" 'HasLens' to simpler instances.  For example:
--
-- @
--     instance (HasLens' f Foo x a, a ~ b) => HasLens f Foo Foo x a b where
--         where lensOf = lensOf'
--     instance Functor f => HasLens' f Foo "a" Int where ...
--     instance Functor f => HasLens' f Foo "b" Double where ...
--     instance Functor f => HasLens' f Foo "c" [Float]  where ...
--     ...
-- @
class HasLens f s s x a a => HasLens' f s x a | x s -> a where
    lensOf' :: Proxy# x -> (a -> f a) -> s -> f s

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

(^.) :: s -> Getting a s t a b -> a
s ^. f = getConst $ runLens f Const s

view :: Getting a s t a b -> s -> a
view = flip (^.)

infixl 8 ^.
