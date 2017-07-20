-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

-- | This module takes care of collecting all the definitions in a .proto file
-- and assigning Haskell names to all of the defined things (messages, enums
-- and field names).
{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings #-}
module Data.ProtoLens.Compiler.Definitions
    ( Env
    , Definition(..)
    , MessageInfo(..)
    , FieldInfo(..)
    , OneofInfo(..)
    , OneofCase(..)
    , FieldName(..)
    , Symbol
    , nameFromSymbol
    , promoteSymbol
    , EnumInfo(..)
    , EnumValueInfo(..)
    , qualifyEnv
    , unqualifyEnv
    , collectDefinitions
    , definedFieldType
    ) where

import Data.Char (isUpper, toUpper)
import Data.Int (Int32)
import Data.List (mapAccumL)
import qualified Data.Map as Map
import Data.Maybe (fromMaybe)
import Data.Monoid
import qualified Data.Set as Set
import Data.String (IsString(..))
import Data.Text (Text, cons, splitOn, toLower, uncons, unpack)
import qualified Data.Text as T
import Lens.Family2 ((^.), (^..))
import Proto.Google.Protobuf.Descriptor
    ( DescriptorProto
    , EnumDescriptorProto
    , EnumValueDescriptorProto
    , FieldDescriptorProto
    , FileDescriptorProto
    , enumType
    , field
    , maybe'oneofIndex
    , messageType
    , name
    , nestedType
    , number
    , oneofDecl
    , package
    , typeName
    , value
    )

import Data.ProtoLens.Compiler.Combinators
    ( Name
    , QName
    , ModuleName
    , Type
    , qual
    , tyPromotedString
    , unQual
    )

-- | 'Env' contains a mapping of proto names (as specified in the .proto file)
-- to Haskell names.  The keys are fully-qualified names, for example,
-- ".package.Message.Submessage".  (The protocol_compiler tool emits all
-- message field types in this form, even if they refer to local definitions.)
--
-- The type 'n' can be either a 'Name' (when talking about definitions within
-- the current file) or a (qualified) 'QName' (when talking about definitions
-- either from this or another file).
type Env n = Map.Map Text (Definition n)

data Definition n = Message (MessageInfo n) | Enum (EnumInfo n)
    deriving Functor

-- | All the information needed to define or use a proto message type.
data MessageInfo n = MessageInfo
    { messageName :: n  -- ^ Haskell type name
    , messageDescriptor :: DescriptorProto
    , messageFields :: [FieldInfo] -- ^ Fields not belonging to a oneof.
    , messageOneofFields :: [OneofInfo]
      -- ^ The oneofs in this message, associated with the fields that
      --   belong to them.
    } deriving Functor

-- | Information about a single field of a proto message.
data FieldInfo = FieldInfo
    { fieldDescriptor  :: FieldDescriptorProto
    , plainFieldName :: FieldName
    }

data OneofInfo = OneofInfo
    { oneofFieldName :: FieldName
    , oneofTypeName :: Name
      -- ^ The name of the sum type corresponding to this oneof.
    , oneofCases :: [OneofCase]
      -- ^ The individual fields that make up this oneof.
    }

data OneofCase = OneofCase
    { caseField :: FieldInfo
    , caseConstructorName :: Name
        -- ^ The constructor for building a 'oneofTypeName' from the
        -- value in this field.
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
    , haskellRecordFieldName :: Name
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
    deriving (Eq, Ord, IsString, Monoid)

nameFromSymbol :: Symbol -> Name
nameFromSymbol (Symbol s) = fromString s

-- | Construct a promoted, type-level string.
promoteSymbol :: Symbol -> Type
promoteSymbol (Symbol s) = tyPromotedString s

-- | All the information needed to define or use a proto enum type.
data EnumInfo n = EnumInfo
    { enumName :: n
    , enumDescriptor :: EnumDescriptorProto
    , enumValues :: [EnumValueInfo n]
    } deriving Functor

-- | Information about a single value case of a proto enum.
data EnumValueInfo n = EnumValueInfo
    { enumValueName :: n
    , enumValueDescriptor :: EnumValueDescriptorProto
    , enumAliasOf :: Maybe Name
        -- ^ If 'Nothing', we turn value into a normal constructor of the enum.
        -- If @'Just' n@, we're treating it as an alias of the constructor @n@
        -- (a PatternSynonym in Haskell).  This mirrors the behavior of the
        -- Java API.
    } deriving Functor

mapEnv :: (n -> n') -> Env n -> Env n'
mapEnv f = fmap $ fmap f

-- Lift a set of local definitions into references to a specific module.
qualifyEnv :: ModuleName -> Env Name -> Env QName
qualifyEnv m = mapEnv (qual m)

-- Lift a set of local definitions into references to the current module.
unqualifyEnv :: Env Name -> Env QName
unqualifyEnv = mapEnv unQual

-- | Look up the Haskell name for the type of a given field (message or enum).
definedFieldType :: FieldDescriptorProto -> Env QName -> Definition QName
definedFieldType fd env = fromMaybe err $ Map.lookup (fd ^. typeName) env
  where
    err = error $ "definedFieldType: Field type " ++ unpack (fd ^. typeName)
                  ++ " not found in environment."

-- | Collect all the definitions in the given file (including definitions
-- nested in other messages), and assign Haskell names to them.
collectDefinitions :: FileDescriptorProto -> Env Name
collectDefinitions fd = let
    protoPrefix = case fd ^. package of
        "" -> "."
        p -> "." <> p <> "."
    hsPrefix = ""
    in Map.fromList $ messageAndEnumDefs protoPrefix hsPrefix
                          (fd ^. messageType) (fd ^. enumType)

messageAndEnumDefs :: Text -> String -> [DescriptorProto]
                   -> [EnumDescriptorProto] -> [(Text, Definition Name)]
messageAndEnumDefs protoPrefix hsPrefix messages enums
    = concatMap (messageDefs protoPrefix hsPrefix) messages
        ++ map (enumDef protoPrefix hsPrefix) enums

-- | Generate the definitions for a message and its nested types (if any).
messageDefs :: Text -> String -> DescriptorProto
            -> [(Text, Definition Name)]
messageDefs protoPrefix hsPrefix d
    = (protoName, thisDef)
          : messageAndEnumDefs
                (protoName <> ".")
                hsPrefix'
                (d ^. nestedType)
                (d ^. enumType)
  where
    protoName = protoPrefix <> d ^. name
    hsPrefix' = hsPrefix ++ hsName (d ^. name) ++ "'"
    hsName = unpack . capitalize
    allFields = collectFieldsByOneofIndex (d ^. field)
    thisDef =
        Message MessageInfo
            { messageName = fromString $ hsPrefix ++ hsName (d ^. name)
            , messageDescriptor = d
            , messageFields =
                  map fieldInfo $ Map.findWithDefault [] Nothing allFields
            , messageOneofFields =
                  zipWith oneofInfo [0..]
                      $ d ^.. oneofDecl . traverse . name
            }
    fieldInfo f = FieldInfo f $ mkFieldName $ f ^. name
    mkFieldName n = FieldName
                    { overloadedName = fromString n'
                    , haskellRecordFieldName = fromString $ "_" ++ hsPrefix' ++ n'
                    }
      where
        n' = fieldName n
    oneofInfo :: Int32 -> Text -> OneofInfo
    oneofInfo idx n = OneofInfo
                        { oneofFieldName = mkFieldName n
                        , oneofTypeName = fromString $ hsPrefix' ++ hsName n
                        , oneofCases = map oneofCase
                                          $ Map.findWithDefault [] (Just idx)
                                              allFields
                        }
    oneofCase f = OneofCase
                        { caseField = fieldInfo f
                        , caseConstructorName =
                              -- Note: oneof case constructors aren't prefixed
                              -- by the oneof name; field names (even inside
                              -- of a oneof) are unique within a message.
                              fromString $ hsPrefix' ++ hsName (f ^. name)
                        }


-- | Group fields by the index of the oneof field that they belong to.
-- (Or 'Nothing' if they don't belong to a oneof.)
collectFieldsByOneofIndex
    :: [FieldDescriptorProto] -> Map.Map (Maybe Int32) [FieldDescriptorProto]
collectFieldsByOneofIndex =
    fmap reverse
    . Map.fromListWith (++)
    . fmap (\f -> (f ^. maybe'oneofIndex, [f]))

-- | Get the name in Haskell of a proto field, taking care of camel casing and
-- clashes with language keywords.
fieldName :: Text -> String
fieldName = unpack . disambiguate . camelCase
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
enumDef :: Text -> String -> EnumDescriptorProto
          -> (Text, Definition Name)
enumDef protoPrefix hsPrefix d = let
    mkText n = protoPrefix <> n
    mkHsName n = fromString $ hsPrefix ++ unpack n
    in (mkText (d ^. name)
       , Enum EnumInfo
            { enumName = mkHsName (d ^. name)
            , enumDescriptor = d
            , enumValues = collectEnumValues mkHsName $ d ^. value
            })

-- | Generate the definitions for each enum value.  In particular, decide
-- whether it's a true constructor or a PatternSynonym to another
-- constructor.
--
-- Like Java, we treat the first case of each numeric value as the "real"
-- constructor, and subsequent cases as synonyms.
collectEnumValues :: (Text -> Name) -> [EnumValueDescriptorProto]
                  -> [EnumValueInfo Name]
collectEnumValues mkHsName = snd . mapAccumL helper Map.empty
  where
    helper :: Map.Map Int32 Name -> EnumValueDescriptorProto
           -> (Map.Map Int32 Name, EnumValueInfo Name)
    helper seenNames v
        | Just n' <- Map.lookup k seenNames = (seenNames, mkValue (Just n'))
        | otherwise = (Map.insert k hsName seenNames, mkValue Nothing)
      where
        mkValue = EnumValueInfo hsName v
        hsName = mkHsName n
        n = v ^. name
        k = v ^. number

-- Haskell types must start with an uppercase letter, so we capitalize message
-- and enum names.
-- Name collisions will show up as build errors in the generated haskell file.
capitalize :: Text -> Text
capitalize s
    | Just (c, s') <- uncons s = cons (toUpper c) s'
    | otherwise = s
