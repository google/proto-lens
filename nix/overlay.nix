{
  vimBackground ? "light",
  vimColorScheme ? "PaperColor"
}:
[(self: super:
    let
      callPackage = self.lib.callPackageWith self.haskellPackages;
      dontCheck = self.haskell.lib.dontCheck;
      doJailbreak = self.haskell.lib.doJailbreak;
    in
      {
        haskell-ide = import (
          fetchTarball "https://github.com/21it/ultimate-haskell-ide/tarball/21d8daa828eb4b17a78923f80801f51c2b80bb03"
          ) {
            formatter = "none";
            inherit vimBackground vimColorScheme;
          };
        haskellPackages = super.haskell.packages.ghc901.extend(
          self': super': {

          }
        );
      }
)]
