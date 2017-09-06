-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

-- | Functions for converting protocol buffers to a human-readable text format.
{-# LANGUAGE GADTs #-}
{-# LANGUAGE PatternGuards #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE NamedFieldPuns #-}

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
pprintMessageWithRegistry reg = pprintMessage' reg descriptor

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

pprintMessage' :: Registry -> MessageDescriptor msg -> msg -> Doc
pprintMessage' reg descr msg
    -- Either put all fields together on a single line, or use a separate line
    -- for each field.  We use a single "sep" for all fields (and all elements
    -- of all the repeated fields) to avoid putting some repeated fields on one
    -- line and other fields on multiple lines, which is less readable.
    = sep $ concatMap (pprintField reg msg) (Map.elems $ fieldsByTag descr)
              ++ map pprintTaggedValue (msg ^. unknownFieldsLens descr)

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
pprintFieldValue reg name field@MessageField m
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
pprintFieldValue _ name EnumField x = text name <> colon <+> text (showEnum x)
pprintFieldValue _ name Int32Field x = primField name x
pprintFieldValue _ name Int64Field x = primField name x
pprintFieldValue _ name UInt32Field x = primField name x
pprintFieldValue _ name UInt64Field x = primField name x
pprintFieldValue _ name SInt32Field x = primField name x
pprintFieldValue _ name SInt64Field x = primField name x
pprintFieldValue _ name Fixed32Field x = primField name x
pprintFieldValue _ name Fixed64Field x = primField name x
pprintFieldValue _ name SFixed32Field x = primField name x
pprintFieldValue _ name SFixed64Field x = primField name x
pprintFieldValue _ name FloatField x = primField name x
pprintFieldValue _ name DoubleField x = primField name x
pprintFieldValue _ name BoolField x = text name <> colon <+> boolValue x
pprintFieldValue _ name StringField x = pprintByteString name (Text.encodeUtf8 x)
pprintFieldValue _ name BytesField x = pprintByteString name x
pprintFieldValue reg name GroupField m
    = pprintSubmessage name (pprintMessageWithRegistry reg m)

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
pprintByteString :: String -> Data.ByteString.ByteString -> Doc
pprintByteString name x = text name <> colon <+> char '\"'
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

primField :: Show value => String -> value -> Doc
primField name x = text name <> colon <+> text (show x)

boolValue :: Bool -> Doc
boolValue True = text "true"
boolValue False = text "false"

pprintTaggedValue :: TaggedValue -> Doc
pprintTaggedValue (TaggedValue t (WireValue v x)) = case v of
    VarInt -> primField name x
    Fixed64 -> primField name x
    Fixed32 -> primField name x
    Lengthy -> case decodeFieldSet x of
                  Left _ -> pprintByteString name x
                  Right ts -> pprintSubmessage name
                                $ sep $ map pprintTaggedValue ts
    -- TODO: implement better printing for unknown groups
    StartGroup -> text name <> colon <+> text "start_group"
    EndGroup -> text name <> colon <+> text "end_group"
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
    | missing <- missingFields desc fields, not $ null missing
        = Left $ "Missing fields " ++ show missing
    | otherwise = reverseRepeatedFields (fieldsByTag desc)
                      <$> buildMessageFromDescriptor reg desc def fields
  where
    desc :: MessageDescriptor msg
    desc = descriptor

missingFields :: MessageDescriptor msg -> Parser.Message -> [String]
missingFields desc = Set.toList . foldl' deleteField requiredFieldNames
  where
    requiredFieldNames :: Set.Set String
    requiredFieldNames = Set.fromList $ Map.keys
                            $ Map.filter isRequired
                            $ fieldsByTextFormatName desc
    deleteField :: Set.Set String -> Parser.Field -> Set.Set String
    deleteField fs (Parser.Field (Parser.Key name) _) = Set.delete name fs
    deleteField fs (Parser.Field (Parser.UnknownKey n) _)
        | Just d <- Map.lookup (Tag (fromIntegral n)) $ fieldsByTag desc
        = Set.delete (fieldDescriptorName d) fs
    deleteField fs _ = fs


buildMessageFromDescriptor
    :: Registry -> MessageDescriptor msg -> msg -> Parser.Message -> Either String msg
buildMessageFromDescriptor reg descr = foldlM (addField reg descr)

addField :: Registry -> MessageDescriptor msg -> msg -> Parser.Field -> Either String msg
addField reg descr msg (Parser.Field key rawValue) = do
    FieldDescriptor _ typeDescriptor accessor <- getFieldDescriptor
    value <- makeValue reg typeDescriptor rawValue
    return $ modifyField accessor value msg
  where
    getFieldDescriptor
        | Parser.Key name <- key, Just f <- Map.lookup name
                                                (fieldsByTextFormatName descr)
            = return f
        | Parser.UnknownKey tag <- key, Just f <- Map.lookup (fromIntegral tag)
                                                      (fieldsByTag descr)
            = return f
        | otherwise = Left $ "Unrecognized field " ++ show key

modifyField :: FieldAccessor msg value -> value -> msg -> msg
modifyField (PlainField _ f) value = set f value
modifyField (OptionalField f) value = set f (Just value)
modifyField (RepeatedField _ f) value = over f (value :)
modifyField (MapField key value f) mapElem
    = over f (Map.insert (mapElem ^. key) (mapElem ^. value))

makeValue :: forall value. Registry -> FieldTypeDescriptor value -> Parser.Value -> Either String value
makeValue _ Int32Field (Parser.IntValue x) = Right (fromInteger x)
makeValue _ Int64Field (Parser.IntValue x) = Right (fromInteger x)
makeValue _ UInt32Field (Parser.IntValue x) = Right (fromInteger x)
makeValue _ UInt64Field (Parser.IntValue x) = Right (fromInteger x)
makeValue _ SInt32Field (Parser.IntValue x) = Right (fromInteger x)
makeValue _ SInt64Field (Parser.IntValue x) = Right (fromInteger x)
makeValue _ Fixed32Field (Parser.IntValue x) = Right (fromInteger x)
makeValue _ Fixed64Field (Parser.IntValue x) = Right (fromInteger x)
makeValue _ SFixed32Field (Parser.IntValue x) = Right (fromInteger x)
makeValue _ SFixed64Field (Parser.IntValue x) = Right (fromInteger x)
makeValue _ FloatField (Parser.IntValue x) = Right (fromInteger x)
makeValue _ DoubleField (Parser.IntValue x) = Right (fromInteger x)
makeValue _ BoolField (Parser.IntValue x)
    | x == 0 = Right False
    | x == 1 = Right True
    | otherwise = Left $ "Unrecognized bool value " ++ show x
makeValue _ DoubleField (Parser.DoubleValue x) = Right x
makeValue _ FloatField (Parser.DoubleValue x) = Right (realToFrac x)
makeValue _ BoolField (Parser.EnumValue x)
    | x == "true" = Right True
    | x == "false" = Right False
    | otherwise = Left $ "Unrecognized bool value " ++ show x
makeValue _ StringField (Parser.ByteStringValue x) = Right (Text.decodeUtf8 x)
makeValue _ BytesField (Parser.ByteStringValue x) = Right x
makeValue _ EnumField (Parser.IntValue x) =
    maybe (Left $ "Unrecognized enum value " ++ show x) Right
        (maybeToEnum $ fromInteger x)
makeValue _ EnumField (Parser.EnumValue x) =
    maybe (Left $ "Unrecognized enum value " ++ show x) Right
        (readEnum x)
makeValue reg MessageField (Parser.MessageValue Nothing x) =
  buildMessage reg x
makeValue reg field@MessageField (Parser.MessageValue (Just typeUri) x)
    | Just AnyMessageDescriptor { anyTypeUrlLens, anyValueLens } <- matchAnyMessage field =
        case lookupRegistered typeUri reg of
          Nothing -> Left "Could not decode Any"
          Just (SomeMessageType (Proxy :: Proxy value')) ->
            case buildMessage reg x :: Either String value' of
              Left err -> Left err
              Right value' -> Right (def & anyTypeUrlLens .~ typeUri
                                         & anyValueLens .~ encodeMessage value')
    | otherwise = Left ("Type mismatch parsing explicitly typed message. Expected " ++
                        show (messageName (descriptor :: MessageDescriptor value))  ++
                        ", got " ++ show typeUri)
makeValue reg GroupField (Parser.MessageValue _ x) = buildMessage reg x
makeValue _ f val = Left $ "Type mismatch parsing text format: " ++ show (f, val)
