-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd
{-# LANGUAGE CPP #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Data.ProtoLens.TestUtil(
    testMain,
    TestTree,
    serializeTo,
    deserializeFrom,
    deserializeFromExpectingError,
    renderIndenting,
    readFrom,
    readFromWithRegistry,
    Data(..),
    tagged,
    varInt,
    toStrictByteString,
    keyed,
    keyedInt,
    keyedStr,
    keyedShow,
    braced,
    doubleQuotes,
    testProperty,
    textRoundTripProperty,
    wireRoundTripProperty,
    MessageProperty,
    roundTripTest,
    TypedTest(runTypedTest),
    Doc,
    PrettyPrint.vcat,
    (PrettyPrint.$+$),
    satisfies,
    -- TODO: remove this after we drop support for base-4.10 (ghc-8.2),
    -- which didn't export (<>) from Prelude.
    (<>)
    ) where

import Data.ProtoLens
import Data.ProtoLens.Arbitrary
import Data.Proxy

import qualified Data.ByteString as B
import qualified Data.ByteString.Builder as Builder
import qualified Data.ByteString.Lazy as L
import Data.List (isInfixOf)
import qualified Data.Text.Lazy as LT
import GHC.Stack (HasCallStack)
import Test.QuickCheck (noShrinking)
#if MIN_VERSION_QuickCheck(2,10,0)
import Test.QuickCheck (withMaxSuccess)
#endif
import Test.Tasty (defaultMain, testGroup, TestTree)
import Test.Tasty.HUnit (testCase, (@=?), assertBool, assertFailure)
import Test.Tasty.QuickCheck (testProperty)
import Data.Either (isLeft)
import Data.Bits (shiftL, shiftR, (.|.), (.&.))
import qualified Data.Text.Lazy as TL
#if !MIN_VERSION_base(4,11,0)
import Data.Semigroup ((<>))
#endif
import Data.Word (Word32, Word64)
import qualified Text.PrettyPrint as PrettyPrint
import Text.PrettyPrint
    ( Doc
    , char
    , colon
    , nest
    , doubleQuotes
    , renderStyle
    , style
    , lineLength
    , (<+>)
    , ($+$)
    )

testMain :: [TestTree] -> IO ()
testMain = defaultMain . testGroup "tests"

serializeTo :: (Show a, Eq a, Message a)
            => String -> a -> Doc -> Builder.Builder -> TestTree
