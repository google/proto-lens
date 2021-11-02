-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd
--
{-# LANGUAGE CPP #-}
{-# LANGUAGE OverloadedStrings #-}

-- | Protoc plugin command-line argument aka "parameter" from
-- plugin.proto document. Example which enables stock deriving
-- of 'GHC.Generics.Generic' class for all generated haskell types:
-- --haskell_opt='Opt{ imports = [], pragmas = ["DeriveGeneric"], stockInstances = ["GHC.Generics.Generic"], defaultInstances = [] }'
module Data.ProtoLens.Compiler.Parameter
  ( Options (..),
    newOptions,
    newDefaultInstances,
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
  { imports' :: [GHC.ModuleNameStr],
    pragmas' :: [String],
    stockInstances' :: [GHC.HsType'],
    deafultInstances' :: [GHC.HsType']
  }

data Opt = Opt
  { imports :: [String],
    pragmas :: [String],
    stockInstances :: [T.Text],
    defaultInstances :: [T.Text]
  }
  deriving (Read)

newDefaultInstances ::
  GHC.HsType' ->
  Options ->
  [GHC.HsDecl']
newDefaultInstances dataType opts =
  ( \class' ->
      GHC.instance'
        (class' GHC.@@ dataType)
        []
  )
    <$> deafultInstances' opts

newOptions :: T.Text -> Options
newOptions "" = Options [] [] [] []
newOptions rawTxt =
  case T.readMaybe rawStr of
    Nothing ->
      error $ "Can not read options from " ++ show rawStr
    Just opts ->
      let stock = List.nub $ stockInstances opts
          alone = List.nub $ defaultInstances opts
       in Options
            { imports' =
                List.nub $
                  (GHC.ModuleNameStr . mkModuleName <$> imports opts)
                    ++ (newModuleName <$> (List.nub $ stock ++ alone)),
              pragmas' = List.nub $ pragmas opts,
              stockInstances' = newTy <$> stock,
              deafultInstances' = newTy <$> alone
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
