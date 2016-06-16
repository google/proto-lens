-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# LANGUAGE OverloadedStrings #-}
module Main where

import Proto.Enum
import Data.ProtoLens
import Lens.Family2 ((&), (.~), (^.))
import Test.Framework (plusTestOptions, testGroup)
import Test.Framework.Options (topt_timeout)
import Test.Framework.Providers.HUnit (testCase)
import Test.HUnit ((@?=))
import Data.Monoid (mempty)

import TestUtil

defFoo :: Foo
defFoo = def

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
    ]

testExternalEnum = testGroup "external"
    [ serializeTo (show e1)
          (defFoo & bar .~ e1) (keyed "bar" e2)
          (tagged 1 $ VarInt $ fromIntegral e2)
    -- Use ":: Bar" to confirm that the external type doesn't have a prefix.
    | (e1, e2) <- zip [BAR3, BAR5, NEGATIVE :: Bar]
                      -- Use Integer to make sure that TextFormat prints
                      -- the type as a negative value (in contrast to the VarInt
                      -- encoding, which renders it as a large positive value).
                      [3, 5, -1 :: Integer]
    ]

testNestedEnum = testGroup "nested"
    [ serializeTo (show e1)
          (defFoo & baz .~ e1) (keyed "baz" e2) (tagged 2 $ VarInt e2)
    -- Use ":: Foo'Baz" to confirm that the nested type has a prefix.
    | (e1, e2) <- zip [Foo'BAZ2, Foo'BAZ4 :: Foo'Baz] [2, 4]
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

