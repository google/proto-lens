{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

------------------------------------------------------------------------------
-- | This module provides OverloadedLabels 'IsLabel' support to lenses
-- generated by protolens; eg, it allows you to reference a proto field 'foo'
-- as @#foo@ without having protolens steal perfectly good identifier names.
module Lens.Labels.Function where

import GHC.OverloadedLabels (IsLabel (..))
import Lens.Labels (LensFn (..))

instance IsLabel x (LensFn p q) => IsLabel x (p -> q) where
  fromLabel x = runLens (fromLabel x)