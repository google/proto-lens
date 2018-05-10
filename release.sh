#!/bin/bash

set -ueo pipefail

cabal sandbox init
export CABAL_SANDBOX_CONFIG=$PWD/cabal.sandbox.config

for p in lens-labels proto-lens proto-lens-protoc
do
  (cd $p && \
    cabal install --force-reinstall)
done

for p in proto-lens-combinators proto-lens-protobuf-types
do
  (cd $p && \
    cabal install --enable-tests --enable-benchmarks --only-dependencies && \
    cabal configure --enable-tests --enable-benchmarks && \
    cabal sdist)
done

