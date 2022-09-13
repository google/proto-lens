# Changelog for `proto-lens-runtime`

## v0.7.0.3
- Support GHC 9.4

## v0.7.0.2
- Relax upper bounds for ghc-9.2

## v0.7.0.0
- Bump upper bound to allow base-4.14.

## v0.6.0.0
- Bump lower bounds to base-4.10 (ghc-8.2).
- Support dependencies on base-4.13 (ghc-8.8) and lens-family-2.0.
- Bump upper bounds to proto-lens-0.6.

## v0.5.0.0
- Export more modules from proto-lens, to support generated encoding/decoding
  and storing repeated fields as `Vector`s.

## v0.4.0.2
- Bump the dependencies on `base` and `containers` to support `ghc-8.6.1.

## v0.4.0.1
- Remove an obsolete dependency on `data-default-class`.

## v0.4.0.0
- Split out from `proto-lens-protoc`.
- Use simplified lens-labels instances. (#208)

## Older
See `Changelog.md` for `proto-lens-protoc`.
