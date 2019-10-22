module Data.ProtoLens.Compiler.ModuleName
    ( protoModuleName ) where

import Data.Char (toUpper)
import Data.List (intercalate)
import System.FilePath

-- | Get the Haskell module name corresponding to a given .proto file.
protoModuleName :: FilePath -> String
protoModuleName path = fixModuleName rawModuleName
  where
    fixModuleName "" = ""
    -- Characters allowed in Bazel filenames but not in module names:
    fixModuleName ('.':c:cs) = '.' : toUpper c : fixModuleName cs
    fixModuleName ('_':c:cs) = toUpper c : fixModuleName cs
    fixModuleName ('-':c:cs) = toUpper c : fixModuleName cs
    fixModuleName (c:cs) = c : fixModuleName cs
    rawModuleName = intercalate "."
                        . (prefix :)
                        . splitDirectories $ dropExtension
                        $ path

prefix :: String
prefix = "Proto"
