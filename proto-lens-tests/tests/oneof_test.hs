{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import Proto.Oneof
import Proto.Oneof_Fields
import Data.ProtoLens
import Lens.Family2 ((&), (.~), (^?), (%~), view)
import Lens.Labels.Prism (_Just, (#))
import Test.Framework.Providers.HUnit (testCase)
import Test.HUnit

import Data.ProtoLens.TestUtil

defFoo :: Foo
defFoo = def

main :: IO ()
main = testMain
    [ serializeTo "default" defFoo "" mempty
    , serializeTo "to first oneof field"
        (defFoo & bippy .~ "querty" & baz .~ 42)
        "baz: 42"
        (tagged 1 $ VarInt 42)
    , serializeTo "to second oneof field"
        (defFoo & baz .~ 42 & bippy .~ "querty")
        "bippy: \"querty\""
        (tagged 2 $ Lengthy "querty")

    -- Check that we can tolerate missing keys and values.
    , deserializeFrom "from first oneof field"
        (Just $ defFoo & baz .~ 42)
        $ tagged 1 $ VarInt 42
    , deserializeFrom "from second oneof field"
        (Just $ defFoo & bippy .~ "querty")
        $ tagged 2 $ Lengthy "querty"

    , testCase "oneof accessor" $ do
        Nothing @=? view maybe'bar defFoo
        Just (Foo'Baz 42) @=? view maybe'bar (defFoo & baz .~ 42)
        Just (Foo'Bippy "querty") @=? view maybe'bar (defFoo & bippy .~ "querty")
        42 @=? view baz (defFoo & maybe'bar .~ Just (Foo'Baz 42))
        Just 42 @=? view maybe'baz (defFoo & maybe'bar .~ Just (Foo'Baz 42))
        Nothing @=? view maybe'bippy (defFoo & maybe'bar .~ Just (Foo'Baz 42))

    , testCase "oneof prism accessor" $ do
        Just 42 @=? (defFoo & baz .~ 42) ^? maybe'bar . _Just . _Foo'Baz
        Nothing @=? (defFoo & baz .~ 42) ^? maybe'bar . _Just . _Foo'Bippy
        Just "querty" @=? (defFoo & bippy .~ "querty") ^? maybe'bar . _Just . _Foo'Bippy

    , testCase "oneof prism setter" $ do
        -- modify an existing value
        let testFoo = (defFoo & baz .~ 42) & maybe'bar . _Just . _Foo'Baz %~ (+1)
        Just 43 @=? testFoo ^? maybe'bar . _Just . _Foo'Baz
        -- test creation methods are equal
        (defFoo & bippy .~ "querty") @=?
            (defFoo & maybe'bar .~ (_Just # _Foo'Bippy # "querty"))

    , testCase "dupe field names" $
        Just (DupeFieldNames'Baz 42) @=?
            view maybe'bar (def & baz .~ 42 :: DupeFieldNames)

    , testCase "set another oneof" $
        Just (Foo'Baz2 42) @=? view maybe'bar2 (def & baz2 .~ 42 :: Foo)
    , serializeTo "to another oneof"
        (defFoo & baz2 .~ 42)
        "baz2: 42"
        (tagged 3 $ VarInt 42)

    , testCase "disambiguated names" $ do
        -- Check that we put apostrophes on oneof types and constructors when
        -- they clash with message or enum types or constructors.
        -- (See oneof.proto for details.)
        -- A oneof type and constructor that overlap with a message
        trivial (Disambiguated'MessageTypeB' 42 :: Disambiguated'MessageTypeA')
        -- A oneof type and constructor that overlap with an enum
        trivial (Disambiguated'EnumCon' 42 :: Disambiguated'EnumType')

        -- And we don't change the message or enum types and constructors.
        trivial (Disambiguated'MessageTypeA
                    {_Disambiguated'MessageTypeA'_unknownFields = []}
                    :: Disambiguated'MessageTypeA)
        trivial (Disambiguated'MessageTypeB
                    {_Disambiguated'MessageTypeB'_unknownFields = []}
                    :: Disambiguated'MessageTypeB)
        trivial (Disambiguated'EnumCon :: Disambiguated'EnumType)

    , testCase "not disambiguated names" $ do
        trivial (NotDisambiguated'EnumCon :: NotDisambiguated'EnumType)
        trivial (NotDisambiguated'EnumType 42 :: NotDisambiguated'EnumCon)

    ]

trivial :: (Show a, Eq a) => a -> IO ()
trivial x = x @=? x
