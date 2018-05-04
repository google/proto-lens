# Changelog for `proto-lens-protobuf-types`

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
