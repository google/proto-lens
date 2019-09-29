-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}
module Main where

import Data.ByteString.Builder (byteString)
import Lens.Family2 (Lens', (&), (.~), view, set)
import Test.Tasty (testGroup)
import Test.QuickCheck
import qualified Data.Text as T
import qualified Data.Vector.Generic as V

import Data.ProtoLens
import Data.ProtoLens.Arbitrary
import Data.ProtoLens.TestUtil
import Proto.Repeated
import Proto.Repeated_Fields

defFoo :: Foo
defFoo = defMessage

defBar :: Bar
defBar = defMessage

-- | Test that the vector and list lenses for repeated fields
-- behave the same.
vectorTest ::
    forall a v b . (Eq a, Eq b, Show a, Show b, Message a, V.Vector v b)
    => String -> Gen b
    -> Lens' a [b] -> Lens' a (v b) -> TestTree
vectorTest name arbitraryElem listLens vecLens = testGroup name
    [ testProperty "get"
        $ \(ArbitraryMessage (m :: a)) ->
            view listLens m === V.toList (view vecLens m)
    , testProperty "set"
        $ forAll arbitraryMessage $ \(m :: a) ->
            forAll (listOf arbitraryElem)
                $ \bs -> set listLens bs m
                            === set vecLens (V.fromList bs) m
    ]

main :: IO ()
main = testMain
    [ serializeTo "default" defFoo mempty mempty
    , serializeTo "int32"
          (defFoo & a .~ [1..3])
          (vcat $ map (keyedInt "a") [1..3])
          $ mconcat [tagged 1 $ VarInt x | x <- [1..3]]
    , serializeTo "string"
          (defFoo & b .~ ["one", "two", "three"])
          (vcat $ map (keyedStr "b") ["one", "two", "three"])
          $ mconcat [ tagged 2 $ Lengthy $ byteString x
                    | x <- ["one", "two", "three"]
                    ]
    , serializeTo "nested/empty"
          (defFoo & c .~ [defMessage, defMessage])
          (braced "c" mempty $+$ braced "c" mempty)
          $ tagged 3 (Lengthy mempty) <> tagged 3 (Lengthy mempty)
    , serializeTo "nested/fixed32"
          (defFoo & c .~ [defBar & d .~ [1..3]])
          (braced "c" $ vcat $ map (keyedInt "d") [1..3])
          $ tagged 3 $ Lengthy $ mconcat [tagged 3 $ Fixed32 x | x <- [1..3]]
    , serializeTo "nested/fixed64"
          (defFoo & c .~ [defBar & e .~ [1..3]])
          (braced "c" $ vcat $ map (keyedInt "e") [1..3])
          $ tagged 3 $ Lengthy $ mconcat [tagged 4 $ Fixed64 x | x <- [1..3]]
    , serializeTo "nested/repeated"
          (defFoo & c .~ [defBar & d .~ [1..3], defBar & e .~ [1..3]])
          (braced "c" (vcat $ map (keyedInt "d") [1..3])
              $+$ braced "c" (vcat $ map (keyedInt "e") [1..3]))
          $ tagged 3 (Lengthy $ mconcat [tagged 3 $ Fixed32 x | x <- [1..3]])
          <> tagged 3 (Lengthy $ mconcat [tagged 4 $ Fixed64 x | x <- [1..3]])
    -- Test that if the same nested tag appears twice, we append the lists
    -- in the correct order.  (We fake this situation by appending the encoding
    -- of two different messages of the same type.)
    , deserializeFrom "nested/duplicateTag"
        (Just (defFoo & a .~ [1,2,3,4] :: Foo))
        $ buildMessage (defFoo & a .~ [1,2] :: Foo)
            <> buildMessage (defFoo & a .~ [3,4] :: Foo)
    , testGroup "vector"
        [ vectorTest @Bar "fixed64" arbitrary e vec'e
        , vectorTest @Foo "int32" arbitrary a vec'a
        , vectorTest @Foo "string" (T.pack <$> arbitrary) b vec'b
        , vectorTest @Foo "message" arbitraryMessage c vec'c
        ]
    , testGroup "roundtrip"
        [ runTypedTest (roundTripTest "foo" :: TypedTest Foo)
        , runTypedTest (roundTripTest "bar" :: TypedTest Bar)
        ]
   ]
