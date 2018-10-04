{-# LANGUAGE OverloadedStrings #-}
module Data.ProtoLens.Compiler.Generate.Encoding
    ( generateParser
    ) where

import Data.ProtoLens.Compiler.Combinators
import Data.ProtoLens.Compiler.Definitions

generateParser :: SyntaxType -> Env QName -> MessageInfo Name -> Exp
generateParser _ _ _ = "Prelude.undefined"
