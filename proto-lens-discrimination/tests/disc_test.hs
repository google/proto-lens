{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Main where

import Data.Discrimination (Sort, runSort, sorting1)
import Data.Int (Int32)
import Data.List (sortBy)
import Lens.Family2 (Lens', (&), (^.), (.~))
import Test.HUnit ((@=?), Assertion)
import Test.Framework (testGroup, defaultMain)
import Test.Framework.Providers.API (Test)
import Test.Framework.Providers.HUnit (testCase)
import Test.Framework.Providers.QuickCheck2 (testProperty)
import Test.QuickCheck ((===), (.||.))

import qualified Data.Map as M

import Data.ProtoLens.Arbitrary (ArbitraryMessage(..))
import Data.ProtoLens.Message
    ( FieldTypeDescriptor(..)
    , FieldDescriptor
    , Message(fieldsByTextFormatName)
    , ScalarField(..)
    , MessageOrGroup(..)
    , defMessage
    )
import Data.ProtoLens.Discrimination (discProtoMapAssocs)
import Data.ProtoLens.Sort

import Proto.Enum
import Proto.Enum_Fields
import Proto.Map
import Proto.Map_Fields


sortCompare :: Sort a -> a -> a -> Ordering
sortCompare s l r = case runSort s [(l, LT), (r, GT)] of
    [x]:_ -> x
    _     -> EQ

-- @comparesAs GT x y c@ asserts that the 'Sort' c compares x and y as GT.
comparesAs :: Ordering -> a -> a -> Sort a -> Assertion
comparesAs ordering x y s = ordering @=? sortCompare s x y

-- @x <? y $ c@ asserts that the 'Sort' c considers x to be less than y.
(<?) :: a -> a -> Sort a -> Assertion
(<?) = comparesAs LT

sortingScalarField :: ScalarField a -> Sort a
sortingScalarField = sortingFieldValue . ScalarField

fieldValueSortTest :: Test
fieldValueSortTest = testGroup "field value"
    -- Spot-check a few primitive types.
    [ testCase "int32" $ 42 <? 2112 $ sortingScalarField Int32Field
    , testCase "string" $ "a" <? "aa" $ sortingScalarField StringField
    -- Enum values.
    , testCase "enum Bar pos" $ BAR3 <? BAR5 $ sortingScalarField EnumField
    , testCase "enum Bar neg" $ NEGATIVE <? BAR5 $ sortingScalarField EnumField
    , testCase "enum Bar eq" $
          comparesAs EQ BAR5 BAR5 $ sortingScalarField EnumField
    -- Message fields.
    , testCase "message Foo eq" $
          comparesAs EQ defMessage defMessage $ sortingFieldValue
              (MessageField MessageType :: FieldTypeDescriptor Foo)
    , testCase "message Foo lt" $
          (defMessage & bar .~ BAR3) <? (defMessage & bar .~ BAR5) $
             sortingFieldValue
              (MessageField MessageType :: FieldTypeDescriptor Foo)
    ]

protoMapSortTest :: Test
protoMapSortTest = testGroup "map"
    [ testCase "empty" $ comparesAs EQ M.empty M.empty c

    , testProperty "empty LT singleton" $ \((k, v) :: (Int32, Int32)) ->
          let m = M.singleton k v
          in sortCompare c M.empty m == LT

    -- Entries for the same key are compared by their value.
    , testProperty "k => v1 `compare` k => v2 = v1 `compare` v2" $
          \(k :: Int32) (v1 :: Int32) v2 ->
              let m1 = M.singleton k v1
                  m2 = M.singleton k v2
              in compare v1 v2 == sortCompare c m1 m2

    -- 2 maps whose smallest keys differ are ordered by those keys.
    , testProperty "k1 => v `compare` k2 => v = k1 `compare` k2" $
          \k1 k2 v ->
              let m1 = M.singleton k1 v
                  m2 = M.singleton k2 v
              in compare k1 k2 == sortCompare c m1 m2

    , testProperty "same as Ord" $ \(x :: [(Int32, Int32)]) y ->
          -- Data.Map has no Arbitrary instance.
          let x' = M.fromList x
              y' = M.fromList y
          in compare x' y' == sortCompare c x' y'
    ]
  where
    c = discProtoMapAssocs sorting1 sortingMessage
            (key :: Lens' MapWrapper'IntMapEntry Int32)
            value

fieldSortTest :: Test
fieldSortTest = testProperty "compares by field" $
    \(ArbitraryMessage msg1 :: ArbitraryMessage Foo) (ArbitraryMessage msg2) ->
      compare (fromEnum <$> msg1 ^. maybe'bar) (fromEnum <$> msg2 ^. maybe'bar)
        == sortCompare (sortingField fieldDesc) msg1 msg2
  where
    fieldDesc =
      (fieldsByTextFormatName :: M.Map String (FieldDescriptor Foo)) M.! "bar"

messageSortTest :: Test
messageSortTest = testGroup "Message"
    [ testCase "defMessage EQ defMessage" $
        comparesAs EQ defMessage defMessage s
    , testCase "lower tags compared first" $
        (defMessage & bar .~ BAR3 & barDefaulted .~ BAR5) <?
        (defMessage & bar .~ BAR5 & barDefaulted .~ BAR3) $ s
    , testProperty "symmetry" $
        \(ArbitraryMessage msg1) (ArbitraryMessage msg2) ->
            (LT == sortCompare s msg1 msg2) ===
            (GT == sortCompare s msg2 msg1)
    , testProperty "transitivity" $
        \(ArbitraryMessage m1) (ArbitraryMessage m2) (ArbitraryMessage m3) ->
            let (low, mid, high) =
                  case sortBy (sortCompare s) [m1, m2, m3] of
                    [l, m, h] -> (l, m, h)
                    res -> error $ "Expected 3 elements, got: " ++ show res
            in  LT === sortCompare s low high .||.
                (EQ, EQ) === (sortCompare s low mid, sortCompare s mid high)
    ]
  where
    -- This fixes the types of all the ArbitraryMessages and defs above.
    s = sortingMessage :: Sort Foo

main :: IO ()
main = defaultMain
    [ fieldValueSortTest
    , protoMapSortTest
    , fieldSortTest
    , messageSortTest
    ]
