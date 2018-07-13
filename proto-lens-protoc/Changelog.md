# Changelog for `proto-lens-protoc`

## v0.4
- Split out `proto-lens-setup` and `proto-lens-runtime` into separate
  packages.

## v0.3.1.1
- Fix management of generated files between Cabal components (#171).
- Bump the lower bound on `base` to indicate we require `ghc>=8.0`.

## v0.3.1.0
- Bump the dependency on `base` for `ghc-8.4.2`.
- Bump the dependency to `Cabal-2.2.*`.
- Make `Symbol` an instance of Semigroup.

## v0.3.0.0
- Remove support for `ghc-7.10`. (#136)
- Use a `.cabal` file that's auto-generated from `hpack`. (#138)
- Separate types into their own module, apart from field lenses.
- Improve readability of `HasLens` instances. (#118)
- Add support for tracking unknown fields. (#129)
- Don't generate Haskell modules if they won't be used. (#126)
- Bundle enum pattern synonyms exports with their type. (#136)
- Split the `Message` class into separate methods. (#139)
- Refactor the `FieldDescriptorType. (#147)
- Add a case to proto3 enums for unknown values. (#137)
- Track consolidation of `proto-lens-descriptors` into `proto-lens`. (#140)
- Generate service definitions using promoted datatypes. (#154)
- Generate prisms for `oneof` message fields. (#160)
- Build with `haskell-src-exts-1.20.*`. (#170)
- Add Haddock comments to fields. (#172)
- Don't unnecessarily touch files. (#177)

## v0.2.2.3
- Don't camel-case message names.  This reverts behavior which was added
  in v0.2.2.0.

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
