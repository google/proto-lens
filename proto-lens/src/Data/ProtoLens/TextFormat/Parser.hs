-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

-- | Helper utilities to parse the human-readable text format into a
-- proto-agnostic syntax tree.
module Data.ProtoLens.TextFormat.Parser
    ( Message
    , Field(..)
    , Key(..)
    , Value(..)
    , parser
    ) where

import Data.List (intercalate)
import Data.Functor.Identity (Identity)
import Data.Text.Lazy (Text)
import Text.Parsec.Char (alphaNum, char, letter, oneOf)
import Text.Parsec.Text.Lazy (Parser)
import Text.Parsec.Combinator (eof, sepBy1, many1, choice)
import Text.Parsec.Token
import Control.Applicative ((<*), (<|>), (*>), many)
import Control.Monad (liftM, liftM2, mzero)

-- | A 'TokenParser' for the protobuf text format.
ptp :: GenTokenParser Text () Identity
ptp = makeTokenParser protobufLangDef

protobufLangDef :: GenLanguageDef Text () Identity
-- We need to fill in the fields manually, since the LanguageDefs provided
-- by Parsec are restricted to parsers of Strings.
protobufLangDef = LanguageDef
  { commentStart = ""
  , commentEnd = ""
  , commentLine = "#"
  , nestedComments = False
  , identStart = letter <|> char '_'
  , identLetter = alphaNum <|> oneOf "_'"
  , opStart = mzero
  , opLetter = mzero
  , reservedNames = []
  , reservedOpNames = []
  , caseSensitive = True
  }


type Message = [Field]

data Field = Field Key Value
  deriving (Show,Ord,Eq)

data Key = Key String  -- ^ A standard key that is just a string.
  | UnknownKey Integer  -- ^ A key that has been written out as a number
  | ExtensionKey [String]  -- ^ An extension, with namespaces and extension.
  | UnknownExtensionKey Integer  -- ^ An extension that has been written out
                                 -- as a number.
  deriving (Ord,Eq)

data Value = IntValue Integer  -- ^ An integer
  | DoubleValue Double  -- ^ Any floating point number
  | StringValue String  -- ^ A string literal
  | MessageValue Message  -- ^ A sub message
  | EnumValue String  -- ^ Any undelimited string (including false & true)
  deriving (Show,Ord,Eq)

instance Show Key
  where
    show (Key name) = name
    show (UnknownKey k) = show k
    show (ExtensionKey name) = "[" ++ intercalate "." name ++ "]"
    show (UnknownExtensionKey k) = "[" ++ show k ++ "]"

parser :: Parser Message
parser = whiteSpace ptp *> parseMessage <* eof
  where
    parseMessage = many parseField
    parseField = liftM2 Field parseKey parseValue
    parseKey =
        liftM Key (identifier ptp) <|>
        liftM UnknownKey (natural ptp) <|>
        liftM ExtensionKey (brackets ptp (identifier ptp `sepBy1` dot ptp)) <|>
        liftM UnknownExtensionKey (brackets ptp (natural ptp))
    parseValue =
        colon ptp *> choice
            [parseNumber, parseString, parseEnumValue, parseMessageValue] <|>
        parseMessageValue

    parseNumber = do
        negative <- (symbol ptp "-" >> return True) <|> return False
        value <- naturalOrFloat ptp
        return $ makeNumberValue negative value
    parseString = liftM (StringValue . concat) . many1 $ stringLiteral ptp
    parseEnumValue = liftM EnumValue (identifier ptp)
    parseMessageValue = liftM MessageValue
        (braces ptp parseMessage <|> angles ptp parseMessage)

    makeNumberValue :: Bool -> Either Integer Double -> Value
    makeNumberValue True (Left intValue) = IntValue (negate intValue)
    makeNumberValue False (Left intValue) = IntValue intValue
    makeNumberValue True (Right doubleValue) = DoubleValue (negate doubleValue)
    makeNumberValue False (Right doubleValue) = DoubleValue doubleValue
