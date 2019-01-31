# Changelog for `proto-lens-protobuf-types`

## v0.5.0.0
- Bump upper bounds to support `proto-lens-0.5.*`.

## v0.4.0.1
- Bump the dependency on `base` to support `ghc-8.6.1`.

## v0.4.0.0
- Switch to `proto-lens-{setup/runtime}` v0.4.
- Bump the lens-labels dependency to `0.3.*` for consistency with other
  packages.

## v0.3.0.2
- Bump the lower bound on `base` to indicate we require `ghc>=8.0`.
- Use autogen-modules. (#196)
- Use OverloadedLabels internally, rather than the `_Fields` modules. (#198)

## v0.3.0.1
- Bump the dependency on `base` for `ghc-8.4.2`.

## v0.3.0.0
- Remove support for `ghc-7.10`. (#136)
- Use a `.cabal` file that's auto-generated from `hpack`. (#138)
- Separate types into their own module, apart from field lenses. (#100)
- Track `proto-lens` change: split the `Message` class into
  separate methods. (#139)


## v0.2.2.0
- Add the `Data.ProtoLens.Any` module for storing arbitrary Messages (#88).
- Bump the dependency on `base` to support `ghc-8.2.1`.

## v0.2.1.0
Initial version.
