{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
module Data.ProtoLens.Compiler.Generate.Encoding
    ( generateParser
    ) where

import Data.Bits (shiftL, (.|.))
import Data.Int (Int32)

import Data.ProtoLens.Compiler.Combinators
import Data.ProtoLens.Compiler.Definitions
import Data.String (fromString)
import Lens.Family2 ((^.))

import Proto.Google.Protobuf.Descriptor
    ( FieldDescriptorProto'Label(..)
    , FieldDescriptorProto'Type(..)
    )
import Proto.Google.Protobuf.Descriptor_Fields
    ( label
    , number
    , type'
     )

generateParser :: SyntaxType -> MessageInfo Name -> Exp
generateParser syntaxType info =
    letE [funBind [match loop [x] loopExpr]]
        (loop @@ "Data.ProtoLens.defMessage")
  where
    loop = "loop"
    x = "x"
    x' = "x'"
    tag = "tv"
    loopExpr = do'
        [ "end" `genStmt` isEnd
        , qualStmt $ if' "end"
            ("Prelude.return" @@ x)
            $ do'
                -- TODO: no intermediate tags, instead just isolate?
                [tag `genStmt` getVarInt
                , x' `genStmt` case' tag
                                (parseTagCases syntaxType info x)
                , qualStmt $ "Prelude.$!" @@ loop @@ x'
                ]
        ]

isEnd, getVarInt, fmap', fromIntegral' :: Exp
isEnd = "Data.ProtoLens.Encoding.Parser.isEnd"
getVarInt = "Data.ProtoLens.Encoding.Bytes.getVarInt"
fmap' = "Prelude.fmap"
fromIntegral' = "Prelude.fromIntegral"

parseTagCases ::
    SyntaxType -> MessageInfo Name
    -> Exp  -- ^ Old message
    -> [Alt]
parseTagCases syntaxType info x =
    concatMap (parseFieldCases syntaxType x)
        (messageFields info
            ++ [caseField c | o <- messageOneofFields info
                            , c <- oneofCases o])
    ++ [alt pWildCard "Prelude.undefined"] -- Unknown field; TODO

parseFieldCases ::
    SyntaxType -> Exp -> FieldInfo -> [Alt]
parseFieldCases syntaxType x f = case fieldDescriptor f ^. label of
    FieldDescriptorProto'LABEL_OPTIONAL
        -> [scalarFieldCase x f]
    FieldDescriptorProto'LABEL_REQUIRED
        -> [scalarFieldCase x f]
    FieldDescriptorProto'LABEL_REPEATED
        -> repeatedFieldCases syntaxType x f

scalarFieldCase :: Exp -> FieldInfo -> Alt
scalarFieldCase x f = alt (pLitInt $ typeTag (fd ^. number) (fd ^. type'))
    $ do'
        [ y `genStmt` parseValue (fd ^. type')
        , qualStmt $ "Prelude.$!" @@ "Prelude.return"
                @@ ("Lens.Family2.set"
                        @@ lensOfExp (overloadedName $ plainFieldName f)
                        @@ y
                        @@ x)
        ]
  where
    y = "y"
    fd = fieldDescriptor f

repeatedFieldCases :: SyntaxType -> Exp -> FieldInfo -> [Alt]
repeatedFieldCases _ _ f =
    -- TODO: packed values too
    [ alt (pLitInt $ typeTag (fd ^. number) (fd ^. type'))
    $ "Prelude.undefined"]
  where
    fd = fieldDescriptor f

typeTag :: Int32 -> FieldDescriptorProto'Type -> Integer
typeTag tag typ = fromIntegral tag `shiftL` 3 .|. wireType
  where
    varint = 0
    fixed64 = 1
    lengthy = 2
    group = 3
    fixed32 = 5
    wireType = case typ of
                FieldDescriptorProto'TYPE_DOUBLE -> fixed64
                FieldDescriptorProto'TYPE_FLOAT -> fixed32
                FieldDescriptorProto'TYPE_INT64 -> varint
                FieldDescriptorProto'TYPE_UINT64 -> varint
                FieldDescriptorProto'TYPE_INT32 -> varint
                FieldDescriptorProto'TYPE_UINT32 -> varint
                FieldDescriptorProto'TYPE_FIXED64 -> fixed64
                FieldDescriptorProto'TYPE_FIXED32 -> fixed32
                FieldDescriptorProto'TYPE_BOOL -> varint
                FieldDescriptorProto'TYPE_STRING -> lengthy
                FieldDescriptorProto'TYPE_GROUP -> group
                FieldDescriptorProto'TYPE_MESSAGE -> lengthy
                FieldDescriptorProto'TYPE_BYTES -> lengthy
                FieldDescriptorProto'TYPE_ENUM -> varint
                FieldDescriptorProto'TYPE_SINT32 -> varint
                FieldDescriptorProto'TYPE_SINT64 -> varint
                FieldDescriptorProto'TYPE_SFIXED32 -> fixed32
                FieldDescriptorProto'TYPE_SFIXED64 -> fixed64

parseValue :: FieldDescriptorProto'Type -> Exp
parseValue FieldDescriptorProto'TYPE_INT32 = fmap' @@ fromIntegral' @@ getVarInt
parseValue FieldDescriptorProto'TYPE_BYTES = do'
    [ "len" `genStmt` getVarInt
    , qualStmt $ protoLensId "Encoding.Parser.takeN" @@ (fromIntegral' @@ "len")
    ]
parseValue FieldDescriptorProto'TYPE_STRING = do'
    [ "len" `genStmt` getVarInt
    , "b" `genStmt` (protoLensId "Encoding.Parser.takeN" @@ (fromIntegral' @@ "len"))
    , qualStmt $ protoLensId "Encoding.Bytes.parseString" @@ "b"
    ]
parseValue FieldDescriptorProto'TYPE_MESSAGE = do'
    [ "len" `genStmt` getVarInt
    , qualStmt $ protoLensId "Encoding.Parser.isolate" @@ (fromIntegral' @@ "len")
            @@ protoLensId "newParseMessage"
    ]
parseValue _ = "Prelude.return" @@ "Prelude.undefined"

-- TODO: don't duplicate
lensOfExp :: Symbol -> Exp
lensOfExp sym = ("Lens.Labels.lensOf'"
                  @@ ("Lens.Labels.proxy#" @::@
                      ("Lens.Labels.Proxy#" @@ promoteSymbol sym)))

protoLensId :: String -> Exp
protoLensId n = fromString $ "Data.ProtoLens." ++ n

