-- | This module generates code for decoding and encoding protocol buffer messages.
--
-- Upstream docs: https://developers.google.com/protocol-buffers/docs/encoding
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE OverloadedStrings #-}
module Data.ProtoLens.Compiler.Generate.Encoding
    ( generatedParser
    , generatedBuilder
    ) where

import Data.Bits (shiftL, (.|.))
import Data.Int (Int32)
import Data.Semigroup ((<>))
import Lens.Family2 (view, (^.))

import Data.ProtoLens.Compiler.Combinators
import Data.ProtoLens.Compiler.Definitions
import Data.ProtoLens.Compiler.Generate.FieldEncoding

import Proto.Google.Protobuf.Descriptor_Fields
    ( number
    , type'
    )

generatedParser :: MessageInfo Name -> Exp
generatedParser m =
    {- let loop :: T -> Parser T
           loop x = ...
       in loop defMessage
    -}
    letE [typeSig [loop] $ tyFun ty $ "Data.ProtoLens.Encoding.Bytes.Parser" @@ ty
         , funBind [match loop [x] loopExpr]
         ]
        $ loop @@ "Data.ProtoLens.defMessage"
  where
    ty = tyCon (unQual $ messageName m)
    x = "x"
    tag = "tag"
    end = "end"
    loop = "loop"
    finish = "Prelude.return" @@ (reverseRepeatedFields m x)

    loopExpr
        {- Group:
            do
              tag <- getVarInt
              case tag of
                {groupEndTag} -> return $ {reverseRepeatedFields} x
                ... -- Regular message fields

          TODO(#282): fail the parse if we find a group-end tag
          with an incorrect field number.
        -}
        | Just g <- groupFieldNumber m = do'
            [ tag <-- getVarInt'
            , stmt $ case' tag $
                (pLitInt (groupEndTag g) --> finish)
                    : parseTagCases (loop @@) x m
            ]
        {- Regular message type:
              do
                end <- atEnd
                if end
                    then return $ {reverseRepeatedFields} x
                    else do
                        tag <- getVarInt
                        case tag of ...
        -}
        | otherwise = do'
            [ end <-- "Data.ProtoLens.Encoding.Bytes.atEnd"
            , stmt $
                if' end finish
                    $ do'
                        [ tag <-- getVarInt'
                        , stmt $ case' tag $ parseTagCases (loop @@) x m
                        ]
            ]

reverseRepeatedFields :: MessageInfo Name -> Exp -> Exp
reverseRepeatedFields m = foldr (.) id $
    (over' unknownFields' "Prelude.reverse" @@) :
    [ (overField (plainFieldInfo f) "Prelude.reverse" @@)
    | f <- messageFields m
    , RepeatedField{} <- [plainFieldKind f]
    ]

-- | A list case alternatives for the fields of a message.
--
-- The exact structure of each case differs based on the field type.  However, it
-- generally looks like:
--
--   {N} -> do
--           {VALUE} <- {PARSE}
--           loop (set {FIELD} {VALUE} x
--
-- where:
--  - {N} is an integer representing the wire type + field number,
--  - {VALUE} is an expression of type "V", which is the type of the field,
--  - {PARSE} is an expression of the form "Parser V",
--  - and "loop" and "x" are as in @generatedParser@.
parseTagCases ::
       (Exp -> Exp) -- ^ loop continuation, equivalent to "msg -> Parser msg".
                    -- It continues the loop with the given new value of the message.
    -> Exp          -- ^ Previous value of the message, of type "msg"
    -> MessageInfo Name
    -> [Alt]
parseTagCases loop x info =
    concatMap (parseFieldCase loop x) allFields
    -- TODO: currently we ignore unknown fields.
    ++ [unknownFieldCase loop x]
  where
    allFields = messageFields info
                -- Cases of a oneof are decoded like optional oneof fields.
                ++ [ PlainFieldInfo OptionalMaybeField (caseField c)
                   | o <- messageOneofFields info
                   , c <- oneofCases o
                   ]

-- | A particular parsing case.  See @parseTagCases@ for details.
parseFieldCase ::
    (Exp -> Exp) -> Exp -> PlainFieldInfo -> [Alt]
parseFieldCase loop x f = case plainFieldKind f of
    MapField entryInfo -> [mapCase entryInfo]
    RepeatedField p
        | p == NotPackable -> [unpackedCase]
        | otherwise -> [unpackedCase, packedCase]
    _ -> [valueCase]
  where
    y = "y"
    bytes = "bytes"
    entry = "entry"
    info = plainFieldInfo f
    valueCase = pLitInt (fieldTag info) --> do'
        [ y <-- parseField info
        , stmt $ loop $ setField info @@ y @@ x
        ]

    unpackedCase = pLitInt (fieldTag info) --> do'
        [ bangPat y <-- parseField info
        , stmt $ loop $ overField info (cons @@ y) @@ x
        ]
    packedCase = pLitInt (packedFieldTag info) --> do'
        [ bytes <-- parseFieldType lengthy
        , y <-- "Data.ProtoLens.Encoding.Bytes.runEither"
                    @@ ("Data.ProtoLens.Encoding.Bytes.runParser"
                        @@ parsePackedField info
                        @@ bytes)
        , stmt $ loop $ overField info ("Prelude.++" @@ y) @@ x
        ]
    mapCase entryInfo = pLitInt (fieldTag info) --> do'
        [ bangPat (entry `patTypeSig` tyCon (unQual $ mapEntryTypeName entryInfo))
                <-- parseField info
        , stmt $ letE [ patBind "key"
                            $ view' @@ lensOfField (keyField entryInfo)
                                    @@ entry
                      , patBind "value"
                            $ view' @@ lensOfField (valueField entryInfo)
                                    @@ entry
                      ]
                $ loop $ overField info
                            ("Data.Map.insert" @@ "key" @@ "value")
                            @@ x
        ]

unknownFieldCase :: (Exp -> Exp) -> Exp -> Alt
unknownFieldCase loop x = wire --> do'
    [ bangPat y <-- "Data.ProtoLens.Encoding.Wire.parseTaggedValue" @@ wire
    , stmt $ loop $ over' unknownFields' (cons @@ y) @@ x
    ]
  where
    wire = "wire"
    y = "y"

-- | An expression of type "b -> a -> a", corresponding to a Lens a b
-- for this field.
setField :: FieldInfo -> Exp
setField f = "Lens.Family2.set" @@ lensOfExp (fieldLens f)

-- | An expression of type "(b -> b) -> a -> a", corresponding to a
-- Lens a b for this field.
overField :: FieldInfo -> Exp -> Exp
overField f = over' (lensOfExp (fieldLens f))

-- | An expression of type "(b -> b) -> a -> a".
--
-- Specifically, this renders to:
--   over f (\!z -> g z) x
-- The extra strictness prevents a space leak due to lists being lazy.
over' :: Exp -> Exp -> Exp
over' f g = "Lens.Family2.over"
                @@ f
                @@ lambda [bangPat t] (g @@ t)
  where
    t = "t"

-- | A "Parser [a]" for a field that can be packed.
parsePackedField :: FieldInfo -> Exp
{- let ploop qs = do
                    packedEnd <- atEnd
                    if packedEnd
                        then return qs
                        else do
                            !q <- {PARSE FIELD}
                            ploop (q:qs)
   in ploop []
-}
parsePackedField info = letE [funBind [match ploop [qs] ploopExp]]
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
                    [ bangPat q <-- parseField info
                    , stmt $ ploop @@ (cons @@ q @@ qs)
                    ]
        ]

generatedBuilder :: MessageInfo Name -> Exp
generatedBuilder m =
    lambda [x] $ foldMapExp $ map (buildPlainField x) (messageFields m)
                                ++ map (buildOneofField x) (messageOneofFields m)
                            ++ [buildUnknown x]
                            ++ buildGroupEnd
  where
    x = "_x" -- TODO: rename to "x" once it's always used
    -- If this is a group, finish by emitting the end-group tag.
    buildGroupEnd = [ putVarInt' @@ litInt (groupEndTag g)
               | Just g <- [groupFieldNumber m]
               ]

buildUnknown :: Exp -> Exp
buildUnknown x
    = "Data.Monoid.mconcat"
        @@ ("Prelude.map"
                @@ "Data.ProtoLens.Encoding.Wire.buildTaggedValue"
                @@ (view' @@ unknownFields' @@ x))

-- | Concatenate a list of Monoids into a single value.
-- For example, foldMapExp [a,b,c] will be transformed into
-- the (unrolled) expression a <> b <> c.
foldMapExp :: [Exp] -> Exp
foldMapExp [] = mempty'
foldMapExp [x] = x
foldMapExp (x:xs) = "Data.Monoid.<>" @@ x @@ foldMapExp xs

-- | An expression of type @Builder@ which encodes the field value
-- @x@ based on the kind and type of the field @f@.
buildPlainField :: Exp -> PlainFieldInfo -> Exp
buildPlainField x f = case plainFieldKind f of
    RequiredField -> buildTaggedField info fieldValue
    OptionalMaybeField -> case' maybeFieldValue
                            ["Prelude.Nothing" --> mempty'
                            , "Prelude.Just" `pApp` [v]
                                --> buildTaggedField info v
                            ]
    OptionalValueField -> letE [patBind v fieldValue]
                          $ if' ("Prelude.==" @@ v @@ "Data.ProtoLens.fieldDefault")
                                mempty'
                                (buildTaggedField info v)
    MapField entryInfo
        -> "Data.Monoid.mconcat"
            @@ ("Prelude.map"
                    @@ lambda [v] (buildEntry entryInfo v)
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
    {- Builds a value of the given map entry type
       from the given key/value pair kv.

       ... set (lensOf {KEY}) (fst kv)
            (set (lensOf {VALUE}) (snd kv)
                (defMessage :: Foo'Entry)
    -}
    buildEntry entry kv
        = buildTaggedField info
            $ set'
                @@ lensOfField (keyField entry)
                @@ ("Prelude.fst" @@ kv)
                @@ (set' @@ lensOfField (valueField entry)
                         @@ ("Prelude.snd" @@ kv)
                         @@ ("Data.ProtoLens.defMessage"
                                @::@ tyCon (unQual $ mapEntryTypeName entry)))

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
    , buildField f @@ x
    ]

-- | Encodes a packed field as a byte string, along with
-- its wire type+number.
buildPackedField :: FieldInfo -> Exp -> Exp
{-
    let p = x -- where x might be a complicated expression
    in if null p then mempty
    else putVarInt {TAG}
            <> ... (runBuilder (mconcat (map {BUILD_ELT} p)))
-}
buildPackedField f x = letE [patBind p x]
    $ if' ("Prelude.null" @@ p) mempty'
    $ "Data.Monoid.<>"
          @@ (putVarInt' @@ litInt (packedFieldTag f))
          @@ (buildFieldType lengthy
                @@ ("Data.ProtoLens.Encoding.Bytes.runBuilder"
                    @@ ("Data.Monoid.mconcat"
                        @@ ("Prelude.map" @@ buildField f @@ p))))
  where
    p = "p"

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

-- | Compute the proto encoding's representation of the wire type
-- and field number.
--
-- The last three bits of the number store the wire type, and the
-- rest store the field number as a varint.
makeTag :: Int32 -> FieldEncoding -> Integer
makeTag num enc =
    fromIntegral num `shiftL` 3 .|. wireType enc

fieldTag :: FieldInfo -> Integer
fieldTag f = makeTag (fieldDescriptor f ^. number) $ fieldInfoEncoding f

packedFieldTag :: FieldInfo -> Integer
packedFieldTag f = makeTag (fieldDescriptor f ^. number) lengthy

groupEndTag :: Int32 -> Integer
groupEndTag num = makeTag num groupEnd

-- | An expression that selects the overloaded field lens of this name.
--
-- lensOf' (proxy# :: Proxy# "fieldName")
lensOfExp :: Symbol -> Exp
lensOfExp sym = ("Lens.Labels.lensOf'"
                  @@ ("Lens.Labels.proxy#" @::@
                      ("Lens.Labels.Proxy#" @@ promoteSymbol sym)))

-- | Some functions that are used in multiple places in the generated code.
getVarInt', putVarInt', mempty', view', set', unknownFields' :: Exp
getVarInt' = "Data.ProtoLens.Encoding.Bytes.getVarInt"
putVarInt' = "Data.ProtoLens.Encoding.Bytes.putVarInt"
mempty' = "Data.Monoid.mempty"
view' = "Lens.Family2.view"
set' = "Lens.Family2.set"
unknownFields' = "Data.ProtoLens.unknownFields"

-- | Returns an expression of type @Parser a@ for the given field.
parseField :: FieldInfo -> Exp
parseField = parseFieldType . fieldInfoEncoding

-- | Returns a function corresponding to `a -> Builder`:
buildField :: FieldInfo -> Exp
buildField = buildFieldType . fieldInfoEncoding

fieldInfoEncoding :: FieldInfo -> FieldEncoding
fieldInfoEncoding = fieldEncoding . view type' . fieldDescriptor
