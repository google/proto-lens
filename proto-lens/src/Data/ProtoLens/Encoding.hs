-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

-- | Functions for encoding and decoding protocol buffer Messages.
--
-- TODO: Currently all operations are on strict ByteStrings;
-- we should try to generalize to lazy Bytestrings as well.
{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE PatternGuards #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}
module Data.ProtoLens.Encoding(
    encodeMessage,
    buildMessage,
    buildMessageDelimited,
    decodeMessage,
    decodeMessageOrDie,
    ) where

import Data.ProtoLens.Message
import Data.ProtoLens.Encoding.Bytes
import Data.ProtoLens.Encoding.Parser
import Data.ProtoLens.Encoding.Wire

import Data.Bool (bool)
import Data.Monoid ((<>))
import Data.Proxy (Proxy(Proxy))
import Data.Text.Encoding (encodeUtf8, decodeUtf8')
import Data.Text.Encoding.Error (UnicodeException(..))
import qualified Data.Text as T
import qualified Data.ByteString as B
import qualified Data.Map.Strict as Map
import Data.ByteString.Lazy.Builder as Builder
import qualified Data.ByteString.Lazy as L
import Lens.Family2 (Lens', set, over, (^.), (&))

-- TODO: We could be more incremental when parsing/encoding length-based fields,
-- rather than forcing the whole thing.  E.g., for encoding we're doing extra
-- allocation by building an intermediate bytestring.

-- | Decode a message from its wire format.  Returns 'Left' if the decoding
-- fails.
decodeMessage :: Message msg => B.ByteString -> Either String msg
decodeMessage input = runParser (parseMessage isEnd) input

-- | Parse a message with the given ending delimiter (which will be EndGroup in
-- the case of a group, and end-of-input otherwise).
parseMessage :: forall msg . Message msg => Parser Bool -> Parser msg
parseMessage end = (<?> T.unpack (messageName (Proxy @msg))) $ do
    (msg, unsetFields) <- loop defMessage requiredFields
    if Map.null unsetFields
        then return $ over unknownFields reverse
                    $ reverseRepeatedFields fields msg
        else fail $ "Missing required fields "
                        ++ show (map fieldDescriptorName
                                    $ Map.elems $ unsetFields)
  where
    fields = fieldsByTag
    addUnknown :: TaggedValue -> msg -> msg
    addUnknown !f = over' unknownFields (f :)
    requiredFields = Map.filter isRequired fields
    loop :: msg -> Map.Map Tag (FieldDescriptor msg)
            -> Parser (msg, Map.Map Tag (FieldDescriptor msg))
    loop msg unsetFields = do
        atEnd <- end
        if atEnd
            then return (msg, unsetFields)
            else do
                    tv@(TaggedValue tag _) <- getTaggedValue
                    case Map.lookup tag fields of
                        Nothing -> (loop $! addUnknown tv msg) unsetFields
                        Just field -> do
                            !msg' <- parseAndAddField msg field tv
                                      <?> fieldDescriptorName field
                            loop msg' $! Map.delete tag unsetFields

-- | Decode a message from its wire format.  Throws an error if the decoding
-- fails.
decodeMessageOrDie :: Message msg => B.ByteString -> msg
decodeMessageOrDie bs = case decodeMessage bs of
    Left e -> error $ "decodeMessageOrDie: " ++ e
    Right x -> x

runEither :: Either String a -> Parser a
runEither = either fail return

parseAndAddField :: forall msg . msg
                 -> FieldDescriptor msg
                 -> TaggedValue
                 -> Parser msg
parseAndAddField
    !msg
    (FieldDescriptor _ typeDescriptor accessor)
    (TaggedValue tag (WireValue wt val)) = let
          getSimpleVal = case typeDescriptor of
                            MessageField GroupType -> do
                                Equal <- equalWireTypes StartGroup wt
                                parseMessage (endOfGroup tag)
                            MessageField MessageType -> do
                                Equal <- equalWireTypes Lengthy wt
                                runEither $ decodeMessage val
                            ScalarField f -> case fieldWireType f of
                                FieldWireType fieldWt _ get -> do
                                    Equal <- equalWireTypes fieldWt wt
                                    runEither $ get val
          getRepeatedVals :: Lens' msg [value] -> FieldTypeDescriptor value -> Parser msg
          getRepeatedVals f (MessageField GroupType) = do
                    Equal <- equalWireTypes StartGroup wt
                    !x <- parseMessage (endOfGroup tag)
                    return $! over' f (x :) msg
          getRepeatedVals f (MessageField MessageType) = do
                    Equal <- equalWireTypes Lengthy wt
                    x <- runEither $ decodeMessage val
                    return $! over' f (x :) msg
          getRepeatedVals f (ScalarField ff) = case fieldWireType ff of
                    FieldWireType fieldWt _ get ->
                        case wt of
                            Lengthy | notLengthy fieldWt -> do -- Packed representation
                                let getElt = do
                                        wv <- getWireValue fieldWt
                                        x <- runEither $ get wv
                                        return $! x
                                xs <- runEither $ runParser (manyReversedTillEnd getElt) val
                                return $! over' f (xs ++) msg
                            _ -> do
                                Equal <- equalWireTypes fieldWt wt
                                x <- runEither $ get val
                                return $! over' f (x :) msg
          in case accessor of
              PlainField _ f -> do
                  !x <- getSimpleVal
                  return $! set f x msg
              OptionalField f -> do
                  !x <- getSimpleVal
                  return $! set f (Just x) msg
              -- Parse either a packed or unpacked representation,
              -- depending on how it was encoded.
              -- Note that if fieldWt is Lengthy (e.g., "string" or
              -- message) we should always parse it as unpacked.
              RepeatedField _ f -> getRepeatedVals f typeDescriptor
              MapField keyLens valueLens f -> do
                  entry <- getSimpleVal
                  let !key = entry ^. keyLens
                  let !value = entry ^. valueLens
                  return $! over f
                      (Map.insert key value)
                      msg

-- | Strict version of 'over' that forces the old value.
-- Helps prevent gross space leaks when modifying a list field.
--
-- In particular, a naive `@over f (x :) y@ keeps the old value of @y@ around
-- in a thunk, because @(:)@ isn't strict in its second argument.  (Similarly
-- for @(++)@.)
over' :: Lens' a b -> (b -> b) -> a -> a
over' f g = over f (\(!x) -> g x)

manyReversedTillEnd :: Parser a -> Parser [a]
manyReversedTillEnd p = loop []
  where
    loop xs = do
        atEnd <- isEnd
        if atEnd
            then return xs
            else do
                x <- p
                loop (x:xs)

-- | Encode a message to the wire format as a strict 'ByteString'.
encodeMessage :: Message msg => msg -> B.ByteString
encodeMessage = L.toStrict . toLazyByteString . buildMessage

-- | Encode a message to the wire format, as part of a 'Builder'.
buildMessage :: Message msg => msg -> Builder
buildMessage = foldMap putTaggedValue . messageToTaggedValues

-- | Encode a message to the wire format, prefixed by its size as a VarInt,
-- as part of a 'Builder'.
--
-- This can be used to build up streams of messages in the size-delimited
-- format expected by some protocols.
buildMessageDelimited :: Message msg => msg -> Builder
buildMessageDelimited msg =
  let b = L.toStrict . toLazyByteString $ buildMessage msg in
    putVarInt (fromIntegral $ B.length b) <> byteString b

-- | Encode a message as a sequence of key-value pairs.
messageToTaggedValues :: Message msg => msg -> [TaggedValue]
messageToTaggedValues msg =
    mconcat
        [ messageFieldToVals tag fieldDescr msg
        | (tag, fieldDescr) <- Map.toList fieldsByTag
        ]
    ++ msg ^. unknownFields

messageFieldToVals :: Tag -> FieldDescriptor a -> a -> [TaggedValue]
messageFieldToVals tag (FieldDescriptor _ typeDescriptor accessor) msg =
    let
        embed src
            = case typeDescriptor of
                MessageField MessageType -> [TaggedValue tag $ WireValue Lengthy
                                                  $ encodeMessage src]
                MessageField GroupType ->
                    TaggedValue tag (WireValue StartGroup ())
                            : messageToTaggedValues src
                                ++ [TaggedValue tag $ WireValue EndGroup ()]
                ScalarField f -> case fieldWireType f of
                    FieldWireType wt convert _ ->
                        [TaggedValue tag $ WireValue wt (convert src)]
        embedPacked [] = []
        embedPacked src
            = case typeDescriptor of
                MessageField _ -> error "Messages can't be packed"
                ScalarField f -> case fieldWireType f of
                    FieldWireType wt convert _ -> let
                        v = L.toStrict $ toLazyByteString
                            $ mconcat [putWireValue wt (convert x) | x <- src]
                        in [TaggedValue tag $ WireValue Lengthy v]
    in case accessor of
            PlainField d f
                -- proto3 optional scalar field:
                | Optional <- d, src == fieldDefault -> []
                -- proto3 optional non-scalar field, or proto2 required field:
                | otherwise -> embed src
              where src = msg ^. f
            -- proto2 optional field:
            OptionalField f -> foldMap embed (msg ^. f)
            -- Note: using 'concatMap' instead of 'foldMap' below
            -- seems to allow better list fusion.
            RepeatedField Unpacked f -> concatMap embed (msg ^. f)
            RepeatedField Packed f -> embedPacked (msg ^. f)
            MapField keyLens valueLens f ->
                concatMap (\(k, v) -> embed $ defMessage
                                                & set keyLens k
                                                & set valueLens v)
                    $ Map.toList (msg ^. f)

data FieldWireType value where
    FieldWireType :: WireType w -> (value -> w) -> (w -> Either String value)
                  -> FieldWireType value

fieldWireType :: ScalarField value -> FieldWireType value
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

endOfGroup :: Tag -> Parser Bool
endOfGroup tag = do
    TaggedValue tag' (WireValue wt _) <- getTaggedValue
    Equal <- equalWireTypes EndGroup wt
    return (tag == tag')

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
