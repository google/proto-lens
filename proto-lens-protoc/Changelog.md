# Changelog for `proto-lens-protoc`

## Unreleased changes

## v0.2.2.2
- Bump the dependency for `process-1.6`.

## v0.2.2.1
- Fix the case where types/constructors of oneofs overlap with those of
  submessages or subenums, by appending `"'"` to the former when required.

## v0.2.2.0
- Bump the dependency on `base` to support `ghc-8.2.1` and `Cabal-2.0`.
- Bump the dependency for `haskell-src-exts-0.19`.
- Improve the semantics of oneof fields, and add a lens to access the
  underlying sum type.
- Generate Ord instances for all exported datatypes.
- Print a better error message when missing `protoc` or `proto-lens-protoc`.
- Expose message names to support `Data.ProtoLens.Any`.
- CamelCase the names of Haskell message types.

## v0.2.1.0 and older
See `Changelog.md` for `proto-lens`.
