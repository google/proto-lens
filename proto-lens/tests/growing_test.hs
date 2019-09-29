-- | Unit and property tests for Data.ProtoLens.Encoding.Growing.
module Main (main) where

import Control.Monad (void)
import Control.Monad.ST
import Data.Foldable (foldlM)
import qualified Data.Vector.Unboxed as V
import Test.QuickCheck
import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.QuickCheck (testProperty)

import Data.ProtoLens.Encoding.Growing

main :: IO ()
main = defaultMain $ testGroup "tests"
    [ testProperty "fromList" testFromList
    , testProperty "unchanged" testUnchanged
    ]

testFromList :: [Int] -> Property
testFromList xs = fromListGrowing xs === V.fromList xs

fromListGrowing :: V.Unbox a => [a] -> V.Vector a
fromListGrowing xs0 = runST (new >>= fill xs0 >>= unsafeFreeze)

fill :: V.Unbox a => [a] -> Growing V.Vector s a -> ST s (Growing V.Vector s a)
fill xs v = foldlM append v xs

-- Test a weak form of immutability: filling in more values (which may or may
-- not cause reallocations) doesn't affect the current value.
testUnchanged :: [Int] -> [Int] -> Property
testUnchanged xs ys =
    let xs' = runST (do
                        v <- new >>= fill xs
                        void $ fill ys v
                        unsafeFreeze v)
    in xs' === V.fromList xs
