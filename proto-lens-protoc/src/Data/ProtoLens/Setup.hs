-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

-- | Helper functions to generate proto files as part of a @Setup.hs@ script.
--
-- These functions assume that the @proto-lens-protoc@ executable is on the
-- PATH, and throw an exception otherwise.  That executable will be installed
-- automatically as part of installing this package; in particular, it should
-- be enough to just list `proto-lens-protoc` in a user package's
-- `build-dependencies`.
--
-- See @README.md@ for instructions on how to use proto-lens with Cabal.
module Data.ProtoLens.Setup
    ( defaultMainGeneratingProtos
    , generatingProtos
    , generateProtos
    ) where

import Distribution.PackageDescription (extraSrcFiles)
import Distribution.Simple.BuildPaths (autogenModulesDir)
import Distribution.Simple.Program (knownPrograms, ConfiguredProgram(..))
import Distribution.Simple.Program.Types (simpleProgram)
import Distribution.Simple.Utils (matchFileGlob)
import Distribution.Simple
    ( defaultMainWithHooks
    , simpleUserHooks
    , UserHooks(..)
    )
import System.FilePath
    ( (</>)
    , equalFilePath
    , isRelative
    , makeRelative
    , takeExtension
    )
import System.Directory (createDirectoryIfMissing, findExecutable)
import System.Process (callProcess)

-- | This behaves the same as 'Distribution.Simple.defaultMain', but
-- auto-generates Haskell files from the .proto files listed in
-- the @.cabal@ file under @extra-source-files@ which are located under the
-- given root directory.
--
-- Writes the generated files to the autogen directory (@dist\/build\/autogen@
-- for Cabal, and @.stack-work\/dist\/...\/build\/autogen@ for stack).
--
-- Throws an exception if the @proto-lens-protoc@ executable is not on the PATH.
defaultMainGeneratingProtos
    :: FilePath -- ^ The root directory under which .proto files can be found.
    -> IO ()
defaultMainGeneratingProtos root
    = defaultMainWithHooks $ generatingProtos root simpleUserHooks

-- | Augment the given 'UserHooks' to auto-generate Haskell files from the
-- .proto files listed in the @.cabal@ file under @extra-source-files@ which
-- are located under the given root directory.
--
-- Writes the generated files to the autogen directory (@dist\/build\/autogen@
-- for Cabal, and @.stack-work\/dist\/...\/build\/autogen@ for stack).
--
-- Throws an exception if the @proto-lens-protoc@ executable is not on the PATH.
generatingProtos
    :: FilePath -- ^ The root directory under which .proto files can be found.
    -> UserHooks -> UserHooks
generatingProtos root hooks = hooks
    { buildHook = \p l h f -> generateSources p l >> buildHook hooks p l h f
    , haddockHook = \p l h f -> generateSources p l >> haddockHook hooks p l h f
    -- TODO: add a hook for sdist.
    }
  where
    generateSources p l = do
        -- Replicate Cabal's own logic for parsing file globs.
        files <- concat <$> mapM matchFileGlob (extraSrcFiles p)
        generateProtos root (autogenModulesDir l)
            $ filter (isSubdirectoryOf root)
            $ filter (\f -> takeExtension f == ".proto")
                files

-- | Returns whether the @root@ is a parent folder of @f@.
isSubdirectoryOf :: FilePath -> FilePath -> Bool
isSubdirectoryOf root f
    = isRelative f
      -- Note: `makeRelative root f` returns `f` when f doesn't live under the
      -- root.
      && equalFilePath f (root </> makeRelative root f)

-- | Run the proto compiler to generate Haskell files from the given .proto files.
--
-- Writes the generated files to the autogen directory (@dist\/build\/autogen@
-- for Cabal, and @.stack-work\/dist\/...\/build\/autogen@ for stack).
--
-- Throws an exception if the @proto-lens-protoc@ executable is not on the PATH.
generateProtos
    :: FilePath -- ^ The root directory under which .proto files can be found.
    -> FilePath -- ^ The output directory for the generated Haskell files.
    -> [FilePath] -- ^ The .proto files to process.
    -> IO ()
generateProtos root output files = do
    maybeProtoLensProtoc <- findExecutable "proto-lens-protoc"
    case maybeProtoLensProtoc of
        Nothing -> error "Couldn't find executable proto-lens-protoc."
        Just protoLensProtoc -> do
            createDirectoryIfMissing True output
            callProcess "protoc" $
                [ "--plugin=protoc-gen-haskell=" ++ protoLensProtoc
                , "--haskell_out=" ++ output
                , "--proto_path=" ++ root
                ]
                ++ files
