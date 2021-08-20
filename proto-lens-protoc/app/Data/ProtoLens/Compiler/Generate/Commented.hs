{-# LANGUAGE CPP #-}
-- | Enables pretty-printing Haddock comments along with top-level declarations.
module Data.ProtoLens.Compiler.Generate.Commented where

import Data.Maybe (fromMaybe)
import GHC.SourceGen
#if MIN_VERSION_ghc(9,0,0)
import GHC.Utils.Outputable (Outputable(..), SDoc, (<+>), ($+$), vcat, empty, text)
#else
import Outputable (Outputable(..), SDoc, (<+>), ($+$), vcat, empty, text)
#endif
#if MIN_VERSION_ghc(8,10,0)
import GHC.Hs (hsmodName)
#else
import HsSyn (hsmodName)
#endif
import GHC (ModuleName)
#if MIN_VERSION_ghc(9,0,0)
import GHC.Types.SrcLoc (unLoc)
#else
import SrcLoc (unLoc)
#endif

-- | A declaration, along with an optional comment.
--
-- GHC's pretty-printer omits the contents of comments, so we can't use it here.
data CommentedDecl = CommentedDecl (Maybe SDoc) HsDecl'

instance Outputable CommentedDecl where
    ppr (CommentedDecl maybeComment decl) =
        maybe empty pprComment maybeComment
        $+$ ppr decl
      where
        pprComment c = text "{- |" <+> c <+> text "-}"

uncommented :: HsDecl' -> CommentedDecl
uncommented = CommentedDecl Nothing

commented :: SDoc -> HsDecl' -> CommentedDecl
commented = CommentedDecl . Just

data CommentedModule = CommentedModule
    { pragmaComments :: [String]
    , moduleHeader :: HsModule'
    , commentedDecls :: [CommentedDecl]
    }

getModuleName :: CommentedModule -> ModuleName
getModuleName m =
    fromMaybe (error $ "getModuleName: No explicit name")
        $ fmap unLoc $ hsmodName $ moduleHeader m

instance Outputable CommentedModule where
    ppr m =
        vcat (map text $ pragmaComments m)
        $+$ ppr (moduleHeader m)
        $+$ vcat (map ppr $ commentedDecls m)

languagePragma, optionsGhcPragma :: String -> String
languagePragma s = "{-# LANGUAGE " ++ s ++ "#-}"
optionsGhcPragma s = "{-# OPTIONS_GHC " ++ s ++ "#-}"
