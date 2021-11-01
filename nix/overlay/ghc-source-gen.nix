{ mkDerivation, base, ghc, ghc-paths, QuickCheck, stdenv, tasty
, tasty-hunit, tasty-quickcheck
}:
mkDerivation {
  pname = "ghc-source-gen";
  version = "0.4.2.0";
  sha256 = "a33a8936a54a1c44991e067e9f22f0fec96a8d7be6bec157a6edfe8ec8f264b1";
  libraryHaskellDepends = [ base ghc ];
  testHaskellDepends = [
    base ghc ghc-paths QuickCheck tasty tasty-hunit tasty-quickcheck
  ];
  homepage = "https://github.com/google/ghc-source-gen#readme";
  description = "Constructs Haskell syntax trees for the GHC API";
  license = stdenv.lib.licenses.bsd3;
}
