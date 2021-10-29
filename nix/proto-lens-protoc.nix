let nixpkgs = import ./nixpkgs.nix;
in
{
  pkgs ? import nixpkgs {
    overlays = import ./overlay.nix {
    };
  },
}:
with pkgs;
let callPackage = lib.callPackageWith haskellPackages;
    pkg = callPackage ./proto-lens-protoc-pkg.nix {inherit stdenv;};
    setupDeps = [ protobuf cacert ];
    testDeps = [ ];
in
  haskell.lib.overrideCabal pkg (drv: {
    setupHaskellDepends =
      if drv ? "setupHaskellDepends"
      then drv.setupHaskellDepends ++ setupDeps
      else setupDeps;
    testSystemDepends =
      if drv ? "testSystemDepends"
      then drv.testSystemDepends ++ testDeps
      else testDeps;
    isExecutable = true;
    enableSharedExecutables = false;
    enableLibraryProfiling = false;
    isLibrary = false;
    doHaddock = false;
    prePatch = "hpack --force";
    postFixup = "rm -rf $out/lib $out/nix-support $out/share/doc";
  })
