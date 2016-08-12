-- | Discrimination of floating-point numbers via their IEEE754 representation.
--
-- This technique is described by http://stereopsis.com/radix.html.
--
-- This orders floating-point numbers according to the IEEE754 floating-point
-- total order.  -NaN < -Infinity < ... < -0 < 0 < ... < +Infinity < +NaN.
-- NaNs with positive sign are ordered by the value of their payload, and NaNs
-- with negative sign are reverse-ordered by the value of their payload.

module Data.Discrimination.IEEE754 where

import Data.Binary.IEEE754 (floatToWord, doubleToWord)
import Data.Bits (xor, setBit, shift)
import Data.Discrimination (Grouping(..), Group, Sorting(..), Sort)
import Data.Functor.Contravariant (Contravariant(contramap))
import Data.Word (Word32, Word64)

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

groupingFloat :: Group Float
groupingFloat = discFloat grouping

groupingDouble :: Group Double
groupingDouble = discDouble grouping

sortingFloat :: Sort Float
sortingFloat = discFloat sorting

sortingDouble :: Sort Double
sortingDouble = discDouble sorting
