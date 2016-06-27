-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

-- | This module takes care of collecting all the definitions in a .proto file
-- and assigning Haskell names to all of the defined things (messages, enums
-- and field names).
{-# LANGUAGE DeriveFunctor, OverloadedStrings #-}
module Definitions
    ( Env
    , Definition(..)
    , MessageInfo(..)
    , FieldInfo(..)
    , EnumInfo(..)
    , qualifyEnv
    , unqualifyEnv
    , collectDefinitions
    , definedFieldType
    ) where

import Data.Char (toUpper)
import qualified Data.Map as Map
import Data.Maybe (fromMaybe)
import Data.Monoid
import qualified Data.Set as Set
import Data.Text (Text, cons, splitOn, toLower, uncons, unpack)
import qualified Data.Text as T
import Language.Haskell.Exts.Syntax (Name(..), QName(..), ModuleName(..))
import Lens.Family2 ((^.))
import Bootstrap.Proto.Google.Protobuf.Descriptor
    ( DescriptorProto
    , EnumDescriptorProto
    , FieldDescriptorProto
    , FileDescriptorProto
    , enumType
    , field
    , messageType
    , name
    , nestedType
    , package
    , typeName
    , value
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
    , messageFields :: [FieldInfo]
      -- ^ The Haskell names for each field.
      -- This list corresponds 1-1 with "field" in messageDescriptor.
    } deriving Functor

-- | Information about a single field of a proto message.
data FieldInfo = FieldInfo
    { overloadedField :: String
      -- ^ The Haskell overloaded name of this field; may be shared between two
      -- different message data types.
    , recordFieldName :: Name
      -- ^ The Haskell name of this internal record field.  Unique within each
      -- module.
    , fieldDescriptor :: FieldDescriptorProto
    }

-- | All the information needed to define or use a proto enum type.
data EnumInfo n = EnumInfo
    { enumName :: n
    , enumDescriptor :: EnumDescriptorProto
    , enumValueNames :: [n]
      -- ^ The Haskell name of each enum value.
      -- This corresponds 1-1 with "value" in EnumDescriptorProto.
    } deriving Functor

mapEnv :: (n -> n') -> Env n -> Env n'
mapEnv f = fmap $ fmap f

-- Lift a set of local definitions into references to a specific module.
qualifyEnv :: ModuleName -> Env Name -> Env QName
qualifyEnv m = mapEnv (Qual m)

-- Lift a set of local definitions into references to the current module.
unqualifyEnv :: Env Name -> Env QName
unqualifyEnv = mapEnv UnQual

-- | Look up the type definition for a given field.
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
    = thisDef : subDefs
  where
    protoName = d ^. name
    hsName = unpack $ capitalize $ d ^. name
    thisDef = (protoPrefix <> protoName
              , Message MessageInfo
                  { messageName = Ident $ hsPrefix ++ hsName
                  , messageDescriptor = d
                  , messageFields =
                      [ FieldInfo
                          { overloadedField = n
                          , recordFieldName = Ident $ "_" ++ hsPrefix' ++ n
                          , fieldDescriptor = f
                          }
                      | f <- d ^. field
                      , let n = fieldName (f ^. name)
                      ]
                  })
    subDefs = messageAndEnumDefs protoPrefix' hsPrefix'
                  (d ^. nestedType) (d ^. enumType)
    protoPrefix' = protoPrefix <> protoName <> "."
    hsPrefix' = hsPrefix ++ hsName ++ "'"

-- | Get the name in Haskell of a proto field, taking care of camel casing and
-- clashes with language keywords.
fieldName :: Text -> String
fieldName = unpack . disambiguate . camelCase
  where
    disambiguate s
        -- TODO: use a more comprehensive blacklist of Haskell keywords.
        | s `Set.member` reservedKeywords = s <> "'"
        | otherwise = s
    camelCase s
        -- Preserve any initial underlines (e.g., "_foo_bar" -> "_fooBar").
        | (underlines, rest) <- T.span (== '_') s
            = case splitOn "_" rest of
                -- splitOn always returns a list with at least one element.
                [] -> error $ "camelCase: splitOn returned empty list: "
                                ++ show rest
                [""] -> error "camelCase: name consists only of underscores"
                s':ss -> T.concat $ underlines : toLower s' : map capitalize ss

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
    , "proc"  -- Arrows
    ]

-- | Generate the definition for an enum type.
enumDef :: Text -> String -> EnumDescriptorProto
          -> (Text, Definition Name)
enumDef protoPrefix hsPrefix d = let
    mkText n = protoPrefix <> n
    mkHsName n = Ident $ hsPrefix ++ unpack n
    in (mkText (d ^. name)
       , Enum EnumInfo
            { enumName = mkHsName (d ^. name)
            , enumDescriptor = d
            , enumValueNames = fmap (mkHsName . (^. name)) (d ^. value)
            })

-- Haskell types must start with an uppercase letter, so we capitalize message
-- and enum names.
-- Name collisions will show up as build errors in the generated haskell file.
capitalize :: Text -> Text
capitalize s
    | Just (c, s') <- uncons s = cons (toUpper c) s'
    | otherwise = s
