-- Copyright 2020 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd
{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -Wno-orphans #-}
module Main (main) where

import Proto.TestProto3Optional
import Proto.TestProto3Optional_Fields
import Data.Int
import Data.ProtoLens
import Data.ProtoLens.Encoding.Parser (Parser, runParser)
import Data.ProtoLens.Field (HasField, fieldOf)
import Data.ProtoLens.Labels ()
import Data.Proxy
import Lens.Family2 ((&), (.~), (^.), (^..))
import Lens.Family2.Unchecked (lens)
import Proto.Google.Protobuf.Descriptor
import Test.Tasty (testGroup)
import Test.Tasty.HUnit (assertFailure, testCase, (@?=))

import Data.ProtoLens.TestUtil

defFoo :: Foo
defFoo = defMessage

main :: IO ()
main = testMain
    [ testGroup "serialize"
        [ serializeTo "unset" defFoo "" mempty
        , serializeTo "tracked-default" (defFoo & tracked .~ 0)
              (keyed "tracked" "0")
              $ tagged 2 $ VarInt 0
        , serializeTo "tracked-nondefault" (defFoo & tracked .~ 17)
              (keyed "tracked" "17")
              $ tagged 2 $ VarInt 17
        , serializeTo "untracked-default" (defFoo & untracked .~ 0) "" mempty
        , serializeTo "alternative-default" (defFoo & alternative .~ 0)
              (keyed "alternative" "0")
              $ tagged 3 $ VarInt 0
        , serializeTo "tracked-unset"
              (defFoo & tracked .~ 17 & maybe'tracked .~ Nothing)
              "" mempty
        ]
    , testGroup "lens"
        [ testCase "unset" $ defFoo ^. tracked @?= 0
        , testCase "default" $ (defFoo & tracked .~ 0) ^. tracked @?= 0
        ]
    , testGroup "maybe'lens"
        [ testCase "unset" $ defFoo ^. maybe'tracked @?= Nothing
        , testCase "default"
          $ (defFoo & tracked .~ 0) ^. maybe'tracked @?= Just 0
        ]
    , testCase "oneof-names" $ do
        -- Ensure that the defined oneofs (synthetic and actual) have
        -- the expected names, since the tests for absence of oneof
        -- API depend on this assumption.
        let descBytes = packedMessageDescriptor (Proxy :: Proxy Foo)
        let parser = parseMessage :: Parser DescriptorProto
        let descEither = runParser parser descBytes
        desc <- case descEither of
          Left err -> assertFailure err
          Right desc -> return desc
        desc ^.. #oneofDecl . traverse . #name @?= ["_nonsynth", "_tracked"]
    , testGroup "compile-time"
        -- These tests tend to verify the ABSENCE of some API. They do
        -- so at compile time, by forcing a name conflict if the API
        -- in question were present. See definitions below these
        -- tests. The tests here exercise the definitions to trigger
        -- the conflict reporting. They should never fail at run-time.
        [ testCase "maybe-untracked" $ defFoo ^. #maybe'untracked @?= Nothing
        , testCase "maybe-tracked" $ defFoo ^. #maybe'tracked @?= Nothing
        , testCase "maybe-_tracked" $ defFoo ^. #maybe'_tracked @?= Nothing
        , testCase "maybe-_nonsynth" $ defFoo ^. #maybe'_nonsynth @?= Nothing
        , testCase "data-tracked" $ discard (Proxy :: Proxy Foo'_tracked)
        , testCase "data-nonsynth" $ discard (Proxy :: Proxy Foo'_nonsynth)
        , testCase "ctor-tracked" $ discard (Foo'Alternative 1)
        , testCase "ctor-nonsynth" $ discard (Foo'Tracked 1)
        ]
    ]

-- Like the discard from Control.Monad.Extra.
discard :: Monad m => a -> m ()
discard _ = return ()

-- The code below establishes conflicts with things that should NOT
-- have been generated. Most of them come with a matching definition
-- for something that we DO expect to be generated. By enabling the
-- #if for each block you can verify those actually lead to the
-- expected conflicts.
--
-- TODO(gagern): Come up with a way to run these comparisons
-- automatically, i.e. invoke Haskell compiler as part of test.

-- We should not generate a maybe lens for a non-optional field.
instance HasField Foo "maybe'untracked" (Maybe ()) where
    fieldOf _ = lens (const Nothing) const
#if 0
-- We should generate a maybe lens for an optional field.
instance HasField Foo "maybe'tracked" (Maybe ()) where
    fieldOf _ = lens (const Nothing) const
#endif

-- We should not generate a maybe lens for a synthetic oneof.
instance HasField Foo "maybe'_tracked" (Maybe ()) where
    fieldOf _ = lens (const Nothing) const
#if 0
-- We should not generate a maybe lens for an actual oneof.
instance HasField Foo "maybe'_nonsynth" (Maybe ()) where
    fieldOf _ = lens (const Nothing) const
#endif

-- Ignore lint suggestions which test generated type names.
{- HLINT ignore Foo'_tracked -}
{- HLINT ignore Foo'_nonsynth -}

-- We should not generate a data type or constructor for the synthetic oneof.
data Foo'_tracked = Foo'Tracked Int32
#if 0
-- We should generate a data type and constructor for the actual oneof.
data Foo'_nonsynth = Foo'Alternative Int32
#endif
