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
{-# LANGUAGE LambdaCase #-}

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
    getVarIntH,
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
    foldMapBuilder,
    ) where

import Control.Monad.IO.Class (liftIO)
import Control.Monad.Trans.Except (throwE, ExceptT)
import Data.Bits
import Data.ByteString (ByteString)
import Data.ByteString.Lazy.Builder as Builder
import qualified Data.ByteString.Builder.Internal as Internal
import qualified Data.ByteString.Lazy as L
import Data.Int (Int32, Int64)
#if !MIN_VERSION_base(4,11,0)
import Data.Semigroup ((<>))
#endif
import qualified Data.Vector.Generic as V
import Data.Word (Word8, Word32, Word64)
import Foreign.Marshal (malloc, free)
import Foreign.Storable (peek)
import System.IO (Handle, hGetBuf)
#if MIN_VERSION_base(4,11,0)
import qualified GHC.Float as Float
#else
import Foreign.Ptr (castPtr)
import Foreign.Marshal.Alloc (alloca)
import Foreign.Storable (Storable, poke)
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
getVarInt = loopStart 0 1
  where
    loopStart !n !s = getWord8 >>= getVarIntLoopFinish loopStart n s

-- Same as getVarInt but reads from a Handle
getVarIntH :: Handle -> ExceptT String IO Word64
getVarIntH h = do
    buf <- liftIO malloc
    let loopStart !n !s =
          (liftIO $ hGetBuf h buf 1) >>=
          \case
            1 -> (liftIO $ peek buf) >>=
                 getVarIntLoopFinish loopStart n s
            _ -> throwE "Unexpected end of file"
    res <- loopStart 0 1
    liftIO $ free buf
    return res

getVarIntLoopFinish
  :: (Monad m)
  => (Word64 -> Word64 -> m Word64) -- "loop start" callback
  -> Word64
  -> Word64
  -> Word8
  -> m Word64
getVarIntLoopFinish ls !n !s !b = do
    let n' = decodeVarIntStep n s b
    if testMsb b
      then ls n' (128*s)
      else return $! n'

-- n -- result of previous step; s -- 128^{step index}; b -- step byte
decodeVarIntStep :: Word64 -> Word64 -> Word8 -> Word64
decodeVarIntStep n s b = n + s * fromIntegral (b .&. 127)

testMsb :: Word8 -> Bool
testMsb b = (b .&. 128) /= 0

putVarInt :: Word64 -> Builder
putVarInt n
    | n < 128 = Builder.word8 (fromIntegral n)
    | otherwise = Builder.word8 (fromIntegral $ n .|. 128)
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

-- | Loop over the elements of a vector and concatenate the resulting
-- @Builder@s.
--
-- This function has been hand-tuned to perform better than a naive
-- implementation using, e.g., Vector.foldr or a manual loop.
foldMapBuilder :: V.Vector v a => (a -> Builder) -> v a -> Builder
foldMapBuilder f = \v0 -> Internal.builder (loop v0)
    -- Place v0 on the right-hand side so that GHC actually inlines
    -- this function.
  where
    -- Fully-saturate the inner loop (rather than currying away `cont`
    -- and `bs`) to avoid GHC creating an intermediate continuation.
    loop v cont bs
        | V.null v = cont bs
        | otherwise = let
            !x = V.unsafeHead v
            -- lts-8.24 (ghc-8.0) doesn't inline unsafeTail well.
            -- We can remove the following bang when we bump the lower bound:
            !xs = V.unsafeTail v
            in Internal.runBuilderWith
                        (f x)
                        (loop xs cont) bs
{-# INLINE foldMapBuilder #-}
