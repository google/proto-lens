-- | Module defining the individual base wire types (e.g. VarInt, Fixed64).
--
-- They are used to represent the @unknownFields@ within the proto message.
--
-- Upstream docs:
-- <https://developers.google.com/protocol-buffers/docs/encoding#structure>
{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE CPP #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module Data.ProtoLens.Encoding.Wire
    ( Tag(..)
    , TaggedValue(..)
    , WireValue(..)
    , FieldSet
    , splitTypeAndTag
    , joinTypeAndTag
    , parseFieldSet
    , buildFieldSet
    , parseTaggedValueFromWire
    ) where

import Control.DeepSeq (NFData(..))
import Data.Bits ((.&.), (.|.), shiftL, shiftR)
import qualified Data.ByteString as B
#if !MIN_VERSION_base(4,11,0)
import Data.Semigroup ((<>))
#endif
import Data.Word (Word8, Word32, Word64)

import Data.ProtoLens.Encoding.Bytes

-- | A tag that identifies a particular field of the message when converting
-- to/from the wire format.
newtype Tag = Tag { unTag :: Int }
    deriving (Show, Eq, Ord, Num, NFData)

-- | The encoding of some unknown field on the wire.
data WireValue
    = VarInt !Word64
    | Fixed64 !Word64
    | Lengthy !B.ByteString
    | StartGroup
    | EndGroup
    | Fixed32 !Word32
    deriving (Eq, Ord)

-- | A pair of an encoded field and a value.
data TaggedValue = TaggedValue !Tag !WireValue
    deriving (Eq, Ord)

type FieldSet = [TaggedValue]

-- TaggedValue, WireValue and Tag are strict, so their NFData instances are
-- trivial:
instance NFData TaggedValue where
    rnf = (`seq` ())

instance NFData WireValue where
    rnf = (`seq` ())

buildTaggedValue :: TaggedValue -> Builder
buildTaggedValue (TaggedValue tag wv) =
    putVarInt (joinTypeAndTag tag (wireValueToInt wv))
    <> buildWireValue wv

buildWireValue :: WireValue -> Builder
buildWireValue (VarInt w) = putVarInt w
buildWireValue (Fixed64 w) = putFixed64 w
buildWireValue (Fixed32 w) = putFixed32 w
buildWireValue (Lengthy b) =
    putVarInt (fromIntegral $ B.length b)
    <> putBytes b
buildWireValue StartGroup = mempty
buildWireValue EndGroup = mempty

wireValueToInt :: WireValue -> Word8
wireValueToInt VarInt{} = 0
wireValueToInt Fixed64{} = 1
wireValueToInt Lengthy{} = 2
wireValueToInt StartGroup{} = 3
wireValueToInt EndGroup{} = 4
wireValueToInt Fixed32{} = 5

parseTaggedValue :: Parser TaggedValue
parseTaggedValue = getVarInt >>= parseTaggedValueFromWire

parseTaggedValueFromWire :: Word64 -> Parser TaggedValue
parseTaggedValueFromWire t =
    let (tag, w) = splitTypeAndTag t
    in TaggedValue tag <$> case w of
        0 -> VarInt <$> getVarInt
        1 -> Fixed64 <$> getFixed64
        2 -> Lengthy <$> do
                len <- getVarInt
                getBytes $ fromIntegral len
        3 -> return StartGroup
        4 -> return EndGroup
        5 -> Fixed32 <$> getFixed32
        _ -> fail $ "Unknown wire type " ++ show w

splitTypeAndTag :: Word64 -> (Tag, Word8)
splitTypeAndTag w = (fromIntegral $ w `shiftR` 3, fromIntegral (w .&. 7))

joinTypeAndTag :: Tag -> Word8 -> Word64
joinTypeAndTag (Tag t) w = fromIntegral t `shiftL` 3 .|. fromIntegral w

parseFieldSet :: Parser FieldSet
parseFieldSet = loop []
  where
    loop ws = do
        end <- atEnd
        if end
            then return $! reverse ws
            else do
                !w <- parseTaggedValue
                loop (w:ws)

buildFieldSet :: FieldSet -> Builder
buildFieldSet = mconcat . map buildTaggedValue 
