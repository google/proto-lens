{-# LANGUAGE CPP #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UndecidableInstances #-}
#if __GLASGOW_HASKELL__ >= 802
{-# LANGUAGE ScopedTypeVariables #-}
#endif
{-# OPTIONS_GHC -fno-warn-orphans #-}

------------------------------------------------------------------------------
-- | This module provides OverloadedLabels 'IsLabel' support via an
-- orphan instance. This means a @Lens.Family.Lens@ can be referenced
-- as @#foo@ whenever we have an instance of 'Data.ProtoLens.Field.HasField'
-- with the label @"foo"@."
--
-- To use these labels, enable the @OverloadedLabels@ extension, and then
-- import:
--
-- > import Data.ProtoLens.Labels()
module Data.ProtoLens.Labels where

import GHC.OverloadedLabels (IsLabel (..))
#if __GLASGOW_HASKELL__ >= 802
import GHC.Prim (Proxy#, proxy#)
#endif

import Data.ProtoLens.Field (HasField(..))

instance (HasField s x a, p ~ (a -> f a), q ~ (s -> f s), Functor f,
        a ~ b) => IsLabel x (p -> q) where
#if __GLASGOW_HASKELL__ >= 802
  fromLabel = fieldOf (proxy# :: Proxy# x)
#else
  fromLabel x = fieldOf x
#endif
