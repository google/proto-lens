-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

-- | Functions for encoding and decoding protocol buffer Messages.
--
-- TODO: Currently all operations are on strict ByteStrings;
-- we should try to generalize to lazy Bytestrings as well.
{-# LANGUAGE GADTs #-}
{-# LANGUAGE PatternGuards #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Data.ProtoLens.Encoding(
    encodeMessage,
    buildMessage,
    decodeMessage,
    decodeMessageOrDie,
    ) where

import Data.ProtoLens.Message
import Data.ProtoLens.Encoding.Bytes
import Data.ProtoLens.Encoding.Wire

import Control.Applicative ((<|>), (<$>))
import Control.Monad (foldM)
import Data.Attoparsec.ByteString as Parse
import Data.Bool (bool)
import Data.Text.Encoding (encodeUtf8, decodeUtf8')
import Data.Text.Encoding.Error (UnicodeException(..))
import qualified Data.ByteString as B
import qualified Data.Map.Strict as Map
import Data.ByteString.Lazy.Builder as Builder
import qualified Data.ByteString.Lazy as L
import Data.Monoid (mconcat, mempty)
import Data.Foldable (foldMap, toList, foldl')
import Lens.Family2 (set, over, (^.), (&))

-- TODO: We could be more incremental when parsing/encoding length-based fields,
-- rather than forcing the whole thing.  E.g., for encoding we're doing extra
-- allocation by building an intermediate bytestring.

-- | Decode a message from its wire format.  Returns 'Left' if the decoding
-- fails.
decodeMessage :: Message msg => B.ByteString -> Either String msg
decodeMessage input =
    parseOnly (Parse.manyTill getTaggedValue endOfInput) input
        >>= taggedValuesToMessage

-- | Decode a message from its wire format.  Throws an error if the decoding
-- fails.
decodeMessageOrDie :: Message msg => B.ByteString -> msg
decodeMessageOrDie bs = case decodeMessage bs of
    Left e -> error $ "decodeMessageOrDie: " ++ e
    Right x -> x

-- | Convert a sequence of parsed key-value pairs into a Message via its
-- descriptor. Will fail if any of the key-value pairs do not match those
-- expected by the field descriptors.
taggedValuesToMessage :: Message msg => [TaggedValue] -> Either String msg
taggedValuesToMessage tvs
    | missing <- missingFields fields tvs, not $ null missing
        = Left $ "Missing required fields " ++ show missing
    | otherwise = reverseRepeatedFields fields <$> result
  where
    addTaggedValue msg tv@(TaggedValue tag _) =
        case Map.lookup (Tag tag) fields of
            Nothing -> return msg
            Just field -> parseAndAddField msg field tv
    fields = fieldsByTag descriptor
    result = foldM addTaggedValue def tvs

missingFields :: Map.Map Tag (FieldDescriptor msg) -> [TaggedValue] -> [String]
missingFields fields
    = map fieldDescriptorName
        . Map.elems
        . foldl' (\m (TaggedValue t _) -> Map.delete (Tag t) m) requiredFields
  where
    requiredFields = Map.filter isRequired fields

runEither :: Either String a -> Parser a
runEither (Left x) = fail x
runEither (Right x) = return x

parseAndAddField :: msg
                 -> FieldDescriptor msg
                 -> TaggedValue
                 -> Either String msg
parseAndAddField
    msg
    (FieldDescriptor name typeDescriptor accessor)
    (TaggedValue tag (WireValue wt val))
    = case fieldWireType typeDescriptor of
        FieldWireType fieldWt _ get -> let
          getSimpleVal = do
              Equal <- equalWireTypes name fieldWt wt
              get val
          -- Get a block of packed values, reversed.
          getPackedVals = do
              Equal <- equalWireTypes name Lengthy wt
              let getElt = getWireValue fieldWt tag >>= runEither . get
              parseOnly (manyReversedTill getElt endOfInput) val
          in case accessor of
              PlainField _ f -> do
                  x <- getSimpleVal
                  return $ set f x msg
              OptionalField f -> do
                  x <- getSimpleVal
                  return $ set f (Just x) msg
              RepeatedField Unpacked f -> do
                  x <- getSimpleVal
                  return $ over f (x:) msg
              RepeatedField Packed f -> do
                  xs <- getPackedVals
                  return $ over f (xs++) msg
              MapField keyLens valueLens f -> do
                  entry <- getSimpleVal
                  return $ over f
                      (Map.insert (entry ^. keyLens) (entry ^. valueLens))
                      msg

-- | Run the parser zero or more times, until the "end" parser succeeds.
-- Returns a list of the parsed elements, in reverse order.
manyReversedTill :: Parser a -> Parser b -> Parser [a]
manyReversedTill p end = loop []
  where
    loop xs = (end >> return xs) <|> (p >>= \x -> loop (x:xs))

-- | Encode a message to the wire format.
encodeMessage :: Message msg => msg -> B.ByteString
encodeMessage = L.toStrict . toLazyByteString . buildMessage

-- | Encode a message to the wire format, as part of a 'Builder'.
buildMessage :: Message msg => msg -> Builder
buildMessage msg = foldMap putTaggedValue (messageToTaggedValues msg)

-- | Encode a message as a sequence of key-value pairs.
messageToTaggedValues :: Message msg => msg -> [TaggedValue]
messageToTaggedValues msg = mconcat
    [ map (TaggedValue t) (messageFieldToVals fieldDescr msg)
    | (Tag t, fieldDescr) <- Map.toList (fieldsByTag descriptor)
    ]

messageFieldToVals :: FieldDescriptor msg -> msg -> [WireValue]
messageFieldToVals (FieldDescriptor _ typeDescriptor accessor) msg =
    case fieldWireType typeDescriptor of
        FieldWireType wt convert _ -> case accessor of
            PlainField d f
                | Optional <- d, src == fieldDefault -> []
                | otherwise -> [WireValue wt (convert src)]
              where src = msg ^. f
            OptionalField f -> case msg ^. f of
                Just src -> [WireValue wt (convert src)]
                _ -> mempty
            RepeatedField Unpacked f
                -> [ WireValue wt (convert src)
                   | src <- toList (msg ^. f)
                   ]
            RepeatedField Packed f
                -> [WireValue Lengthy v]
                     where v = L.toStrict $ toLazyByteString
                               $ mconcat
                                 [ putWireValue wt (convert src)
                                 | src <- toList (msg ^. f)
                                 ]
            MapField keyLens valueLens f ->
                [ WireValue wt v
                | (key, value) <- Map.toList (msg ^. f)
                , let entry = def & set keyLens key & set valueLens value
                , let v = convert entry
                ]

data FieldWireType value where
    FieldWireType :: WireType w -> (value -> w) -> (w -> Either String value)
                  -> FieldWireType value

fieldWireType :: FieldTypeDescriptor value -> FieldWireType value
-- TODO: Don't let toEnum crash on unknown enum values.
fieldWireType EnumField = simpleFieldWireType VarInt
                              (fromIntegral . fromEnum)
                              (toEnum . fromIntegral)
fieldWireType BoolField = simpleFieldWireType VarInt (bool 0 1) (/= 0)
-- Note: int{32,64} and sfixed{32,64} are stored using the signed -> unsigned
-- conversion of fromIntegral.
fieldWireType Int32Field = integralFieldWireType VarInt
fieldWireType Int64Field = integralFieldWireType VarInt
fieldWireType UInt32Field = integralFieldWireType VarInt
fieldWireType UInt64Field = identityFieldWireType VarInt
fieldWireType SInt32Field = simpleFieldWireType VarInt
                                (fromIntegral . signedInt32ToWord)
                                (wordToSignedInt32 . fromIntegral)
fieldWireType SInt64Field = simpleFieldWireType VarInt
                                signedInt64ToWord wordToSignedInt64
fieldWireType Fixed32Field = identityFieldWireType Fixed32
fieldWireType Fixed64Field = identityFieldWireType Fixed64
fieldWireType SFixed32Field = integralFieldWireType Fixed32
fieldWireType SFixed64Field = integralFieldWireType Fixed64
fieldWireType FloatField = simpleFieldWireType Fixed32 floatToWord wordToFloat
fieldWireType DoubleField = simpleFieldWireType Fixed64
                                doubleToWord wordToDouble
fieldWireType StringField = FieldWireType Lengthy encodeUtf8
                                                  (stringizeError . decodeUtf8')
fieldWireType BytesField = identityFieldWireType Lengthy
fieldWireType MessageField = FieldWireType Lengthy encodeMessage decodeMessage
fieldWireType GroupField =
    FieldWireType StartGroup messageToTaggedValues taggedValuesToMessage

-- | Helper function to define a field type whose decoding operation can't fail.
simpleFieldWireType :: WireType w -> (value -> w) -> (w -> value)
                    -> FieldWireType value
simpleFieldWireType w f g = FieldWireType w f (return . g)

-- | A simple field type which is the same as its wire type.
identityFieldWireType :: WireType w -> FieldWireType w
identityFieldWireType w = simpleFieldWireType w id id

-- | A simple field type which converts to/from its wire type via
-- "fromIntegral".
integralFieldWireType
    :: (Integral w, Integral value) => WireType w -> FieldWireType value
integralFieldWireType w = simpleFieldWireType w fromIntegral fromIntegral

stringizeError :: Either UnicodeException a -> Either String a
stringizeError (Left e) = Left (show e)
stringizeError (Right a) = Right a
