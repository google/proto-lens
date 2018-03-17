-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# LANGUAGE OverloadedStrings #-}
module Main where

import Proto.Enum
    ( Bar(..)
    , Baz(..)
    , TwoBazs(..)
    , Foo(..)
    , Foo'Baz(..)
    -- explicit import to make sure we get pattern synonyms
    , Alias(..)
    )
import Proto.Enum_Fields
import Data.Function (on)
import Data.ProtoLens
import Data.ProtoLens.Arbitrary
import Lens.Family2 ((&), (.~), (^.))
import Test.Framework (plusTestOptions, testGroup)
import Test.Framework.Options (topt_timeout)
import Test.Framework.Providers.HUnit (testCase)
import Test.HUnit ((@?=))

import Data.ProtoLens.TestUtil

defFoo :: Foo
defFoo = def

main :: IO ()
main = testMain
    [ serializeTo "default" defFoo mempty mempty
    , testExternalEnum
    , testNestedEnum
    , testDefaults
    , testBadEnumValues
    , testNamedEnumValues
    , testRoundTrip
    , testBounded
    , testMaybeSuccAndPred
    , testEnumFromThenTo
    , testMonotonicFromEnum
    , testAliases
    ]

testExternalEnum, testNestedEnum, testDefaults, testBadEnumValues,
    testNamedEnumValues, testRoundTrip, testBounded, testMaybeSuccAndPred,
    testEnumFromThenTo, testMonotonicFromEnum, testAliases :: Test

testExternalEnum = testGroup "external"
    [ serializeTo (show e1)
          (defFoo & bar .~ e1)
          (keyed "bar" e2)
          (tagged 1 $ VarInt e3)
    -- Use ":: Bar" to confirm that the external type doesn't have a prefix.
    | (e1, e2, e3) <- zip3 [BAR3, BAR5, NEGATIVE :: Bar]
                           ["BAR3", "BAR5", "NEGATIVE"]
                           -- Varints store negative numbers in two's
                           -- complement.
                           [3, 5, maxBound]
    ]

testNestedEnum = testGroup "nested"
    [ serializeTo (show e1)
          (defFoo & baz .~ e1)
          (keyed "baz" e2)
          (tagged 2 $ VarInt e3)
    -- Use ":: Foo'Baz" to confirm that the nested type has a prefix.
    | (e1, e2, e3) <- zip3 [Foo'BAZ2, Foo'BAZ4 :: Foo'Baz]
                           ["BAZ2", "BAZ4"]
                           [2, 4]
    ]

testDefaults = testGroup "defaults"
    [ testCase "external" $ defFoo  ^. barDefaulted @?= BAR5
    , testCase "nested" $ defFoo  ^. bazDefaulted @?= Foo'BAZ4
    , testCase "true" $ defFoo ^. trueDefaulted @?= True
    , testCase "false" $ defFoo  ^. falseDefaulted @?= False
    ]

testBadEnumValues = testGroup "badEnumValues"
    [ readFrom "valid" (Just $ defFoo & bar .~ BAR5) "bar: 5"
    , readFrom "invalid" (Nothing :: Maybe Foo) "bar: 7"
    ]

testNamedEnumValues = testGroup "namedEnumValues"
    [ readFrom "valid" (Just $ defFoo & bar .~ BAR5) "bar: BAR5"
    , readFrom "invalid" (Nothing :: Maybe Foo) "bar: BAR7"
    ]

testRoundTrip =
    runTypedTest (roundTripTest "roundtrip" :: TypedTest Foo)

testBounded = testGroup "bounded"
    [ testCase "minBound" $ (minBound :: Bar) @?= NEGATIVE
    , testCase "maxBound" $ (maxBound :: Bar) @?= BAR5
    ]

testMaybeSuccAndPred = testGroup "succPred"
    [ testGroup "succ"
        [ testCase "min" $ succ (minBound :: Bar) @?= BAR3
        , testCase "BAR3" $ succ BAR3 @?= BAR5
        ]
    , testGroup "pred"
        [ testCase "BAR3" $ pred BAR3 @?= NEGATIVE
        , testCase "max" $ pred (maxBound :: Bar) @?= BAR3
        ]
    ]

testEnumFromThenTo = plusTestOptions testOptions $ testGroup "enumFromThenTo"
    [ testCaseEnum "[min ..]" [minBound :: Baz ..]
        [BAZ1, BAZ2, BAZ3, BAZ4, BAZ5, BAZ6, BAZ7, BAZ8]
    , testCaseEnum "[3..5]" [BAZ3 .. BAZ5] [BAZ3, BAZ4, BAZ5]
    , testCaseEnum "[4..4]" [BAZ4 .. BAZ4] [BAZ4]
    , testCaseEnum "[5..1]" [BAZ5 .. BAZ1] []
    , testCaseEnum "[2,5..]" [BAZ2, BAZ5 ..] [BAZ2, BAZ5, BAZ8]
    , testCaseEnum "[8,6..]" [BAZ8, BAZ6 ..] [BAZ8, BAZ6, BAZ4, BAZ2]
    , testCaseEnum "[8,6..2]" [BAZ8, BAZ6 .. BAZ2] [BAZ8, BAZ6, BAZ4, BAZ2]
    , testCaseEnum "[1,3..2]" [BAZ1, BAZ3 .. BAZ2] [BAZ1]
    , testCaseEnum "[6,5..7]" [BAZ6, BAZ5 .. BAZ7] []
    , testCaseEnum "[2,2..]" [BAZ2, BAZ2 ..] $ replicate 10 BAZ2
    , testCaseEnum "[2,2..2]" [BAZ2, BAZ2 .. BAZ2] $ replicate 10 BAZ2
    , testCaseEnum "[2,2..1]" [BAZ2, BAZ2 .. BAZ1] []
    ]
  where
    -- One second timeout in µs in case there's an infinite loop.
    testOptions = mempty {topt_timeout = Just $ Just 1000000}
    testCaseEnum name actual expected =
        -- We limit the actual to 10 in case of accidental infinite sequences.
        -- Note that there are only 10 values, so this should happen rarely.
        testCase name $ take 10 actual @?= expected

testMonotonicFromEnum = testGroup "monotonicFromEnum"
    [ testProperty "baz" monotonicFromEnumProperty
    ]
  where
    monotonicFromEnumProperty :: ArbitraryMessage TwoBazs -> Bool
    monotonicFromEnumProperty (ArbitraryMessage twoBazs)  =
      let b1 = twoBazs ^. baz1
          b2 = twoBazs ^. baz2
       in compare b1 b2 == (compare `on` fromEnum) b1 b2

testAliases = testCase "alias" $ do
    map fromEnum [Alias1, Alias2, Alias2a, Alias3] @?= [1,2,2,3]
    Alias2 @?= Alias2a
    -- Test that we can use the pattern synonym as a pattern:
    True @?= case Alias2 of
              Alias2a -> True
              _ -> False
    Alias2 @?= case Alias2 of
        -- Check that this explicit list (which doesn't include Alias2) covers
        -- all the constructor cases for this type.
        -- We turn on warnings and -Werror for this test in the .cabal file.
        Alias1 -> Alias1
        Alias2 -> Alias2
        Alias3 -> Alias3
