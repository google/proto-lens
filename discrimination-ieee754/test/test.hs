{-# LANGUAGE TupleSections #-}
module Main where

import Data.Binary.IEEE754 (doubleToWord, floatToWord, wordToDouble, wordToFloat)
import Data.Bits ((.|.), (.&.), Bits, FiniteBits, bit)
import Data.Discrimination (Sort, runSort)
import Data.Discrimination.IEEE754 (sortingFloat, sortingDouble)
import Data.Word (Word32, Word64)

import Test.Framework (defaultMain, testGroup)
import Test.Framework.Providers.API (Test)
import Test.Framework.Providers.QuickCheck2 (testProperty)
import Test.QuickCheck (Arbitrary)

sortCompare :: Sort a -> a -> a -> Ordering
sortCompare s l r = case runSort s [(l, LT), (r, GT)] of
    [x]:_ -> x
    _     -> EQ

propAgreesWithOrd :: RealFloat a => Sort a -> (a, a) -> Bool
propAgreesWithOrd s (l, r)
    | l < r = sortCompare s l r == LT
    | l > r = sortCompare s l r == GT
    | l == r = sortCompare s l r == EQ
    -- one or the other is NaN; Ord doesn't give coherent comparisons for these:
    -- compare NaN 0 = GT, but compare 0 NaN == GT as well.  So don't trust it.
    | otherwise = True

propNegLTPos :: Num a => Sort a -> (a, a) -> Bool
propNegLTPos s (l, r) = sortCompare s (negate (abs l)) (abs r) == LT

propNegZeroLTZero :: Fractional a => Sort a -> Bool
propNegZeroLTZero s = sortCompare s (-0.0) 0.0 == LT

inf :: Fractional a => a
inf = 1.0 / 0

negInf :: Fractional a => a
negInf = -1.0 / 0

propNegInfLTNumbers :: RealFloat a => Sort a -> a -> Bool
propNegInfLTNumbers s x = isNaN x || x == negInf || sortCompare s negInf x == LT

propInfGTNumbers :: RealFloat a => Sort a -> a -> Bool
propInfGTNumbers s x = isNaN x || x == inf || sortCompare s inf x == GT

-- Trim a word to be a valid NaN payload of n bits.
makeNaNPayload :: (Num w, Bits w) => Int -> w -> w
makeNaNPayload n x = case x .&. (bit n - 1) of
  -- Zero significand is infinity, so choose 1 arbitrarily instead.
  0 -> 1
  payload -> payload

makeFloatNaNPayload :: Word32 -> Word32
makeFloatNaNPayload = makeNaNPayload 23

-- Build a 'Float' NaN with the given sign and payload.
makeFloatNaN :: Bool -> Word32 -> Float
makeFloatNaN sign payload =
    wordToFloat $ exponentAndSign .|. makeFloatNaNPayload payload
  where
    exponentAndSign = if sign then 0xff800000 else 0x7f800000

makeDoubleNaNPayload :: Word64 -> Word64
makeDoubleNaNPayload = makeNaNPayload 52

-- Build a 'Double' NaN with the given sign and payload.
makeDoubleNaN :: Bool -> Word64 -> Double
makeDoubleNaN sign payload =
    wordToDouble $ exponentAndSign .|. makeDoubleNaNPayload payload
  where
    exponentAndSign = if sign then 0xfff0000000000000 else 0x7ff0000000000000

-- Let's obey the IEEE754 total order.  See
-- https://github.com/rust-lang/rust/issues/5585 for a description of it.
-- It's consistent with Ord for all non-NaN arguments, so we only have to write
-- properties for the cases involving NaNs.
nansTestGroup
    :: ( Arbitrary a, RealFloat a, Show a
       , Arbitrary b, FiniteBits b, Ord b, Show b
       )
    => Sort a -> (a -> b) -> (Bool -> b -> a) -> (b -> b) -> Test
nansTestGroup s toWord makeNaN makePayload = testGroup "NaNs"
    [ testProperty "-NaN < everything" $ \x payload ->
        sortCompare s (makeNaN True payload) x == LT
    , testProperty "-NaN < -Infinity" $ \payload ->
        sortCompare s (makeNaN True payload) negInf == LT
    , testProperty "+NaN > everything" $ \x payload ->
        sortCompare s (makeNaN False payload) x == GT
    , testProperty "+NaN > +Infinity" $ \payload ->
        sortCompare s (makeNaN False payload) inf == GT
    , testProperty "-NaN < +NaN" $ \l r ->
        sortCompare s (makeNaN True l) (makeNaN False r) == LT &&
        sortCompare s (makeNaN False l) (makeNaN True r) == GT
    , testProperty "+NaNs compare by payload" $ \l r ->
        sortCompare s (makeNaN False l) (makeNaN False r) ==
        compare (makePayload l) (makePayload r)
    , testProperty "-NaNs compare by reverse payload" $ \l r ->
        sortCompare s (makeNaN True l) (makeNaN True r) ==
        compare (makePayload r) (makePayload l)

    -- Sanity checks...
    , testProperty "NaNs are NaN" $ \sign payload ->
        isNaN (makeNaN sign payload)
    , testProperty "makePayload is correct" $ \sign payload ->
        toWord (makeNaN sign payload) ==
        toWord (makeNaN sign (makePayload payload))
    ]

comparisonsTestGroup
    :: ( RealFloat a, Arbitrary a, Show a
       , FiniteBits b, Ord b, Show b, Arbitrary b
       )
    => String -> Sort a -> (a -> b) -> (Bool -> b -> a) -> (b -> b) -> Test
comparisonsTestGroup nm s toWord makeNaN makePayload = testGroup nm
    [ testProperty "negatives LT positives" $
        propNegLTPos s
    , testProperty "-0 < 0" $
        propNegZeroLTZero s
    , testProperty "-INF < x" $
        propNegInfLTNumbers s
    , testProperty "INF > x" $
        propInfGTNumbers s

    , testGroup "agrees with Ord" $ ($ propAgreesWithOrd s) <$>
        [ testProperty "l = 0" . (. (0,))
        , testProperty "r = 0" . (. (,0))
        , testProperty "l = -INF" . (. (negInf,))
        , testProperty "r = -INF" . (. (,negInf))
        , testProperty "l = INF" . (. (inf,))
        , testProperty "r = INF" . (. (,inf))
        , testProperty "l = r" . (. (\x -> (x, x)))
        , testProperty "arbitrary"
        ]

    , nansTestGroup s toWord makeNaN makePayload
    ]

main :: IO ()
main = defaultMain
    [ comparisonsTestGroup "Float" sortingFloat floatToWord
                                   makeFloatNaN makeFloatNaNPayload
    , comparisonsTestGroup "Double" sortingDouble doubleToWord
                                    makeDoubleNaN makeDoubleNaNPayload
    ]
