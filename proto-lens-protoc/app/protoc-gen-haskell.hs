-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

{-# LANGUAGE CPP #-}
{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE OverloadedStrings #-}
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
import Proto.Google.Protobuf.Descriptor (FileDescriptorProto, Edition(..))
import System.Environment (getProgName)
import System.Exit (exitWith, ExitCode(..))
import System.IO as IO

import Data.ProtoLens.Compiler.Generate.Commented (getModuleName)
import Data.ProtoLens.Compiler.Generate
import Data.ProtoLens.Compiler.Plugin

import Data.Text.Prettyprint.Doc (pretty)
import Debug.Trace
import Prettyprinter.GHC

main :: IO ()
main = do
    contents <- B.getContents
    progName <- getProgName
    case decodeMessage contents of
        Left e -> IO.hPutStrLn stderr e >> exitWith (ExitFailure 1)
        Right x -> B.putStr $ encodeMessage $
                        makeResponse progName x

makeResponse :: String -> CodeGeneratorRequest -> CodeGeneratorResponse
makeResponse prog request = let
    outputFiles = generateFiles header
                      (request ^. #protoFile)
                      (request ^. #fileToGenerate)
    header :: FileDescriptorProto -> Text
    header f = "{- This file was auto-generated from "
                <> (f ^. #name)
                <> " by the " <> pack prog <> " program. -}\n"
    features = [ CodeGeneratorResponse'FEATURE_PROTO3_OPTIONAL
               , CodeGeneratorResponse'FEATURE_SUPPORTS_EDITIONS
               ]
    preamble = defMessage
               & #supportedFeatures .~
                 foldl (.|.) zeroBits (fmap (toEnum . fromEnum) features)
               -- Do not process actual Protobuf Editions files yet.
               & #minimumEdition .~ fromIntegral (fromEnum EDITION_PROTO2)
               & #maximumEdition .~ fromIntegral (fromEnum EDITION_2024)
    in case outputFiles of
         Right fs -> preamble & #file .~
           [ defMessage
             & #name .~ (traceShowId outputName)
             & #content .~ outputContent
           | (outputName, outputContent) <- fs
           ]
         Left e -> preamble & #error .~ e

generateFiles :: (FileDescriptorProto -> Text)
              -> [FileDescriptorProto] -> [ProtoFileName]
              -> Either Text [(Text, Text)]
generateFiles header files toGenerate = do
  filesByName <- analyzeProtoFiles files

  let modulesToBuild f =
        generateModule (haskellModule f) (descriptor f) imports
            (publicImports f)
            (definitions f)
            (collectEnvFromDeps deps filesByName)
            (services f)
        where
          deps = descriptor f ^. #dependency
          imports = Set.toAscList $ Set.fromList
                    $ map (haskellModule . (filesByName !)) deps


  -- The contents of the generated Haskell file for a given .proto file.
  return [ ( moduleFilePath $ pack $ moduleNameStrToString (getModuleName modul)
           , header (descriptor f) <> pack (show $ pretty modul)
           )
         | fileName <- toGenerate
         , let f = filesByName ! fileName
         , modul <- modulesToBuild f
         ]

moduleFilePath :: Text -> Text
moduleFilePath n = T.replace "." "/" n <> ".hs"
