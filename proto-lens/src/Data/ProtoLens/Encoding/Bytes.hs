-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE CPP #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}

-- | Utility functions for parsing and encoding individual types.
module Data.ProtoLens.Encoding.Bytes(
    -- * Running encodings
    Parser,
    Builder,
    runParser,
    isolate,
    runBuilder,
    -- * Bytestrings
    getBytes,
    putBytes,
    -- * Integral types
    getVarInt,
    putVarInt,
    getFixed32,
    getFixed64,
    putFixed32,
    putFixed64,
    -- * Floating-point types
    wordToFloat,
    wordToDouble,
    floatToWord,
    doubleToWord,
    -- * Signed types
    signedInt32ToWord,
    wordToSignedInt32,
    signedInt64ToWord,
    wordToSignedInt64,
    -- * Other utilities
    atEnd,
    runEither,
    (<?>),
    ) where

import Data.Bits
import Data.ByteString (ByteString)
import Data.ByteString.Lazy.Builder as Builder
import qualified Data.ByteString.Lazy as L
import Data.Int (Int32, Int64)
import Data.Monoid ((<>))
import Data.Word (Word32, Word64)
#if MIN_VERSION_base(4,11,0)
import qualified GHC.Float as Float
#else
import Foreign.Ptr (castPtr)
import Foreign.Marshal.Alloc (alloca)
import Foreign.Storable (Storable, peek, poke)
import System.IO.Unsafe (unsafePerformIO)
#endif

import Data.ProtoLens.Encoding.Parser

-- | Constructs a strict 'ByteString' from the given 'Builder'.
runBuilder :: Builder -> ByteString
runBuilder = L.toStrict . Builder.toLazyByteString

-- | Emit a given @ByteString@.
putBytes :: ByteString -> Builder
putBytes = Builder.byteString

-- VarInts are inherently unsigned; there are different ways of encoding
-- negative numbers for int32/64 and sint32/64.
getVarInt :: Parser Word64
getVarInt = loop 1 0
  where
    loop !s !n = do
        b <- getWord8
        let n' = n + s * fromIntegral (b .&. 127)
        if (b .&. 128) == 0
            then return $! n'
            else loop (128*s) n'

putVarInt :: Word64 -> Builder
putVarInt n
    | n < 128 = Builder.word8 (fromIntegral n)
    | otherwise = Builder.word8 (fromIntegral $ n .&. 127 .|. 128)
                      <> putVarInt (n `shiftR` 7)

getFixed32 :: Parser Word32
getFixed32 = getWord32le

getFixed64 :: Parser Word64
getFixed64 = do
    x <- getFixed32
    y <- getFixed32
    return $ fromIntegral y `shiftL` 32 + fromIntegral x

-- Note: putFixed32 and putFixed32 have added BangPatterns over the
-- standard Builders.
-- This works better when they're composed with other functions.
-- For example, consider `putFixed32 . floatToWord`.
-- Since `putFixed32` may return a continuation, it doesn't automatically
-- force the result of `floatToWord`, so the resulting Word32 must be kept
-- lazily.  The extra strictness means that the Word32 will be evaluated
-- outside of the continuation, and GHC can pass it around unboxed.

putFixed32 :: Word32 -> Builder
putFixed32 !x = word32LE x

putFixed64 :: Word64 -> Builder
putFixed64 !x = word64LE x

#if MIN_VERSION_base(4,11,0)
wordToDouble :: Word64 -> Double
wordToDouble = Float.castWord64ToDouble

wordToFloat :: Word32 -> Float
wordToFloat = Float.castWord32ToFloat

doubleToWord :: Double -> Word64
doubleToWord = Float.castDoubleToWord64

floatToWord :: Float -> Word32
floatToWord = Float.castFloatToWord32

#else
-- WARNING: SUPER UNSAFE!
-- Helper function purely for converting between Word32/Word64 and
-- Float/Double.  Note that ideally we could just use unsafeCoerce, but this
-- breaks with -O2 since it violates some assumptions in Core.  As a result,
-- poking the FFI turns out to be a more reliable way to do these casts.
-- For more information see:
-- https://ghc.haskell.org/trac/ghc/ticket/2209
-- https://ghc.haskell.org/trac/ghc/ticket/4092
{-# INLINE cast #-}
cast :: (Storable a, Storable b) => a -> b
cast x = unsafePerformIO $ alloca $ \p -> do
            poke p x
            peek $ castPtr p

wordToDouble :: Word64 -> Double
wordToDouble = cast

wordToFloat :: Word32 -> Float
wordToFloat = cast

doubleToWord :: Double -> Word64
doubleToWord = cast

floatToWord :: Float -> Word32
floatToWord = cast
#endif

signedInt32ToWord :: Int32 -> Word32
signedInt32ToWord n = fromIntegral $ shiftL n 1 `xor` shiftR n 31

wordToSignedInt32 :: Word32 -> Int32
wordToSignedInt32 n
    = fromIntegral (shiftR n 1) `xor` negate (fromIntegral $ n .&. 1)

signedInt64ToWord :: Int64 -> Word64
signedInt64ToWord n = fromIntegral $ shiftL n 1 `xor` shiftR n 63

wordToSignedInt64 :: Word64 -> Int64
wordToSignedInt64 n
    = fromIntegral (shiftR n 1) `xor` negate (fromIntegral $ n .&. 1)

runEither :: Either String a -> Parser a
runEither = either fail return
