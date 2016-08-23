-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# LANGUAGE OverloadedStrings #-}
module Main where

import qualified Data.ByteString as B
import Data.Char (toUpper)
import Data.List (foldl', intercalate)
import qualified Data.Map.Strict as Map
import Data.Map.Strict (Map, unions, (!))
import Data.Monoid ((<>))
import qualified Data.Set as Set
import qualified Data.Text as T
import Data.Text (Text, pack)
import Data.ProtoLens (decodeMessage, def, encodeMessage)
import Language.Haskell.Exts.Pretty (prettyPrint)
import Language.Haskell.Exts.Syntax (ModuleName(..), Name(..), QName(..))
import Lens.Family2
import Bootstrap.Proto.Google.Protobuf.Compiler.Plugin
    ( CodeGeneratorRequest
    , CodeGeneratorResponse
    , content
    , file
    , fileToGenerate
    , parameter
    , protoFile
    )
import Bootstrap.Proto.Google.Protobuf.Descriptor
    (FileDescriptorProto, name, dependency, publicDependency)
import System.Environment (getProgName)
import System.Exit (exitWith, ExitCode(..))
import System.IO as IO
import System.FilePath (dropExtension, replaceExtension, splitDirectories)


import Data.ProtoLens.Compiler.Definitions
import Data.ProtoLens.Compiler.Generate
import Data.ProtoLens.Compiler.Plugin

main = do
    contents <- B.getContents
    progName <- getProgName
    case decodeMessage contents of
        Left e -> IO.hPutStrLn stderr e >> exitWith (ExitFailure 1)
        Right x -> B.putStr $ encodeMessage $ makeResponse progName x

makeResponse :: String -> CodeGeneratorRequest -> CodeGeneratorResponse
makeResponse prog request = let
    outputFiles = generateFiles (request ^. parameter) header
                      (request ^. protoFile)
                      (request ^. fileToGenerate)
    header :: FileDescriptorProto -> Text
    header f = "{- This file was auto-generated from "
                <> (f ^. name)
                <> " by the " <> pack prog <> " program. -}\n"
    in def & file .~ [ def & name .~ outputName
                           & content .~ outputContent
                     | (outputName, outputContent) <- outputFiles
                     ]


generateFiles :: Text -> (FileDescriptorProto -> Text) -> [FileDescriptorProto]
              -> [ProtoFileName] -> [(Text, Text)]
generateFiles modulePrefix header files toGenerate = let
  filesByName = analyzeProtoFiles modulePrefix files
  -- The contents of the generated Haskell file for a given .proto file.
  buildFile file = let
      deps = descriptor file ^. dependency
      imports = Set.toAscList $ Set.fromList
                  [ haskellModule (filesByName ! exportName)
                  | dep <- deps
                  , exportName <- exports (filesByName ! dep)
                  ]
      in generateModule (haskellModule file) imports
             (fileSyntaxType (descriptor file))
             (definitions file)
             (collectEnvFromDeps deps filesByName)
  in [ ( outputFilePath . (\(ModuleName n) -> n) . haskellModule $ file
       , header (descriptor file) <> pack (prettyPrint $ buildFile file)
       )
     | fileName <- toGenerate
     , let file = filesByName ! fileName
     ]

