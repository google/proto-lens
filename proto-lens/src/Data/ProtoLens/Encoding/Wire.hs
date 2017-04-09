-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# LANGUAGE GADTs #-}
{-# LANGUAGE RankNTypes #-}
-- | Module defining the individual base wire types (e.g. VarInt, Fixed64) and
-- how to encode/decode them.
module Data.ProtoLens.Encoding.Wire(
    WireType(..),
    SomeWireType(..),
    WireValue(..),
    TaggedValue(..),
    getTaggedValue,
    putTaggedValue,
    getWireValue,
    putWireValue,
    Equal(..),
    equalWireTypes,
    ) where

import Data.Attoparsec.ByteString as Parse
import Data.Bits
import qualified Data.ByteString as B
import Data.ByteString.Lazy.Builder as Builder
import Data.Monoid ((<>))
import Data.Word

import Data.ProtoLens.Encoding.Bytes

data WireType a where
    VarInt :: WireType Word64
    Fixed64 :: WireType Word64
    Fixed32 :: WireType Word32
    Lengthy :: WireType B.ByteString
    StartGroup :: WireType ()
    EndGroup :: WireType ()

-- A value read from the wire
data WireValue = forall a . WireValue !(WireType a) !a
-- The wire contents of a single key-value pair in a Message.
data TaggedValue = TaggedValue !Int !WireValue

instance Show (WireType a) where
    show = show . wireTypeToInt

data Equal a b where
    Equal :: Equal a a

-- Assert that two wire types are the same, or fail with a message about this
-- field.
{-# INLINE equalWireTypes #-}
equalWireTypes :: Monad m => String -> WireType a -> WireType b
               -> m (Equal a b)
equalWireTypes _ VarInt VarInt = return Equal
equalWireTypes _ Fixed64 Fixed64 = return Equal
equalWireTypes _ Fixed32 Fixed32 = return Equal
equalWireTypes _ Lengthy Lengthy = return Equal
equalWireTypes _ StartGroup StartGroup = return Equal
equalWireTypes _ EndGroup EndGroup = return Equal
equalWireTypes name expected actual
    = fail $ "Field " ++ name ++ " expects wire type " ++ show expected
        ++ " but found " ++ show actual

getWireValue :: WireType a -> Int -> Parser a
getWireValue VarInt _ = getVarInt
getWireValue Fixed64 _ = anyBits
getWireValue Fixed32 _ = anyBits
getWireValue Lengthy _ = getVarInt >>= Parse.take . fromIntegral
getWireValue StartGroup _ = return ()
getWireValue EndGroup _ = return ()

putWireValue :: WireType a -> a -> Builder
putWireValue VarInt n = putVarInt n
putWireValue Fixed64 n = word64LE n
putWireValue Fixed32 n = word32LE n
putWireValue Lengthy b = putVarInt (fromIntegral $ B.length b) <> byteString b
putWireValue StartGroup _ = mempty
putWireValue EndGroup _ = mempty

data SomeWireType where
    SomeWireType :: WireType a -> SomeWireType

wireTypeToInt :: WireType a -> Word64
wireTypeToInt VarInt = 0
wireTypeToInt Fixed64 = 1
wireTypeToInt Lengthy = 2
wireTypeToInt StartGroup = 3
wireTypeToInt EndGroup = 4
wireTypeToInt Fixed32 = 5

intToWireType :: Word64 -> Either String SomeWireType
intToWireType 0 = Right $ SomeWireType VarInt
intToWireType 1 = Right $ SomeWireType Fixed64
intToWireType 2 = Right $ SomeWireType Lengthy
intToWireType 3 = Right $ SomeWireType StartGroup
intToWireType 4 = Right $ SomeWireType EndGroup
intToWireType 5 = Right $ SomeWireType Fixed32
intToWireType n = Left $ "Unrecognized wire type " ++ show n

putTypeAndTag :: WireType a -> Int -> Builder
putTypeAndTag wt tag
    = putVarInt $ wireTypeToInt wt .|. fromIntegral tag `shiftL` 3

getTypeAndTag :: Parser (SomeWireType, Int)
getTypeAndTag = do
  n <- getVarInt
  case intToWireType (n .&. 7) of
    Left err -> fail err
    Right wt -> return (wt, fromIntegral $ n `shiftR` 3)

getTaggedValue :: Parser TaggedValue
getTaggedValue = do
    (SomeWireType wt, tag) <- getTypeAndTag
    val <- getWireValue wt tag
    return $ TaggedValue tag (WireValue wt val)

putTaggedValue :: TaggedValue -> Builder
putTaggedValue (TaggedValue tag (WireValue wt val)) =
    putTypeAndTag wt tag <> putWireValue wt val
