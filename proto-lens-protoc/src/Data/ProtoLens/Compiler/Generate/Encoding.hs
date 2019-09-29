-- | This module generates code for decoding and encoding protocol buffer messages.
--
-- Upstream docs: <https://developers.google.com/protocol-buffers/docs/encoding>
{-# LANGUAGE CPP #-}
{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE OverloadedStrings #-}
module Data.ProtoLens.Compiler.Generate.Encoding
    ( generatedParser
    , generatedBuilder
    ) where

import Data.Int (Int32)
import qualified Data.Map as Map
#if !MIN_VERSION_base(4,11,0)
import Data.Semigroup ((<>))
#endif
import qualified Data.Text as Text
import Lens.Family2 (view, (^.))
import GHC.SourceGen

import Data.ProtoLens.Compiler.Definitions
import Data.ProtoLens.Compiler.Generate.Field
import Data.ProtoLens.Encoding.Wire (joinTypeAndTag)

generatedParser :: Env RdrNameStr -> MessageInfo OccNameStr -> HsExpr'
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
    let' [typeSig loop loopSig
         , funBind loop $ match (bvar <$> loopArgs names) loopExpr
         ]
        $ var "Data.ProtoLens.Encoding.Bytes.<?>"
           @@ do' (startStmts ++ [stmt $ continue startExp])
           @@ string msgName
  where
    ty = var (unqual $ messageName m)
    msgName = Text.unpack (messageDescriptor m ^. #name)
    loopSig = foldr (-->)
        (var "Data.ProtoLens.Encoding.Bytes.Parser" @@ ty)
        (loopArgs $ parseStateTypes env m)

    names = parseStateNames m
    exprs = fmap (var . unqual) names
    tag = bvar "tag"
    end = bvar "end"
    loop = "loop"

    (startStmts, startExp) = startParse names

    continue :: ParseState HsExpr' -> HsExpr'
    continue s = foldl (@@) (var loop) (loopArgs s)

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
                (match [int (groupEndTag g)] (finish m exprs))
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
            [ end <-- var "Data.ProtoLens.Encoding.Bytes.atEnd"
            , stmt $
                if' end (finish m exprs)
                    $ do'
                        [ tag <-- getVarInt'
                        , stmt $ case' tag $ parseTagCases continue exprs m
                        ]
            ]

-- | A Parser expression that finalizes the message.
finish :: MessageInfo OccNameStr -> ParseState HsExpr' -> HsExpr'
finish m s = do' $
    {- do
        frozen'a <- unsafeLiftIO $ unsafeFreeze mutable'a
        frozen'b <- unsafeLiftIO $ unsafeFreeze mutable'b
        ...
        {checkMissingFields}
        over unknownFields reverse
            $ set field @"vec'a" frozen'a
            $ set field @"vec'b" frozen'b
            ...
            $ {partialMessage}
    -}
    [ bvar frozen <-- unsafeLiftIO' @@
                    (var "Data.ProtoLens.Encoding.Growing.unsafeFreeze"
                        @@ mutable)
    | (frozen, mutable) <- Map.elems $ Map.intersectionWith (,)
                                frozenNames (repeatedFieldMVectors s)
    ]
    ++
    [ stmt $ checkMissingFields s
    , stmt $ var "Prelude.return" @@
        (over' unknownFields' (var "Prelude.reverse")
            @@(foldr (@@)
                (partialMessage s)
                (Map.intersectionWith
                    (\finfo frozen ->
                        var "Lens.Family2.set"
                            @@ fieldOfVector finfo
                            @@ var (unqual frozen))
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
fieldId f = FieldId $ fieldDescriptor (plainFieldInfo f) ^. #name

-- | The names of the loop arguments.
parseStateNames :: MessageInfo OccNameStr -> ParseState OccNameStr
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

repeatedFields :: MessageInfo OccNameStr -> Map.Map FieldId FieldInfo
repeatedFields m = Map.fromList
    [ (fieldId f, plainFieldInfo f)
    | f <- messageFields m
    , RepeatedField{} <- [plainFieldKind f]
    ]

-- | Intialize the values of the loop arguments.
startParse :: ParseState OccNameStr -> ([Stmt'], ParseState HsExpr')
startParse names =
    ([ bvar n <-- unsafeLiftIO' @@ var "Data.ProtoLens.Encoding.Growing.new"
     | n <- Map.elems mvectorNames
     ]
    , ParseState
        { partialMessage = var "Data.ProtoLens.defMessage"
        , requiredFieldsUnset = const (var "Prelude.True")
                                    <$> requiredFieldsUnset names
        , repeatedFieldMVectors = var . unqual <$> mvectorNames
        }
    )
  where
    mvectorNames = repeatedFieldMVectors names

-- | The types of the loop arguments.
parseStateTypes :: Env RdrNameStr -> MessageInfo OccNameStr -> ParseState HsType'
parseStateTypes env m = ParseState
    { partialMessage = var $ unqual $ messageName m
    , requiredFieldsUnset = fmap (const $ var "Prelude.Bool")
                            $ requiredFieldsUnset
                            $ parseStateNames m
    , repeatedFieldMVectors = growingType env <$> repeatedFields m
    }

-- | Transform the loop arguments by applying a given function
-- to the intermediate message value.
updateParseState ::
       HsExpr' -- ^ An expression of type @msg -> msg@
    -> ParseState HsExpr'
    -> ParseState HsExpr'
updateParseState f s = s { partialMessage = f @@ (partialMessage s) }

-- | Transform the loop arguments by marking a required field
-- as having been set.
markRequiredField :: FieldId -> ParseState HsExpr' -> ParseState HsExpr'
markRequiredField f s =
    s { requiredFieldsUnset = Map.insert f (var "Prelude.False")
                                $ requiredFieldsUnset s }

-- | Append to the given repeated field.
appendToRepeated :: FieldId -> HsExpr' -> ParseState HsExpr' -> (Stmt', ParseState HsExpr')
appendToRepeated f x s =
    ( v <-- unsafeLiftIO'
                @@ (var "Data.ProtoLens.Encoding.Growing.append"
                        @@ (repeatedFieldMVectors s Map.! f)
                        @@ x)
    , s { repeatedFieldMVectors =
                            Map.insert f v
                                $ repeatedFieldMVectors s
                        }
    )
  where
    v = bvar "v"

-- | Returns an HsExpr' of type @Parser ()@
-- which fails if any of the missing fields aren't set.
checkMissingFields :: ParseState HsExpr' -> HsExpr'
checkMissingFields s =
    {- let missing = (if required'a then ("a":) else id)
                        ((if required'b then ("b":) else id)
                        ... [])
       in if null missing then return ()
          else fail ("Missing required fields: " ++ show missing)
    -}
    let' [valBind missing $ allMissingFields]
    $ if' (var "Prelude.null" @@ var missing) (var "Prelude.return" @@ unit)
    $ var "Prelude.fail"
        @@ (var "Prelude.++"
                @@ string "Missing required fields: "
                @@ (var "Prelude.show" @@ (var missing @::@ listTy (var "Prelude.String"))))
  where
    missing = "missing"
    allMissingFields = Map.foldrWithKey consIfMissing (list []) (requiredFieldsUnset s)
    consIfMissing (FieldId f) e rest =
        (if' e (cons @@ string (Text.unpack f)) (var "Prelude.id")) @@ rest

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
       (ParseState HsExpr' -> HsExpr')
            -- ^ loop continuation, equivalent to "msg -> Bool -> ... -> Bool -> Parser msg".
            -- It continues the loop with the given new value of the message, keeping track
            -- of whether the required fields are still needed.
    -> ParseState HsExpr' -- ^ Previous value of the message and required field states
    -> MessageInfo OccNameStr
    -> [RawMatch]
parseTagCases loop x info =
    concatMap (parseFieldCase loop x) allFields
    -- TODO: currently we ignore unknown fields.
    ++ [unknownFieldCase info loop x]
  where
    allFields = messageFields info
                -- Cases of a oneof are decoded like optional oneof fields.
                ++ [ PlainFieldInfo OptionalMaybeField (caseField c)
                   | o <- messageOneofFields info
                   , c <- oneofCases o
                   ]

-- | A particular parsing case.  See @parseTagCases@ for details.
parseFieldCase ::
    (ParseState HsExpr' -> HsExpr') -> ParseState HsExpr' -> PlainFieldInfo -> [RawMatch]
parseFieldCase loop x f = case plainFieldKind f of
    MapField entryInfo -> [mapCase entryInfo]
    RepeatedField p
        | p == NotPackable -> [unpackedCase]
        | otherwise -> [unpackedCase, packedCase]
    RequiredField -> [requiredCase]
    _ -> [valueCase]
  where
    y = bvar "y"
    entry = bvar "entry"
    info = plainFieldInfo f
    valueCase = match [int (fieldTag info)] $ do'
        [ y <-- parseField info
        , stmt . loop . updateParseState (setField info @@ y)
            $ x
        ]
    requiredCase = match [int (fieldTag info)] $ do'
        [ y <-- parseField info
        , stmt . loop
               . updateParseState (setField info @@ y)
               . markRequiredField (fieldId f)
               $ x
        ]
    unpackedCase = match [int (fieldTag info)]
        $ let (appendStmt, x') = appendToRepeated (fieldId f) y x
        in do'
            [ strictP y <-- parseField info
            , appendStmt
            , stmt . loop $ x'
            ]
    packedCase = match [int (packedFieldTag info)] $ do'
        [ y <-- isolatedLengthy (parsePackedField info
                                    @@ repeatedFieldMVectors x Map.! fieldId f)
        , stmt $ loop x { repeatedFieldMVectors =
                                Map.insert (fieldId f) y
                                    $ repeatedFieldMVectors x }
        ]
    mapCase entryInfo = match [int (fieldTag info)] $ do'
        [ strictP (entry `sigP` var (unqual $ mapEntryTypeName entryInfo))
                <-- parseField info
        , stmt . let' [ valBind "key"
                            $ view' @@ fieldOf (keyField entryInfo)
                                    @@ entry
                      , valBind "value"
                            $ view' @@ fieldOf (valueField entryInfo)
                                    @@ entry
                      ]
               . loop
               . updateParseState
                    (overField info
                                (var "Data.Map.insert" @@ var "key" @@ var "value"))
               $ x
        ]

unknownFieldCase ::
    MessageInfo OccNameStr -> (ParseState HsExpr' -> HsExpr') -> ParseState HsExpr' -> RawMatch
{-
  wire -> do
        !y <- parseTaggedValueFromWire wire
        -- Omitted if not a group:
        case y of
            TaggedValue utag EndGroup
                -> fail ("Mismatched group-end tag number " ++ show utag)
            _ -> return ()
        loop (over unknownFields (\!t -> y:t) x) ...
-}
unknownFieldCase info loop x = match [wire] $ do' $
    [ strictP y <-- var "Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire" @@ wire
    ]
    ++
    [ stmt $ case' y
        [ match
            [conP "Data.ProtoLens.Encoding.Wire.TaggedValue"
                [utag, conP_ "Data.ProtoLens.Encoding.Wire.EndGroup"]]
            $ var "Prelude.fail" @@
                (var "Prelude.++"
                    @@ string "Mismatched group-end tag number "
                    @@ (var "Prelude.show" @@ utag))
        , match [wildP] $ var "Prelude.return" @@ unit
        ]
    | Just _ <- [groupFieldNumber info]
    ]
    ++
    [ stmt . loop . updateParseState (over' unknownFields' (cons @@ y))
        $ x
    ]
  where
    wire = bvar "wire"
    y = bvar "y"
    utag = bvar "utag"

-- | An expression of type "b -> a -> a", corresponding to a Lens a b
-- for this field.
setField :: FieldInfo -> HsExpr'
setField f = var "Lens.Family2.set" @@ fieldOf f

-- | An expression of type "(b -> b) -> a -> a", corresponding to a
-- Lens a b for this field.
overField :: FieldInfo -> HsExpr' -> HsExpr'
overField f = over' (fieldOf f)

-- | An expression of type "(b -> b) -> a -> a".
--
-- Specifically, this renders to:
--   over f (\!z -> g z) x
-- The extra strictness prevents a space leak due to lists being lazy.
over' :: HsExpr' -> HsExpr' -> HsExpr'
over' f g = var "Lens.Family2.over"
                @@ f
                @@ lambda [strictP t] (g @@ t)
  where
    t = bvar "t"

-- | A "Growing v RealWorld a -> Parser (Growing v RealWorld a)"
-- for a field that can be packed.
parsePackedField :: FieldInfo -> HsExpr'
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
parsePackedField info = let' [funBind ploop $ match [qs] ploopExp]
                            (var ploop)
  where
    ploop = "ploop"
    q = bvar "q"
    qs = bvar "qs"
    qs' = bvar "qs'"
    packedEnd = bvar "packedEnd"
    ploopExp = do'
        [ packedEnd <-- var "Data.ProtoLens.Encoding.Bytes.atEnd"
        , stmt $
            if' packedEnd
                (var "Prelude.return" @@ qs)
                $ do'
                    [ strictP q <-- parseField info
                    , qs' <-- unsafeLiftIO' @@
                                (var "Data.ProtoLens.Encoding.Growing.append"
                                    @@ qs @@ q)
                    , stmt $ var ploop @@ qs'
                    ]
        ]

generatedBuilder :: MessageInfo OccNameStr -> HsExpr'
generatedBuilder m =
    lambda [x] $ foldMapExp $ map (buildPlainField x) (messageFields m)
                                ++ map (buildOneofField x) (messageOneofFields m)
                            ++ [buildUnknown x]
                            ++ buildGroupEnd
  where
    x = bvar "_x" -- TODO: rename to "x" once it's always used
    -- If this is a group, finish by emitting the end-group tag.
    buildGroupEnd = [ putVarInt' @@ int (groupEndTag g)
               | Just g <- [groupFieldNumber m]
               ]

buildUnknown :: HsExpr' -> HsExpr'
buildUnknown x
    = var "Data.ProtoLens.Encoding.Wire.buildFieldSet"
                @@ (view' @@ unknownFields' @@ x)

-- | Concatenate a list of Monoids into a single value.
-- For example, foldMapExp [a,b,c] will be transformed into
-- the (unrolled) expression a <> b <> c.
foldMapExp :: [HsExpr'] -> HsExpr'
foldMapExp [] = mempty'
foldMapExp [x] = x
foldMapExp (x:xs) = var "Data.Monoid.<>" @@ x @@ foldMapExp xs

-- | An expression of type @Builder@ which encodes the field value
-- @x@ based on the kind and type of the field @f@.
buildPlainField :: HsExpr' -> PlainFieldInfo -> HsExpr'
buildPlainField x f = case plainFieldKind f of
    RequiredField -> buildTaggedField info fieldValue
    OptionalMaybeField -> case' maybeFieldValue
                            [ match [conP_ "Prelude.Nothing"] mempty'
                            , match [conP "Prelude.Just" [v']]
                                $ buildTaggedField info v'
                            ]
    OptionalValueField -> let' [valBind v $ fieldValue]
                          $ if' (var "Prelude.==" @@ v' @@ var "Data.ProtoLens.fieldDefault")
                                mempty'
                                (buildTaggedField info v')
    MapField entryInfo
        -> var "Data.Monoid.mconcat"
            @@ (var "Prelude.map"
                    @@ lambda [v'] (buildEntry entryInfo v')
                    @@ (var "Data.Map.toList" @@ fieldValue))
    RepeatedField Packed -> buildPackedField info vectorFieldValue
    RepeatedField _ -> var "Data.ProtoLens.Encoding.Bytes.foldMapBuilder"
                            @@ lambda [v']
                                    (buildTaggedField info v')
                            @@ vectorFieldValue
  where
    info = plainFieldInfo f
    v = "_v"
    v' = bvar v
    fieldValue = view'
                    @@ fieldOf info
                    @@ x
    maybeFieldValue = view'
                        @@ fieldOfMaybe info
                        @@ x
    vectorFieldValue = view'
                        @@ fieldOfVector info
                        @@ x
    {- Builds a value of the given map entry type
       from the given key/value pair kv.

       ... set (fieldOf {KEY}) (fst kv)
            (set (fieldOf {VALUE}) (snd kv)
                (defMessage :: Foo'Entry)
    -}
    buildEntry entry kv
        = buildTaggedField info
            $ set'
                @@ fieldOf (keyField entry)
                @@ (var "Prelude.fst" @@ kv)
                @@ (set' @@ fieldOf (valueField entry)
                         @@ (var "Prelude.snd" @@ kv)
                         @@ (var "Data.ProtoLens.defMessage"
                                @::@ var (unqual $ mapEntryTypeName entry)))

fieldOf :: FieldInfo -> HsExpr'
fieldOf = fieldOfExp . overloadedFieldName

fieldOfMaybe :: FieldInfo -> HsExpr'
fieldOfMaybe = fieldOfExp . ("maybe'" <>) . overloadedFieldName

fieldOfOneof :: OneofInfo -> HsExpr'
fieldOfOneof =
    fieldOfExp . ("maybe'" <>) . overloadedName . oneofFieldName

fieldOfVector :: FieldInfo -> HsExpr'
fieldOfVector = fieldOfExp . ("vec'" <>) . overloadedFieldName

-- | Build a field along with its tag.
buildTaggedField :: FieldInfo -> HsExpr' -> HsExpr'
buildTaggedField f x = foldMapExp
    [ putVarInt' @@ int (fieldTag f)
    , buildField f @@ x
    ]

-- | Encodes a packed field as a byte string, along with
-- its wire type+number.
buildPackedField :: FieldInfo -> HsExpr' -> HsExpr'
{-
    let p = x -- where x might be a complicated expression
    in if null p then mempty
    else putVarInt {TAG}
            <> ... (runBuilder (mconcat (map {BUILD_ELT} p)))
-}
buildPackedField f x = let' [valBind p x]
    $ if' (var "Data.Vector.Generic.null" @@ var p) mempty'
    $ var "Data.Monoid.<>"
        @@ (putVarInt' @@ int (packedFieldTag f))
        @@ (buildFieldType lengthy
                @@ (var "Data.ProtoLens.Encoding.Bytes.runBuilder"
                    @@ (var "Data.ProtoLens.Encoding.Bytes.foldMapBuilder"
                            @@ buildField f
                            @@ var p)))
  where
    p = "p"

buildOneofField :: HsExpr' -> OneofInfo -> HsExpr'
buildOneofField x info = case' (view' @@ fieldOfOneof info @@ x) $
    (match [conP_ "Prelude.Nothing"] mempty')
    : [ match [conP "Prelude.Just" [conP (unqual $ caseConstructorName c)
                                 [v]]]
            $ buildTaggedField (caseField c) v
      | c <- oneofCases info
      ]
  where
    v = bvar "v"

-- | Compute the proto encoding's representation of the wire type
-- and field number.
--
-- The last three bits of the number store the wire type, and the
-- rest store the field number as a varint.
makeTag :: Int32 -> FieldEncoding -> Integer
makeTag num enc = fromIntegral $ joinTypeAndTag (fromIntegral num) (wireType enc)

fieldTag :: FieldInfo -> Integer
fieldTag f = makeTag (fieldDescriptor f ^. #number) $ fieldInfoEncoding f

packedFieldTag :: FieldInfo -> Integer
packedFieldTag f = makeTag (fieldDescriptor f ^. #number) lengthy

groupEndTag :: Int32 -> Integer
groupEndTag num = makeTag num groupEnd

-- | An expression that selects the overloaded field lens of this name.
--
-- field @"fieldName"
fieldOfExp :: Symbol -> HsExpr'
fieldOfExp sym = tyApp (var "Data.ProtoLens.Field.field") (promoteSymbol sym)

-- | Some functions that are used in multiple places in the generated code.
getVarInt', putVarInt', mempty', view', set', unknownFields', unsafeLiftIO'
    :: HsExpr'
getVarInt' = var "Data.ProtoLens.Encoding.Bytes.getVarInt"
putVarInt' = var "Data.ProtoLens.Encoding.Bytes.putVarInt"
mempty' = var "Data.Monoid.mempty"
view' = var "Lens.Family2.view"
set' = var "Lens.Family2.set"
unknownFields' = var "Data.ProtoLens.unknownFields"
unsafeLiftIO' = var "Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO"

-- | Returns an expression of type @Parser a@ for the given field.
parseField :: FieldInfo -> HsExpr'
parseField f = var "Data.ProtoLens.Encoding.Bytes.<?>"
                    @@ (parseFieldType $ fieldInfoEncoding f)
                    @@ string n
  where
    n = Text.unpack (fieldDescriptor f ^. #name)

-- | Returns a function corresponding to `a -> Builder`:
buildField :: FieldInfo -> HsExpr'
buildField = buildFieldType . fieldInfoEncoding

fieldInfoEncoding :: FieldInfo -> FieldEncoding
fieldInfoEncoding = fieldEncoding . view #type' . fieldDescriptor

growingType :: Env RdrNameStr -> FieldInfo -> HsType'
growingType env f
    = var "Data.ProtoLens.Encoding.Growing.Growing"
        @@ hsFieldVectorType f
        @@ var "Data.ProtoLens.Encoding.Growing.RealWorld"
        @@ hsFieldType env f
