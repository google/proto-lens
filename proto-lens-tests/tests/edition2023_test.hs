-- Copyright 2024 Google LLC. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

-- Edition 2023 is a union of proto2 and proto3 features, just with different
-- defaults and feature specification mechanism.  These tests focus on
-- these aspects; other tests can comprehensively test the features themselves.
--
-- If we trust the feature set defaults for each edition that protoc generates,
-- then tests for future editions can be limited to testing new features independent
-- from any edition, and that the new feature is indeed supported by the new edition.
-- We would not have to comprehensively test all features in every edition.

{-# LANGUAGE OverloadedStrings #-}
module Main where

import Control.Exception (ErrorCall(..), handle)
import Data.ProtoLens
import Lens.Family2 ((&), (.~), (^.))
import qualified Data.ByteString.Builder as Builder
import Test.Tasty (testGroup)
import Test.Tasty.HUnit (assertFailure, testCase, (@=?), (@?=))

import Proto.Edition2023
    ( Defaults
    , Features
    , Features'WithRequiredField
    )
import Proto.Edition2023_Fields
    ( enumType
    , enumTypeClosed
    , enumTypeOpen
    , foo
    , fieldPresence
    , fieldPresenceImplicit
    , messageEncoding
    , messageEncodingDelimited
    , messageEncodingLengthPrefixed
    , messageEncodingLengthPrefixedSeparate
    , repeatedFieldEncoding
    , repeatedFieldExpanded
    , repeatedFieldPacked
    , utf8ValidationNone
    , maybe'fieldPresence
    , maybe'fieldPresenceExplicit
    )
import Proto.Edition2023Fileoptions (FeatureOverrides)
import qualified Proto.Edition2023Fileoptions_Fields as O

import Data.ProtoLens.TestUtil

defDefaults :: Defaults
defDefaults = defMessage

defFeatures :: Features
defFeatures = defMessage

main :: IO ()
main = testMain
  [ testGroup "Default features"
    [ testGroup "field_presence (EXPLICIT)"
      [ testCase "unset" $
        Nothing @=? (defDefaults ^. maybe'fieldPresence)
      , testCase "set" $
        Just 0 @=? ((defDefaults & fieldPresence .~ 0) ^. maybe'fieldPresence)
      ]

    , deserializeFrom "enum_type (OPEN)"
        (Just $ defDefaults & enumType .~ toEnum 5)
        (tagged 2 $ VarInt 5)

    , serializeTo "repeated_field_encoding (PACKED)"
        (defDefaults & repeatedFieldEncoding .~ [1,2,3])
        (vcat [keyedInt "repeated_field_encoding" x | x <- [1,2,3]])
        (tagged 3 $ Lengthy $ mconcat $ [varInt x | x <- [1,2,3]])

    , deserializeFrom "utf8_validation (VERIFY)"
        (Nothing :: Maybe Defaults)
        (tagged 4 $ Lengthy invalidUtf8)

    , serializeTo "message_encoding (LENGTH_PREFIXED)"
        (defDefaults & messageEncoding .~ (defMessage & foo .~ 42))
        (braced "message_encoding" $ keyedInt "foo" 42)
        (tagged 5 $ Lengthy $ tagged 1 $ VarInt 42)
    ]

  , testGroup "Explicitly specified features"
    [ testGroup "field_presence"
      [ testCase "EXPLICIT" $
        (defFeatures ^. maybe'fieldPresenceExplicit) @?= Nothing

      , testCase "IMPLICIT" $
        defFeatures @=? (defFeatures & fieldPresenceImplicit .~ 0)

      , deserializeFrom "LEGACY_REQUIRED"
          (Nothing :: Maybe Features'WithRequiredField)
          (tagged 2 $ VarInt 10)
          -- Should not decode if required field with tag 1 is missing.
      ]

    , testGroup "enum_type"
      [ testCase "CLOSED" $ do
          -- Input with an invalid value for the Mood enum.
          let input = toStrictByteString $ tagged 4 $ VarInt 11
          -- The message should still be successfully decoded.
          -- However, the enum will raise an error when actually evaluated.
          let msg = decodeMessage input :: Either String Features
          -- There should be an error raised when strictly evaluating the enum.
          -- This does not match the specification for CLOSED enum types,
          -- which specifies that the value be an unset default value,
          -- but this is the current implementation for proto-lens.
          handle (\(ErrorCallWithLocation _ _) -> return ()) $
            case msg of
              -- The decoding should still have succeeded.
              Left e -> assertFailure $ "failed to decode: " ++ show e
              -- If the strict evaluation of the invalid enum value calls
              -- the 'error' function as expected, it will be caught
              -- as an ErrorCall and the test will pass.
              --
              -- If no error is thrown during the strict evaluation,
              -- then an HUnitFailure will be thrown by assertFailure,
              -- and the test will fail.
              Right m -> assertFailure $! show $ m ^. enumTypeClosed

      , deserializeFrom "OPEN"
          (Just $ defFeatures & enumTypeOpen .~ toEnum 11)
          (tagged 5 $ VarInt 11)
      ]

    , testGroup "repeated_field_encoding"
      [ serializeTo "EXPANDED"
          (defFeatures & repeatedFieldExpanded .~ [1,2,3])
          (vcat [keyedInt "repeated_field_expanded" x | x <- [1,2,3]])
          (mconcat $ [tagged 6 $ VarInt x | x <- [1,2,3]])

      , serializeTo "PACKED"
          (defFeatures & repeatedFieldPacked .~ [1,2,3])
          (vcat [keyedInt "repeated_field_packed" x | x <- [1,2,3]])
          (tagged 7 $ Lengthy $ mconcat [varInt x | x <- [1,2,3]])
      ]

    , testGroup "utf8_validation"
      [ const (testCase "NONE (skipped)" (pure ())) $
        -- We actually cannot disable validation of UTF-8 in strings.
        -- This could be done by passing down the verification mode
        -- to the code generator and using decodeUtf8Lenient instead
        -- when verification is disabled.  This may not be worth it;
        -- the content with a string containing invalid UTF-8 is undefined,
        -- and changing it to a bytes field would be a straightforward fix.
        --
        -- If this was done, we would stop ignoring this test case.
        deserializeFrom "NONE"
          (Just $ defFeatures & utf8ValidationNone .~ "depends on decoding")
          (tagged 8 $ Lengthy invalidUtf8)

      , deserializeFrom "VERIFY"
          (Nothing :: Maybe Features)
          (tagged 9 $ Lengthy invalidUtf8)
      ]

    , testGroup "message_encoding"
      [ serializeTo "DELIMITED"
          (defFeatures & messageEncodingDelimited . foo .~ 7)
          (braced "message_encoding_delimited" $ keyedInt "foo" 7)
          (tagged 10 GroupStart <> tagged 1 (VarInt 7) <> tagged 10 GroupEnd)

      , const (testCase "LENGTH_PREFIXED (skipped)" (pure ())) $
        -- proto-lens sets DELIMITED encoding by message type, not field.
        -- Full compatability with Protobuf Editions would require it to be
        -- by field.  However, given the usual use case for DELIMITED encoding,
        -- where it is to support legacy proto2 groups in which message types
        -- and fields are tied toggether, this may not be worth fixing.
        --
        -- If this was done, we would stop ignoring this test case.
        serializeTo "LENGTH_PREFIXED"
          (defFeatures & messageEncodingLengthPrefixed . foo .~ 21)
          (braced "message_encoding_length_prefixed" $ keyedInt "foo" 21)
          (tagged 11 $ Lengthy $ tagged 1 $ VarInt 21)

      , serializeTo "LENGTH_PREFIXED (separate message type)"
          (defFeatures & messageEncodingLengthPrefixedSeparate . foo .~ 31)
          (braced "message_encoding_length_prefixed_separate" $ keyedInt "foo" 31)
          (tagged 12 $ Lengthy $ tagged 1 $ VarInt 31)
      ]
    ]

  , testGroup "Feature overrides from file options"
    [ testCase "IMPLICIT field presence passed to field" $
        ((defMessage :: FeatureOverrides) & O.fieldPresence .~ 0) @?= defMessage

    , testCase "IMPLICIT field presence passed through nested message type" $
        ((defMessage :: FeatureOverrides) & O.sub . O.fieldPresence .~ 0) @?=
        (defMessage & O.sub .~ defMessage)
    ]
  ]

invalidUtf8 :: Builder.Builder
invalidUtf8 = Builder.word8 0xc3 <> Builder.word8 0x28
