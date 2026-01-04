{-# LANGUAGE CPP #-}
{-# LANGUAGE OverloadedStrings #-}
-- | Enables pretty-printing Haddock comments along with top-level declarations.
module Data.ProtoLens.Compiler.Generate.Commented where

import Prettyprinter.GHC
import Data.Text.Prettyprint.Doc (Pretty(..), Doc, hardline, (<+>), unAnnotate, vcat)

-- | A declaration, along with an optional comment.
--
-- GHC's pretty-printer omits the contents of comments, so we can't use it here.
data CommentedDecl = CommentedDecl (Maybe (Doc ())) HsDecl'

instance Pretty CommentedDecl where
    pretty (CommentedDecl Nothing decl) = unAnnotate decl
    pretty (CommentedDecl (Just comment) decl) = unAnnotate $
        "{- |" <+> comment <+> "-}"  <> hardline <> decl

uncommented :: HsDecl' -> CommentedDecl
uncommented = CommentedDecl Nothing

commented :: Doc () -> HsDecl' -> CommentedDecl
commented = CommentedDecl . Just

data CommentedModule = CommentedModule
    { pragmaComments :: [String]
    , moduleName :: ModuleNameStr
    , moduleHeader :: HsModule'
    , commentedDecls :: [CommentedDecl]
    }

getModuleName :: CommentedModule -> ModuleNameStr
getModuleName = moduleName

instance Pretty CommentedModule where
    pretty m = unAnnotate $
        vcat (map pretty $ pragmaComments m)
        <> hardline <> moduleHeader m
        <> hardline <> vcat (map pretty $ commentedDecls m)

languagePragma, optionsGhcPragma :: String -> String
languagePragma s = "{-# LANGUAGE " ++ s ++ "#-}"
optionsGhcPragma s = "{-# OPTIONS_GHC " ++ s ++ "#-}"
