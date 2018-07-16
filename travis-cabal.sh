#!/usr/bin/env bash
# A script for running Cabal on all the individual packages in this project.

set -euo pipefail
set -x

echo Installing hpack
curl -L https://github.com/sol/hpack/releases/download/0.28.2/hpack_linux.gz \
  | gunzip > $HOME/.local/bin/hpack
chmod +x $HOME/.local/bin/hpack

# List all the packages in this repo.  Put certain ones first since
# they're dependencies of the others.  (Unfortunately, "stack query" doesn't
# give them to us in the right order.)

# All the packages that are prepared to be test-released.
# Don't include test packages, some of which require
# Cabal-2.0 or higher during `sdist` due to using hpack.
PACKAGES_TO_INSTALL="
    discrimination-ieee754
    lens-labels
    proto-lens
    proto-lens-protoc
    proto-lens-runtime
    proto-lens-setup
    proto-lens-protobuf-types
    proto-lens-arbitrary
    proto-lens-combinators
    proto-lens-optparse
    proto-lens-discrimination
    proto-lens-tests-dep
"

PACKAGES_TO_BUILD="
    proto-lens-tests
    proto-lens-benchmarks
"""

echo Installing: ${PACKAGES_TO_INSTALL}
echo Building: ${PACKAGES_TO_BUILD}

# Needed by haskell-src-exts which is a dependency of proto-lens-protoc.
# Sadly, Cabal won't install such build-tools automatically.
cabal install happy

# Unregister the already-installed packages, since otherwise they may
# propagate between builds.
# TODO: use a Cabal sandbox for this.
for p in $PACKAGES_TO_INSTALL
do
  echo "Unregistering $p"
  ghc-pkg unregister --force $p || true
done

function build_package () {
  hpack
  cabal clean
  cabal install --enable-tests --force --only-dependencies
  cabal configure --enable-tests --enable-benchmarks
  cabal build
}


for p in $PACKAGES_TO_INSTALL
do
    echo "Cabal installing $p"
    (cd $p &&
      build_package
      cabal sdist
      SRC_TGZ=$(cabal info . | awk '{print $2 ".tar.gz"; exit}')
      cd dist
      if [ -f "$SRC_TGZ" ]; then
          cabal install --force-reinstalls "$SRC_TGZ"
      else
          echo "expected '$SRC_TGZ' not found"
          exit 1
      fi
    )
done

for p in $PACKAGES_TO_BUILD
do
  echo "Cabal building $p"
  (cd $p && build_package)
done

# Check that "cabal repl" works on a simple test.
cd proto-lens-tests
# Get rid of the previous dist/autogen to make sure "cabal repl" rebuilds it.
cabal clean  # Get rid of previous dist/autogen
cabal configure --enable-tests
printf "main\n:quit\n" | cabal repl canonical_test
