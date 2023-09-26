-- Copyright 2023 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE DeriveTraversable #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE NumericUnderscores #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}
-- | ToJSON/FromJSON instances for protocol buffer Messages to use with aeson.
module Data.ProtoLens.Json where
import Control.Applicative
import Control.Monad
import Data.Aeson
import Data.ByteString.Base64 (decodeBase64)
import Data.Char
import Lens.Family2
import Data.Fixed
import Data.ProtoLens
import qualified Data.Text as T
import qualified Data.Text.Read as T
import Data.Aeson.Types (Parser)
import Data.Dynamic
import Data.Proxy
import Data.Aeson.Key (fromText)
import qualified Data.Map.Strict as M
import qualified Data.Text.Encoding as T
import Data.List.Split (wordsBy)
import Data.Map.Strict (Map)
import Data.Time.Clock.System
import Proto.Google.Protobuf.Duration
import qualified Proto.Google.Protobuf.Duration_Fields as Duration
import Proto.Google.Protobuf.Empty
import Proto.Google.Protobuf.Timestamp
import qualified Proto.Google.Protobuf.Timestamp_Fields as Timestamp

newtype JsonMessage a = JsonMessage { unJsonMessage :: a }
  deriving (Eq, Show, Ord)

instance Functor JsonMessage where
  fmap f (JsonMessage a) = JsonMessage (f a)

instance Applicative JsonMessage where
  pure = JsonMessage
  (JsonMessage f) <*> (JsonMessage a) = JsonMessage (f a)

-- | N.B. if you want to use this instance, make sure that you use the generated
-- types for Duration, Timestamp, etc. from proto-lens-protobuf-types instead of generating your own.
instance (Show a, Typeable a, Message a) => FromJSON (JsonMessage a) where
  parseJSON = fmap JsonMessage . case jsonParseOverrides M.!? messageName (Proxy :: Proxy a) of
    Nothing -> defaultParser
    Just dynParser -> case fromDynamic dynParser of
      Nothing -> defaultParser
      Just parser -> (parser :: Value -> Parser a)
    where
      defaultParser :: Value -> Parser a
      defaultParser = withObject (T.unpack $ messageName (Proxy :: Proxy a)) $ \o -> parseJsonMessage defaultFromJsonMessageOptions o

-- These are special cases outlined in the proto3 JSON spec
jsonParseOverrides :: Map T.Text Dynamic
jsonParseOverrides = M.fromList
  [ ("google.protobuf.Duration", toDyn durationParser)
  , ("google.protobuf.Timestamp", toDyn timestampParser)
  , ("google.protobuf.Empty", toDyn emptyParser)
    -- TODO not sure if we can support this one.
    -- "google.protobuf.Any"
  ]
  where
    durationParser :: Value -> Parser Duration
    durationParser = withText "google.protobuf.Duration" $ \t -> case parseDuration t of
      Nothing -> fail $ "Invalid duration: " <> T.unpack t
      Just d -> pure d
    timestampParser :: Value -> Parser Timestamp
    timestampParser t = do
      MkSystemTime{..} <- utcToSystemTime <$> parseJSON t
      pure $ defMessage
        & Timestamp.seconds .~ systemSeconds
        & Timestamp.nanos .~ fromIntegral systemNanoseconds
    emptyParser :: Value -> Parser Empty
    emptyParser = withObject "google.protobuf.Empty" $ \_ -> pure defMessage

-- | Generated output always contains 0, 3, 6, or 9 fractional digits, depending on required precision, followed by the suffix "s". 
-- Accepted are any fractional digits (also none) as long as they fit into nano-seconds precision and the suffix "s" is required.
parseDuration :: T.Text -> Maybe Duration
parseDuration t = case reads @Nano (T.unpack t) of
  [(n, "s")] -> Just $ fromNanos n
  _ -> Nothing
  where
    fromNanos :: Nano -> Duration
    fromNanos (MkFixed n) = let (secs, nanos) = divMod n 1_000_000_000 in defMessage
      & Duration.seconds .~ fromIntegral secs
      & Duration.nanos .~ fromIntegral nanos

data FromJsonMessageOptions = FromJsonMessageOptions
  { fromJsonMessageEnumModifier :: forall msg enum. (Message msg, MessageEnum enum) => msg -> Proxy enum -> String -> String
  }

defaultFromJsonMessageOptions :: FromJsonMessageOptions
defaultFromJsonMessageOptions = FromJsonMessageOptions
  { fromJsonMessageEnumModifier = \_ _ -> id
  }

parseJsonMessage :: forall a. (Message a) => FromJsonMessageOptions -> Object -> Parser a
parseJsonMessage opts o = foldM (parseField opts o) defMessage (allFields @a)

