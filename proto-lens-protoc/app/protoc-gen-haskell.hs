-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# LANGUAGE CPP #-}
{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
module Main where

import Control.Monad.IO.Class (liftIO)
import qualified Data.ByteString as B
import Data.Map.Strict ((!))
#if !MIN_VERSION_base(4,11,0)
import Data.Semigroup ((<>))
#endif
import qualified Data.Set as Set
import qualified Data.Text as T
import Data.Text (Text, pack)
import Data.Bits
import Data.ProtoLens (defMessage, decodeMessage, encodeMessage)
-- Force the use of the Reflected API when decoding DescriptorProto
-- so that we can run the test suite against the Generated API.
-- TODO: switch back to Data.ProtoLens.Encoding once the Generated encoding is
-- good enough.
import Lens.Family2
import Proto.Google.Protobuf.Compiler.Plugin
    ( CodeGeneratorRequest
    , CodeGeneratorResponse
    , CodeGeneratorResponse'Feature(..)
    )
import Proto.Google.Protobuf.Descriptor (FileDescriptorProto)
import System.Environment (getProgName)
import System.Exit (exitWith, ExitCode(..))
import System.IO as IO

import Data.ProtoLens.Compiler.Generate.Commented (CommentedModule, getModuleName)
import Data.ProtoLens.Compiler.Generate
import Data.ProtoLens.Compiler.Plugin

#if MIN_VERSION_ghc(9,0,0)
import GHC.Driver.Session (DynFlags, getDynFlags)
#else
import DynFlags (DynFlags, getDynFlags)
#endif
import GHC (runGhc)
import GHC.Paths (libdir)
import GHC.SourceGen.Pretty (showPpr)

main :: IO ()
main = do
    contents <- B.getContents
    progName <- getProgName
    case decodeMessage contents of
        Left e -> IO.hPutStrLn stderr e >> exitWith (ExitFailure 1)
        Right x -> runGhc (Just libdir) $ do
                      dflags <- getDynFlags
                      liftIO $ B.putStr $ encodeMessage $
                        makeResponse dflags progName x

makeResponse :: DynFlags -> String -> CodeGeneratorRequest -> CodeGeneratorResponse
makeResponse dflags prog request = let
    outputFiles = generateFiles dflags header
                      (request ^. #protoFile)
                      (request ^. #fileToGenerate)
    header :: FileDescriptorProto -> Text
    header f = "{- This file was auto-generated from "
                <> (f ^. #name)
                <> " by the " <> pack prog <> " program. -}\n"
    features = [CodeGeneratorResponse'FEATURE_PROTO3_OPTIONAL]
    in defMessage
           & #supportedFeatures .~
               (foldl (.|.) zeroBits $ fmap (toEnum . fromEnum) features)
           & #file .~ [ defMessage
                            & #name .~ outputName
                            & #content .~ outputContent
                     | (outputName, outputContent) <- outputFiles
                     ]


generateFiles :: DynFlags -> (FileDescriptorProto -> Text)
              -> [FileDescriptorProto] -> [ProtoFileName] -> [(Text, Text)]
generateFiles dflags header files toGenerate = let
  filesByName = analyzeProtoFiles files
  -- The contents of the generated Haskell file for a given .proto file.
  modulesToBuild :: ProtoFile -> [CommentedModule]
  modulesToBuild f = let
      deps = descriptor f ^. #dependency
      imports = Set.toAscList $ Set.fromList
                  $ map (haskellModule . (filesByName !)) deps
      in generateModule (haskellModule f) (descriptor f) imports
            (publicImports f)
             (definitions f)
             (collectEnvFromDeps deps filesByName)
             (services f)
  in [ ( moduleFilePath $ pack $ showPpr dflags (getModuleName modul)
       , header (descriptor f) <> pack (showPpr dflags modul)
       )
     | fileName <- toGenerate
     , let f = filesByName ! fileName
     , modul <- modulesToBuild f
     ]

moduleFilePath :: Text -> Text
moduleFilePath n = T.replace "." "/" n <> ".hs"
