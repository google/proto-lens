-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

-- | This module takes care of collecting all the definitions in a .proto file
-- and assigning Haskell names to all of the defined things (messages, enums
-- and field names).
{-# LANGUAGE CPP #-}
{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE OverloadedStrings #-}
module Data.ProtoLens.Compiler.Definitions
    ( Env
    , Definition(..)
    , MessageInfo(..)
    , ServiceInfo(..)
    , MethodInfo(..)
    , PlainFieldInfo(..)
    , FieldInfo(..)
    , FieldKind(..)
    , FieldPacking(..)
    , MapEntryInfo(..)
    , OneofInfo(..)
    , OneofCase(..)
    , FieldName(..)
    , Symbol
    , nameFromSymbol
    , promoteSymbol
    , EnumInfo(..)
    , EnumValueInfo(..)
    , EnumUnrecognizedInfo(..)
    , qualifyEnv
    , unqualifyEnv
    , collectDefinitions
    , collectServices
    , definedFieldType
    , definedType
    , camelCase
    , overloadedFieldName
    ) where

import Control.Applicative (liftA2)
import Data.Char (isUpper, toUpper)
import Data.Int (Int32)
import Data.List (mapAccumL)
import qualified Data.Map as Map
import Data.Maybe (catMaybes, fromMaybe)
#if !MIN_VERSION_base(4,11,0)
import Data.Monoid ((<>))
#endif
import Data.ProtoLens.Labels ()
import qualified Data.Semigroup as Semigroup
import qualified Data.Set as Set
import Data.String (IsString(..))
import Data.Text (Text, cons, splitOn, toLower, uncons, unpack)
import qualified Data.Text as T
import Data.Tree
    ( Tree(..)
    , Forest
    , flatten
    )
import Lens.Family2 ((^.), (^..), toListOf)
import Proto.Google.Protobuf.Descriptor
    ( DescriptorProto
    , EnumDescriptorProto
    , EnumValueDescriptorProto
    , FieldDescriptorProto
    , FieldDescriptorProto'Label(..)
    , FieldDescriptorProto'Type(..)
    , FileDescriptorProto
    , MethodDescriptorProto
    , ServiceDescriptorProto
    )
import GHC.SourceGen
    ( OccNameStr
    , RdrNameStr
    , ModuleNameStr
    , HsType'
    , qual
    , stringTy
    , unqual
    )

-- | 'Env' contains a mapping of proto names (as specified in the .proto file)
-- to Haskell names.  The keys are fully-qualified names, for example,
-- ".package.Message.Submessage".  (The protocol_compiler tool emits all
-- message field types in this form, even if they refer to local definitions.)
--
-- The type 'n' can be either a 'Name' (when talking about definitions within
-- the current file) or a (qualified) 'RdrNameStr' (when talking about definitions
-- either from this or another file).
type Env n = Map.Map Text (Definition n)

data SyntaxType = Proto2 | Proto3
    deriving (Show, Eq)

fileSyntaxType :: FileDescriptorProto -> SyntaxType
fileSyntaxType f = case f ^. #syntax of
    "proto2" -> Proto2
    "proto3" -> Proto3
    "" -> Proto2  -- The proto compiler doesn't set syntax for proto2 files.
    s -> error $ "Unknown syntax type " ++ show s

data Definition n = Message (MessageInfo n) | Enum (EnumInfo n)
    deriving Functor

-- | All the information needed to define or use a proto message type.
data MessageInfo n = MessageInfo
    { messageName :: n  -- ^ Haskell type name
    , messageConstructorName :: n  -- ^ Haskell constructor name
    , messageDescriptor :: DescriptorProto
    , messageFields :: [PlainFieldInfo]
      -- ^ Fields not belonging to a oneof. This includes proto3
      -- optional fields even though they are part of a synthetic
      -- oneof.
    , messageOneofFields :: [OneofInfo]
      -- ^ The oneofs in this message, associated with the fields that
      -- belong to them. Does not include synthetic oneofs generated
      -- for proto3 optional fields.
    , messageUnknownFields :: OccNameStr
      -- ^ The name of the Haskell field in this message that holds the
      -- unknown fields.
    , groupFieldNumber :: Maybe Int32
      -- ^ The number of the field that holds this message, if it is a group.
    } deriving Functor

data ServiceInfo = ServiceInfo
    { serviceName    :: Text
    , servicePackage :: Text
    , serviceMethods :: [MethodInfo]
    }

data MethodInfo = MethodInfo
    { methodName   :: Text
    , methodIdent  :: Text
    , methodInput  :: Text
    , methodOutput :: Text
    , methodClientStreaming :: Bool
    , methodServerStreaming :: Bool
    }

-- | Information about a single field of a proto message,
-- associated with how it is stored.
data PlainFieldInfo = PlainFieldInfo
    { plainFieldKind :: FieldKind
    , plainFieldInfo :: FieldInfo
    }

-- | Information about a single field of a proto message.
data FieldInfo = FieldInfo
    { fieldDescriptor  :: FieldDescriptorProto
    , fieldName :: FieldName
    }

-- | How a field is stored inside of the proto message.
data FieldKind
    = RequiredField
        -- ^ A proto2 required field.  Stored internally as a value.
    | OptionalValueField
        -- ^ A proto3 scalar field.  Stored internally as a value, and
        -- defaults to corresponding instance of fieldDefault.
    | OptionalMaybeField
        -- ^ An optional field where the "unset" and "default" values
        -- are distinguishable.  Stored internally as a Maybe.
        -- In particular: proto2 optional fields, proto3 messages,
        -- proto3 explicitly optional fields and "oneof" fields.
    | RepeatedField FieldPacking
        -- ^ A field containing a sequence of values.
        -- Stored internally as either a list or a map, depending on
        -- whether the field's FieldDescriptorProto of the field has
        -- options.map_entry set.
    | MapField MapEntryInfo
       -- ^ A field containing a map of keys to values.
       -- Serialized as a repeated field of an autogenerated "entry"
       -- proto type, each instance of which contains a key-value pair.

data FieldPacking
    = NotPackable  -- ^ Cannot be packed (e.g., strings or messages).
    | Packable     -- ^ Can be decoded as packed, but should not be not be
                   --   encoded as packed by default.
    | Packed       -- ^ Can be decoded as packed, and should be encoded
                   --   as packed by default.
  deriving Eq

data OneofInfo = OneofInfo
    { oneofFieldName :: FieldName
    , oneofTypeName :: OccNameStr
      -- ^ The name of the sum type corresponding to this oneof.
    , oneofCases :: [OneofCase]
      -- ^ The individual fields that make up this oneof.
    }

data OneofCase = OneofCase
    { caseField :: FieldInfo
    , caseConstructorName :: OccNameStr
        -- ^ The constructor for building a 'oneofTypeName' from the
        -- value in this field.
    , casePrismName :: OccNameStr
        -- ^ The name for building 'Prism' definition.
    }

-- | The "entry" type for a map field is a proto message, autogenerated by
-- protoc, that has two fields: a key and a value. The map field should be
-- serialized like a repeated field of the entry messages.
data MapEntryInfo = MapEntryInfo
    { mapEntryTypeName :: OccNameStr
        -- ^ The Haskell name for this type.
    , keyField :: FieldInfo
        -- ^ The field of the entry type corresponding to the map key.
    , valueField :: FieldInfo
        -- ^ The field of the entry type corresponding to the map value.
    }

data FieldName = FieldName
    { overloadedName :: Symbol
      -- ^ The overloaded name of lenses that access this field.
      -- For example, if the field is called "foo_bar" in the .proto
      -- then @overloadedName == "fooBar"@ and we might generate
      -- @fooBar@ and/or @maybe'fooBar@ lenses to access the data.
      --
      -- May be shared between two different message data types in the same
      -- module.
    , haskellRecordFieldName :: OccNameStr
      -- ^ The Haskell name of this internal record field; for example,
      -- "_Foo'Bar'baz.  Unique within each module.
    }

-- | A string that refers to the name (in Haskell) of a lens that accesses a
-- field.
--
-- For example, in the signature of the overloaded lens
--
-- @
--     foo :: HasLens "foo" ... => Lens ...
-- @
--
-- a 'Symbol' is used to construct both the type-level argument to
-- @HasLens@ and the name of the function @foo@.
newtype Symbol = Symbol String
    deriving (Eq, Ord, IsString, Semigroup.Semigroup, Monoid)

nameFromSymbol :: Symbol -> OccNameStr
nameFromSymbol (Symbol s) = fromString s

-- | Construct a promoted, type-level string.
promoteSymbol :: Symbol -> HsType'
promoteSymbol (Symbol s) = stringTy s

-- | All the information needed to define or use a proto enum type.
data EnumInfo n = EnumInfo
    { enumName :: n
    , enumUnrecognized :: Maybe EnumUnrecognizedInfo
    , enumDescriptor :: EnumDescriptorProto
    , enumValues :: [EnumValueInfo n]
    } deriving Functor

-- | Information about the "unrecognized" case of an enum.
data EnumUnrecognizedInfo = EnumUnrecognizedInfo
    { unrecognizedName :: OccNameStr
    , unrecognizedValueName :: OccNameStr
    }

-- | Information about a single value case of a proto enum.
data EnumValueInfo n = EnumValueInfo
    { enumValueName :: n
    , enumValueDescriptor :: EnumValueDescriptorProto
    , enumAliasOf :: Maybe OccNameStr
        -- ^ If 'Nothing', we turn value into a normal constructor of the enum.
        -- If @'Just' n@, we're treating it as an alias of the constructor @n@
        -- (a PatternSynonym in Haskell).  This mirrors the behavior of the
        -- Java API.
    } deriving Functor

mapEnv :: (n -> n') -> Env n -> Env n'
mapEnv f = fmap $ fmap f

-- Lift a set of local definitions into references to a specific module.
qualifyEnv :: ModuleNameStr -> Env OccNameStr -> Env RdrNameStr
qualifyEnv m = mapEnv (qual m)

-- Lift a set of local definitions into references to the current module.
unqualifyEnv :: Env OccNameStr -> Env RdrNameStr
unqualifyEnv = mapEnv unqual

-- | Look up the Haskell name for the type of a given field (message or enum).
definedFieldType :: FieldDescriptorProto -> Env RdrNameStr -> Definition RdrNameStr
definedFieldType fd env = fromMaybe err $ Map.lookup (fd ^. #typeName) env
  where
    err = error $ "definedFieldType: Field type " ++ unpack (fd ^. #typeName)
                  ++ " not found in environment."

-- | Look up the Haskell name for the type of a given type.
definedType :: Text -> Env RdrNameStr -> Definition RdrNameStr
definedType ty = fromMaybe err . Map.lookup ty
  where
    err = error $ "definedType: Type " ++ unpack ty
                  ++ " not found in environment."

-- | Collect all the definitions in the given file (including definitions
-- nested in other messages), and assign Haskell names to them.
collectDefinitions :: FileDescriptorProto -> Env OccNameStr
collectDefinitions fd = let
    protoPrefix = case fd ^. #package of
        "" -> "."
        p -> "." <> p <> "."
    hsPrefix = ""
    in Map.fromList $ concatMap flatten $
            messageAndEnumDefs (fileSyntaxType fd)
                protoPrefix hsPrefix Map.empty
                (fd ^. #messageType) (fd ^. #enumType)

collectServices :: FileDescriptorProto -> [ServiceInfo]
collectServices fd = fmap (toServiceInfo $ fd ^. #package) $ fd ^. #service
  where
    toServiceInfo :: Text -> ServiceDescriptorProto -> ServiceInfo
    toServiceInfo pkg sd =
        ServiceInfo
            { serviceName    = sd ^. #name
            , servicePackage = pkg
            , serviceMethods = fmap toMethodInfo $ sd ^. #method
            }

    toMethodInfo :: MethodDescriptorProto -> MethodInfo
    toMethodInfo md =
        MethodInfo
            { methodName   = md ^. #name
            , methodIdent  = camelCase $ md ^. #name
            , methodInput  = fromString . T.unpack $ md ^. #inputType
            , methodOutput = fromString . T.unpack $ md ^. #outputType
            , methodClientStreaming = md ^. #clientStreaming
            , methodServerStreaming = md ^. #serverStreaming
            }

messageAndEnumDefs ::
    SyntaxType -> Text -> String
    -> GroupMap
        -- ^ Group fields of the parent message (if any).
    -> [DescriptorProto]
    -> [EnumDescriptorProto]
    -> Forest (Text, Definition OccNameStr)
        -- ^ Organized as a list of trees, to make it possible for callers
        -- to get the immediate child nested types.
messageAndEnumDefs syntaxType protoPrefix hsPrefix groups messages enums
    = map (messageDefs syntaxType protoPrefix hsPrefix groups) messages
        ++ map
            (flip Node [] -- Enums have no sub-definitions
                . enumDef syntaxType protoPrefix hsPrefix)
            enums

-- | Generate the definitions for a message and its nested types (if any).
messageDefs :: SyntaxType -> Text -> String -> GroupMap -> DescriptorProto
            -> Tree (Text, Definition OccNameStr)
messageDefs syntaxType protoPrefix hsPrefix groups d
    = Node (protoName, thisDef) subDefs
  where
    protoName = protoPrefix <> d ^. #name
    hsPrefix' = hsPrefix ++ hsName (d ^. #name) ++ "'"
    allFields = groupFieldsByOneofIndex (d ^. #field)
    thisDef =
        Message MessageInfo
            { messageName = fromString $ hsPrefix ++ hsName (d ^. #name)
              -- Set the constructor name to not conflict with enum values.
            , messageConstructorName =
                 fromString $ hsPrefix ++ hsName (d ^. #name)
                                ++ "'_constructor"
            , messageDescriptor = d
            , messageFields =
                  map (liftA2 PlainFieldInfo
                              (fieldKind syntaxType mapEntries) (fieldInfo hsPrefix'))
                      $ Map.findWithDefault [] Nothing allFields
            , messageOneofFields = collectOneofFields hsPrefix' d allFields
            , messageUnknownFields =
                  fromString $ "_" ++ hsPrefix' ++ "_unknownFields"
            , groupFieldNumber = Map.lookup protoName groups
            }
    subDefs = messageAndEnumDefs
                    syntaxType
                    (protoName <> ".")
                    hsPrefix'
                    (collectGroupFields $ d ^. #field)
                    (d ^. #nestedType)
                    (d ^. #enumType)
    -- For efficiency, only look for map entries within the immediate
    -- nested types, rather than recursively searching through all of them.
    mapEntries = collectMapEntries $ map rootLabel subDefs

-- | If this type is a map entry, retrieves the relevant information
-- along with the proto name of this type.
mapEntryInfo :: Definition OccNameStr -> Maybe MapEntryInfo
mapEntryInfo (Message m)
    | messageDescriptor m ^. #options . #mapEntry
    , [keyFd, valueFd] <- messageFields m
    = Just MapEntryInfo
                { mapEntryTypeName = messageName m
                , keyField = plainFieldInfo keyFd
                , valueField = plainFieldInfo valueFd
                }
mapEntryInfo _ = Nothing

-- | Returns a map whose keys are the proto type name of the entry message.
collectMapEntries :: [(Text, Definition OccNameStr)] -> Map.Map Text MapEntryInfo
collectMapEntries defs =
    Map.fromList
        [(protoName, e) | (protoName, d) <- defs, Just e <- [mapEntryInfo d]]

-- | A map whose keys are the proto type names of the groups in a message,
-- and values are the field numbers for those groups.
-- (Every group corresponds to exactly one message field.)
type GroupMap = Map.Map Text Int32

collectGroupFields :: [FieldDescriptorProto] -> GroupMap
collectGroupFields fs = Map.fromList
    [ (f ^. #typeName, f ^. #number)
    | f <- fs
    , f ^. #type' == FieldDescriptorProto'TYPE_GROUP
      ]

fieldInfo :: String -> FieldDescriptorProto -> FieldInfo
fieldInfo hsPrefix f = FieldInfo
                            { fieldDescriptor = f
                            , fieldName = mkFieldName hsPrefix $ f ^. #name
                            }

fieldKind ::
    SyntaxType -> Map.Map Text MapEntryInfo -> FieldDescriptorProto
    -> FieldKind
fieldKind syntaxType mapEntries f = case f ^. #label of
            FieldDescriptorProto'LABEL_OPTIONAL
                | syntaxType == Proto3
                    && f ^. #type' /= FieldDescriptorProto'TYPE_MESSAGE
                    && not (f ^. #proto3Optional)
                    -> OptionalValueField
                | otherwise -> OptionalMaybeField
            FieldDescriptorProto'LABEL_REQUIRED -> RequiredField
            FieldDescriptorProto'LABEL_REPEATED
                | Just entryInfo <- Map.lookup (f ^. #typeName) mapEntries
                    -> MapField entryInfo
                | otherwise -> RepeatedField packed
  where
    packed
        | f ^. #type' `elem` unpackableTypes = NotPackable
        | packedByDefault = Packed
        | otherwise = Packable
    -- If the "packed" attribute isn't set, then default to packed if proto3.
    -- Unfortunately, protoc doesn't implement this logic for us automatically.
    packedByDefault = fromMaybe (syntaxType == Proto3)
                        $ f ^. #options . #maybe'packed
    unpackableTypes =
        [ FieldDescriptorProto'TYPE_MESSAGE
        , FieldDescriptorProto'TYPE_GROUP
        , FieldDescriptorProto'TYPE_STRING
        , FieldDescriptorProto'TYPE_BYTES
        ]

collectOneofFields
    :: String -> DescriptorProto -> Map.Map (Maybe Int32) [FieldDescriptorProto]
    -> [OneofInfo]
collectOneofFields hsPrefix d allFields
    = catMaybes $ zipWith oneofMaybe [0..] $ d ^.. #oneofDecl . traverse . #name
  where
    oneofMaybe idx n =
      let fields = Map.findWithDefault [] (Just idx) allFields
      in if isSynthetic fields
         then Nothing
         else Just $ oneofInfo n fields
    oneofInfo n fields = OneofInfo
        { oneofFieldName = mkFieldName hsPrefix n
        , oneofTypeName = fromString $ hsPrefix ++ hsNameUnique subdefTypes n
        , oneofCases = map oneofCase fields
        }
    -- The oneof is synthetic if it contains a single proto3_optional field.
    isSynthetic :: [FieldDescriptorProto] -> Bool
    isSynthetic [f] = f ^. #proto3Optional
    isSynthetic _ = False
    oneofCase f =
        let consName = hsPrefix ++ hsNameUnique subdefCons (f ^. #name)
        in OneofCase
            { caseField = fieldInfo hsPrefix f
            , caseConstructorName =
                  -- Note: oneof case constructors aren't prefixed
                  -- by the oneof name; field names (even inside
                  -- of a oneof) are unique within a message.
                  fromString consName
            , casePrismName =
                  fromString $ "_" ++ consName
            }
    -- Make a name that doesn't overlap with those already defined by submessages
    -- or subenums.
    hsNameUnique ns n
        | n' `elem` ns = n' ++ "'"
        | otherwise = n'
      where
        n' = hsName $ camelCase n
    -- The Haskell "type" namespace
    subdefTypes = Set.fromList $ map hsName
                    $ toListOf (#nestedType . traverse . #name) d
                    ++ toListOf (#enumType . traverse . #name) d
    -- The Haskell "expression" namespace (i.e., constructors)
    subdefCons = Set.fromList $ map hsName
                    $ toListOf (#nestedType . traverse . #name) d
                    ++ toListOf (#enumType . traverse . #value . traverse . #name) d

-- | Group fields by the index of the oneof field that they belong to.
-- Or 'Nothing' if they don't belong to a oneof. Proto3 optional
-- fields are included twice, both as members of their synthetic oneof
-- (so that collectOneofFields can use them to recognize synthetic
-- oneofs) and as stand-alone fields for which we generate bindings.
groupFieldsByOneofIndex
    :: [FieldDescriptorProto] -> Map.Map (Maybe Int32) [FieldDescriptorProto]
groupFieldsByOneofIndex =
    fmap reverse
    . Map.fromListWith (++)
    . concatMap mapElementsForField
  where
    mapElementsForField
      :: FieldDescriptorProto -> [(Maybe Int32, [FieldDescriptorProto])]
    mapElementsForField f = case f ^. #maybe'oneofIndex of
      Nothing -> [(Nothing, [f])]
      Just idx -> if f ^. #proto3Optional
                  then [(Nothing, [f]), (Just idx, [f])]
                  else [(Just idx, [f])]

hsName :: Text -> String
hsName = unpack . capitalize

mkFieldName :: String -> Text -> FieldName
mkFieldName hsPrefix n = FieldName
                    { overloadedName = fromString n'
                    , haskellRecordFieldName = fromString $ "_" ++ hsPrefix ++ n'
                    }
      where
        n' = fieldBaseName n

-- | Get the name in Haskell of a proto field, taking care of camel casing and
-- clashes with language keywords.  Doesn't handle the name prefix of the
-- containing type.
fieldBaseName :: Text -> String
fieldBaseName = unpack . disambiguate . camelCase
  where
    disambiguate s
        | s `Set.member` reservedKeywords = s <> "'"
        | otherwise = s

camelCase :: Text -> Text
camelCase s =
    -- Preserve any initial underlines (e.g., "_foo_bar" -> "_fooBar").
    let (underlines, rest) = T.span (== '_') s
    in case splitOn "_" rest of
        -- splitOn always returns a list with at least one element.
        [] -> error $ "camelCase: splitOn returned empty list: "
                        ++ show rest
        [""] -> error $ "camelCase: name consists only of underscores: "
                            ++ show s
        s':ss -> T.concat $ underlines : lowerInitialChars s' : map capitalize ss

-- | Lower-case all initial upper-case characters.
-- For example: "Foo" -> "foo", "FooBar" -> "fooBar", "FOObar" -> "foobar"
lowerInitialChars :: Text -> Text
lowerInitialChars s = toLower pre <> post
  where (pre, post) = T.span isUpper s

-- | A list of reserved keywords that aren't valid as variable names.
reservedKeywords :: Set.Set Text
reservedKeywords = Set.fromList $
    -- Haskell2010 keywords:
    -- https://www.haskell.org/onlinereport/haskell2010/haskellch2.html#x7-180002.4
    -- We don't include keywords that are allowed to be variable names,
    -- in particular: "as", "forall", and "hiding".
    [ "case"
    , "class"
    , "data"
    , "default"
    , "deriving"
    , "do"
    , "else"
    , "foreign"
    , "if"
    , "import"
    , "in"
    , "infix"
    , "infixl"
    , "infixr"
    , "instance"
    , "let"
    , "module"
    , "newtype"
    , "of"
    , "then"
    , "type"
    , "where"
    ]
    ++  -- Nonstandard extensions
    [ "mdo"   -- RecursiveDo
    , "rec"   -- Arrows, RecursiveDo
    , "pattern"  -- PatternSynonyms
    , "proc"  -- Arrows
    ]

-- | Generate the definition for an enum type.
enumDef :: SyntaxType -> Text -> String -> EnumDescriptorProto
          -> (Text, Definition OccNameStr)
enumDef syntaxType protoPrefix hsPrefix d = let
    mkText n = protoPrefix <> n
    mkHsName n = fromString $ hsPrefix ++ case hsName n of
      ('_':xs) -> 'X':xs
      xs       -> xs
    in (mkText (d ^. #name)
       , Enum EnumInfo
            { enumName = mkHsName (d ^. #name)
            , enumUnrecognized = if syntaxType == Proto2
                    then Nothing
                    else Just EnumUnrecognizedInfo
                            { unrecognizedName
                                = mkHsName (d ^. #name <> "'Unrecognized")
                            , unrecognizedValueName
                                = mkHsName (d ^. #name <> "'UnrecognizedValue")
                            }
            , enumDescriptor = d
            , enumValues = collectEnumValues mkHsName $ d ^. #value
            })

-- | Generate the definitions for each enum value.  In particular, decide
-- whether it's a true constructor or a PatternSynonym to another
-- constructor.
--
-- Like Java, we treat the first case of each numeric value as the "real"
-- constructor, and subsequent cases as synonyms.
collectEnumValues :: (Text -> OccNameStr) -> [EnumValueDescriptorProto]
                  -> [EnumValueInfo OccNameStr]
collectEnumValues mkHsName = snd . mapAccumL helper Map.empty
  where
    helper :: Map.Map Int32 OccNameStr -> EnumValueDescriptorProto
           -> (Map.Map Int32 OccNameStr, EnumValueInfo OccNameStr)
    helper seenNames v
        | Just n' <- Map.lookup k seenNames = (seenNames, mkValue (Just n'))
        | otherwise = (Map.insert k n seenNames, mkValue Nothing)
      where
        mkValue = EnumValueInfo n v
        n = mkHsName (v ^. #name)
        k = v ^. #number

-- Haskell types must start with an uppercase letter, so we capitalize message
-- and enum names.
-- OccNameStr collisions will show up as build errors in the generated haskell file.
capitalize :: Text -> Text
capitalize s
    | Just (c, s') <- uncons s = cons (toUpper c) s'
    | otherwise = s

overloadedFieldName :: FieldInfo -> Symbol
overloadedFieldName = overloadedName . fieldName
