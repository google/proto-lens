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
{-# LANGUAGE CPP #-}
module Data.ProtoLens.Setup
    ( defaultMainGeneratingProtos
    , defaultMainGeneratingSpecificProtos
    , generatingProtos
    , generatingSpecificProtos
    , generateProtosWithImports
    , generateProtos
    ) where

#if __GLASGOW_HASKELL__ < 709
import Data.Functor ((<$>))
#endif

import Control.Monad (filterM, forM_, guard, when)
#if MIN_VERSION_Cabal(2,0,0)
import qualified Data.Map as Map
#endif
import Data.Maybe (maybeToList)
import qualified Data.Set as Set
import Distribution.ModuleName (ModuleName)
import qualified Distribution.ModuleName as ModuleName
import qualified Distribution.InstalledPackageInfo as InstalledPackageInfo
import Distribution.PackageDescription
    ( PackageDescription(..)
    , benchmarkBuildInfo
    , benchmarkName
    , buildInfo
    , exeName
    , exposedModules
    , extraSrcFiles
    , hsSourceDirs
    , libBuildInfo
    , otherModules
    , testBuildInfo
    , testBuildInfo
    , testName
    )
import qualified Distribution.Simple.BuildPaths as BuildPaths
import Distribution.Simple.InstallDirs (datadir)
import Distribution.Simple.LocalBuildInfo
    ( LocalBuildInfo(..)
    , absoluteInstallDirs
    , ComponentName(..)
    , componentPackageDeps
#if MIN_VERSION_Cabal(2,0,0)
    , allComponentsInBuildOrder
    , componentNameMap
#endif
    )
import qualified Distribution.Simple.PackageIndex as PackageIndex
import Distribution.Simple.Setup (fromFlag, copyDest, copyVerbosity)
import Distribution.Simple.Utils
    ( createDirectoryIfMissingVerbose
    , installOrdinaryFile
    , matchFileGlob
    )
import Distribution.Simple
    ( defaultMainWithHooks
    , simpleUserHooks
    , UserHooks(..)
    )
import Distribution.Verbosity (Verbosity)
import System.FilePath
    ( (</>)
    , equalFilePath
    , isRelative
    , makeRelative
    , takeDirectory
    , takeExtension
    )
import System.Directory
    ( createDirectoryIfMissing
    , doesDirectoryExist
    , findExecutable
    , removeDirectoryRecursive
    )
import System.IO (hPutStrLn, stderr)
import System.Process (callProcess)

import qualified Data.ProtoLens.Compiler.Plugin as Plugin

-- | This behaves the same as 'Distribution.Simple.defaultMain', but
-- auto-generates Haskell files from .proto files which are:
--
-- * Listed in the @.cabal@ file under @extra-source-files@,
--
-- * Located under the given root directory, and
--
-- * Correspond to a module (@"Proto.*"@) in `exposed-modules` or
-- `other-modules` of some component in the @.cabal@ file.
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

-- | This behaves the same as 'Distribution.Simple.defaultMain', but
-- auto-generates Haskell files from the .proto files listed. The given .proto
-- files should be under the given root directory.
--
-- Writes the generated files to the autogen directory (@dist\/build\/autogen@
-- for Cabal, and @.stack-work\/dist\/...\/build\/autogen@ for stack).
--
-- Throws an exception if the @proto-lens-protoc@ executable is not on the PATH.
defaultMainGeneratingSpecificProtos
    :: FilePath -- ^ The root directory under which .proto files can be found.
    -> (LocalBuildInfo -> IO [FilePath])
    -- ^ A function to return a list of .proto files. Takes the Cabal package
    -- description as input. Non-absolute paths are treated as relative to the
    -- provided root directory.
    -> IO ()
defaultMainGeneratingSpecificProtos root getProtos
    = defaultMainWithHooks
    $ generatingSpecificProtos root getProtos simpleUserHooks

-- | Augment the given 'UserHooks' to auto-generate Haskell files from the
-- .proto files which are:
--
-- * Listed in the @.cabal@ file under @extra-source-files@,
--
-- * Located under the given root directory, and
--
-- * Correspond to a module (@"Proto.*"@) in `exposed-modules` or
-- `other-modules` of some component in the @.cabal@ file.
--
-- Writes the generated files to the autogen directory (@dist\/build\/autogen@
-- for Cabal, and @.stack-work\/dist\/...\/build\/autogen@ for stack).
--
-- Throws an exception if the @proto-lens-protoc@ executable is not on the PATH.
generatingProtos
    :: FilePath -- ^ The root directory under which .proto files can be found.
    -> UserHooks -> UserHooks
generatingProtos root = generatingSpecificProtos root getProtos
  where
    getProtos l = do
      -- Replicate Cabal's own logic for parsing file globs.
      files <- concat <$> mapM matchFileGlob (extraSrcFiles $ localPkgDescr l)
      let activeModules = Set.fromList $ collectActiveModules l
      pure . filter (\f -> relativeFileToProtoModule f
                            `Set.member` activeModules)
           . filter (\f -> takeExtension f == ".proto")
           . map (makeRelative root)
           . filter (isSubdirectoryOf root)
           $ files
    relativeFileToProtoModule
        = ModuleName.fromString . Plugin.moduleNameStr "Proto"


-- | Augment the given 'UserHooks' to auto-generate Haskell files from the
-- .proto files returned by a function @getProtos@.
--
-- Writes the generated files to the autogen directory (@dist\/build\/autogen@
-- for Cabal, and @.stack-work\/dist\/...\/build\/autogen@ for stack).
--
-- Throws an exception if the @proto-lens-protoc@ executable is not on the PATH.
generatingSpecificProtos
    :: FilePath -- ^ The root directory under which .proto files can be found.
    -> (LocalBuildInfo -> IO [FilePath])
    -- ^ A function to return a list of .proto files. Takes the Cabal package
    -- description as input. Non-absolute paths are treated as relative to the
    -- provided root directory.
    -> UserHooks -> UserHooks
generatingSpecificProtos root getProtos hooks = hooks
    { buildHook = \p l h f -> generate l >> buildHook hooks p l h f
    , haddockHook = \p l h f -> generate l >> haddockHook hooks p l h f
    , replHook = \p l h f args -> generate l >> replHook hooks p l h f args
    , sDistHook = \p maybe_l h f -> case maybe_l of
            Nothing -> error "Can't run protoc; run 'cabal configure' first."
            Just l -> do
                        generate l
                        sDistHook hooks (fudgePackageDesc l p) maybe_l h f
    , postCopy = \a flags pkg lbi -> do
                  let verb = fromFlag $ copyVerbosity flags
                  let destDir = datadir (absoluteInstallDirs pkg lbi
                                             $ fromFlag $ copyDest flags)
                              </> protoLensImportsPrefix
                  getProtos lbi >>= copyProtosToDataDir verb root destDir
                  postCopy hooks a flags pkg lbi
    }
  where
    generate l = getProtos l >>= generateSources root l

-- | Generate Haskell source files for the given input .proto files.
generateSources :: FilePath -- ^ The root directory
                -> LocalBuildInfo
                -> [FilePath] -- ^ Proto files relative to the root directory.
                -> IO ()
generateSources _ _ [] = return ()
generateSources root l files = do
    -- Collect import paths from build-depends of this package.
    importDirs <- filterM doesDirectoryExist
                     [ InstalledPackageInfo.dataDir info </> protoLensImportsPrefix
                     | info <- collectDeps l
                     ]
    generateProtosWithImports (root : importDirs) (autogenModulesDir l)
                              -- Applying 'root </>' does nothing if the path is already
                              -- absolute.
                              (map (root </>) files)

-- | Copy each .proto file into the installed "data-dir" path,
-- so that it can be included by other packages that depend on this one.
copyProtosToDataDir :: Verbosity
                    -> FilePath -- ^ The root for source .proto files in this
                                -- package.
                    -> FilePath -- ^ The final location where .proto files should
                                -- be installed.
                    -> [FilePath] -- ^ .proto files relative to the root
                    -> IO ()
copyProtosToDataDir verb root destDir files = do
    -- Make the build more hermetic by clearing the output
    -- directory.
    exists <- doesDirectoryExist destDir
    when exists $ removeDirectoryRecursive destDir
    forM_ files $ \f -> do
        let srcFile = root </> f
        let destFile = destDir </> f
        createDirectoryIfMissingVerbose verb True
            (takeDirectory destFile)
        installOrdinaryFile verb srcFile destFile

-- | Imports are stored as $datadir/proto-lens-imports/**/*.proto.
protoLensImportsPrefix :: FilePath
protoLensImportsPrefix = "proto-lens-imports"

-- | Add the autogen directory to the hs-source-dirs of all the targets in the
-- .cabal file.  Used to fool 'sdist' by pointing it to the generated source
-- files.
fudgePackageDesc :: LocalBuildInfo -> PackageDescription -> PackageDescription
fudgePackageDesc lbi p = p
    { library =
        (\lib -> lib { libBuildInfo = fudgeBuildInfo (libBuildInfo lib) })
            <$> library p
    , executables =
        (\exe -> exe { buildInfo = fudgeBuildInfo (buildInfo exe) })
            <$> executables p
    , testSuites =
        (\test -> test { testBuildInfo = fudgeBuildInfo (testBuildInfo test) })
            <$> testSuites p
    , benchmarks =
        (\bench -> bench { benchmarkBuildInfo =
                              fudgeBuildInfo (benchmarkBuildInfo bench) })
            <$> benchmarks p
    }
  where
    fudgeBuildInfo bi =
        bi { hsSourceDirs = autogenModulesDir lbi : hsSourceDirs bi }

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
generateProtos root = generateProtosWithImports [root]
--
-- | Run the proto compiler to generate Haskell files from the given .proto files.
--
-- Writes the generated files to the autogen directory (@dist\/build\/autogen@
-- for Cabal, and @.stack-work\/dist\/...\/build\/autogen@ for stack).
--
-- Throws an exception if the @proto-lens-protoc@ executable is not on the PATH.
generateProtosWithImports
    :: [FilePath] -- ^ Directories under which .proto files and/or files that
                  -- they import can be found.
    -> FilePath -- ^ The output directory for the generated Haskell files.
    -> [FilePath] -- ^ The .proto files to process.
    -> IO ()
generateProtosWithImports imports output files = do
    protoLensProtoc
        <- findExecutableOrDie "proto-lens-protoc"
              $ "Please file a bug at "
                  ++ "https://github.com/google/proto-lens/issues ."
    protoc <- findExecutableOrDie "protoc"
                $ "Follow the installation instructions at "
                    ++ "https://google.github.io/proto-lens/installing-protoc.html ."
    createDirectoryIfMissing True output
    callProcess protoc $
        [ "--plugin=protoc-gen-haskell=" ++ protoLensProtoc
        , "--haskell_out=" ++ output
        ]
        ++ ["--proto_path=" ++ p | p <- imports]
        ++ files

-- | Search the PATH for an executable, printing an error message if it's not
-- found.
findExecutableOrDie :: String -> String -> IO FilePath
findExecutableOrDie name debugMsg = do
    maybePath <- findExecutable name
    case maybePath of
        Just path -> return path
        Nothing -> do
            let sep = "=========="
            hPutStrLn stderr sep
            hPutStrLn stderr $ "Error: couldn't find the executable " ++ show name
                            ++ " in your $PATH."
                            ++ "\n    " ++ debugMsg
            hPutStrLn stderr sep
            error $ "Missing executable " ++ show name

-- | Collect all the module names that we need to build.
-- For example: only include test-suites if we're building with tests enabled
-- (e.g., `stack test` vs `stack build`).
collectActiveModules :: LocalBuildInfo -> [ModuleName]
collectActiveModules l = let
    in (activeLib >>= exposedModules)
        ++ concatMap otherModules
            (concat
                [ libBuildInfo <$> activeLib
                , buildInfo <$> activeExes
                , testBuildInfo <$> activeTests
                , benchmarkBuildInfo <$> activeBenchmarks
                ])
  where
    p = localPkgDescr l
    activeLib = guard (active CLibName) >> maybeToList (library p)
    activeExes = filter (active . CExeName . exeName) $ executables p
    activeTests = filter (active . CTestName . testName) $ testSuites p
    activeBenchmarks = filter (active . CBenchName . benchmarkName)
                          $ benchmarks p
    comps = Set.fromList $ allComponentNames l
    active = (`Set.member` comps)

-------------------------------------------------------
-- Compatibility layer between Cabal-1.* and Cabal-2.*

-- | List all the packages that this one depends on.
collectDeps :: LocalBuildInfo -> [InstalledPackageInfo.InstalledPackageInfo]
#if MIN_VERSION_Cabal(2,0,0)
collectDeps l = do
    c <- allComponentsInBuildOrder l
    (i,_) <- componentPackageDeps c
    Just p <- [PackageIndex.lookupUnitId (installedPkgs l) i]
    return p
#else
collectDeps l = do
    (_, c ,_) <- componentsConfigs l
    (_, i) <- componentPackageDeps c
    PackageIndex.lookupSourcePackageId (installedPkgs l) i
#endif

-- | All the components that will be built by this Cabal command.
allComponentNames :: LocalBuildInfo -> [ComponentName]
#if MIN_VERSION_Cabal(2,0,0)
allComponentNames l = Map.keys $ componentNameMap l
#else
allComponentNames l = [c | (c, _, _) <- componentsConfigs l]
#endif

-- | Get the package-level "autogen" directory where we're putting the
-- generated .hs files.  (The 'BuildPaths.autogenModulesDir' file was
-- deprecated in Cabal-2.0 in favor of module-specific directories
-- (@autogenComponentModulesDir@), but our setup currently needs the more
-- global location.)
autogenModulesDir :: LocalBuildInfo -> FilePath
#if MIN_VERSION_Cabal(2,0,0)
autogenModulesDir = BuildPaths.autogenPackageModulesDir
#else
autogenModulesDir = BuildPaths.autogenModulesDir
#endif
