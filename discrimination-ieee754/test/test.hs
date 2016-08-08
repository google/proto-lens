module Main where

import Data.Discrimination (Sort, runSort)
import Data.Discrimination.IEEE754 (sortingFloat, sortingDouble)

import Test.Framework (defaultMain)
import Test.Framework.Providers.API (Test)
import Test.Framework.Providers.QuickCheck2 (testProperty)

sortCompare :: Sort a -> a -> a -> Ordering
sortCompare s l r = case runSort s [(l, LT), (r, GT)] of
    [x]:_ -> x
    _     -> EQ

propAgreesWithOrd :: Ord a => Sort a -> (a, a) -> Bool
propAgreesWithOrd s (l, r) = compare l r == sortCompare s l r

main = defaultMain
    [ testProperty "sortingFloat agrees with Ord" $
        propAgreesWithOrd sortingFloat
    , testProperty "sortingDouble agrees with Ord" $
        propAgreesWithOrd sortingDouble
    ]
