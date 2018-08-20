-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# LANGUAGE GADTs #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE PatternGuards #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE RankNTypes #-}
-- | Module defining the individual base wire types (e.g. VarInt, Fixed64) and
-- how to encode/decode them.
module Data.ProtoLens.Encoding.Wire(
    WireType(..),
    SomeWireType(..),
    WireValue(..),
    Tag(..),
    TaggedValue(..),
    getTaggedValue,
    putTaggedValue,
    getWireValue,
    putWireValue,
    Equal(..),
    equalWireTypes,
    decodeFieldSet,
    ) where

import Control.DeepSeq (NFData(..))
import Data.Attoparsec.ByteString as Parse
import Data.Bits
import qualified Data.ByteString as B
import Data.ByteString.Lazy.Builder as Builder
import Data.Monoid ((<>))
import Data.Word

import Data.ProtoLens.Encoding.Bytes

data WireType a where
    -- Note: all of these types are fully strict (vs, say,
    -- Data.ByteString.Lazy.ByteString).  If that changes, we'll
    -- need to update the NFData instance.
    VarInt :: WireType Word64
    Fixed64 :: WireType Word64
    Fixed32 :: WireType Word32
    Lengthy :: WireType B.ByteString
    StartGroup :: WireType ()
    EndGroup :: WireType ()

instance Show (WireType a) where
    show = show . wireTypeToInt


-- A value read from the wire
data WireValue = forall a . WireValue !(WireType a) !a

instance Show WireValue where
    show (WireValue VarInt x) = show x
    show (WireValue Fixed64 x) = show x
    show (WireValue Fixed32 x) = show x
    show (WireValue Lengthy x) = show x
    show (WireValue StartGroup x) = show x
    show (WireValue EndGroup x) = show x


-- The wire contents of a single key-value pair in a Message.
data TaggedValue = TaggedValue !Tag !WireValue
    deriving (Show, Eq, Ord)

-- TaggedValue, WireValue and Tag are strict, so their NFData instances are
-- trivial:
instance NFData TaggedValue where
    rnf = (`seq` ())

instance NFData WireValue where
    rnf = (`seq` ())

-- | A tag that identifies a particular field of the message when converting
-- to/from the wire format.
newtype Tag = Tag { unTag :: Int}
    deriving (Show, Eq, Ord, Num, NFData)

data Equal a b where
    -- TODO: move Eq/Ord instance somewhere else?
    Equal :: (Eq a, Ord a) => Equal a a

-- Assert that two wire types are the same, or fail with a message about this
-- field.
{-# INLINE equalWireTypes #-}
equalWireTypes :: Monad m => WireType a -> WireType b
               -> m (Equal a b)
equalWireTypes VarInt VarInt = return Equal
equalWireTypes Fixed64 Fixed64 = return Equal
equalWireTypes Fixed32 Fixed32 = return Equal
equalWireTypes Lengthy Lengthy = return Equal
equalWireTypes StartGroup StartGroup = return Equal
equalWireTypes EndGroup EndGroup = return Equal
equalWireTypes expected actual
    = fail $ "Expected wire type " ++ show expected
        ++ " but found " ++ show actual

instance Eq WireValue where
    WireValue t v == WireValue t' v'
        | Just Equal <- equalWireTypes t t'
            = v == v'
        | otherwise = False

instance Ord WireValue where
    WireValue t v `compare` WireValue t' v'
        | Just Equal <- equalWireTypes t t'
            = v `compare` v'
        | otherwise = wireTypeToInt t `compare` wireTypeToInt t'

getWireValue :: WireType a -> Parser a
getWireValue VarInt = getVarInt
getWireValue Fixed64 = anyBits
getWireValue Fixed32 = anyBits
getWireValue Lengthy = getVarInt >>= Parse.take . fromIntegral
getWireValue StartGroup = return ()
getWireValue EndGroup = return ()

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

putTypeAndTag :: WireType a -> Tag -> Builder
putTypeAndTag wt (Tag tag)
    = putVarInt $ wireTypeToInt wt .|. fromIntegral tag `shiftL` 3

getTypeAndTag :: Parser (SomeWireType, Tag)
getTypeAndTag = do
  n <- getVarInt
  case intToWireType (n .&. 7) of
    Left err -> fail err
    Right wt -> return (wt, fromIntegral $ n `shiftR` 3)

getTaggedValue :: Parser TaggedValue
getTaggedValue = do
    (SomeWireType wt, tag) <- getTypeAndTag
    val <- getWireValue wt
    return $ TaggedValue tag (WireValue wt val)

putTaggedValue :: TaggedValue -> Builder
putTaggedValue (TaggedValue tag (WireValue wt val)) =
    putTypeAndTag wt tag <> putWireValue wt val

decodeFieldSet :: B.ByteString -> Either String [TaggedValue]
decodeFieldSet = parseOnly (manyTill getTaggedValue endOfInput)
