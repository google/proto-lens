-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

-- | Functions for converting protocol buffers to a human-readable text format.
{-# LANGUAGE CPP #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE PatternGuards #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}

module Data.ProtoLens.TextFormat(
    showMessage,
    showMessageWithRegistry,
    showMessageShort,
    pprintMessage,
    pprintMessageWithRegistry,
    readMessage,
    readMessageWithRegistry,
    readMessageOrDie,
    ) where

import Lens.Family2 ((&),(^.),(.~), set, over, view)
import Control.Arrow (left)
import Data.Bifunctor (first)
import qualified Data.ByteString
import Data.Char (isPrint, isAscii, chr)
import Data.Foldable (foldlM, foldl')
import qualified Data.Map as Map
import Data.Maybe (catMaybes)
import Data.Proxy (Proxy(Proxy))
import Data.ProtoLens.Encoding (encodeMessage, decodeMessage)
import qualified Data.Set as Set
import qualified Data.Text.Encoding as Text
import qualified Data.Text.Lazy as Lazy
import qualified Data.Text as Text (unpack)
import Numeric (showOct)
import Text.Parsec (parse)
import Text.PrettyPrint

#if MIN_VERSION_base(4,11,0)
import Prelude hiding ((<>))
#endif

import Data.ProtoLens.Encoding.Wire
import Data.ProtoLens.Message
import qualified Data.ProtoLens.TextFormat.Parser as Parser

-- TODO: This code is newer and missing some edge cases,
-- including:
-- - Serialize directly to Text
-- - String/bytestring serialization
--   - Strings delimited by single quotes
--   - Concatenate multiple strings one after another
--   - control characters and non-UTF8 text
--   - characters in bytes fields should fit in Word8
-- - More output formats for floats like exponentials
-- - Print/parse enums by textual name in addition to integer value
-- - More compact printing/parsing for packed fields
-- - Decide what to do for values that don't fit in the field (e.g., overflow)
-- - Add more tests for:
--   - edge cases of deserialization ("deserializeFrom")


-- | Pretty-print the given message into a human-readable form.
pprintMessage :: Message msg => msg -> Doc
pprintMessage = pprintMessageWithRegistry mempty

-- | Pretty-print the given message into human-readable form, using the given
-- 'Registry' to decode @google.protobuf.Any@ values.
pprintMessageWithRegistry :: Message msg => Registry -> msg -> Doc
pprintMessageWithRegistry reg msg
    -- Either put all fields together on a single line, or use a separate line
    -- for each field.  We use a single "sep" for all fields (and all elements
    -- of all the repeated fields) to avoid putting some repeated fields on one
    -- line and other fields on multiple lines, which is less readable.
    = sep $ concatMap (pprintField reg msg) allFields
              ++ map pprintTaggedValue (msg ^. unknownFields)

-- | Convert the given message into a human-readable 'String'.
showMessage :: Message msg => msg -> String
showMessage = render . pprintMessage

-- | Convert the given message into a human-readable 'String', using the
-- 'Registry' to encode @google.protobuf.Any@ values.
showMessageWithRegistry :: Message msg => Registry -> msg -> String
showMessageWithRegistry reg = render . pprintMessageWithRegistry reg

-- | Serializes a proto as a string on a single line.  Useful for debugging
-- and error messages like @.DebugString()@ in other languages.
showMessageShort :: Message msg => msg -> String
showMessageShort = renderStyle (Style OneLineMode maxBound 1.5) . pprintMessage

pprintField :: Registry -> msg -> FieldDescriptor msg -> [Doc]
pprintField reg msg (FieldDescriptor name typeDescr accessor)
    = map (pprintFieldValue reg name typeDescr) $ case accessor of
        PlainField d f
            | Optional <- d, val == fieldDefault -> []
            | otherwise -> [val]
          where val = msg ^. f
        OptionalField f -> catMaybes [msg ^. f]
        -- TODO: better printing for packed fields
        RepeatedField _ f -> msg ^. f
        MapField k v f -> pairToMsg <$> Map.assocs (msg ^. f)
          where pairToMsg (x,y) = def & k .~ x
                                      & v .~ y

pprintFieldValue :: Registry -> String -> FieldTypeDescriptor value -> value -> Doc
pprintFieldValue reg name field@(MessageField MessageType) m
  | Just AnyMessageDescriptor { anyTypeUrlLens, anyValueLens } <- matchAnyMessage field,
    typeUri <- view anyTypeUrlLens m,
    fieldData <- view anyValueLens m,
    Just (SomeMessageType (Proxy :: Proxy value')) <- lookupRegistered typeUri reg,
    Right (anyValue :: value') <- decodeMessage fieldData =
      pprintSubmessage name
          $ sep
            [ lbrack <> text (Text.unpack typeUri) <> rbrack <+> lbrace
            , nest 2 (pprintMessageWithRegistry reg anyValue)
            , rbrace ]
  | otherwise =
      pprintSubmessage name (pprintMessageWithRegistry reg m)
pprintFieldValue reg name (MessageField GroupType) m
    = pprintSubmessage name (pprintMessageWithRegistry reg m)
pprintFieldValue _ name (ScalarField f) x = named name $ pprintScalarValue f x

named :: String -> Doc -> Doc
named n x = text n <> colon <+> x


pprintScalarValue :: ScalarField value -> value -> Doc
pprintScalarValue EnumField x = text (showEnum x)
pprintScalarValue Int32Field x = primField x
pprintScalarValue Int64Field x = primField x
pprintScalarValue UInt32Field x = primField x
pprintScalarValue UInt64Field x = primField x
pprintScalarValue SInt32Field x = primField x
pprintScalarValue SInt64Field x = primField x
pprintScalarValue Fixed32Field x = primField x
pprintScalarValue Fixed64Field x = primField x
pprintScalarValue SFixed32Field x = primField x
pprintScalarValue SFixed64Field x = primField x
pprintScalarValue FloatField x = primField x
pprintScalarValue DoubleField x = primField x
pprintScalarValue BoolField x = boolValue x
pprintScalarValue StringField x = pprintByteString (Text.encodeUtf8 x)
pprintScalarValue BytesField x = pprintByteString x

pprintSubmessage :: String -> Doc -> Doc
pprintSubmessage name contents =
    sep [text name <+> lbrace, nest 2 contents, rbrace]

-- | Formats a string in a way that mostly matches the C-compatible escaping
-- used by the Protocol Buffer distribution.  We depart a bit by escaping all
-- non-ASCII characters, which depending on the locale, the distribution might
-- not do.
--
-- This uses three-digit octal escapes, e.g. "\011" plus \n, \r,, \t, \', \",
-- and \\ only.  Note that Haskell string-literal syntax calls for "\011" to be
-- interpreted as decimal 11, rather than the decimal 9 it actually represent,
-- so you can't use Prelude.read to parse the strings created here.
pprintByteString :: Data.ByteString.ByteString -> Doc
pprintByteString x = char '\"'
    <> text (concatMap escape $ Data.ByteString.unpack x) <> char '\"'
  where escape w8 | ch == '\n'               = "\\n"
                  | ch == '\r'               = "\\r"
                  | ch == '\t'               = "\\t"
                  | ch == '\"'               = "\\\""
                  | ch == '\''               = "\\\'"
                  | ch == '\\'               = "\\\\"
                  | isPrint ch && isAscii ch = ch : ""
                  | otherwise                = "\\" ++ pad (showOct w8 "")
          where
            ch = chr $ fromIntegral w8
            pad str = replicate (3 - length str) '0' ++ str

primField :: Show value => value -> Doc
primField x = text (show x)

boolValue :: Bool -> Doc
boolValue True = text "true"
boolValue False = text "false"

pprintTaggedValue :: TaggedValue -> Doc
pprintTaggedValue (TaggedValue t (WireValue v x)) = case v of
    VarInt -> named name $ primField x
    Fixed64 -> named name $ primField x
    Fixed32 -> named name $ primField x
    Lengthy -> case decodeFieldSet x of
                  Left _ -> named name $ pprintByteString x
                  Right ts -> pprintSubmessage name
                                $ sep $ map pprintTaggedValue ts
    -- TODO: implement better printing for unknown groups
    StartGroup -> named name $ text "start_group"
    EndGroup -> named name $ text "end_group"
  where
    name = show (unTag t)

--------------------------------------------------------------------------------
-- Parsing

-- | Parse a 'Message' from the human-readable protocol buffer text format.
readMessage :: Message msg => Lazy.Text -> Either String msg
readMessage = readMessageWithRegistry mempty

-- | Parse a 'Message' from the human-readable protocol buffer text format.
-- Throws an error if the parse was not successful.
readMessageOrDie :: Message msg => Lazy.Text -> msg
readMessageOrDie str = case readMessage str of
    Left e -> error $ "readMessageOrDie: " ++ e
    Right x -> x

-- | Parse a 'Message' from a human-readable protocol buffer text format, using
-- the given 'Registry' to decode 'Any' fields
readMessageWithRegistry :: Message msg => Registry -> Lazy.Text -> Either String msg
readMessageWithRegistry reg str = left show (parse Parser.parser "" str) >>= buildMessage reg

buildMessage :: forall msg . Message msg => Registry -> Parser.Message -> Either String msg
buildMessage reg fields
    | missing <- missingFields (Proxy @msg) fields, not $ null missing
        = Left $ "Missing fields " ++ show missing
    | otherwise = reverseRepeatedFields fieldsByTag
                      <$> buildMessageFromDescriptor reg def fields

missingFields :: forall msg . Message msg => Proxy msg -> Parser.Message -> [String]
missingFields _ = Set.toList . foldl' deleteField requiredFieldNames
  where
    requiredFieldNames :: Set.Set String
    requiredFieldNames = Set.fromList $ Map.keys
                            $ Map.filter isRequired
                            $ fieldsByTextFormatName @msg
    deleteField :: Set.Set String -> Parser.Field -> Set.Set String
    deleteField fs (Parser.Field (Parser.Key name) _) = Set.delete name fs
    deleteField fs (Parser.Field (Parser.UnknownKey n) _)
        | Just d <- Map.lookup (Tag (fromIntegral n)) (fieldsByTag @msg)
        = Set.delete (fieldDescriptorName d) fs
    deleteField fs _ = fs


buildMessageFromDescriptor
    :: Message msg => Registry -> msg -> Parser.Message -> Either String msg
buildMessageFromDescriptor reg = foldlM (addField reg)

addField :: forall msg . Message msg => Registry -> msg -> Parser.Field -> Either String msg
addField reg msg (Parser.Field key rawValue) = do
    FieldDescriptor name typeDescriptor accessor <- getFieldDescriptor
    value <- makeValue name reg typeDescriptor rawValue
    return $ modifyField accessor value msg
  where
    getFieldDescriptor
        | Parser.Key name <- key, Just f <- Map.lookup name
                                                fieldsByTextFormatName
            = return f
        | Parser.UnknownKey tag <- key, Just f <- Map.lookup (fromIntegral tag)
                                                      fieldsByTag
            = return f
        | otherwise = Left $ "Unrecognized field " ++ show key

modifyField :: FieldAccessor msg value -> value -> msg -> msg
modifyField (PlainField _ f) value = set f value
modifyField (OptionalField f) value = set f (Just value)
modifyField (RepeatedField _ f) value = over f (value :)
modifyField (MapField key value f) mapElem
    = over f (Map.insert (mapElem ^. key) (mapElem ^. value))

makeValue
    :: forall value
     . String -- ^ name of field
    -> Registry
    -> FieldTypeDescriptor value
    -> Parser.Value
    -> Either String value
makeValue name _ (ScalarField f) v =
    first (("Error parsing field " ++ show name ++ ": ") ++) $ makeScalarValue f v
makeValue name reg field@(MessageField MessageType) (Parser.MessageValue (Just typeUri) x)
    | Just AnyMessageDescriptor { anyTypeUrlLens, anyValueLens } <- matchAnyMessage field =
        case lookupRegistered typeUri reg of
          Nothing -> Left $ "Could not decode google.protobuf.Any for field "
                                ++ show name ++ ": unregistered type URI "
                                ++ show typeUri
          Just (SomeMessageType (Proxy :: Proxy value')) ->
            case buildMessage reg x :: Either String value' of
              Left err -> Left err
              Right value' -> Right (def & anyTypeUrlLens .~ typeUri
                                         & anyValueLens .~ encodeMessage value')
    | otherwise = Left ("Type mismatch parsing explicitly typed message. Expected " ++
                        show (messageName (Proxy @value))  ++
                        ", got " ++ show typeUri)
makeValue _ reg (MessageField _) (Parser.MessageValue _ x) = buildMessage reg x
makeValue name _ (MessageField _) val =
    Left $ "Type mismatch for field " ++ show name ++
            ": expected message, found " ++ show val

makeScalarValue :: ScalarField value -> Parser.Value -> Either String value
makeScalarValue Int32Field (Parser.IntValue x) = Right (fromInteger x)
makeScalarValue Int64Field (Parser.IntValue x) = Right (fromInteger x)
makeScalarValue UInt32Field (Parser.IntValue x) = Right (fromInteger x)
makeScalarValue UInt64Field (Parser.IntValue x) = Right (fromInteger x)
makeScalarValue SInt32Field (Parser.IntValue x) = Right (fromInteger x)
makeScalarValue SInt64Field (Parser.IntValue x) = Right (fromInteger x)
makeScalarValue Fixed32Field (Parser.IntValue x) = Right (fromInteger x)
makeScalarValue Fixed64Field (Parser.IntValue x) = Right (fromInteger x)
makeScalarValue SFixed32Field (Parser.IntValue x) = Right (fromInteger x)
makeScalarValue SFixed64Field (Parser.IntValue x) = Right (fromInteger x)
makeScalarValue FloatField (Parser.IntValue x) = Right (fromInteger x)
makeScalarValue DoubleField (Parser.IntValue x) = Right (fromInteger x)
makeScalarValue BoolField (Parser.IntValue x)
    | x == 0 = Right False
    | x == 1 = Right True
    | otherwise = Left $ "Unrecognized bool value " ++ show x
makeScalarValue DoubleField (Parser.DoubleValue x) = Right x
makeScalarValue FloatField (Parser.DoubleValue x) = Right (realToFrac x)
makeScalarValue BoolField (Parser.EnumValue x)
    | x == "true" = Right True
    | x == "false" = Right False
    | otherwise = Left $ "Unrecognized bool value " ++ show x
makeScalarValue StringField (Parser.ByteStringValue x) = Right (Text.decodeUtf8 x)
makeScalarValue BytesField (Parser.ByteStringValue x) = Right x
makeScalarValue EnumField (Parser.IntValue x) =
    maybe (Left $ "Unrecognized enum value " ++ show x) Right
        (maybeToEnum $ fromInteger x)
makeScalarValue EnumField (Parser.EnumValue x) =
    maybe (Left $ "Unrecognized enum value " ++ show x) Right
        (readEnum x)
makeScalarValue f val = Left $ "Type mismatch: " ++ show (f, val)
