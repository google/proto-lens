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

import Data.ByteString (ByteString, pack)
import Data.Char (ord, isSpace)
import Data.Functor.Identity (Identity)
import Data.List (intercalate)
import Data.Maybe (catMaybes)
import Data.Text.Lazy (Text)
import qualified Data.Text as StrictText
import Data.Word (Word8)
import Numeric (readOct, readHex)
import Text.Parsec ((<?>))
import Text.Parsec.Char
  (alphaNum, char, hexDigit, letter, octDigit, oneOf, satisfy)
import Text.Parsec.Text.Lazy (Parser)
import Text.Parsec.Combinator (choice, eof, many1, optionMaybe, sepBy1)
import Text.Parsec.Token hiding (octal)
import Control.Applicative ((<|>), many)
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
    word8s <- many stringChar
    _ <- char initialQuoteChar
    return $ pack word8s
  where
    stringChar :: Parser Word8
    stringChar = nonEscape <|> stringEscape
    nonEscape  = fmap (fromIntegral . ord)
        $ satisfy (\c -> c `notElem` "\\\'\"" && ord c < 256)
    stringEscape = char '\\' >> (octal <|> hex <|> unicode <|> simple)
    octal = do d0 <- octDigit
               d1 <- optionMaybe octDigit
               d2 <- optionMaybe octDigit
               readMaybeDigits readOct [Just d0, d1, d2]
    readMaybeDigits :: ReadS Word8 -> [Maybe Char] -> Parser Word8
    readMaybeDigits reader
        = return . (\str -> let [(v, "")] = reader str in v) . catMaybes
    hex = do _ <- oneOf "xX"
             d0 <- hexDigit
             d1 <- optionMaybe hexDigit
             readMaybeDigits readHex [Just d0, d1]
    unicode = oneOf "uU" >> fail "Unicode in string literals not yet supported"
    simple = choice $ map charRet [ ('a', '\a')
                                  , ('b', '\b')
                                  , ('f', '\f')
                                  , ('n', '\n')
                                  , ('r', '\r')
                                  , ('t', '\t')
                                  , ('v', '\v')
                                  , ('\\', '\\')
                                  , ('\'', '\'')
                                  , ('\"', '\"')
                                  ]
      where
        charRet :: (Char, Char) -> Parser Word8
        charRet (escapeCh, ch) = do _ <- char escapeCh
                                    return $ fromIntegral $ ord ch
