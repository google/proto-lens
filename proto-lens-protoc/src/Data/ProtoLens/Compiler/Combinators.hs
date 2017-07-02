-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# LANGUAGE CPP #-}
{-# LANGUAGE FlexibleInstances #-}
-- | Some utility functions, classes and instances for nicer code generation.
--
-- Re-exports simpler versions of the types and constructors from
-- @haskell-src-exts@.
--
-- We define orphan instances of IsString for various syntax
-- datatypes, with some intelligence about Haskell names.  For example, @"foo"
-- :: Exp@ is treated as a variable and @"Foo" :: Exp@ is treated as a
-- constructor.
module Data.ProtoLens.Compiler.Combinators
    ( module Data.ProtoLens.Compiler.Combinators
    -- Since ImportDecl is a record type, for simplicity we just export it
    -- directly.
    , Syntax.ImportDecl(..)
    ) where

import Data.Char (isAlphaNum, isUpper)
import Data.String (IsString(..))
#if MIN_VERSION_haskell_src_exts(1,18,0)
import qualified Language.Haskell.Exts.Syntax as Syntax
import qualified Language.Haskell.Exts.Pretty as Pretty
#else
import qualified Language.Haskell.Exts.Annotated.Syntax as Syntax
import qualified Language.Haskell.Exts.Pretty as Pretty
import Language.Haskell.Exts.SrcLoc (SrcLoc, noLoc)
#endif

#if MIN_VERSION_haskell_src_exts(1,18,0)
prettyPrint :: Pretty.Pretty a => a -> String
prettyPrint = Pretty.prettyPrint
#else
prettyPrint :: (Functor m, Pretty.Pretty (m SrcLoc)) => m () -> String
prettyPrint = Pretty.prettyPrint . fmap (const noLoc)
#endif

type Asst = Syntax.Asst ()

classA :: QName -> [Type] -> Asst
classA = Syntax.ClassA ()

equalP :: Type -> Type -> Asst
equalP = Syntax.EqualP ()


type ConDecl = Syntax.ConDecl ()

conDecl :: Name -> [Type] -> ConDecl
conDecl constructorName paramTypes
    = Syntax.ConDecl () constructorName $
        fmap tyBang paramTypes

recDecl :: Name -> [(Name, Type)] -> ConDecl
recDecl dataName fields
    = Syntax.RecDecl () dataName
        [Syntax.FieldDecl () [n] (tyBang t) | (n,t) <- fields]


type Decl = Syntax.Decl ()

patSynSig :: Name -> Type -> Decl
patSynSig n t = Syntax.PatSynSig () n Nothing Nothing Nothing t

patSyn :: Pat -> Pat -> Decl
patSyn p1 p2 = Syntax.PatSyn () p1 p2 Syntax.ImplicitBidirectional

dataDecl :: Name -> [ConDecl] -> [QName] -> Decl
dataDecl name conDecls derives
    = Syntax.DataDecl () (Syntax.DataType ()) Nothing
        (Syntax.DHead () name)
            [Syntax.QualConDecl () Nothing Nothing q | q <- conDecls]
        $ Just $ Syntax.Deriving ()
            [ Syntax.IRule () Nothing Nothing (Syntax.IHCon () c)
            | c <- derives
            ]

funBind :: [Match] -> Decl
funBind = Syntax.FunBind ()

instDecl :: [Asst] -> InstHead -> [[Match]] -> Decl
instDecl ctx instHead matches
    = Syntax.InstDecl () Nothing
        (Syntax.IRule () Nothing ctx' instHead)
        $ Just [Syntax.InsDecl () $ funBind m | m <- matches]
  where
    ctx' = case ctx of
        [] -> Nothing
        [c] -> Just $ Syntax.CxSingle () c
        cs -> Just $ Syntax.CxTuple () cs

typeSig :: [Name] -> Type -> Decl
typeSig = Syntax.TypeSig ()


type Exp = Syntax.Exp ()

let' :: [Decl] -> Exp -> Exp
let' ds e = Syntax.Let () (Syntax.BDecls () ds) e

type Alt = Syntax.Alt ()

case' :: Exp -> [Alt] -> Exp
case' = Syntax.Case ()

alt :: Pat -> Exp -> Alt
alt p e = Syntax.Alt () p (Syntax.UnGuardedRhs () e) Nothing

stringExp :: String -> Exp
stringExp = Syntax.Lit () . string

tuple :: [Exp] -> Exp
tuple = Syntax.Tuple () Syntax.Boxed

lambda :: [Pat] -> Exp -> Exp
lambda = Syntax.Lambda ()

(@::@) :: Exp -> Type -> Exp
(@::@) = Syntax.ExpTypeSig ()
infixl 2 @::@

recConstr :: QName -> [FieldUpdate] -> Exp
recConstr = Syntax.RecConstr ()

recUpdate :: Exp -> [FieldUpdate] -> Exp
recUpdate = Syntax.RecUpdate ()

var, con :: QName -> Exp
var = Syntax.Var ()
con = Syntax.Con ()

list :: [Exp] -> Exp
list = Syntax.List ()


type FieldUpdate = Syntax.FieldUpdate ()

fieldUpdate :: QName -> Exp -> FieldUpdate
fieldUpdate = Syntax.FieldUpdate ()

type InstHead = Syntax.InstHead ()

ihApp :: InstHead -> [Type] -> InstHead
ihApp = foldl (Syntax.IHApp ())


type Match = Syntax.Match ()

-- | A simple clause of a function binding.
match :: Name -> [Pat] -> Exp -> Syntax.Match ()
match n ps e = Syntax.Match () n ps (Syntax.UnGuardedRhs () e) Nothing

type Module = Syntax.Module ()

module' :: ModuleName -> [ModulePragma] -> [Syntax.ImportDecl ()] -> [Decl] -> Module
module' modName
    = Syntax.Module ()
        (Just $ Syntax.ModuleHead () modName
                    -- no warning text
                    Nothing
                    -- no explicit exports; we export everything.
                    -- TODO: Also export public imports, taking care not to
                    -- cause a name conflict between field accessors.
                    Nothing)

type ModuleName = Syntax.ModuleName ()
type ModulePragma = Syntax.ModulePragma ()

languagePragma :: [Name] -> ModulePragma
languagePragma = Syntax.LanguagePragma ()

optionsGhcPragma :: String -> ModulePragma
optionsGhcPragma = Syntax.OptionsPragma () (Just Syntax.GHC)

type Name = Syntax.Name ()

type Pat = Syntax.Pat ()

pApp :: QName -> [Pat] -> Pat
pApp = Syntax.PApp ()

pVar :: Name -> Pat
pVar = Syntax.PVar ()

pWildCard :: Pat
pWildCard = Syntax.PWildCard ()

stringPat :: String -> Pat
stringPat = Syntax.PLit () (Syntax.Signless ()) . string


type QName = Syntax.QName ()

qual :: ModuleName -> Name -> QName
qual = Syntax.Qual ()

unQual :: Name -> QName
unQual = Syntax.UnQual ()


type TyVarBind = Syntax.TyVarBind ()
type Type = Syntax.Type ()

tyCon :: QName -> Type
tyCon = Syntax.TyCon ()

tyList :: Type -> Type
tyList = Syntax.TyList ()

tyPromotedString :: String -> Type
tyPromotedString s = Syntax.TyPromoted () $ Syntax.PromotedString () s s

tyForAll :: [TyVarBind] -> [Asst] -> Type -> Type
tyForAll vars ctx t = Syntax.TyForall () (Just vars)
                            (Just $ Syntax.CxTuple () ctx)
                            t

tyBang :: Type -> Type
#if MIN_VERSION_haskell_src_exts(1,18,0)
tyBang = Syntax.TyBang () (Syntax.BangedTy ()) (Syntax.NoUnpackPragma ())
#else
tyBang = Syntax.TyBang () (Syntax.BangedTy ())
#endif
 
-- | Application of a Haskell type or expression to an argument.
-- For example, to represent @f x y@, you can write
--
-- > "f" @@ "x" @@ "y"
class App a where
    (@@) :: a -> a -> a
    infixl 2 @@

instance App Type where
    (@@) = Syntax.TyApp ()

instance App Exp where
    (@@) = Syntax.App ()

instance IsString Name where
    fromString s
        -- TODO: better handle the case of mixed ident and symbol characters.
        | all isIdentChar s = Syntax.Ident () s
        | otherwise = Syntax.Symbol () s

-- | Whether this character belongs to an Ident (e.g., "foo") or a symbol
-- (e.g., "<$>").
isIdentChar :: Char -> Bool
isIdentChar c = isAlphaNum c || c `elem` "_'"

instance IsString ModuleName where
    fromString = Syntax.ModuleName ()

instance IsString QName where
    fromString f
      -- TODO: support qualified operators (e.g., "Control.Applicative.<$>")
      -- Currently we ignore them due to edge-cases
      -- like the composition operator "Prelude.."
      | isIdentChar (last f), '.' `elem` f
      -- Split "Foo.Bar.baz" into ("Foo.Bar", "baz")
      , (f', '.':f'') <- span (/='.') (reverse f)
            = Syntax.Qual () (fromString $ reverse f'') (fromString $ reverse f')
      | otherwise = Syntax.UnQual () $ fromString f

instance IsString Type where
  fromString fs@(f:_)
      | isUpper f = Syntax.TyCon () $ fromString fs
  fromString fs = Syntax.TyVar () $ fromString fs

instance IsString Exp where
    fromString fs@(f:_)
        | isUpper f = Syntax.Con () $ fromString fs
    fromString fs = Syntax.Var () $ fromString fs

instance IsString Pat where
    fromString = Syntax.PVar () . fromString

instance IsString TyVarBind where
    fromString = Syntax.UnkindedVar () . fromString

instance IsString InstHead where
    fromString = Syntax.IHCon () . fromString

-- Helper functions for literal numbers, since haskell-src-exts doesn't
-- put parentheses around negative numbers automatically.

litInt :: Integer -> Exp
litInt n
    | n >= 0 = Syntax.Lit () $ Syntax.Int () n (show n)
    | otherwise = Syntax.NegApp () $ litInt $ negate n

litFrac :: Rational -> Exp
litFrac x
    | x >= 0 = Syntax.Lit () $ Syntax.Frac () x (show x)
    | otherwise = Syntax.NegApp () $ litFrac $ negate x

pLitInt :: Integer -> Pat
pLitInt n = Syntax.PLit () sign $ Syntax.Int () n' (show n')
  where
    (n', sign)
        | n >= 0 = (n, Syntax.Signless ())
        | otherwise = (negate n, Syntax.Negative ())

string :: String -> Syntax.Literal ()
string s = Syntax.String () s (show s)
