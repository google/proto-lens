{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE OverloadedStrings #-}
-- | This module generates the code for decoding and encoding
-- individual field types.
--
-- Upstream docs:
-- <https://developers.google.com/protocol-buffers/docs/encoding#structure>
module Data.ProtoLens.Compiler.Generate.Field
    ( hsFieldType
    , hsFieldVectorType
    , FieldEncoding(..)
    , fieldEncoding
    , lengthy
    , groupEnd
    , isolatedLengthy
    ) where

import Data.Text (unpack)
import Data.Word (Word8)
import Lens.Family2
import Proto.Google.Protobuf.Descriptor (FieldDescriptorProto'Type(..))

import Data.ProtoLens.Compiler.Combinators
import Data.ProtoLens.Compiler.Definitions

hsFieldType :: Env QName -> FieldInfo -> Type
hsFieldType env f = let
    fd = fieldDescriptor f
    in case fd ^. #type' of
        FieldDescriptorProto'TYPE_DOUBLE -> "Prelude.Double"
        FieldDescriptorProto'TYPE_FLOAT -> "Prelude.Float"
        FieldDescriptorProto'TYPE_INT64 -> "Data.Int.Int64"
        FieldDescriptorProto'TYPE_UINT64 -> "Data.Word.Word64"
        FieldDescriptorProto'TYPE_INT32 -> "Data.Int.Int32"
        FieldDescriptorProto'TYPE_FIXED64 -> "Data.Word.Word64"
        FieldDescriptorProto'TYPE_FIXED32 -> "Data.Word.Word32"
        FieldDescriptorProto'TYPE_BOOL -> "Prelude.Bool"
        FieldDescriptorProto'TYPE_STRING -> "Data.Text.Text"
        FieldDescriptorProto'TYPE_GROUP
            | Message m <- definedFieldType fd env -> tyCon $ messageName m
            | otherwise -> error $ "expected TYPE_GROUP for type name"
                                ++ unpack (fd ^. #typeName)
        FieldDescriptorProto'TYPE_MESSAGE
            | Message m <- definedFieldType fd env -> tyCon $ messageName m
            | otherwise -> error $ "expected TYPE_MESSAGE for type name"
                                ++ unpack (fd ^. #typeName)
        FieldDescriptorProto'TYPE_BYTES -> "Data.ByteString.ByteString"
        FieldDescriptorProto'TYPE_UINT32 -> "Data.Word.Word32"
        FieldDescriptorProto'TYPE_ENUM
            | Enum e <- definedFieldType fd env -> tyCon $ enumName e
            | otherwise -> error $ "expected TYPE_ENUM for type name"
                                ++ unpack (fd ^. #typeName)
        FieldDescriptorProto'TYPE_SFIXED32 -> "Data.Int.Int32"
        FieldDescriptorProto'TYPE_SFIXED64 -> "Data.Int.Int64"
        FieldDescriptorProto'TYPE_SINT32 -> "Data.Int.Int32"
        FieldDescriptorProto'TYPE_SINT64 -> "Data.Int.Int64"

hsFieldVectorType :: FieldInfo -> Type
hsFieldVectorType f = case fieldDescriptor f ^. #type' of
    FieldDescriptorProto'TYPE_MESSAGE -> boxed
    -- TODO: store enums in unboxed fields.
    FieldDescriptorProto'TYPE_ENUM -> boxed
    FieldDescriptorProto'TYPE_GROUP -> boxed
    FieldDescriptorProto'TYPE_STRING -> boxed
    FieldDescriptorProto'TYPE_BYTES -> boxed
    _ -> unboxed
  where
    boxed = "Data.Vector.Vector"
    unboxed = "Data.Vector.Unboxed.Vector"

-- | A representation for how to encode and decode a particular field type.
data FieldEncoding = FieldEncoding
    { buildFieldType :: Exp -- ^ :: a -> Builder
    , parseFieldType :: Exp -- ^ :: Parser a
    , wireType :: Word8
    }

-- | A variable-length integer, decoded as an unsigned Word64.
varint :: FieldEncoding
varint = FieldEncoding
            { wireType = 0
            , buildFieldType = putVarInt'
            , parseFieldType = getVarInt'
            }

-- | A fixed-length integer (Word64).
fixed64 :: FieldEncoding
fixed64 = FieldEncoding
            { wireType = 1
            , buildFieldType = "Data.ProtoLens.Encoding.Bytes.putFixed64"
            , parseFieldType = "Data.ProtoLens.Encoding.Bytes.getFixed64"
            }

-- | A fixed-length integer (Word32).
fixed32 :: FieldEncoding
fixed32 = FieldEncoding
            { wireType = 5
            , buildFieldType = "Data.ProtoLens.Encoding.Bytes.putFixed32"
            , parseFieldType = "Data.ProtoLens.Encoding.Bytes.getFixed32"
            }

-- | A ByteString, prefixed by its length (which is encoded as a varint).
lengthy :: FieldEncoding
lengthy = FieldEncoding
            { wireType = 2
            , buildFieldType = buildLengthy
            , parseFieldType = parseLengthy
            }
  where
    bs = "bs"
    len = "len"
    buildLengthy =
        -- Bind x since it may be a nontrivial expression:
        lambda [bs]
            $ "Data.Monoid.<>"
                @@ (putVarInt'
                        @@ (fromIntegral'
                                @@ ("Data.ByteString.length" @@ bs)))
                @@ ("Data.ProtoLens.Encoding.Bytes.putBytes" @@ bs)
    parseLengthy = do'
        [ len <-- getVarInt'
        , stmt $ "Data.ProtoLens.Encoding.Bytes.getBytes"
                    @@ (fromIntegral' @@ len)
        ]

group :: FieldEncoding
group = FieldEncoding
            { wireType = 3
            , buildFieldType = "Data.ProtoLens.buildMessage"
            , parseFieldType = "Data.ProtoLens.parseMessage"
            }

groupEnd :: FieldEncoding
groupEnd = FieldEncoding
            { wireType = 4
            , buildFieldType = "Prelude.const" @@ "Data.Monoid.mempty"
            , parseFieldType = "Prelude.return" @@ unit
            }

-- Wrap a field encoding  with Haskell functions that should always succeed.
bijectField :: Exp -> Exp -> FieldEncoding -> FieldEncoding
bijectField buildF parseF f = FieldEncoding
    { buildFieldType = "Prelude.." @@ buildFieldType f @@ buildF
    , parseFieldType = "Prelude.fmap" @@ parseF @@ parseFieldType f
    , wireType = wireType f
    }

-- | Wrap a field encoding with Haskell functions that may fail during parsing.
partialField :: Exp -> (Exp -> Exp) -> FieldEncoding -> FieldEncoding
partialField buildF parseF f = FieldEncoding
    { buildFieldType = "Prelude.." @@ buildFieldType f @@ buildF
    -- do
    --  value <- ...
    --  runEither $ {parseF} value
    , parseFieldType = do'
        [ value <-- parseFieldType f
        , stmt $ runEither @@ parseF value
        ]
    , wireType = wireType f
    }
  where
    value = "value"
    runEither = "Data.ProtoLens.Encoding.Bytes.runEither"

-- | Convert a field of one integral type to another.
integralField :: FieldEncoding -> FieldEncoding
integralField = bijectField fromIntegral' fromIntegral'

fieldEncoding :: FieldDescriptorProto'Type -> FieldEncoding
fieldEncoding = \case
    FieldDescriptorProto'TYPE_INT64 -> integralField varint
    FieldDescriptorProto'TYPE_UINT64 -> varint
    FieldDescriptorProto'TYPE_INT32 -> integralField varint
    FieldDescriptorProto'TYPE_UINT32 -> integralField varint
    FieldDescriptorProto'TYPE_FIXED64 -> fixed64
    FieldDescriptorProto'TYPE_FIXED32 -> fixed32
    FieldDescriptorProto'TYPE_SFIXED64 -> integralField fixed64
    FieldDescriptorProto'TYPE_SFIXED32 -> integralField fixed32
    FieldDescriptorProto'TYPE_DOUBLE ->
        bijectField
            "Data.ProtoLens.Encoding.Bytes.doubleToWord"
            "Data.ProtoLens.Encoding.Bytes.wordToDouble"
            fixed64
    FieldDescriptorProto'TYPE_FLOAT ->
        bijectField
            "Data.ProtoLens.Encoding.Bytes.floatToWord"
            "Data.ProtoLens.Encoding.Bytes.wordToFloat"
            fixed32
    FieldDescriptorProto'TYPE_BOOL ->
        bijectField
            (lambda ["b"] $ if' "b" (litInt 1) (litInt 0))
            ("Prelude./=" @@ litInt 0)
            varint
    FieldDescriptorProto'TYPE_ENUM ->
        -- TODO: don't throw an exception on unknown proto2 enums.
        bijectField "Prelude.fromEnum" "Prelude.toEnum"
            $ integralField varint
    FieldDescriptorProto'TYPE_SINT64 ->
        bijectField
            "Data.ProtoLens.Encoding.Bytes.signedInt64ToWord"
            "Data.ProtoLens.Encoding.Bytes.wordToSignedInt64"
            $ integralField varint
    FieldDescriptorProto'TYPE_SINT32 ->
        bijectField
            "Data.ProtoLens.Encoding.Bytes.signedInt32ToWord"
            "Data.ProtoLens.Encoding.Bytes.wordToSignedInt32"
            $ integralField varint
    FieldDescriptorProto'TYPE_BYTES -> lengthy
    FieldDescriptorProto'TYPE_STRING -> stringField
    FieldDescriptorProto'TYPE_MESSAGE -> message
    FieldDescriptorProto'TYPE_GROUP -> group

-- | A string, represented as Data.Text.Text.
stringField :: FieldEncoding
stringField = partialField "Data.Text.Encoding.encodeUtf8" decodeUtf8P lengthy
  where
    {- Translates to:
        case decodeUtf8' bytes of
            Left err -> Left (show err)
            Right r -> r
    Equivalently:
        first show $ decodeUtf8' bytes
    but avoids dragging in Data.Bifunctors.
    -}
    decodeUtf8P bytes =
        case' ("Data.Text.Encoding.decodeUtf8'" @@ bytes )
            [ "Prelude.Left" `pApp` ["err"]
                --> "Prelude.Left" @@ ("Prelude.show" @@ "err")
            , "Prelude.Right" `pApp` ["r"]
                --> "Prelude.Right" @@ "r"
            ]

-- | A protobuf message type.
message :: FieldEncoding
message = lengthy
        { buildFieldType = "Prelude.." @@
            buildFieldType lengthy @@
            "Data.ProtoLens.encodeMessage"
        , parseFieldType = isolatedLengthy "Data.ProtoLens.parseMessage"
        }

-- | Takes a @Parser a@, reads a varint and then runs the parser
-- isolated to the given length.
isolatedLengthy :: Exp -> Exp
isolatedLengthy parser = do'
    [ len <-- getVarInt'
    , stmt $ "Data.ProtoLens.Encoding.Bytes.isolate"
                @@ (fromIntegral' @@ len)
                @@ parser
    ]
  where
    len = "len"

-- | Some functions that are used in multiple places in the generated code.
getVarInt', putVarInt', fromIntegral' :: Exp
getVarInt' = "Data.ProtoLens.Encoding.Bytes.getVarInt"
putVarInt' = "Data.ProtoLens.Encoding.Bytes.putVarInt"
fromIntegral' = "Prelude.fromIntegral"
