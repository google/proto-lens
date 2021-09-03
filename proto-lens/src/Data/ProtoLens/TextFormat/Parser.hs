-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

-- | Helper utilities to parse the human-readable text format into a
-- proto-agnostic syntax tree.
{-# LANGUAGE FlexibleContexts #-}

module Data.ProtoLens.TextFormat.Parser
    ( Message
    , Field(..)
    , Key(..)
    , Value(..)
    , parser
    ) where

import Control.Applicative ((<|>), many)
import Control.Monad (liftM, liftM2, mzero, unless)
import Data.ByteString (ByteString)
import Data.ByteString.Builder (Builder, char8, charUtf8, toLazyByteString, word8)
import Data.ByteString.Lazy (toStrict)
import Data.Char (digitToInt, isSpace)
import Data.Functor (($>))
import Data.Functor.Identity (Identity)
import Data.List (intercalate)
import qualified Data.Text as StrictText
import Data.Text.Lazy (Text)
import Text.Parsec ((<?>))
import Text.Parsec.Char
  (alphaNum, char, hexDigit, letter, octDigit, oneOf, satisfy)
import Text.Parsec.Text.Lazy (Parser)
import Text.Parsec.Combinator (choice, eof, many1, sepBy1)
import Text.Parsec.Token hiding (octal)

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
  | ByteStringValue ByteString    -- ^ A string or bytes literal
  | MessageValue (Maybe StrictText.Text) Message  -- ^ A sub message, with an optional type URI
  | EnumValue String  -- ^ Any undelimited string (including false & true)
  deriving (Show,Ord,Eq)

instance Show Key
  where
    show (Key name) = show name  -- Quoting field names (i.e., `"field"` vs `field`
                                 -- leads to nicer error messages.
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
    parseString = liftM (ByteStringValue . mconcat)
        $ many1 $ lexeme ptp $ protoStringLiteral
    parseEnumValue = liftM EnumValue (identifier ptp)
    parseMessageValue =
        braces ptp (parseAny <|>
                    liftM (MessageValue Nothing) parseMessage) <|>
        angles ptp (liftM (MessageValue Nothing) parseMessage)

    typeUri = liftM StrictText.pack (many (satisfy (\c -> c /= ']' && not (isSpace c)))) <?>
              "type URI"
    parseAny = liftM2 MessageValue (liftM Just (brackets ptp typeUri))
                                   (braces ptp parseMessage)

    makeNumberValue :: Bool -> Either Integer Double -> Value
    makeNumberValue True (Left intValue) = IntValue (negate intValue)
    makeNumberValue False (Left intValue) = IntValue intValue
    makeNumberValue True (Right doubleValue) = DoubleValue (negate doubleValue)
    makeNumberValue False (Right doubleValue) = DoubleValue doubleValue

-- | Reads a literal string the way the Protocol Buffer distribution's
-- tokenizer.cc does.  This differs from Haskell string literals in treating,
-- e.g. "\11" as octal instead of decimal, so reading as 9 instead of 11.  Also,
-- like tokenizer.cc we assume octal and hex escapes can have at most three and
-- two digits, respectively.
--
-- TODO: implement reading of Unicode escapes.
protoStringLiteral :: Parser ByteString
protoStringLiteral = do
    initialQuoteChar <- char '\'' <|> char '\"'
    let quoted = do
          _ <- char '\\'
          choice
            [ char 'a'   $> char8 '\a'
            , char 'b'   $> char8 '\b'
            , char 'f'   $> char8 '\f'
            , char 'n'   $> char8 '\n'
            , char 'r'   $> char8 '\r'
            , char 't'   $> char8 '\t'
            , char 'v'   $> char8 '\v'
            , char '\\'  $> char8 '\\'
            , char '\''  $> char8 '\''
            , char '\"'  $> char8 '\"'
            , oneOf "xX" *> parse8BitToBuilder hexDigit 16 (1, 2)
            , oneOf "uU" *> fail "Unicode in string literals not yet supported"
            ,               parse8BitToBuilder octDigit 8 (1, 3)
            ]
        unquoted = charUtf8 <$> satisfy (/= initialQuoteChar)
    builders <- many $ quoted <|> unquoted
    _ <- char initialQuoteChar
    return $ toStrict $ toLazyByteString $ mconcat builders
  where
    -- | Apply a parser between 'min' and 'max' times, failing otherwise.
    manyN :: Parser a -> (Int, Int) -> Parser [a]
    manyN _ (_, 0) = return []
    manyN p (0, max) = ((:) <$> p <*> manyN p (0, max - 1)) <|> pure []
    manyN p (min, max) = (:) <$> p <*> manyN p (min - 1, max - 1)
    -- | Parse a number in 'base' with between 'min' and 'max' digits.
    parseNum :: Parser Char -> Int -> (Int, Int) -> Parser Int
    parseNum p base range = do
      digits <- map digitToInt <$> manyN p range
      return $ foldl (\a d -> a * base + d) 0 digits
    -- | Parse a number and return a builder for the 8-bit char it represents.
    parse8BitToBuilder :: Parser Char -> Int -> (Int, Int) -> Parser Builder
    parse8BitToBuilder p base range = do
      value <- parseNum p base range
      unless (value < 256) $ fail "Escaped number is not 8-bit"
      return $ word8 $ fromIntegral value
