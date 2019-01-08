-- | This module generates code for decoding and encoding protocol buffer messages.
--
-- Upstream docs: <https://developers.google.com/protocol-buffers/docs/encoding>
{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE OverloadedStrings #-}
module Data.ProtoLens.Compiler.Generate.Encoding
    ( generatedParser
    , generatedBuilder
    ) where

import Data.Int (Int32)
import qualified Data.Map as Map
import Data.Semigroup ((<>))
import qualified Data.Text as Text
import Lens.Family2 (view, (^.))

import Data.ProtoLens.Compiler.Combinators
import Data.ProtoLens.Compiler.Definitions
import Data.ProtoLens.Compiler.Generate.Field
import Data.ProtoLens.Encoding.Wire (joinTypeAndTag)

import Proto.Google.Protobuf.Descriptor_Fields
    ( name
    , number
    , type'
    )

generatedParser :: Env QName -> MessageInfo Name -> Exp
generatedParser env m =
    {- let loop :: T -> Bool -> Bool -> ...
                   -> MVector RealWorld Int32 -> MVector RealWorld Float -> ...
                   -> Parser T
           loop x required'a required'b ... mutable'a mutable'b ... = ...
       in "package.T" <?> do
            mutable'a <- unsafeLiftIO new
            mutable'b <- unsafeLiftIO new
            ...
            loop defMessage True True ... mutable'a mutable'b ...
    -}
    let' [typeSig [loop] loopSig
         , funBind [match loop (fmap pVar $ loopArgs names) loopExpr]
         ]
        $ "Data.ProtoLens.Encoding.Bytes.<?>"
           @@ do' (startStmts ++ [stmt $ continue startExp])
           @@ stringExp msgName
  where
    ty = tyCon (unQual $ messageName m)
    msgName = Text.unpack (messageDescriptor m ^. name)
    loopSig = foldr tyFun
        ("Data.ProtoLens.Encoding.Bytes.Parser" @@ ty)
        (loopArgs $ parseStateTypes env m)

    names = parseStateNames m
    exprs = fmap (var . unQual) names
    tag = "tag"
    end = "end"
    loop = "loop"

    (startStmts, startExp) = startParse names

    continue :: ParseState Exp -> Exp
    continue s = foldl (@@) loop (loopArgs s)

    loopExpr
        {- Group:
            do
              tag <- getVarInt
              case tag of
                {groupEndTag} -> {finish}
                ... -- Regular message fields

          TODO(#282): fail the parse if we find a group-end tag
          with an incorrect field number.
        -}
        | Just g <- groupFieldNumber m = do'
            [ tag <-- getVarInt'
            , stmt $ case' tag $
                (pLitInt (groupEndTag g) --> finish m exprs)
                    : parseTagCases continue exprs m
            ]
        {- Regular message type:
              do
                end <- atEnd
                if end
                    then {finish}
                    else do
                        tag <- getVarInt
                        case tag of ...
        -}
        | otherwise = do'
            [ end <-- "Data.ProtoLens.Encoding.Bytes.atEnd"
            , stmt $
                if' end (finish m exprs)
                    $ do'
                        [ tag <-- getVarInt'
                        , stmt $ case' tag $ parseTagCases continue exprs m
                        ]
            ]

-- | A Parser expression that finalizes the message.
finish :: MessageInfo Name -> ParseState Exp -> Exp
finish m s = do' $
    {- do
        frozen'a <- unsafeLiftIO $ unsafeFreeze mutable'a
        frozen'b <- unsafeLiftIO $ unsafeFreeze mutable'b
        ...
        {checkMissingFields}
        over unknownFields reverse
            $ set (lensOf' proxy# :: Proxy# vec'a) frozen'a
            $ set (lensOf' proxy# :: Proxy# vec'b) frozen'b
            ...
            $ {partialMessage}
    -}
    [ pVar frozen <-- unsafeLiftIO' @@
                    ("Data.ProtoLens.Encoding.Growing.unsafeFreeze"
                        @@ mutable)
    | (frozen, mutable) <- Map.elems $ Map.intersectionWith (,)
                                frozenNames (repeatedFieldMVectors s)
    ]
    ++
    [ stmt $ checkMissingFields s
    , stmt $ "Prelude.return" @@
        (over' unknownFields' "Prelude.reverse"
            @@(foldr (@@)
                (partialMessage s)
                (Map.intersectionWith
                    (\finfo frozen ->
                        "Lens.Family2.set"
                            @@ lensOfVectorField finfo
                            @@ var (unQual frozen))
                repeatedInfos frozenNames)))
            ]

  where
    repeatedInfos = repeatedFields m
    frozenNames = (\f -> nameFromSymbol $ "frozen'" <> overloadedFieldName f)
                    <$> repeatedInfos

-- | The state of the parsing loop.  Each instance of @v@ corresponds
-- to an argument of the loop function.
data ParseState v = ParseState
    { partialMessage :: v
        -- ^ The message that we're parsing.
    , requiredFieldsUnset :: Map.Map FieldId v
        -- ^ The required fields of the message, each corresponding to
        -- a @Bool@ argument of the loop.
    , repeatedFieldMVectors :: Map.Map FieldId v
        -- ^ The repeated fields of the message, each corresponding to
        -- an @MVector@ argument of the loop.
    } deriving Functor

-- | Returns a sequence of all arguments of the loop function.
loopArgs :: ParseState v -> [v]
loopArgs s = partialMessage s : Map.elems (requiredFieldsUnset s)
                                ++ Map.elems (repeatedFieldMVectors s)

-- | The proto name of the field.
newtype FieldId = FieldId Text.Text
    deriving (Eq, Ord)

fieldId :: PlainFieldInfo -> FieldId
fieldId f = FieldId $ fieldDescriptor (plainFieldInfo f) ^. name

-- | The names of the loop arguments.
parseStateNames :: MessageInfo Name -> ParseState Name
parseStateNames m = ParseState
    { partialMessage = "x"
    , requiredFieldsUnset = Map.fromList
        [ (fieldId f, nameFromSymbol $ "required'" <> n)
        | f <- messageFields m
        , let info = plainFieldInfo f
        , let n = overloadedFieldName info
        , RequiredField <- [plainFieldKind f]
        ]
    , repeatedFieldMVectors =
        (\f -> nameFromSymbol $ "mutable'" <> overloadedFieldName f)
            <$> repeatedFields m
    }

repeatedFields :: MessageInfo Name -> Map.Map FieldId FieldInfo
repeatedFields m = Map.fromList
    [ (fieldId f, plainFieldInfo f)
    | f <- messageFields m
    , RepeatedField{} <- [plainFieldKind f]
    ]

-- | Intialize the values of the loop arguments.
startParse :: ParseState Name -> ([Stmt], ParseState Exp)
startParse names =
    ([ pVar n <-- unsafeLiftIO' @@ "Data.ProtoLens.Encoding.Growing.new"
     | n <- Map.elems mvectorNames
     ]
    , ParseState
        { partialMessage = "Data.ProtoLens.defMessage"
        , requiredFieldsUnset = const "Prelude.True"
                                    <$> requiredFieldsUnset names
        , repeatedFieldMVectors = var . unQual <$> mvectorNames
        }
    )
  where
    mvectorNames = repeatedFieldMVectors names

-- | The types of the loop arguments.
parseStateTypes :: Env QName -> MessageInfo Name -> ParseState Type
parseStateTypes env m = ParseState
    { partialMessage = tyCon (unQual $ messageName m)
    , requiredFieldsUnset = fmap (const "Prelude.Bool")
                            $ requiredFieldsUnset
                            $ parseStateNames m
    , repeatedFieldMVectors = growingType env <$> repeatedFields m
    }

-- | Transform the loop arguments by applying a given function
-- to the intermediate message value.
updateParseState ::
       Exp -- ^ An expression of type @msg -> msg@
    -> ParseState Exp
    -> ParseState Exp
updateParseState f s = s { partialMessage = f @@ (partialMessage s) }

-- | Transform the loop arguments by marking a required field
-- as having been set.
markRequiredField :: FieldId -> ParseState Exp -> ParseState Exp
markRequiredField f s =
    s { requiredFieldsUnset = Map.insert f "Prelude.False"
                                $ requiredFieldsUnset s }

-- | Append to the given repeated field.
appendToRepeated :: FieldId -> Exp -> ParseState Exp -> (Stmt, ParseState Exp)
appendToRepeated f x s =
    ( v <-- unsafeLiftIO'
                @@ ("Data.ProtoLens.Encoding.Growing.append"
                        @@ (repeatedFieldMVectors s Map.! f)
                        @@ x)
    , s { repeatedFieldMVectors =
                            Map.insert f (var $ unQual v)
                                $ repeatedFieldMVectors s
                        }
    )
  where
    v = "v"

-- | Returns an Exp of type @Parser ()@
-- which fails if any of the missing fields aren't set.
checkMissingFields :: ParseState Exp -> Exp
checkMissingFields s =
    {- let missing = (if required'a then ("a":) else id)
                        ((if required'b then ("b":) else id)
                        ... [])
       in if null missing then return ()
          else fail ("Missing required fields: " ++ show missing)
    -}
    let' [patBind missing allMissingFields]
    $ if' ("Prelude.null" @@ missing) ("Prelude.return" @@ unit)
    $ "Prelude.fail"
        @@ ("Prelude.++"
                @@ stringExp "Missing required fields: "
                @@ ("Prelude.show" @@ (missing @::@ "[Prelude.String]")))
  where
    missing = "missing"
    allMissingFields = Map.foldrWithKey consIfMissing emptyList (requiredFieldsUnset s)
    consIfMissing (FieldId f) e rest =
        (if' e (cons @@ stringExp (Text.unpack f)) "Prelude.id") @@ rest

-- | A list case alternatives for the fields of a message.
--
-- The exact structure of each case differs based on the field type.  However, it
-- generally looks like:
--
-- @
--   {N} -> do
--           {VALUE} <- {PARSE}
--           loop (set {FIELD} {VALUE} x) required'a False required'c ...
-- @
--
-- where:
--  - {N} is an integer representing the wire type + field number,
--  - {VALUE} is an expression of type "V", which is the type of the field,
--  - {PARSE} is an expression of the form "Parser V",
--  - and "loop" and "x" are as in @generatedParser@.
parseTagCases ::
       (ParseState Exp -> Exp)
            -- ^ loop continuation, equivalent to "msg -> Bool -> ... -> Bool -> Parser msg".
            -- It continues the loop with the given new value of the message, keeping track
            -- of whether the required fields are still needed.
    -> ParseState Exp -- ^ Previous value of the message and required field states
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
    (ParseState Exp -> Exp) -> ParseState Exp -> PlainFieldInfo -> [Alt]
parseFieldCase loop x f = case plainFieldKind f of
    MapField entryInfo -> [mapCase entryInfo]
    RepeatedField p
        | p == NotPackable -> [unpackedCase]
        | otherwise -> [unpackedCase, packedCase]
    RequiredField -> [requiredCase]
    _ -> [valueCase]
  where
    y = "y"
    entry = "entry"
    info = plainFieldInfo f
    valueCase = pLitInt (fieldTag info) --> do'
        [ y <-- parseField info
        , stmt . loop . updateParseState (setField info @@ y)
            $ x
        ]
    requiredCase = pLitInt (fieldTag info) --> do'
        [ y <-- parseField info
        , stmt . loop
               . updateParseState (setField info @@ y)
               . markRequiredField (fieldId f)
               $ x
        ]
    unpackedCase = pLitInt (fieldTag info) -->
        let (appendStmt, x') = appendToRepeated (fieldId f) y x
        in do'
            [ bangPat y <-- parseField info
            , appendStmt
            , stmt . loop $ x'
            ]
    packedCase = pLitInt (packedFieldTag info) --> do'
        [ y <-- isolatedLengthy (parsePackedField info
                                    @@ repeatedFieldMVectors x Map.! fieldId f)
        , stmt $ loop x { repeatedFieldMVectors =
                                Map.insert (fieldId f) (var $ unQual y)
                                    $ repeatedFieldMVectors x }
        ]
    mapCase entryInfo = pLitInt (fieldTag info) --> do'
        [ bangPat (entry `patTypeSig` tyCon (unQual $ mapEntryTypeName entryInfo))
                <-- parseField info
        , stmt . let' [ patBind "key"
                            $ view' @@ lensOfField (keyField entryInfo)
                                    @@ entry
                      , patBind "value"
                            $ view' @@ lensOfField (valueField entryInfo)
                                    @@ entry
                      ]
               . loop
               . updateParseState
                    (overField info
                                ("Data.Map.insert" @@ "key" @@ "value"))
               $ x
        ]

unknownFieldCase ::
    (ParseState Exp -> Exp) -> ParseState Exp -> Alt
unknownFieldCase loop x = wire --> do'
    [ bangPat y <-- "Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire" @@ wire
    , stmt . loop . updateParseState (over' unknownFields' (cons @@ y))
        $ x
    ]
  where
    wire = "wire"
    y = "y"

-- | An expression of type "b -> a -> a", corresponding to a Lens a b
-- for this field.
setField :: FieldInfo -> Exp
setField f = "Lens.Family2.set" @@ lensOfField f

-- | An expression of type "(b -> b) -> a -> a", corresponding to a
-- Lens a b for this field.
overField :: FieldInfo -> Exp -> Exp
overField f = over' (lensOfField f)

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

-- | A "Growing v RealWorld a -> Parser (Growing v RealWorld a)"
-- for a field that can be packed.
parsePackedField :: FieldInfo -> Exp
{- let ploop qs = do
                    packedEnd <- atEnd
                    if packedEnd
                        then return qs
                        else do
                            !q <- {PARSE FIELD}
                            qs' <- append qs q
                            ploop qs'
   in ploop
-}
parsePackedField info = let' [funBind [match ploop [qs] ploopExp]]
                            ploop
  where
    ploop = "ploop"
    q = "q"
    qs = "qs"
    qs' = "qs'"
    packedEnd = "packedEnd"
    ploopExp = do'
        [ packedEnd <-- "Data.ProtoLens.Encoding.Bytes.atEnd"
        , stmt $
            if' packedEnd
                ("Prelude.return" @@ qs)
                $ do'
                    [ bangPat q <-- parseField info
                    , qs' <-- unsafeLiftIO' @@
                                ("Data.ProtoLens.Encoding.Growing.append"
                                    @@ qs @@ q)
                    , stmt $ ploop @@ qs'
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
    = "Data.ProtoLens.Encoding.Wire.buildFieldSet"
                @@ (view' @@ unknownFields' @@ x)

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
    OptionalValueField -> let' [patBind v fieldValue]
                          $ if' ("Prelude.==" @@ v @@ "Data.ProtoLens.fieldDefault")
                                mempty'
                                (buildTaggedField info v)
    MapField entryInfo
        -> "Data.Monoid.mconcat"
            @@ ("Prelude.map"
                    @@ lambda [v] (buildEntry entryInfo v)
                    @@ ("Data.Map.toList" @@ fieldValue))
    RepeatedField Packed -> buildPackedField info vectorFieldValue
    RepeatedField _ -> "Data.ProtoLens.Encoding.Bytes.foldMapBuilder"
                            @@ lambda [v]
                                    (buildTaggedField info v)
                            @@ vectorFieldValue
  where
    info = plainFieldInfo f
    v = "_v"
    fieldValue = view'
                    @@ lensOfField info
                    @@ x
    maybeFieldValue = view'
                        @@ lensOfMaybeField info
                        @@ x
    vectorFieldValue = view'
                        @@ lensOfVectorField info
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

lensOfField :: FieldInfo -> Exp
lensOfField = lensOfExp . overloadedFieldName

lensOfMaybeField :: FieldInfo -> Exp
lensOfMaybeField = lensOfExp . ("maybe'" <>) . overloadedFieldName

lensOfOneofField :: OneofInfo -> Exp
lensOfOneofField =
    lensOfExp . ("maybe'" <>) . overloadedName . oneofFieldName

lensOfVectorField :: FieldInfo -> Exp
lensOfVectorField = lensOfExp . ("vec'" <>) . overloadedFieldName

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
buildPackedField f x = let' [patBind p x]
    $ if' ("Data.Vector.Generic.null" @@ p) mempty'
    $ "Data.Monoid.<>"
        @@ (putVarInt' @@ litInt (packedFieldTag f))
        @@ (buildFieldType lengthy
                @@ ("Data.ProtoLens.Encoding.Bytes.runBuilder"
                    @@ ("Data.ProtoLens.Encoding.Bytes.foldMapBuilder"
                            @@ buildField f
                            @@ p)))
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
makeTag num enc = fromIntegral $ joinTypeAndTag (fromIntegral num) (wireType enc)

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
getVarInt', putVarInt', mempty', view', set', unknownFields', unsafeLiftIO'
    :: Exp
getVarInt' = "Data.ProtoLens.Encoding.Bytes.getVarInt"
putVarInt' = "Data.ProtoLens.Encoding.Bytes.putVarInt"
mempty' = "Data.Monoid.mempty"
view' = "Lens.Family2.view"
set' = "Lens.Family2.set"
unknownFields' = "Data.ProtoLens.unknownFields"
unsafeLiftIO' = "Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO"

-- | Returns an expression of type @Parser a@ for the given field.
parseField :: FieldInfo -> Exp
parseField f = "Data.ProtoLens.Encoding.Bytes.<?>"
                    @@ (parseFieldType $ fieldInfoEncoding f)
                    @@ stringExp n
  where
    n = Text.unpack (fieldDescriptor f ^. name)

-- | Returns a function corresponding to `a -> Builder`:
buildField :: FieldInfo -> Exp
buildField = buildFieldType . fieldInfoEncoding

fieldInfoEncoding :: FieldInfo -> FieldEncoding
fieldInfoEncoding = fieldEncoding . view type' . fieldDescriptor

growingType :: Env QName -> FieldInfo -> Type
growingType env f
    = "Data.ProtoLens.Encoding.Growing.Growing"
        @@ hsFieldVectorType f
        @@ "Data.ProtoLens.Encoding.Growing.RealWorld"
        @@ hsFieldType env f
