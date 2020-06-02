#!/usr/bin/env bash
# A script for running Cabal new-build on this project.

set -euo pipefail
set -x

echo Installing hpack
curl -L https://github.com/sol/hpack/releases/download/0.34.1/hpack_linux.gz \
  | gunzip > $HOME/.local/bin/hpack
chmod +x $HOME/.local/bin/hpack

# Work around #354: With new-build we don't include .proto files from
# dependencies in the same project.
# For now, just copy the files in directly.
cp -Rv proto-lens-tests-dep/protos/* proto-lens-tests/tests/

for p in */package.yaml
do
  hpack $p
done

cabal new-update
cabal new-test all