serializeTo name x text bs = testCase name $ do
    let bs' = toStrictByteString bs
    bs' @=? encodeMessage x
    x @=? decodeMessageOrDie bs'
    let text' = show text
    -- For consistency in the tests, make them put each field and submessage on
    -- a separate line.
    text' @=? renderIndenting (pprintMessage x)
    x @=? readMessageOrDie (LT.pack text')

renderIndenting :: Doc -> String
renderIndenting = renderStyle style { lineLength = 1 }

deserializeFrom :: (Show a, Eq a, Message a)
                => String -> Maybe a -> Builder.Builder -> TestTree
deserializeFrom name x bs = testCase name $ case x of
    -- Check whether or not it failed without worrying about the exact error
    -- message.
    Nothing -> satisfies isLeft y
    Just x' -> Right x' @=? y
  where
    y = decodeMessage $ toStrictByteString bs

deserializeFromExpectingError
    :: forall a . (Show a, Eq a, Message a)
    => String -> Proxy a -> String -> Builder.Builder -> TestTree
deserializeFromExpectingError name _ msg bs = testCase name $
    case decodeMessage $ toStrictByteString bs :: Either String a of
        Right x -> assertFailure $ "expected failure; got: " ++ show x
        Left e
            | msg `isInfixOf` e -> return ()
            | otherwise -> assertFailure $
                            "Incorrect error message; expected "
                            ++ show msg
                            ++ ", got " ++ show e

type MessageProperty a = ArbitraryMessage a -> Bool

wireRoundTripProperty :: (Message a, Eq a) => MessageProperty a
wireRoundTripProperty (ArbitraryMessage msg) =
    let msg' = (decodeMessage . encodeMessage) msg
    in msg' == Right msg

textRoundTripProperty :: (Message a, Eq a) => MessageProperty a
textRoundTripProperty (ArbitraryMessage msg) =
    let msg' = (readMessage . TL.pack . showMessage) msg
    in msg' == Right msg

-- | A basic santity check that shrinking a message doesn't return the
-- original message as one of the "shrunken" values.  If it did, QuickCheck
-- could go into an infinite loop.
shrinkSanityProperty :: (Message a, Eq a) => MessageProperty a
shrinkSanityProperty (ArbitraryMessage msg) = msg `notElem` shrinkMessage msg

newtype TypedTest a = TypedTest { runTypedTest :: TestTree }

roundTripTest :: forall a . (Show a, Message a, Eq a) => String -> TypedTest a
roundTripTest name = TypedTest $ testGroup name
    [ testProperty "shrink sanity" $
            -- Disable automatic shrinking so the test behaves
            -- sensibly if there's a bug in shrinkMessage.
#if MIN_VERSION_QuickCheck(2,10,0)
            noShrinking $
            -- Limit the number of tests since shrinking is slow for large messages.
            withMaxSuccess 20
                (shrinkSanityProperty :: MessageProperty a)
#else
            noShrinking (shrinkSanityProperty :: MessageProperty a)
#endif
    , testProperty "wire" (wireRoundTripProperty :: MessageProperty a)
    , testProperty "text" (textRoundTripProperty :: MessageProperty a)
    ]

readFromWithRegistry :: (Show a, Eq a, Message a)
                     => Registry -> String -> Maybe a -> LT.Text -> TestTree
readFromWithRegistry reg name x text = testCase name $ case x of
    -- Check whether or not it failed without worrying about the exact error
    -- message.
    Nothing -> satisfies isLeft y
    Just x' -> Right x' @=? y
  where y = readMessageWithRegistry reg text

readFrom :: (Show a, Eq a, Message a)
         => String -> Maybe a -> LT.Text -> TestTree
readFrom = readFromWithRegistry mempty

varInt :: Word64 -> Builder.Builder
varInt n
    | n < 128 = Builder.word8 (fromIntegral n)
    | otherwise = Builder.word8 (fromIntegral $ n .&. 127 .|. 128)
                      <> varInt (n `shiftR` 7)

data Data
  = VarInt Word64
  | Fixed64 Word64
  | Fixed32 Word32
  | Lengthy Builder.Builder
  | GroupStart
  | GroupEnd

-- | Build the binary representation of a proto field.
-- Note that this code should be separate from anything in Data.ProtoLens.*,
-- so it can unit test the encoding code.
tagged :: Word64 -> Data -> Builder.Builder
tagged t (VarInt w) = varInt (t `shiftL` 3 .|. 0) <> varInt w
tagged t (Fixed64 w) = varInt (t `shiftL` 3 .|. 1) <> Builder.word64LE w
tagged t (Fixed32 w) = varInt (t `shiftL` 3 .|. 5) <> Builder.word32LE w
tagged t (Lengthy bs) = let
    bs' = Builder.toLazyByteString bs
    in varInt (t `shiftL` 3 .|. 2) <> varInt (fromIntegral $ L.length bs')
        <> Builder.lazyByteString bs'
tagged t GroupStart = varInt (t `shiftL` 3 .|. 3)
tagged t GroupEnd = varInt (t `shiftL` 3 .|. 4)

-- | Utility to generate the text format for a single, non-message field.
keyed :: Doc -> Doc -> Doc
keyed k v = (k <> colon) <+> v

-- | A version of keyed with a showable type.
keyedShow :: Show a => Doc -> a -> Doc
keyedShow k = keyed k . PrettyPrint.text . show

-- | A version of keyed that's specialized to integers.
keyedInt :: Doc -> Integer -> Doc
keyedInt k = keyed k . PrettyPrint.text . show

-- | A version of keyed that's specialized to (quoted) strings.
keyedStr :: Doc -> Doc -> Doc
keyedStr k = keyed k . doubleQuotes

-- | Utility to generate the text format for a submessage.
braced :: String -> Doc -> Doc
braced k v = (PrettyPrint.text k <+> char '{')
              $+$ nest 2 v
              $+$ PrettyPrint.char '}'

toStrictByteString :: Builder.Builder -> B.ByteString
toStrictByteString = L.toStrict . Builder.toLazyByteString

-- | Checks the predicate in HUnit tests, and displays the original
-- value in case of failure.
satisfies :: (HasCallStack, Show a) => (a -> Bool) -> a -> IO ()
satisfies f x = assertBool ("Predicate fails: " ++ show x) (f x)
