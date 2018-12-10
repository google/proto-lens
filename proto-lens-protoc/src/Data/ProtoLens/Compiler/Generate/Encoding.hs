{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE OverloadedStrings #-}
module Data.ProtoLens.Compiler.Generate.Encoding
    ( generatedParser
    , generatedBuilder
    ) where

import Data.Bits (shiftL, (.|.))
import Data.Int (Int32)
import Data.Maybe (isNothing)

import Data.ProtoLens.Compiler.Combinators
import Data.ProtoLens.Compiler.Definitions
import Lens.Family2 ((^.))

import Proto.Google.Protobuf.Descriptor
    ( FieldDescriptorProto'Type(..)
    )
import Proto.Google.Protobuf.Descriptor_Fields
    ( number
    , type'
    )

generatedParser :: Env QName -> MessageInfo Name -> Exp
generatedParser env m =
    {- let loop :: T -> Parser T
           loop x = do
                    end <- atEnd
                    if end
                        then return x
                        else do
                            tag <- getVarInt
                            case tag of ...
      in loop defMessage
    -}
    letE [typeSig [loop] $ tyFun ty $ "Data.ProtoLens.Encoding.Bytes.Parser" @@ ty
         , funBind [match loop [x] loopExpr]]
         (loop @@ "Data.ProtoLens.defMessage")
  where
    ty = tyCon (unQual $ messageName m)
    x = "x"
    tag = "tag"
    end = "end"
    loop = "loop"
    loopExpr = do'
        [ end <-- "Data.ProtoLens.Encoding.Bytes.atEnd"
        , stmt $
            if' end
                ("Prelude.return" @@
                    (reverseRepeatedFields env m x))
                $ do'
                    [ tag <-- getVarInt'
                    , stmt $ case' tag $ parseTagCases env (loop @@) x m
                    ]
        ]

reverseRepeatedFields :: Env QName -> MessageInfo Name -> Exp -> Exp
reverseRepeatedFields env m = foldr (.) id
    [ (overField (plainFieldInfo f) "Prelude.reverse" @@)
    | f <- messageFields m
    , RepeatedField{} <- [plainFieldKind f]
    , isNothing (getMapFields env $ fieldDescriptor $ plainFieldInfo f)
    ]

parseTagCases ::
       Env QName
    -> (Exp -> Exp) -- ^ loop continuation
    -> Exp -- ^ Old message
    -> MessageInfo Name
    -> [Alt]
parseTagCases env loop x info =
    concatMap (parseFieldCase env loop x) allFields
    -- TODO: currently we ignore unknown fields.
    ++ [ pWildCard --> loop x]
  where
    allFields = messageFields info
                -- Cases of a oneof are decoded like optional oneof fields.
                ++ [ PlainFieldInfo OptionalMaybeField (caseField c)
                   | o <- messageOneofFields info
                   , c <- oneofCases o
                   ]


parseFieldCase ::
    Env QName -> (Exp -> Exp) -> Exp -> PlainFieldInfo -> [Alt]
-- TODO: implement repeated fields
parseFieldCase env loop x f = case plainFieldKind f of
    RepeatedField _
        | Just mapInfo <- getMapFields env (fieldDescriptor info)
            -> [mapCase mapInfo]
    RepeatedField NotPackable -> [unpackedCase]
    RepeatedField _ -> [unpackedCase, packedCase]
    _ -> [pLitInt (fieldTag info)
            --> do'
                [ y <-- parseField (fieldEncoding info)
                , stmt $ loop $ setField info @@ y @@ x
                ]
         ]
  where
    y = "y"
    bytes = "bytes"
    entry = "entry"
    info = plainFieldInfo f
    unpackedCase = pLitInt (fieldTag info) --> do'
        [ bangPat y <-- parseField (fieldEncoding info)
        , stmt $ loop $ overField info (cons @@ y) @@ x
        ]
    packedCase = pLitInt (packedFieldTag info) --> do'
        [ bytes <-- parseField lengthy
        , y <-- "Data.ProtoLens.Encoding.Bytes.runEither"
                    @@ ("Data.ProtoLens.Encoding.Bytes.runParser"
                        @@ parsePackedField (fieldEncoding info)
                        @@ bytes)
        , stmt $ loop $ overField info ("Prelude.++" @@ y) @@ x
        ]
    mapCase (entryName, kField, vField) = pLitInt (fieldTag info) --> do'
        [ bangPat (entry `patTypeSig` tyCon entryName)
                <-- parseField (fieldEncoding info)
        , stmt $ letE [ patBind "key" $ view' @@ lensOfField kField
                                            @@ entry
                      , patBind "value" $ view' @@ lensOfField vField
                                            @@ entry
                      ]
                $ loop $ overField info
                            ("Data.Map.insert" @@ "key" @@ "value")
                            @@ x
        ]

setField :: FieldInfo -> Exp
setField f = "Lens.Family2.set" @@ lensOfExp (fieldLens f)

-- over f (\!z -> g z) x
-- The extra strictness prevents a space leak due to lists being lazy.
overField :: FieldInfo -> Exp -> Exp
overField f g =
    "Lens.Family2.over"
        @@ lensOfExp (fieldLens f)
        @@ lambda [bangPat t] (g @@ t)
  where
    t = "t"

-- | Parser [a] for a field that can be packed.
parsePackedField :: FieldEncoding -> Exp
parsePackedField enc = letE [funBind [match ploop [qs] ploopExp]]
                       (ploop @@ emptyList)
  where
    ploop = "ploop"
    q = "q"
    qs = "qs"
    packedEnd = "packedEnd"
    ploopExp = do'
        [ packedEnd <-- "Data.ProtoLens.Encoding.Bytes.atEnd"
        , stmt $
            if' packedEnd
                ("Prelude.return" @@ qs)
                $ do'
                    [ bangPat q <-- parseField enc
                    , stmt $ ploop @@ (cons @@ q @@ qs)
                    ]
        ]

generatedBuilder :: Env QName -> MessageInfo Name -> Exp
generatedBuilder env m =
    lambda [x] $ foldMapExp $ map (buildPlainField env x) (messageFields m)
                                ++ map (buildOneofField x) (messageOneofFields m)
  where
    x = "_x" -- TODO: rename to "x" once it's always used

-- | Concatenate a list of Monoids into a single value.
-- For example, foldMapExp [a,b,c] will be transformed into
-- the (unrolled) expression a <> b <> c.
foldMapExp :: [Exp] -> Exp
foldMapExp [] = mempty'
foldMapExp [x] = x
foldMapExp (x:xs) = "Data.Monoid.<>" @@ x @@ foldMapExp xs

buildPlainField :: Env QName -> Exp -> PlainFieldInfo -> Exp
buildPlainField env x f = case plainFieldKind f of
    RequiredField -> buildTaggedField info fieldValue
    OptionalMaybeField -> case' maybeFieldValue
                            ["Prelude.Nothing" --> mempty'
                            , "Prelude.Just" `pApp` [v]
                                --> buildTaggedField info v
                            ]
    OptionalValueField -> letE [patBind v $ fieldValue]
                          $ if' ("Prelude.==" @@ v @@ "Data.ProtoLens.fieldDefault")
                                mempty'
                                (buildTaggedField info v)
    RepeatedField _
        | Just mapInfo
                <- getMapFields env (fieldDescriptor info)
        -> "Data.Monoid.mconcat"
            @@ ("Prelude.map"
                    @@ lambda [v] (buildEntry mapInfo v)
                    @@ ("Data.Map.toList" @@ fieldValue))
    RepeatedField Packed -> buildPackedField info fieldValue
    RepeatedField _ -> "Data.Monoid.mconcat"
                        @@ ("Prelude.map"
                            @@ lambda [v] (buildTaggedField info v)
                            @@ fieldValue)
  where
    info = plainFieldInfo f
    v = "_v"
    fieldValue = view'
                    @@ lensOfField info
                    @@ x
    maybeFieldValue = view'
                        @@ lensOfMaybeField info
                        @@ x
    buildEntry (entry, keyField, valueField) kv
        = buildTaggedField info
            $ set'
                @@ lensOfField keyField
                @@ ("Prelude.fst" @@ kv)
                @@ (set' @@ lensOfField valueField
                         @@ ("Prelude.snd" @@ kv)
                         @@ ("Data.ProtoLens.defMessage"
                                @::@ tyCon entry))

fieldLens :: FieldInfo -> Symbol
fieldLens = overloadedName . fieldName

lensOfField :: FieldInfo -> Exp
lensOfField = lensOfExp . fieldLens

lensOfMaybeField :: FieldInfo -> Exp
lensOfMaybeField = lensOfExp . ("maybe'" <>) . fieldLens

lensOfOneofField :: OneofInfo -> Exp
lensOfOneofField =
    lensOfExp . ("maybe'" <>) . overloadedName . oneofFieldName

-- | Build a field along with its tag.
buildTaggedField :: FieldInfo -> Exp -> Exp
buildTaggedField f x = foldMapExp
    [ putVarInt' @@ litInt (fieldTag f)
    , buildField (fieldEncoding f) x
    ]

buildPackedField :: FieldInfo -> Exp -> Exp
buildPackedField f x =
    if' ("Prelude.null" @@ x) mempty'
    $ foldMapExp
        [ putVarInt' @@ litInt (packedFieldTag f)
        , buildField lengthy
            $ "Data.ProtoLens.Encoding.Bytes.runBuilder"
                @@ ("Data.Monoid.mconcat"
                    @@ ("Prelude.map" @@ buildElt @@ x))
        ]
  where
    buildElt = lambda [y] (buildField enc y)
    enc = fieldEncoding f
    y = "y"

-- TODO: build oneof fields.
buildOneofField :: Exp -> OneofInfo -> Exp
buildOneofField x info = case' (view' @@ lensOfOneofField info @@ x) $
    ("Prelude.Nothing" --> mempty')
    : [ pApp "Prelude.Just" [pApp (unQual $ caseConstructorName c)
                                 [v]]
            --> buildTaggedField (caseField c) v
      | c <- oneofCases info
      ]
  where
    v = "v"

-- | A representation for how to encode and decode a particular field type.
data FieldEncoding = FieldEncoding
    { buildField :: Exp -> Exp -- ^ :: a -> Builder
    , parseField :: Exp        -- ^ :: Parser a
    , wireType :: Integer
    }

varint, fixed64, fixed32, lengthy, group :: FieldEncoding
varint = FieldEncoding
            { wireType = 0
            , buildField = (putVarInt' @@)
            , parseField = getVarInt'
            }
fixed64 = FieldEncoding
            { wireType = 1
            , buildField = ("Data.ProtoLens.Encoding.Bytes.putFixed64" @@)
            , parseField = "Data.ProtoLens.Encoding.Bytes.getFixed64"
            }
fixed32 = FieldEncoding
            { wireType = 5
            , buildField = ("Data.ProtoLens.Encoding.Bytes.putFixed32" @@)
            , parseField = "Data.ProtoLens.Encoding.Bytes.getFixed32"
            }
lengthy = FieldEncoding
            { wireType = 2
            , buildField = buildLengthy
            , parseField = parseLengthy
            }
  where
    buildLengthy x = letE [patBind bs x]
        $ "Data.Monoid.<>"
        @@ (putVarInt' @@ (fromIntegral' @@ ("Data.ByteString.length" @@ bs)))
        @@ ("Data.ProtoLens.Encoding.Bytes.putBytes" @@ bs)
    bs = "bs"
    parseLengthy = do'
        [ len <-- getVarInt'
        , stmt $ "Data.ProtoLens.Encoding.Bytes.getBytes"
                    @@ (fromIntegral' @@ len)
        ]
    len = "len"

-- TODO: implement groups.  For now, use incorrect placeholders that match
-- the expected types.
group = FieldEncoding
            { wireType = 3
            , buildField = const mempty'
            , parseField = "Prelude.return" @@ "Data.ProtoLens.defMessage"
            }

-- | Wrap a field encoding with Haskell functions that should always succeed.
bijectField :: Exp -> Exp -> FieldEncoding -> FieldEncoding
bijectField buildF parseF f = FieldEncoding
    { buildField = buildField f . (buildF @@)
    , parseField = "Prelude.fmap" @@ parseF @@ parseField f
    , wireType = wireType f
    }

-- | Wrap a field encoding with Haskell functions that may fail during parsing.
partialField :: Exp -> (Exp -> Exp) -> FieldEncoding -> FieldEncoding
partialField buildF parseF f = FieldEncoding
    { buildField = buildField f . (buildF @@)
    -- do
    --  value <- ...
    --  runEither $ {parseF} value
    , parseField = do' [value <-- parseField f, stmt $ runEither @@ parseF value]
    , wireType = wireType f
    }
  where
    value = "value"
    runEither = "Data.ProtoLens.Encoding.Bytes.runEither"

integralField :: FieldEncoding -> FieldEncoding
integralField = bijectField fromIntegral' fromIntegral'

fieldEncoding :: FieldInfo -> FieldEncoding
fieldEncoding f = case fieldDescriptor f ^. type' of
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
    FieldDescriptorProto'TYPE_STRING ->
        partialField "Data.Text.Encoding.encodeUtf8" decodeUtf8P lengthy
    FieldDescriptorProto'TYPE_MESSAGE ->
        partialField ("Prelude.."
                        @@ "Data.ProtoLens.Encoding.Bytes.runBuilder"
                        @@ "Data.ProtoLens.unfinishedBuildMessage")
            (\m -> "Data.ProtoLens.Encoding.Bytes.runParser"
                    @@ "Data.ProtoLens.unfinishedParseMessage" @@ m)
            lengthy
    FieldDescriptorProto'TYPE_GROUP -> group


{- Translates to:
     case decodeUtf8' bytes of
        Left err -> Left (show err)
        Right r -> r
   Equivalently:
      first show $ decodeUtf8' bytes
   but avoids dragging in Data.Bifunctors.
-}
decodeUtf8P :: Exp -> Exp
decodeUtf8P bytes = case' ("Data.Text.Encoding.decodeUtf8'" @@ bytes )
    [ "Prelude.Left" `pApp` ["err"]
        --> "Prelude.Left" @@ ("Prelude.show" @@ "err")
    , "Prelude.Right" `pApp` ["r"]
        --> "Prelude.Right" @@ "r"
    ]

fieldTag :: FieldInfo -> Integer
fieldTag f = makeTag (fieldDescriptor f ^. number) (fieldEncoding f)

packedFieldTag :: FieldInfo -> Integer
packedFieldTag f = makeTag (fieldDescriptor f ^. number) lengthy

makeTag :: Int32 -> FieldEncoding -> Integer
makeTag num enc =
    fromIntegral num `shiftL` 3 .|. wireType enc

lensOfExp :: Symbol -> Exp
lensOfExp sym = ("Lens.Labels.lensOf'"
                  @@ ("Lens.Labels.proxy#" @::@
                      ("Lens.Labels.Proxy#" @@ promoteSymbol sym)))

-- | Some functions that are used in multiple places in the generated code.
getVarInt', putVarInt', mempty', fromIntegral', view', set' :: Exp
getVarInt' = "Data.ProtoLens.Encoding.Bytes.getVarInt"
putVarInt' = "Data.ProtoLens.Encoding.Bytes.putVarInt"
mempty' = "Data.Monoid.mempty"
fromIntegral' = "Prelude.fromIntegral"
view' = "Lens.Family2.view"
set' = "Lens.Family2.set"
