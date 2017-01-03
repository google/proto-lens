-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

-- To regenerate the bootstrapping proto bindings:
-- $ runghc bootstrap.hs
-- Note: if this doesn't work, you may need to edit the "location" field in
-- stack-boostrap.yaml.
import Control.Applicative ((<$>))
import System.FilePath ((</>))
import System.Process (callProcess, readProcess)

protoRoot = "google/protobuf/src"
protoc = "protoc"
bootstrapModuleRoot = "proto-lens-descriptors/src"
useBootstrappingYaml = "--stack-yaml=stack-bootstrap.yaml"

main = do
  [installRoot] <- lines <$> readProcess "stack"
                    [useBootstrappingYaml, "path", "--local-install-root"] ""
  let protocGenHaskell = installRoot </> "bin/proto-lens-protoc"
  callProcess "stack" [useBootstrappingYaml, "build", "proto-lens-protoc"]
  callProcess protoc $
      [ "--plugin=protoc-gen-haskell=" ++ protocGenHaskell
      , "--haskell_out=no-reexports:" ++ bootstrapModuleRoot
      , "--proto_path=" ++ protoRoot
      ]
      ++ map (protoRoot </>)
          [ "google/protobuf/descriptor.proto"
          , "google/protobuf/compiler/plugin.proto"
          ]
