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
import Language.Haskell.Exts.Syntax (ModuleName(..))
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


import Definitions
import Generate

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

-- | The filename of an input .proto file.
type ProtoFileName = Text

generateFiles :: Text -> (FileDescriptorProto -> Text) -> [FileDescriptorProto]
              -> [ProtoFileName] -> [(Text, Text)]
generateFiles modulePrefix header files toGenerate = let
  filesByName = Map.fromList [(f ^. name, f) | f <- files]
  moduleNames = fmap (moduleName modulePrefix) filesByName
  -- The definitions in each input proto file, indexed by filename.
  definitions = fmap collectDefinitions filesByName
  -- The exports from each .proto file (including any "public import"
  -- dependencies), as they appear to other modules that are importing them;
  -- i.e., qualified by module name.
  exports = transitiveExports files
  localExports = Map.intersectionWith qualifyEnv moduleNames definitions
  exportedEnvs = fmap (\es -> unions [localExports ! e | e <- es]) exports
  -- The contents of the generated Haskell file for a given .proto file.
  buildFile fileName = let
      f = filesByName ! fileName
      deps = f ^. dependency
      env = unions $ fmap (exportedEnvs !) deps
      imports = Set.toAscList $ Set.fromList
                  [ moduleNames ! exportName
                  | dep <- deps
                  , exportName <- exports ! dep
                  ]
      in generateModule (moduleNames ! fileName) imports (fileSyntaxType f)
              (definitions ! fileName) env
  in [ ( outputFilePath (moduleNames ! f)
       , header fd <> pack (prettyPrint $ buildFile f)
       )
     | f <- toGenerate
     , let fd = filesByName ! f
     ]

-- | Given a list of .proto files (topologically sorted), determine which
-- files' definitions are exported by which files.
--
-- Files only export their own definitions, along with the definitions exported
-- by any "import public" declarations.
transitiveExports :: [FileDescriptorProto] -> Map ProtoFileName [ProtoFileName]
-- Accumulate the transitive dependencies by folding over the files in
-- topological order.
transitiveExports = foldl' setExportsFromFile Map.empty
  where
    setExportsFromFile :: Map ProtoFileName [ProtoFileName]
                       -> FileDescriptorProto
                       -> Map ProtoFileName [ProtoFileName]
    setExportsFromFile prevExports fd
        = flip (Map.insert n) prevExports $
            n : concat [ prevExports ! ((fd ^. dependency) !! fromIntegral i)
                       -- Note that publicDependency is a list of indices into
                       -- the dependency list.
                       | i <- fd ^. publicDependency
                       ]
      where n = fd ^. name

outputFilePath :: ModuleName -> Text
outputFilePath (ModuleName n) = T.replace "." "/" (T.pack n) <> ".hs"

-- | Get the module name of a .proto file.
moduleName :: Text -> FileDescriptorProto -> ModuleName
moduleName modulePrefix fd = ModuleName $ fixModuleName rawModuleName
  where
    path = fd ^. name
    prefix
        | T.null modulePrefix = "Proto"
        | otherwise = modulePrefix
    fixModuleName "" = ""
    -- Characters allowed in Bazel filenames but not in module names:
    fixModuleName ('.':c:cs) = '.' : toUpper c : fixModuleName cs
    fixModuleName ('_':c:cs) = toUpper c : fixModuleName cs
    fixModuleName ('-':c:cs) = toUpper c : fixModuleName cs
    fixModuleName (c:cs) = c : fixModuleName cs
    rawModuleName = intercalate "." $ (T.unpack prefix :)
                        $ splitDirectories $ dropExtension
                        $ T.unpack path


