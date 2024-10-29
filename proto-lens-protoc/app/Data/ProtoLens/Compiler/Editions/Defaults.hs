-- Copyright 2024 Google LLC. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-|
Module: Data.ProtoLens.Compiler.Editions.Defaults
Description: Exports defaults for native features in Protobuf Editions.
Copyright: Copyright (c) 2024 Google LLC
License: BSD3
-}
module Data.ProtoLens.Compiler.Editions.Defaults (nativeDefaults) where

import Data.ByteString (ByteString)
import Data.ProtoLens (decodeMessage)
import Proto.Google.Protobuf.Descriptor (FeatureSetDefaults)

{-| 'FeatureSetDefaults' message containing feature defaults.

This contains the defaults from editions @LEGACY@ to @EDITION_2023@
for the native features defined by @google.protobuf.FeatureSet@.
-}
nativeDefaults :: FeatureSetDefaults
nativeDefaults
  | Right m <- msg = m
  | Left e <- msg = error $ "unable to decode built-in defaults: " ++ e
  where msg = decodeMessage serializedNativeDefaults

{-| Serialized 'FeatureSetDefaults' message containing feature defaults.

This contains the defaults from editions @PROTO2@ to @EDITION_2024@
for the native features defined by @google.protobuf.FeatureSet@.
The message was generated with @protoc@ and translated into a Haskell string:

> $ protoc --edition_defaults_out=defaults.binpb --edition_defaults_minimum=PROTO2 --edition_defaults_maximum=2024 google/protobuf/descriptor.proto
> $ ghci
> ghci> import Data.ByteString as B
> ghci> B.readFile "defaults.binpb" >>= print . show

-}
serializedNativeDefaults :: ByteString
serializedNativeDefaults = read "\"\\n\\DC3\\CAN\\132\\a\\\"\\NUL*\\f\\b\\SOH\\DLE\\STX\\CAN\\STX \\ETX(\\SOH0\\STX\\n\\DC3\\CAN\\231\\a\\\"\\NUL*\\f\\b\\STX\\DLE\\SOH\\CAN\\SOH \\STX(\\SOH0\\SOH\\n\\DC3\\CAN\\232\\a\\\"\\f\\b\\SOH\\DLE\\SOH\\CAN\\SOH \\STX(\\SOH0\\SOH*\\NUL \\230\\a(\\233\\a\""