parseField :: (Message a) => FromJsonMessageOptions -> Object -> a -> FieldDescriptor a -> Parser a
parseField opts o msg (FieldDescriptor n ftd fa) = case fa of
  PlainField fieldReq lens_ -> do
    case fieldReq of
      Required -> do
        (o .: camelK <|> o .: plainK) >>= jsonFieldValue opts msg ftd >>= \x -> pure $ msg & lens_ .~ x
      Optional -> do
        mVal <- (o .:? camelK <|> o .:? plainK)
        case mVal of
          Nothing -> pure msg
          Just val -> jsonFieldValue opts msg ftd val >>= \x -> pure $ msg & lens_ .~ x
  OptionalField lens_ -> do
    mVal <- (o .:? camelK <|> o .:? plainK)
    case mVal of
      Nothing -> pure msg
      Just val -> jsonFieldValue opts msg ftd val >>= \x -> pure $ msg & lens_ .~ Just x
  RepeatedField _ lens_ -> do
    arr <- (o .: camelK <|> o .: plainK)
    case arr of
      -- Null is treated as an empty list
      Null -> pure msg
      _ -> do
        vals <- traverse (jsonFieldValue opts msg ftd) =<< parseJSON arr
        pure $ msg & lens_ .~ vals
  MapField kTy valDetails _entryK _entryVal lens_ -> do
    raw <- (o .: camelK <|> o .: plainK <|> pure (Object mempty))
    m <- mapKeyScalarValue kTy $ case raw of
      Null -> Object mempty
      other -> other
    m' <- traverse (jsonFieldValue opts msg valDetails) m
    pure $ msg & lens_ .~ m'
  where
    plainK = fromText (T.pack n)
    camelK = fromText (T.pack $ toCamel $ fromSnake n)

jsonFieldValue :: forall value msg. (Message msg, Typeable value) => FromJsonMessageOptions -> msg -> FieldTypeDescriptor value -> Value -> Parser value
jsonFieldValue opts msg fdt val = case fdt of
    MessageField _ -> case jsonParseOverrides M.!? messageName (Proxy @value) of
      Nothing -> withObject (T.unpack $ messageName (Proxy @value)) (parseJsonMessage opts) val'
      Just override -> case fromDynamic override of
        Nothing -> withObject (T.unpack $ messageName (Proxy @value)) (parseJsonMessage opts) val'
        Just parser -> parser val' :: Parser value
    ScalarField f -> jsonScalarFieldValue opts msg f val
  where
    val' = case val of
      Null -> Object mempty
      _ -> val

parse64BitNumber :: (Integral a) => Value -> Parser a
parse64BitNumber val = do
  x <- parseJSON val
  case T.decimal x of
    Left e -> fail e
    Right (n, remaining) ->
      if T.null remaining
        then pure n
        else fail $ "Invalid number: " <> T.unpack x

mapKeyScalarValue :: forall key value. FromJSON value => MapKey key -> Value -> Parser (Map key value)
mapKeyScalarValue = \case
  MapInt32Key -> parseJSON
  MapInt64Key -> parseJSON 
  MapUInt32Key -> parseJSON
  MapUInt64Key -> parseJSON 
  MapSInt32Key -> parseJSON
  MapSInt64Key -> parseJSON 
  MapFixed32Key -> parseJSON
  MapFixed64Key -> parseJSON 
  MapSFixed32Key -> parseJSON
  MapSFixed64Key -> parseJSON
  MapBoolKey -> parseJSON
  MapStringKey -> parseJSON

jsonScalarFieldValue :: forall msg value. Message msg => FromJsonMessageOptions -> msg -> ScalarField value -> Value -> Parser value
jsonScalarFieldValue opts msg = \case
  EnumField -> \v -> parseJSON v >>= \str -> case readEnum (fromJsonMessageEnumModifier opts msg (Proxy @value) str) of
    Nothing -> fail ("Invalid enum value: " <> str)
    Just val -> pure val
  Int32Field -> parseJSON
  Int64Field -> parse64BitNumber
  UInt32Field -> parseJSON
  UInt64Field -> parse64BitNumber
  SInt32Field -> parseJSON
  SInt64Field -> parse64BitNumber
  Fixed32Field -> parseJSON
  Fixed64Field -> parse64BitNumber
  SFixed32Field -> parseJSON
  SFixed64Field -> parse64BitNumber
  FloatField -> parseJSON
  DoubleField -> parseJSON
  BoolField -> parseJSON
  StringField -> parseJSON
  BytesField -> withText "bytes" $ \t -> case decodeBase64 (T.encodeUtf8 t) of
    Left e -> fail $ T.unpack e
    Right bs -> pure bs

newtype Identifier a = Identifier { unIdentifier :: [a] }
    deriving (Monad, Functor, Applicative, Show, Foldable, Traversable, Eq)

toCamel :: Identifier String -> String
toCamel (Identifier []) = ""
toCamel (Identifier (x:xs)) = concat $ fmap toLower x:map wordCase xs

-- | Convert from @snake_cased@ (either flavor)
fromSnake :: String -> Identifier String
fromSnake = Identifier . wordsBy (== '_')

wordCase :: String -> String
wordCase "" = ""
wordCase (x:xs) = toUpper x : fmap toLower xs