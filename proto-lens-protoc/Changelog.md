# Changelog for `proto-lens-protoc`

## Unreleased changes
- Bump the dependency on `base` to support `ghc-8.2.1` and `Cabal-2.0`.
- Improve the semantics of oneof fields, and add a lens to access the
  underlying sum type.
- Generate Ord instances for all exported datatypes.
- Print a better error message when missing `protoc` or `proto-lens-protoc`.
- Expose message names to support `Data.ProtoLens.Any`.

## v0.2.1.0 and older
See `Changelog.md` for `proto-lens`.
