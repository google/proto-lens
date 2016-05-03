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
import Test.Framework (testGroup)
import Test.Framework.Providers.HUnit (testCase)
import Test.HUnit ((@=?))
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
    [ testCase "external" $ defFoo  ^. barDefaulted @=? BAR5
    , testCase "nested" $ defFoo  ^. bazDefaulted @=? Foo'BAZ4
    , testCase "true" $ defFoo ^. trueDefaulted @=? True
    , testCase "false" $ defFoo  ^. falseDefaulted @=? False
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
