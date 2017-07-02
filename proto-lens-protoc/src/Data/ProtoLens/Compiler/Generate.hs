-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

-- | This module builds the actual, generated Haskell file
-- for a given input .proto file.
{-# LANGUAGE OverloadedStrings #-}
module Data.ProtoLens.Compiler.Generate(
    generateModule,
    fileSyntaxType,
    ModifyImports,
    reexported,
    ) where


import Control.Arrow (second)
import qualified Data.Foldable as F
import qualified Data.List as List
import qualified Data.Map as Map
import Data.Maybe (isNothing)
import Data.Ord (comparing)
import qualified Data.Set as Set
import Data.String (fromString)
import Data.Text (unpack)
import qualified Data.Text as T
import Data.Tuple (swap)
import Lens.Family2 ((^.))
import Proto.Google.Protobuf.Descriptor
    ( EnumValueDescriptorProto
    , FieldDescriptorProto
    , FieldDescriptorProto'Label(..)
    , FieldDescriptorProto'Type(..)
    , FileDescriptorProto
    , defaultValue
    , label
    , mapEntry
    , maybe'oneofIndex
    , maybe'packed
    , name
    , number
    , options
    , syntax
    , type'
    , typeName
    )

import Data.ProtoLens.Compiler.Combinators
import Data.ProtoLens.Compiler.Definitions

data SyntaxType = Proto2 | Proto3
    deriving Eq

fileSyntaxType :: FileDescriptorProto -> SyntaxType
fileSyntaxType f = case f ^. syntax of
    "proto2" -> Proto2
    "proto3" -> Proto3
    "" -> Proto2  -- The proto compiler doesn't set syntax for proto2 files.
    s -> error $ "Unknown syntax type " ++ show s

-- Whether to import the "Reexport" modules or the originals;
-- e.g., Data.ProtoLens.Reexport.Data.Map vs Data.Map.
data UseReexport = UseReexport | UseOriginal
    deriving (Eq, Read)

-- | Generate a Haskell module for the given input file(s).
-- input contains all defined names, incl. those in this module
generateModule :: ModuleName
               -> [ModuleName]  -- ^ The imported modules
               -> SyntaxType
               -> ModifyImports
               -> Env Name      -- ^ Definitions in this file
               -> Env QName     -- ^ Definitions in the imported modules
               -> Module
generateModule modName imports syntaxType modifyImport definitions importedEnv
    = module' modName
          [ languagePragma $ map fromString
              ["ScopedTypeVariables", "DataKinds", "TypeFamilies",
               "UndecidableInstances",
               "MultiParamTypeClasses", "FlexibleContexts", "FlexibleInstances",
               "PatternSynonyms", "MagicHash", "NoImplicitPrelude"]
              -- Allow unused imports in case we don't import anything from
              -- Data.Text, Data.Int, etc.
          , optionsGhcPragma "-fno-warn-unused-imports"
          ]
          (map (modifyImport . importSimple)
              [ "Prelude", "Data.Int", "Data.Word"
              , "Data.ProtoLens", "Data.ProtoLens.Message.Enum"
              , "Lens.Family2", "Lens.Family2.Unchecked", "Data.Default.Class"
              , "Data.Text",  "Data.Map" , "Data.ByteString"
              , "Lens.Labels"
              ]
            ++ map importSimple imports)
          (concatMap generateDecls (Map.elems definitions)
           ++ concatMap generateFieldDecls allFieldNames)
  where
    env = Map.union (unqualifyEnv definitions) importedEnv
    generateDecls (Message m) = generateMessageDecls syntaxType env m
    generateDecls (Enum e) = generateEnumDecls e
    allFieldNames = F.toList $ Set.fromList
        [ fieldSymbol i
        | Message m <- Map.elems definitions
        , f <- messageFields m
        , i <- fieldInstances (lensInfo syntaxType env f)
        ]

importSimple :: ModuleName -> ImportDecl ()
importSimple m = ImportDecl
    { importAnn = ()
    , importModule = m
    -- Import qualified to avoid clashes with names defined in this module.
    , importQualified = True
    , importSrc = False
    , importSafe = False
    , importPkg = Nothing
    , importAs = Nothing
    , importSpecs = Nothing
    }

type ModifyImports = ImportDecl () -> ImportDecl ()

reexported :: ModifyImports
reexported imp@ImportDecl {importModule = m}
    = imp { importAs = Just m, importModule = m' }
  where
    m' = fromString $ "Data.ProtoLens.Reexport." ++ prettyPrint m

generateMessageDecls :: SyntaxType -> Env QName -> MessageInfo Name -> [Decl]
generateMessageDecls syntaxType env info =
    -- data Bar = Bar {
    --    foo :: Baz
    -- }
    [ dataDecl dataName
        [recDecl dataName $
                  [ (recordFieldName f, internalType (lensInfo syntaxType env f))
                  | f@(FieldInfo _ _ _ Nothing) <- fields
                  ] ++
                  [ (ooFieldName, "Prelude.Maybe" @@ (fromString ooTypeName))
                  | OneofInfo ooTypeName ooFieldName <- oneofFields
                  ]
        ]
        ["Prelude.Show", "Prelude.Eq"]
    ] ++

    -- oneof field data type declarations
    -- proto: message Foo {
    --          oneof bar {
    --            float c = 1;
    --            Sub s = 2;
    --          }
    --        }
    -- haskell: data Foo'Bar = Foo'Bar'c !Prelude.Float
    --                       | Foo'Bar's !Sub
    [ dataDecl (fromString ooTypeName)
      [ conDecl consName [internalType (lensInfo syntaxType env f)]
      | f @ (FieldInfo _ _ desc (Just (OneofFieldInfo consName _))) <- fields
      , elem idx (desc ^. maybe'oneofIndex)
      ]
      ["Prelude.Show", "Prelude.Eq"]
    | (OneofInfo ooTypeName _, idx) <- zip oneofFields [0..]
    ] ++


    -- type instance (Functor f, a ~ Baz, b ~ Baz)
    --     => HasLens "foo" f Bar Bar a b where
    --   lensOf _ = ...
    -- Note: for optional fields, this generates an instance both for "foo" and
    -- for "maybe'foo" (see lensInfo below).
    [ instDecl [equalP "a" t, equalP "b" t, classA "Prelude.Functor" ["f"]]
        ("Lens.Labels.HasLens" `ihApp`
            [sym, "f", dataType, dataType, "a", "b"])
            [[match "lensOf" [pWildCard] $ fieldAccessor i]]
    | f <- fields
    , i <- fieldInstances (lensInfo syntaxType env f)
    , let t = fieldTypeInstance i
    , let sym = tyPromotedString $ fieldSymbol i
    ]
    ++
    -- instance Data.Default.Class.Default Bar where
    [ instDecl [] ("Data.Default.Class.Default" `ihApp` [dataType])
        -- def = Bar { _Bar_foo = 0 }
        [
            [ match "def" []
                $ recConstr (unQual dataName) $
                      [ fieldUpdate (unQual $ recordFieldName f)
                            (hsFieldDefault syntaxType env (fieldDescriptor f))
                      | f@(FieldInfo _ _ _ Nothing) <- fields
                      ] ++
                      [ fieldUpdate (unQual $ fieldName) "Prelude.Nothing"
                      | OneofInfo _ fieldName <- oneofFields
                      ]
            ]
        ]
    -- instance Message.Message Bar where
    , instDecl [] ("Data.ProtoLens.Message" `ihApp` [dataType])
        [[match "descriptor" [] $ descriptorExpr syntaxType env info]]
    ]
  where
    dataType = tyCon $ unQual dataName
    MessageInfo { messageName = dataName, messageFields = fields, messageOneofFields = oneofFields } = info

generateEnumDecls :: EnumInfo Name -> [Decl]
generateEnumDecls info =
    [ dataDecl dataName
        [conDecl n [] | n <- constructorNames]
        ["Prelude.Show", "Prelude.Eq"]
    -- instance Data.Default.Class.Default Foo where
    --   def = FirstEnumValue
    , instDecl [] ("Data.Default.Class.Default" `ihApp` [dataType])
        [[match "def" [] defaultCon]]
    -- instance Data.ProtoLens.FieldDefault Foo where
    --   fieldDefault = FirstEnumValue
    , instDecl [] ("Data.ProtoLens.FieldDefault" `ihApp` [dataType])
        [[match "fieldDefault" [] defaultCon]]
    -- instance MessageEnum Foo where
    --    maybeToEnum 1 = Just Foo1
    --    maybeToEnum 2 = Just Foo2
    --    ...
    --    maybeToEnum _ = Nothing
    --    showEnum Foo1 = "Foo1"
    --    showEnum Foo2 = "Foo2"
    --    ...
    --    readEnum "Foo1" = Just Foo1
    --    readEnum "Foo2" = Just Foo2
    --    ...
    --    readEnum _ = Nothing
    , instDecl [] ("Data.ProtoLens.MessageEnum" `ihApp` [dataType])
        [
            [ match "maybeToEnum" [pLitInt k]
                $ "Prelude.Just" @@ con (unQual n)
            | (n, k) <- constructorNumbers
            ]
            ++
            [ match "maybeToEnum" [pWildCard] "Prelude.Nothing"
            ]
            ++
            [ match "showEnum" [pVar n] $ stringExp $ T.unpack pn
            | (n, pn) <- constructorProtoNames
            ]
            ++
            [ match "readEnum" [stringPat $ T.unpack pn]
                $ "Prelude.Just" @@ con (unQual n)
            | (n, pn) <- constructorProtoNames
            ]
            ++
            [ match "readEnum" [pWildCard] "Prelude.Nothing"
            ]
        ]
    -- instance Enum Foo where
    --    toEnum k = maybe (error ("Foo.toEnum: unknown argument for enum Foo: "
    --                                ++ show k))
    --                  id (maybeToEnum k)
    --    fromEnum Foo1 = 1
    --    fromEnum Foo2 = 2
    --    ..
    --    succ FooN = error "Foo.succ: bad argument FooN."
    --    succ Foo1 = Foo2
    --    succ Foo2 = Foo3
    --    ..
    --    pred Foo1 = error "Foo.succ: bad argument Foo1."
    --    pred Foo2 = Foo1
    --    pred Foo3 = Foo2
    --    ..
    --    enumFrom = messageEnumFrom
    --    enumFromTo = messageEnumFromTo
    --    enumFromThen = messageEnumFromThen
    --    enumFromThenTo = messageEnumFromThenTo
    , instDecl [] ("Prelude.Enum" `ihApp` [dataType])
        [[match "toEnum" ["k__"]
                  $ "Prelude.maybe" @@ errorMessageExpr @@ "Prelude.id"
                        @@ ("Data.ProtoLens.maybeToEnum" @@ "k__")]
        , [ match "fromEnum" [pApp (unQual c) []] $ litInt k
          | (c, k) <- constructorNumbers
          ]
        , succDecl "succ" maxBoundName succPairs
        , succDecl "pred" minBoundName $ map swap succPairs
        , alias "enumFrom" "Data.ProtoLens.Message.Enum.messageEnumFrom"
        , alias "enumFromTo" "Data.ProtoLens.Message.Enum.messageEnumFromTo"
        , alias "enumFromThen" "Data.ProtoLens.Message.Enum.messageEnumFromThen"
        , alias "enumFromThenTo"
            "Data.ProtoLens.Message.Enum.messageEnumFromThenTo"
        ]
    -- instance Bounded Foo where
    --    minBound = Foo1
    --    maxBound = FooN
    , instDecl [] ("Prelude.Bounded" `ihApp` [dataType])
        [[ match "minBound" [] $ con $ unQual minBoundName
         , match "maxBound" [] $ con $ unQual maxBoundName
         ]]
    ]
    ++
    -- pattern FooAlias :: Foo
    -- pattern FooAlias = FooConstructor
    concat
        [ [ patSynSig aliasName dataType
          , patSyn (pVar aliasName) (pVar originalName)
          ]
        | EnumValueInfo
            { enumValueName = aliasName
            , enumAliasOf = Just originalName
            } <- enumValues info
        ]
  where
    dataType = tyCon $ unQual dataName
    EnumInfo { enumName = dataName, enumDescriptor = ed } = info
    constructors :: [(Name, EnumValueDescriptorProto)]
    constructors = List.sortBy (comparing ((^. number) . snd))
                            [(n, d) | EnumValueInfo
                                { enumValueName = n
                                , enumValueDescriptor = d
                                , enumAliasOf = Nothing
                                } <- enumValues info
                            ]
    constructorNames = map fst constructors
    minBoundName = head constructorNames
    maxBoundName = last constructorNames

    constructorProtoNames = map (second (^. name)) constructors
    constructorNumbers = map (second (fromIntegral . (^. number)))
                          constructors

    succPairs = zip constructorNames $ tail constructorNames
    succDecl funName boundName thePairs =
        match funName [pApp (unQual boundName) []]
            ("Prelude.error" @@ stringExp (concat
                [ prettyPrint dataName, ".", prettyPrint funName, ": bad argument "
                , prettyPrint boundName, ". This value would be out of bounds."
                ]))
        :
        [ match funName [pApp (unQual from) []] $ con $ unQual to
        | (from, to) <- thePairs
        ]
    alias funName implName = [match funName [] implName]

    defaultCon = con $ unQual $ head constructorNames
    errorMessageExpr = "Prelude.error"
                          @@ ("Prelude.++" @@ stringExp errorMessage
                              @@ ("Prelude.show" @@ "k__"))
    errorMessage = "toEnum: unknown value for enum " ++ unpack (ed ^. name)
                      ++ ": "

generateFieldDecls :: String -> [Decl]
generateFieldDecls xStr =
    -- foo :: forall x f s t a b
    --        . HasLens x f s t a b => LensLike f s t a b
    -- -- Note: `Lens.Family2.LensLike f` implies Functor f.
    -- foo = lensOf (Proxy# :: Proxy# x)
    [ typeSig [x]
          $ tyForAll ["f", "s", "t", "a", "b"]
                  [classA "Lens.Labels.HasLens" [xSym, "f", "s", "t", "a", "b"]]
                    $ "Lens.Family2.LensLike" @@ "f" @@ "s" @@ "t" @@ "a" @@ "b"
    , funBind [match x []
                  $ "Lens.Labels.lensOf"
                      @@ ("Lens.Labels.proxy#" @::@
                          ("Lens.Labels.Proxy#" @@ xSym))
              ]
    ]
  where
    x = fromString xStr
    xSym = tyPromotedString xStr

------------------------------------------

-- | The Haskell types and lenses for an individual field of a message.
-- This is used to generate both the data record Decl and the instances of
-- HasField.
data LensInfo = LensInfo
    { internalType :: Type  -- ^ Internal type in the record
    , fieldInstances :: [FieldInstanceInfo]  -- ^ All instances of Field/HasField
    }

data FieldInstanceInfo = FieldInstanceInfo
    { fieldSymbol :: String      -- ^ The name of the Symbol corresponding to
                                 --   this field.
    , fieldTypeInstance :: Type  -- ^ The type instance for Field, i.e.,
                                 --     type instance Field "foo" Bar = ...
    , fieldAccessor :: Exp       -- ^ The value of the "field" lens for this
                                 --   field, i.e.,
                                 --     field _ = ...
    }

-- | Compile information about the record field type and type/class instances
-- for this particular field.
lensInfo :: SyntaxType -> Env QName -> FieldInfo -> LensInfo
lensInfo syntaxType env f = case fd ^. label of
    -- data Foo = Foo { _Foo_bar :: Bar }
    -- type instance Field "bar" Foo = Bar
    FieldDescriptorProto'LABEL_REQUIRED -> LensInfo baseType
                  [FieldInstanceInfo
                      { fieldSymbol = baseName
                      , fieldTypeInstance = baseType
                      , fieldAccessor = rawAccessor
                      }]
    FieldDescriptorProto'LABEL_OPTIONAL
        | isDefaultingOptional syntaxType fd
              -> LensInfo baseType
                    [FieldInstanceInfo
                      { fieldSymbol = baseName
                      , fieldTypeInstance = baseType
                      , fieldAccessor = rawAccessor
                      }]
        | Just info <- oneofFieldInfo f
              -> LensInfo baseType
                    [FieldInstanceInfo
                      { fieldSymbol = baseName
                      , fieldTypeInstance = baseType
                      , fieldAccessor = maybeAccessor
                      }
                    , FieldInstanceInfo
                      { fieldSymbol = maybeName
                      , fieldTypeInstance = "Prelude.Maybe" @@ baseType
                      , fieldAccessor = oneofFieldAccessor info
                      }
                    ]
    FieldDescriptorProto'LABEL_REPEATED
        -- data Foo = Foo { _Foo_bar :: Map Bar Baz }
        -- type instance Field "foo" Foo = Map Bar Baz
        | Just (k,v) <- getMapFields env fd -> let
            mapType = "Data.Map.Map" @@ hsFieldType env (fieldDescriptor k)
                                     @@ hsFieldType env (fieldDescriptor v)
            in LensInfo mapType
                  [FieldInstanceInfo
                       { fieldSymbol = baseName
                       , fieldTypeInstance = mapType
                       , fieldAccessor = rawAccessor
                       }]
        -- data Foo = Foo { _Foo_bar :: [Bar] }
        -- type instance Field "bar" Foo = [Bar]
        | otherwise -> LensInfo listType
                  [FieldInstanceInfo
                      { fieldSymbol = baseName
                      , fieldTypeInstance = listType
                      , fieldAccessor = rawAccessor
                      }]
    -- data Foo = Foo { _Foo_bar :: Maybe Bar }
    -- type instance Field "bar" Foo = Bar
    -- type instance Field "maybe'bar" Foo = Maybe Bar
    FieldDescriptorProto'LABEL_OPTIONAL -> LensInfo maybeType
                  [FieldInstanceInfo
                      { fieldSymbol = baseName
                      , fieldTypeInstance = baseType
                      , fieldAccessor = maybeAccessor
                      }
                  , FieldInstanceInfo
                      { fieldSymbol = maybeName
                      , fieldTypeInstance = "Prelude.Maybe" @@ baseType
                      , fieldAccessor = rawAccessor
                      }
                  ]
  where
    baseName = overloadedField f
    fd = fieldDescriptor f
    baseType = hsFieldType env fd
    listType = tyList baseType
    maybeType = "Prelude.Maybe" @@ baseType
    maybeName = "maybe'" ++ baseName
    maybeAccessor = "Prelude.." @@ fromString maybeName
                        @@ ("Data.ProtoLens.maybeLens"
                                @@ hsFieldValueDefault env fd)
    rawAccessor = rawFieldAccessor $ unQual $ recordFieldName f

-- Get the key/value types of this type, if it is really a map.
getMapFields :: Env QName -> FieldDescriptorProto
             -> Maybe (FieldInfo, FieldInfo)
getMapFields env f
    | f ^. type' == FieldDescriptorProto'TYPE_MESSAGE
    , Message m@MessageInfo { messageDescriptor = d } <- definedFieldType f env
    , d ^. options.mapEntry
    , [f1, f2] <- messageFields m = Just (f1, f2)
    | otherwise = Nothing

hsFieldType :: Env QName -> FieldDescriptorProto -> Type
hsFieldType env fd = case fd ^. type' of
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
                              ++ unpack (fd ^. typeName)
    FieldDescriptorProto'TYPE_MESSAGE
        | Message m <- definedFieldType fd env -> tyCon $ messageName m
        | otherwise -> error $ "expected TYPE_MESSAGE for type name"
                              ++ unpack (fd ^. typeName)
    FieldDescriptorProto'TYPE_BYTES -> "Data.ByteString.ByteString"
    FieldDescriptorProto'TYPE_UINT32 -> "Data.Word.Word32"
    FieldDescriptorProto'TYPE_ENUM
        | Enum e <- definedFieldType fd env -> tyCon $ enumName e
        | otherwise -> error $ "expected TYPE_ENUM for type name"
                              ++ unpack (fd ^. typeName)
    FieldDescriptorProto'TYPE_SFIXED32 -> "Data.Int.Int32"
    FieldDescriptorProto'TYPE_SFIXED64 -> "Data.Int.Int64"
    FieldDescriptorProto'TYPE_SINT32 -> "Data.Int.Int32"
    FieldDescriptorProto'TYPE_SINT64 -> "Data.Int.Int64"

hsFieldDefault :: SyntaxType -> Env QName -> FieldDescriptorProto -> Exp
hsFieldDefault syntaxType env fd
    = case fd ^. label of
          FieldDescriptorProto'LABEL_OPTIONAL
              | isDefaultingOptional syntaxType fd -> hsFieldValueDefault env fd
              | otherwise -> "Prelude.Nothing"
          FieldDescriptorProto'LABEL_REPEATED
              | Just _ <- getMapFields env fd -> "Data.Map.empty"
              | otherwise -> list []
          -- TODO: More sensible initialization of required fields.
          FieldDescriptorProto'LABEL_REQUIRED -> hsFieldValueDefault env fd

hsFieldValueDefault :: Env QName -> FieldDescriptorProto -> Exp
hsFieldValueDefault env fd = case fd ^. type' of
    FieldDescriptorProto'TYPE_MESSAGE -> "Data.Default.Class.def"
    FieldDescriptorProto'TYPE_GROUP -> "Data.Default.Class.def"
    FieldDescriptorProto'TYPE_ENUM
        | T.null def -> "Data.Default.Class.def"
        | Enum e <- definedFieldType fd env
        , Just v <- List.lookup def [ (enumValueDescriptor v ^. name, enumValueName v)
                                    | v <- enumValues e
                                    ]
            -> con v
        | otherwise -> errorMessage "enum"
    -- The rest of the cases are for scalar fields that have a fieldDefault
    -- instance.
    _ | T.null def -> "Data.ProtoLens.fieldDefault"
    FieldDescriptorProto'TYPE_BOOL
        | def == "true" -> "Prelude.True"
        | def == "false" -> "Prelude.False"
        | otherwise -> errorMessage "bool"
    FieldDescriptorProto'TYPE_STRING
        -> "Data.Text.pack" @@ stringExp (T.unpack def)
    FieldDescriptorProto'TYPE_BYTES
        -> "Data.ByteString.pack"
                @@ list ((mkByte . fromEnum) <$> T.unpack def)
      where mkByte c
              | c > 0 && c < 255 = litInt $ fromIntegral c
              | otherwise = errorMessage "bytes"
    FieldDescriptorProto'TYPE_FLOAT -> defaultFrac $ T.unpack def
    FieldDescriptorProto'TYPE_DOUBLE -> defaultFrac $ T.unpack def
    -- Otherwise, assume it's an integral field:
    _ -> defaultInt $ T.unpack def
  where
    def = fd ^. defaultValue
    errorMessage fieldType
        = error $ "Bad default value " ++ show (T.unpack def)
                    ++ " in default value for " ++ fieldType ++ " field "
                    ++ unpack (fd ^. name)
    -- float/double fields can use nan, inf and -inf as default values.
    -- The Prelude doesn't provide names for them, so we implement
    -- them as division by zero.
    defaultFrac "nan" = "Prelude./" @@ litFrac 0 @@ litFrac 0
    defaultFrac "inf" = "Prelude./" @@ litFrac 1 @@ litFrac 0
    defaultFrac "-inf" = "Prelude./" @@ litFrac (negate 1) @@ litFrac 0
    defaultFrac s = case reads s of
        [(x, "")] -> litFrac $ toRational (x :: Double)
        _ -> errorMessage "fractional"
    defaultInt s = case reads s of
        [(x, "")] -> litInt x
        _ -> errorMessage "integral"

-- | A lens to access an internal field.
--
--   lens _Foo_bar (\x__ y__ -> x__ { _Foo_bar = y__ })
rawFieldAccessor :: QName -> Exp
rawFieldAccessor f = "Lens.Family2.Unchecked.lens" @@ getter @@ setter
  where
    getter = var f
    setter = lambda ["x__", "y__"]
                    $ recUpdate "x__" [fieldUpdate f "y__"]

-- | A lens to access a oneof field.
--
-- lens
--   (\ x__ -> case _Foo'bar x__ of
--       Prelude.Just (Foo'Bar'c x__val) -> Prelude.Just x__val
--       otherwise -> Prelude.Nothing)
--   (\ x__ y__ -> x__{_Foo'bar = Prelude.fmap Foo'Bar'c y__})
oneofFieldAccessor :: OneofFieldInfo -> Exp
oneofFieldAccessor (OneofFieldInfo consName encName) =
        "Lens.Family2.Unchecked.lens" @@ getter @@ setter
      where
        getter = lambda ["x__"] $
            case' (var (unQual encName) @@ var "x__")
                [ alt
                    (pApp "Prelude.Just" [pApp (unQual consName) [pVar "x__val"]])
                    ("Prelude.Just" @@ "x__val")
                , alt
                    (pVar "_otherwise")
                    (con "Prelude.Nothing")
                ]
        setter = lambda ["x__", "y__"]
                    $ recUpdate "x__" [fieldUpdate (unQual encName)
                    $ ("Prelude.fmap" @@ (con $ unQual consName) @@ "y__")]

descriptorExpr :: SyntaxType -> Env QName -> MessageInfo Name -> Exp
descriptorExpr syntaxType env m
    -- let foo__field_descriptor = ...
    --     ...
    -- in Message.MessageDescriptor
    --      (Data.Map.fromList [(Tag 1, foo__field_descriptor),...])
    --      (Data.Map.fromList [("foo", foo__field_descriptor),...])
    --
    -- (Note that the two maps have the same elements but different keys.  We
    -- use the "let" expression to share elements between the two maps.)
    = let' (map (fieldDescriptorVarBind $ messageName m) $ fields)
        $ "Data.ProtoLens.MessageDescriptor"
          @@ ("Data.Map.fromList" @@ list fieldsByTag)
          @@ ("Data.Map.fromList" @@ list fieldsByTextFormatName)
  where
    fieldsByTag =
        [tuple
              [ t, fieldDescriptorVar f ]
              | f <- fields
              , let t = "Data.ProtoLens.Tag"
                          @@ litInt (fromIntegral
                                      $ fieldDescriptor f ^. number)
              ]
    fieldsByTextFormatName =
        [tuple
              [ t, fieldDescriptorVar f ]
              | f <- fields
              , let t = stringExp $ T.unpack $ textFormatFieldName env
                                                    (fieldDescriptor f)
              ]
    fieldDescriptorVar = fromString . fieldDescriptorName
    fieldDescriptorName f
        = fromString $ overloadedField f ++ "__field_descriptor"
    fieldDescriptorVarBind n f
        = funBind
              [match (fromString $ fieldDescriptorName f) []
                  $ fieldDescriptorExpr syntaxType env n f
              ]
    fields = messageFields m

-- | Get the name of the field when used in a text format proto. Groups are
-- special because their text format field name is the name of their type,
-- not the name of the field in the descriptor (e.g. "Foo", not "foo").
textFormatFieldName :: Env QName -> FieldDescriptorProto -> T.Text
textFormatFieldName env descr = case descr ^. type' of
    FieldDescriptorProto'TYPE_GROUP
        | Message msg <- definedFieldType descr env
              -> messageDescriptor msg ^. name
        | otherwise -> error $ "expected TYPE_GROUP for type name"
                           ++ T.unpack (descr ^. typeName)
    _ -> descr ^. name

fieldDescriptorExpr :: SyntaxType -> Env QName -> Name -> FieldInfo
                    -> Exp
fieldDescriptorExpr syntaxType env n f =
    ("Data.ProtoLens.FieldDescriptor"
        -- Record the original .proto name for text format
        @@ stringExp (T.unpack $ textFormatFieldName env fd)
        -- Force the type signature since it can't be inferred for Map entry
        -- types.
        @@ (fieldTypeDescriptorExpr (fd ^. type')
                @::@
                    ("Data.ProtoLens.FieldTypeDescriptor"
                        @@ hsFieldType env fd))
        @@ fieldAccessorExpr syntaxType env f)
    -- TODO: why is this type sig needed?
    @::@
    ("Data.ProtoLens.FieldDescriptor" @@ tyCon (unQual n))
  where
    fd = fieldDescriptor f

fieldAccessorExpr :: SyntaxType -> Env QName -> FieldInfo -> Exp
-- (PlainField Required foo), (OptionalField foo), etc...
fieldAccessorExpr syntaxType env f = accessorCon @@ var (unQual hsFieldName)
  where
    fd = fieldDescriptor f
    accessorCon = case fd ^. label of
          FieldDescriptorProto'LABEL_REQUIRED
              -> "Data.ProtoLens.PlainField" @@ "Data.ProtoLens.Required"
          FieldDescriptorProto'LABEL_OPTIONAL
              | isDefaultingOptional syntaxType fd
                  -> "Data.ProtoLens.PlainField" @@ "Data.ProtoLens.Optional"
              | otherwise -> "Data.ProtoLens.OptionalField"
          FieldDescriptorProto'LABEL_REPEATED
              | Just (k, v) <- getMapFields env fd
                  -> "Data.ProtoLens.MapField"
                         @@ fromString (overloadedField k)
                         @@ fromString (overloadedField v)
              | otherwise -> "Data.ProtoLens.RepeatedField"
                  @@ if isPackedField syntaxType fd
                        then "Data.ProtoLens.Packed"
                        else "Data.ProtoLens.Unpacked"
    hsFieldName
        = fromString $ case fd ^. label of
              FieldDescriptorProto'LABEL_OPTIONAL
                  | not (isDefaultingOptional syntaxType fd)
                      -> "maybe'" ++ overloadedField f
              _ -> overloadedField f

isDefaultingOptional :: SyntaxType -> FieldDescriptorProto -> Bool
isDefaultingOptional syntaxType f
    = f ^. label == FieldDescriptorProto'LABEL_OPTIONAL
          && syntaxType == Proto3
          && f ^. type' /= FieldDescriptorProto'TYPE_MESSAGE
          -- oneof fields have the same API as proto2 optional fields,
          -- but setting one field will automatically clear the others.
          && isNothing (f ^. maybe'oneofIndex)

isPackedField :: SyntaxType -> FieldDescriptorProto -> Bool
isPackedField s f = case f ^. options . maybe'packed of
    Just t -> t
    -- proto3 fields are packed by default.  Annoyingly, we need to
    -- implement this logic manually rather than relying on protoc.
    Nothing -> s == Proto3
                && f ^. type' `notElem`
                      [ FieldDescriptorProto'TYPE_MESSAGE
                      , FieldDescriptorProto'TYPE_GROUP
                      , FieldDescriptorProto'TYPE_STRING
                      , FieldDescriptorProto'TYPE_BYTES
                      ]

fieldTypeDescriptorExpr :: FieldDescriptorProto'Type -> Exp
fieldTypeDescriptorExpr =
    (\n -> fromString $ "Data.ProtoLens." ++ n ++ "Field") . \t -> case t of
    FieldDescriptorProto'TYPE_DOUBLE -> "Double"
    FieldDescriptorProto'TYPE_FLOAT -> "Float"
    FieldDescriptorProto'TYPE_INT64 -> "Int64"
    FieldDescriptorProto'TYPE_UINT64 -> "UInt64"
    FieldDescriptorProto'TYPE_INT32 -> "Int32"
    FieldDescriptorProto'TYPE_FIXED64 -> "Fixed64"
    FieldDescriptorProto'TYPE_FIXED32 -> "Fixed32"
    FieldDescriptorProto'TYPE_BOOL -> "Bool"
    FieldDescriptorProto'TYPE_STRING -> "String"
    FieldDescriptorProto'TYPE_GROUP -> "Group"
    FieldDescriptorProto'TYPE_MESSAGE -> "Message"
    FieldDescriptorProto'TYPE_BYTES -> "Bytes"
    FieldDescriptorProto'TYPE_UINT32 -> "UInt32"
    FieldDescriptorProto'TYPE_ENUM -> "Enum"
    FieldDescriptorProto'TYPE_SFIXED32 -> "SFixed32"
    FieldDescriptorProto'TYPE_SFIXED64 -> "SFixed64"
    FieldDescriptorProto'TYPE_SINT32 -> "SInt32"
    FieldDescriptorProto'TYPE_SINT64 -> "SInt64"
