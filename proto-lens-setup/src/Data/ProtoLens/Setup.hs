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
{-# LANGUAGE BangPatterns #-}
module Data.ProtoLens.Setup
    ( defaultMainGeneratingProtos
    , defaultMainGeneratingSpecificProtos
    , generatingProtos
    , generatingSpecificProtos
    , generateProtosWithImports
    , generateProtos
    ) where

import Control.Monad (filterM, forM_, when)
import qualified Data.ByteString as BS
import qualified Data.Map as Map
import Data.Maybe (maybeToList)
import qualified Data.Set as Set
import qualified Data.Text as T
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
#if !MIN_VERSION_Cabal(2,0,0)
    , hsSourceDirs
#endif
#if MIN_VERSION_Cabal(2,4,0)
    , specVersion
#endif
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
    , ComponentLocalBuildInfo
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
#if MIN_VERSION_Cabal(2,4,0)
#else
    , matchFileGlob
#endif
    )
#if MIN_VERSION_Cabal(2,4,0)
import Distribution.Simple.Glob (matchDirFileGlob)
#endif
import Distribution.Simple
    ( defaultMainWithHooks
    , simpleUserHooks
    , UserHooks(..)
    )
import Distribution.Verbosity
    ( Verbosity
#if MIN_VERSION_Cabal(2,4,0)
    , normal
#endif
    )
import System.FilePath
    ( (</>)
    , equalFilePath
    , isRelative
    , makeRelative
    , takeDirectory
    , takeExtension
    )
import System.Directory
    ( copyFile
    , createDirectoryIfMissing
    , doesDirectoryExist
    , doesFileExist
    , findExecutable
    , removeDirectoryRecursive
    )
import System.IO (hPutStrLn, stderr)
import System.IO.Temp (withSystemTempDirectory)
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
      files <- concat <$> mapM (match $ localPkgDescr l)
                               (extraSrcFiles $ localPkgDescr l)
      pure
           . filter (\f -> takeExtension f == ".proto")
           . map (makeRelative root)
           . filter (isSubdirectoryOf root)
           $ files

match :: PackageDescription -> FilePath -> IO [FilePath]
#if MIN_VERSION_Cabal(2,4,0)
match desc f = matchDirFileGlob normal (specVersion desc) "." f
#else
match _ f = matchFileGlob f
#endif

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
#if !MIN_VERSION_Cabal(2,0,0)
    -- Older versions of Cabal don't support the autogen-modules field.
    -- Work around it by manually generating the modules and putting them
    -- in a place where `cabal sdist` will pick them up.
    , sDistHook = \p maybe_l h f -> case maybe_l of
            Nothing -> error "Can't run protoc; run 'cabal configure' first."
            Just l -> do
                        generate l
                        sDistHook hooks (fudgePackageDesc l p) maybe_l h f
#endif
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
--
-- Process all the proto files that are referenced in the exposed-modules
-- or other-modules of some "active" component, and write them all to a
-- single temporary directory.  (For example, passing --no-enable-tests
-- makes all test-suite components inactive.)
--
-- Then, for each active component, copy the corresponding module files
-- over to its specific autogen directory (if Cabal-2.*) or to the global
-- autogen directory (if Cabal-1.*).  However, don't actually do the copy
-- if it's the same as what's already there.  This way, we don't needlessly
-- touch the generated .hs files when nothing changes, and thus don't
-- needlessly make GHC recompile them (as it considers their modification
-- times for that).
generateSources :: FilePath -- ^ The root directory
                -> LocalBuildInfo
                -> [FilePath] -- ^ Proto files relative to the root directory.
                -> IO ()
generateSources root l files = withSystemTempDirectory "protoc-out" $ \tmpDir -> do
    -- Collect import paths from build-depends of this package.
    importDirs <- filterM doesDirectoryExist
                     [ InstalledPackageInfo.dataDir info </> protoLensImportsPrefix
                     | info <- collectDeps l
                     ]
    -- Generate .hs files for all active components into a single temporary
    -- directory.
    let activeModules = collectActiveModules l
    let allModules = Set.fromList . concat . map snd $ activeModules
    let usedInComponent f = ModuleName.fromString (Plugin.moduleNameStr "Proto" f)
                          `Set.member` allModules
    generateProtosWithImports (root : importDirs) tmpDir
                              -- Applying 'root </>' does nothing if the path is already
                              -- absolute.
                              $ map (root </>) $ filter usedInComponent files
    -- Copy each active component's files over to its autogen directory, but
    -- only if they've changed since last time.
    forM_ activeModules $ \(compBI, mods) -> forM_ mods $ \m -> do
          let f = T.unpack (Plugin.outputFilePath $ ModuleName.toFilePath m)
          let sourcePath = tmpDir </> f
          sourceExists <- doesFileExist sourcePath
          when sourceExists $ do
            let dest = autogenComponentModulesDir l compBI </> f
            copyIfDifferent sourcePath dest

