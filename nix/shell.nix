let nixpkgs = import ./nixpkgs.nix;
in
{
  pkgs ? import nixpkgs {
    overlays = import ./overlay.nix {
      inherit vimBackground vimColorScheme;
    };
  },
  usingDocker ? false,
  vimBackground ? "light",
  vimColorScheme ? "PaperColor",
}:
with pkgs;

#
# TODO : nixify all pkgs
#

let defaultShellHook = ''

      (cd /app/ && gen-hie > ./hie.yaml)
      (cd /app/ && git submodule init && git submodule update)

      for PKG in "proto-lens" "proto-lens-runtime" "proto-lens-protoc"; do
        (cd /app/nix/ && cabal2nix ./../$PKG > ./$PKG-pkg.nix)
      done

    '';
    dockerShellHook = ''

      stack config set system-ghc --global true
      SKIP_GHC_CHECK="skip-ghc-check: true"
      grep -q "$SKIP_GHC_CHECK" ~/.stack/config.yaml \
        || echo "$SKIP_GHC_CHECK" >> ~/.stack/config.yaml

   '';
in

stdenv.mkDerivation {
  name = "haskell-shell";
  buildInputs = [
    haskell-ide
    cabal2nix
    protobuf
  ];
  TERM="xterm-256color";
  LC_ALL="C.UTF-8";
  GIT_SSL_CAINFO="${cacert}/etc/ssl/certs/ca-bundle.crt";
  NIX_SSL_CERT_FILE="${cacert}/etc/ssl/certs/ca-bundle.crt";
  shellHook =
    if usingDocker
    then dockerShellHook + defaultShellHook
    else defaultShellHook;
}
