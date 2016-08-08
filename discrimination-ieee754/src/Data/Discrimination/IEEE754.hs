-- | Discrimination of floating-point numbers via their IEEE754 representation.
--
-- This technique is described by http://stereopsis.com/radix.html.
--
-- This orders -0.0 < 0.0, and imposes unspecified ordering and distinction
-- between NaNs.

{-# LANGUAGE CPP #-}
module Data.Discrimination.IEEE754 where

import Data.Binary.IEEE754 (floatToWord, doubleToWord)
import Data.Bits (xor, setBit, shift)
import Data.Discrimination (Grouping(..), Group, Sorting(..), Sort)
import Data.Functor.Contravariant (Contravariant(contramap))
import Data.Word (Word32, Word64)

-- TODO(awpr): Do these agree with the IEEE754 "total ordering"?

sortableFloat32 :: Float -> Word32
sortableFloat32 x = w `xor` mask
  where
    w = floatToWord x
    mask = setBit (negate (shift w (-31))) 31

sortableFloat64 :: Double -> Word64
sortableFloat64 x = w `xor` mask
  where
    w = doubleToWord x
    mask = setBit (negate (shift w (-63))) 63

discFloat :: Contravariant f => f Word32 -> f Float
discFloat = contramap sortableFloat32

discDouble :: Contravariant f => f Word64 -> f Double
discDouble = contramap sortableFloat64

groupFloat :: Group Float
groupFloat = discFloat grouping

groupDouble :: Group Double
groupDouble = discDouble grouping

sortFloat :: Sort Float
sortFloat = discFloat sorting

sortDouble :: Sort Double
sortDouble = discDouble sorting

#ifdef ORPHAN_DISCRIMINATION_INSTANCES
instance Grouping Float where
  grouping = groupFloat
instance Sorting Float where
  sorting = sortFloat

instance Grouping Double where
  grouping = groupDouble
instance Sorting Double where
  sorting = sortDouble
#endif