-- Note: we do a copy rather than a move since a given module may be used in
-- more than one component.
copyIfDifferent :: FilePath -> FilePath -> IO ()
copyIfDifferent sourcePath targetPath = do
    targetExists <- doesFileExist targetPath
    identical <- do
        if not targetExists
            then return False
            else do
                -- This could be done in a streaming fashion,
                -- but since the .hs files usually easily fit
                -- into RAM, this is OK.
                sourceContents <- BS.readFile sourcePath
                targetContents <- BS.readFile targetPath
                return (sourceContents == targetContents)
    -- Do the move if necessary.
    when (not identical) $ do
        createDirectoryIfMissing True (takeDirectory targetPath)
        copyFile sourcePath targetPath


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

#if !MIN_VERSION_Cabal(2,0,0)
-- | Add the autogen directory to the hs-source-dirs of all the targets in the
-- .cabal file.  Used to fool 'sdist' by pointing it to the generated source
-- files.
fudgePackageDesc :: LocalBuildInfo -> PackageDescription -> PackageDescription
fudgePackageDesc lbi p = p
    { library =
        (\lib -> lib { libBuildInfo = fudgeBuildInfo CLibName $ libBuildInfo lib })
            <$> library p
    , executables =
        (\exe -> exe { buildInfo = fudgeBuildInfo (CExeName $ exeName exe)
                                        $ buildInfo exe })
            <$> executables p
    , testSuites =
        (\test -> test { testBuildInfo = fudgeBuildInfo (CTestName $ testName test)
                                            $ testBuildInfo test })
            <$> testSuites p
    , benchmarks =
        (\bench -> bench { benchmarkBuildInfo =
                              fudgeBuildInfo (CBenchName $ benchmarkName bench)
                                  $ benchmarkBuildInfo bench })
            <$> benchmarks p
    }
  where
    comps = allComponents lbi
    fudgeBuildInfo n bi
        | Just compLBI <- Map.lookup n comps
            = bi { hsSourceDirs = autogenComponentModulesDir lbi compLBI
                                    : hsSourceDirs bi }
        | otherwise = bi -- Could happen if a component isn't active; try
                         -- anyway and see whether Cabal complains later on.
#endif

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
generateProtosWithImports _ _ [] = return ()
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
collectActiveModules
    :: LocalBuildInfo -> [(ComponentLocalBuildInfo, [ModuleName])]
collectActiveModules l = map (\(n, c) -> (c, f n)) $ Map.toList $ allComponents l
  where
    p = localPkgDescr l
    f CLibName = maybeToList (library p) >>=
                    \lib -> exposedModules lib
                                ++ otherModules (libBuildInfo lib)
    f (CExeName n) = otherModules . buildInfo $ exes Map.! n
    f (CTestName n) = otherModules . testBuildInfo $ tests Map.! n
    f (CBenchName n) = otherModules . benchmarkBuildInfo $ benchs Map.! n
#if MIN_VERSION_Cabal(2,0,0)
    f _ = []  -- TODO: other lib kinds; for now just suppress the warning
#endif
    exes = Map.fromList [(exeName e, e) | e <- executables p]
    tests = Map.fromList [(testName e, e) | e <- testSuites p]
    benchs = Map.fromList [(benchmarkName e, e) | e <- benchmarks p]

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
allComponents :: LocalBuildInfo -> Map.Map ComponentName ComponentLocalBuildInfo
#if MIN_VERSION_Cabal(2,0,0)
allComponents l = fmap requireOne $ componentNameMap l
  where
    -- TODO: this doesn't support Backpack, which can have more than one
    -- ComponentLocalBuildInfo associated with a name.
    requireOne [x] = x
    requireOne xs = error $ "Data.ProtoLens.Setup.allComponents: expected one "
                          ++ "component per name, got " ++ show xs

#else
allComponents l = Map.fromList [(c, b) | (c, b, _) <- componentsConfigs l]
#endif

-- | Get the component-level "autogen" directory where we're putting the
-- generated .hs files.  (For Cabal-1.0, use the shared 'BuildPaths.autogenModulesDir'.)
autogenComponentModulesDir :: LocalBuildInfo -> ComponentLocalBuildInfo -> FilePath
#if MIN_VERSION_Cabal(2,0,0)
autogenComponentModulesDir = BuildPaths.autogenComponentModulesDir
#else
autogenComponentModulesDir lbi _ = BuildPaths.autogenModulesDir lbi
#endif
