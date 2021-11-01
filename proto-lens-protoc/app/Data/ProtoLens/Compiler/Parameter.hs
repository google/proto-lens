{-# LANGUAGE CPP #-}
-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd
--
-- Protoc plugin command-line argument aka "parameter" from
-- plugin.proto document. Example which enables stock deriving
-- of GHC.Generics.Generic class in generated haskell sources:
-- --haskell_opt='Opts{derivingStock=["GHC.Generics.Generic"], derivingAlone=[]}'
{-# LANGUAGE OverloadedStrings #-}

module Data.ProtoLens.Compiler.Parameter
  ( Options (..),
    newOptions,
    deriveStandalone,
  )
where

#if MIN_VERSION_ghc(9,0,0)
import GHC.Unit.Module.Name (mkModuleName)
#else
import Module (mkModuleName)
#endif

import qualified Data.List as List
import qualified Data.String as String
import qualified Data.Text as T
import qualified GHC.SourceGen as GHC
import qualified Text.Read as T

data Options = Options
  { import' :: [GHC.ModuleNameStr],
    pragma' :: [String],
    derivingStock' :: [GHC.HsType'],
    derivingAlone' :: [GHC.HsType']
  }

data Opt = Opt
  { pragma :: [String],
    imports :: [String],
    derivingStock :: [T.Text],
    derivingAlone :: [T.Text]
  }
  deriving (Read)

deriveStandalone ::
  GHC.HsType' ->
  Options ->
  [GHC.HsDecl']
deriveStandalone dataType opts =
  ( \class' ->
      GHC.instance'
        (class' GHC.@@ dataType)
        []
  )
    <$> derivingAlone' opts

newOptions :: T.Text -> Options
newOptions "" = Options [] [] [] []
newOptions rawTxt =
  case T.readMaybe rawStr of
    Nothing ->
      error $ "Can not read options from " ++ show rawStr
    Just opts ->
      let stock = List.nub $ derivingStock opts
          alone = List.nub $ derivingAlone opts
       in Options
            { import' =
                List.nub $
                  (GHC.ModuleNameStr . mkModuleName <$> imports opts)
                    ++ (newModuleName <$> (List.nub $ stock ++ alone)),
              pragma' = List.nub $ pragma opts,
              derivingStock' = newTy <$> stock,
              derivingAlone' = newTy <$> alone
            }
  where
    rawStr = T.unpack rawTxt
    newTy = GHC.var . String.fromString . T.unpack

newModuleName :: T.Text -> GHC.ModuleNameStr
newModuleName rawTxt =
  case reverse $ T.splitOn sep rawTxt of
    [] ->
      error $ "Can not create GHC.ModuleNameStr from " ++ show rawTxt
    (_ : xs) ->
      GHC.ModuleNameStr
        . mkModuleName
        . T.unpack
        . T.intercalate sep
        $ reverse xs
  where
    sep = "."
