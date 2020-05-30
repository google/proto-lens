{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}
module Main where

import Data.ProtoLens (Message, defMessage)
import Data.ProtoLens.Labels ()
import Lens.Family2 (Lens', view, set)
import Test.Tasty.HUnit (testCase, (@=?))

import Data.ProtoLens.TestUtil (TestTree, testMain)
import qualified Proto.Enum as Enum
import qualified Proto.Imports as Imports
import qualified Proto.ImportsDep as ImportsDep
import qualified Proto.Nested as Nested
import qualified Proto.ImportsTransitive as ImportsTransitive
import qualified Proto.ImportsTransitive2 as ImportsTransitive2
import qualified Proto.Google.Protobuf.Compiler.Plugin as Plugin
import qualified Proto.Google.Protobuf.Descriptor as Descriptor

main :: IO ()
main = testMain
    [ testFoo
    , testUseDep
    , testUseBootstrapped
    ]

-- A simple check that a type is a sub-field of another type.
-- (In this test, we're checking that the sub-field type got imported
-- correctly from another file.)
testField
    :: forall a b . (Message a, Message b, Eq b, Show b)
    => Lens' a b -> IO ()
testField f = defMessage @=? view f (set f defMessage defMessage)

testFoo :: TestTree
testFoo = testCase "testFoo" $ do
    testField @Imports.Foo @Nested.A #a
    testField @Imports.Foo @Nested.A'B #b
    -- Check that it uses the (proto2 non-zero) default values which were
    -- part of a different module:
    Enum.BAR5 @=? view #bar (defMessage :: Imports.Foo)
    Enum.Foo'BAZ4 @=? view #baz (defMessage :: Imports.Foo)

testUseDep :: TestTree
testUseDep = testCase "testUseDep" $ do
    testField @Imports.UseDep @ImportsDep.DepPkg #foo
    testField @Imports.UseDep @ImportsTransitive.TransitiveDep #bar
    testField @Imports.UseDep @ImportsTransitive2.TransitiveDep2 #baz
    -- Due to "import public" statements, these modules reexport their
    -- dependencies transitively:
    testField @Imports.UseDep @ImportsDep.TransitiveDep #bar
    testField @Imports.UseDep @ImportsDep.TransitiveDep2 #baz
    testField @Imports.UseDep @ImportsTransitive.TransitiveDep2 #baz

testUseBootstrapped :: TestTree
testUseBootstrapped = testCase "testUseBootstrapped" $ do
    testField @Imports.UseBootstrapped @Descriptor.DescriptorProto #descriptor
    testField @Imports.UseBootstrapped @Plugin.CodeGeneratorRequest #request
