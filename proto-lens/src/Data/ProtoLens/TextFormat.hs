-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

-- | Functions for converting protocol buffers to a human-readable text format.
{-# LANGUAGE GADTs #-}
{-# LANGUAGE PatternGuards #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Data.ProtoLens.TextFormat(
    showMessage,
    showMessageShort,
    pprintMessage,
    readMessage,
    readMessageOrDie,
    ) where

import Lens.Family2 ((&),(^.),(.~), set, over)
import Control.Arrow (left)
import qualified Data.ByteString
import Data.Char (isPrint, isAscii, chr)
import Data.Foldable (foldlM, foldl')
import Data.Maybe (catMaybes)
import qualified Data.Map as Map
import qualified Data.Set as Set
import qualified Data.Text.Encoding as Text
import qualified Data.Text.Lazy as Lazy
import Numeric (showOct)
import Text.Parsec (parse)
import Text.PrettyPrint

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
pprintMessage = pprintMessage' descriptor

-- | Convert the given message into a human-readable 'String'.
showMessage :: Message msg => msg -> String
showMessage = render . pprintMessage

-- | Serializes a proto as a string on a single line.  Useful for debugging
-- and error messages like @.DebugString()@ in other languages.
showMessageShort :: Message msg => msg -> String
showMessageShort = renderStyle (Style OneLineMode maxBound 1.5) . pprintMessage

pprintMessage' :: MessageDescriptor msg -> msg -> Doc
pprintMessage' descr msg
    -- Either put all fields together on a single line, or use a separate line
    -- for each field.  We use a single "sep" for all fields (and all elements
    -- of all the repeated fields) to avoid putting some repeated fields on one
    -- line and other fields on multiple lines, which is less readable.
    = sep $ concatMap (pprintField msg) $ Map.elems $ fieldsByTag descr

pprintField :: msg -> FieldDescriptor msg -> [Doc]
pprintField msg (FieldDescriptor name typeDescr accessor)
    = map (pprintFieldValue name typeDescr) $ case accessor of
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

pprintFieldValue :: String -> FieldTypeDescriptor value -> value -> Doc
pprintFieldValue name MessageField m
    = sep [text name <+> lbrace, nest 2 (pprintMessage m), rbrace]
pprintFieldValue name EnumField x = text name <> colon <+> text (showEnum x)
pprintFieldValue name Int32Field x = primField name x
pprintFieldValue name Int64Field x = primField name x
pprintFieldValue name UInt32Field x = primField name x
pprintFieldValue name UInt64Field x = primField name x
pprintFieldValue name SInt32Field x = primField name x
pprintFieldValue name SInt64Field x = primField name x
pprintFieldValue name Fixed32Field x = primField name x
pprintFieldValue name Fixed64Field x = primField name x
pprintFieldValue name SFixed32Field x = primField name x
pprintFieldValue name SFixed64Field x = primField name x
pprintFieldValue name FloatField x = primField name x
pprintFieldValue name DoubleField x = primField name x
pprintFieldValue name BoolField x = text name <> colon <+> boolValue x
pprintFieldValue name StringField x = pprintByteString name (Text.encodeUtf8 x)
pprintFieldValue name BytesField x = pprintByteString name x
pprintFieldValue name GroupField m
    = text name <+> lbrace $$ nest 2 (pprintMessage m) $$ rbrace

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

--------------------------------------------------------------------------------
-- Parsing

-- | Parse a 'Message' from the human-readable protocol buffer text format.
readMessage :: Message msg => Lazy.Text -> Either String msg
readMessage str = left show (parse Parser.parser "" str) >>= buildMessage

-- | Parse a 'Message' from the human-readable protocol buffer text format.
-- Throws an error if the parse was not successful.
readMessageOrDie :: Message msg => Lazy.Text -> msg
readMessageOrDie str = case readMessage str of
    Left e -> error $ "readMessageOrDie: " ++ e
    Right x -> x

buildMessage :: forall msg . Message msg => Parser.Message -> Either String msg
buildMessage fields
    | missing <- missingFields desc fields, not $ null missing
        = Left $ "Missing fields " ++ show missing
    | otherwise = reverseRepeatedFields (fieldsByTag desc)
                      <$> buildMessageFromDescriptor desc def fields
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
    :: MessageDescriptor msg -> msg -> Parser.Message -> Either String msg
buildMessageFromDescriptor descr = foldlM (addField descr)

addField :: MessageDescriptor msg -> msg -> Parser.Field -> Either String msg
addField descr msg (Parser.Field key rawValue) = do
    FieldDescriptor _ typeDescriptor accessor <- getFieldDescriptor
    value <- makeValue typeDescriptor rawValue
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

makeValue :: FieldTypeDescriptor value -> Parser.Value -> Either String value
makeValue Int32Field (Parser.IntValue x) = Right (fromInteger x)
makeValue Int64Field (Parser.IntValue x) = Right (fromInteger x)
makeValue UInt32Field (Parser.IntValue x) = Right (fromInteger x)
makeValue UInt64Field (Parser.IntValue x) = Right (fromInteger x)
makeValue SInt32Field (Parser.IntValue x) = Right (fromInteger x)
makeValue SInt64Field (Parser.IntValue x) = Right (fromInteger x)
makeValue Fixed32Field (Parser.IntValue x) = Right (fromInteger x)
makeValue Fixed64Field (Parser.IntValue x) = Right (fromInteger x)
makeValue SFixed32Field (Parser.IntValue x) = Right (fromInteger x)
makeValue SFixed64Field (Parser.IntValue x) = Right (fromInteger x)
makeValue FloatField (Parser.IntValue x) = Right (fromInteger x)
makeValue DoubleField (Parser.IntValue x) = Right (fromInteger x)
makeValue BoolField (Parser.IntValue x)
    | x == 0 = Right False
    | x == 1 = Right True
    | otherwise = Left $ "Unrecognized bool value " ++ show x
makeValue DoubleField (Parser.DoubleValue x) = Right x
makeValue FloatField (Parser.DoubleValue x) = Right (realToFrac x)
makeValue BoolField (Parser.EnumValue x)
    | x == "true" = Right True
    | x == "false" = Right False
    | otherwise = Left $ "Unrecognized bool value " ++ show x
makeValue StringField (Parser.ByteStringValue x) = Right (Text.decodeUtf8 x)
makeValue BytesField (Parser.ByteStringValue x) = Right x
makeValue EnumField (Parser.IntValue x) =
    maybe (Left $ "Unrecognized enum value " ++ show x) Right
        (maybeToEnum $ fromInteger x)
makeValue EnumField (Parser.EnumValue x) =
    maybe (Left $ "Unrecognized enum value " ++ show x) Right
        (readEnum x)
makeValue MessageField (Parser.MessageValue x) = buildMessage x
makeValue GroupField (Parser.MessageValue x) = buildMessage x
makeValue f val = Left $ "Type mismatch parsing text format: " ++ show (f, val)
