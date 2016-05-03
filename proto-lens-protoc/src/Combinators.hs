-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# OPTIONS_GHC -fno-warn-orphans #-}
-- | Some utility functions, classes and instances for nicer code generation
-- with haskell-src-exts.
--
-- In particular, we define orphan instances of IsString for various syntax
-- datatypes, with some intelligence about Haskell names.  For example, @"foo"
-- :: Exp@ is treated as a variable and @"Foo" :: Exp@ is treated as a
-- constructor.
module Combinators where

import Data.Char (isAlphaNum, isUpper)
import Data.String (IsString(..))
import Language.Haskell.Exts.SrcLoc (noLoc)
import Language.Haskell.Exts.Syntax as Syntax

-- | Application of a Haskell type or expression to an argument.
-- For example, to represent @f x y@, you can write
--
-- > "f" @@ "x" @@ "y"
class App a where
    (@@) :: a -> a -> a
    infixl 2 @@

instance App Type where
    (@@) = TyApp

instance App Exp where
    (@@) = App

instance IsString Name where
    fromString s
        -- TODO: better handle the case of mixed ident and symbol characters.
        | all isIdentChar s = Ident s
        | otherwise = Symbol s

-- | Whether this character belongs to an Ident (e.g., "foo") or a symbol
-- (e.g., "<$>").
isIdentChar :: Char -> Bool
isIdentChar c = isAlphaNum c || c `elem` "_'"

instance IsString ModuleName where
    fromString = ModuleName

instance IsString QName where
    fromString f
      -- TODO: support qualified operators (e.g., "Control.Applicative.<$>")
      -- Currently we ignore them due to edge-cases
      -- like the composition operator "Prelude.."
      | isIdentChar (last f), '.' `elem` f
      -- Split "Foo.Bar.baz" into ("Foo.Bar", "baz")
      , (f', '.':f'') <- span (/='.') (reverse f)
            = Qual (fromString $ reverse f'') (fromString $ reverse f')
      | otherwise = UnQual $ fromString f

instance IsString Type where
  fromString fs@(f:_)
      | isUpper f = TyCon $ fromString fs
  fromString fs = TyVar $ fromString fs

instance IsString Exp where
    fromString fs@(f:_)
        | isUpper f = Con $ fromString fs
    fromString fs = Var $ fromString fs

instance IsString Pat where
    fromString = PVar . fromString

instance IsString TyVarBind where
    fromString = UnkindedVar . fromString


-- Helper functions for literal numbers, since haskell-src-exts doesn't
-- put parentheses around negative numbers automatically.

litInt :: Integer -> Exp
litInt n
    | n >= 0 = Lit $ Int n
    | otherwise = NegApp $ Lit $ Int $ negate n

litFrac :: Rational -> Exp
litFrac x
    | x >= 0 = Lit $ Frac x
    | otherwise = NegApp $ Lit $ Frac $ negate x

pLitInt :: Integer -> Pat
pLitInt n
    | n >= 0 = PLit Signless $ Int n
    | otherwise = PLit Negative $ Int $ negate n

-- | A simple clause of a function binding.
match :: Name -> [Pat] -> Exp -> Match
match n ps e = Match noLoc n ps Nothing (UnGuardedRhs e) Nothing
