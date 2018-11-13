{-# LANGUAGE OverloadedStrings #-}
module Data.ProtoLens.Compiler.Generate.Encode
    ( generateEncoder
    ) where

import Data.ProtoLens.Compiler.Combinators
import Data.ProtoLens.Compiler.Definitions

generateEncoder :: SyntaxType -> MessageInfo Name -> Exp
generateEncoder _ _ = "Prelude.undefined"


