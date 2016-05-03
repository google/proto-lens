-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

-- To regenerate the bootstrapping proto bindings:
-- $ runghc bootstrap.hs
import Control.Applicative ((<$>))
import System.FilePath ((</>))
import System.Process (callProcess, readProcess)

protoRoot = "google/protobuf/src"
protoc = protoRoot </> "protoc"
modulePrefix = "Bootstrap.Proto"
bootstrapModuleRoot = "proto-lens-protoc/src"

main = do
  [installRoot] <- lines <$> readProcess "stack"
                                ["path", "--local-install-root"] ""
  -- TODO: use Data.ProtoLens.Setup (but use the locally built proto-lens-protoc)
  let protocGenHaskell = installRoot </> "bin/proto-lens-protoc"
  callProcess "stack" ["build"]
  callProcess protoc $
      [ "--plugin=protoc-gen-haskell=" ++ protocGenHaskell
      , "--haskell_out=" ++ modulePrefix ++ ":" ++ bootstrapModuleRoot
      , "--proto_path=" ++ protoRoot
      ]
      ++ map (protoRoot </>)
          [ "google/protobuf/descriptor.proto"
          , "google/protobuf/compiler/plugin.proto"
          ]


