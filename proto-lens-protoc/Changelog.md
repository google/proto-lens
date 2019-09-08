# Changelog for `proto-lens-protoc`

## Pending

### Breaking Changes
- Reexport transitive definitions from modules generated for `.proto` files
  with `import public` statements (#329).
- Add `methodOptions` to `HasMethodImpl` to provide custom method options.
- Bump lower bounds to base-4.10 (ghc-8.2).

### Backwards-Compatible Changes
- Fix a potential naming conflict when message types and enum values
  are the same except for case.

## v0.5.0.0

### Breaking Changes
- Capitalize enum values, and capitalize names of enum sub-messages (#270).
- Fix the parser to fail on end-group markers with the wrong tag number (#282).

### Backwards-Compatible Changes
- Allow enum names that start with underscores. (#238)
- Track changes to `proto-lens`: use generated Haskell code and a custom
  parsing monad to encode/decode proto messages faster.
- Store repeated fields internally as `Vector`s, and expose the internal
  representation via new `vec'*` lenses. (#302)
- Use `Vector`s for more efficient encoding/decoding.
- Add more combinators to support the generated code.

## v0.4.0.1
- Bump the dependency on `base` and `containers` to support `ghc-8.6.1`.
- Fix a GHC error on enums with a very large number of cases (#241).

## v0.4.0.0
- Split out `proto-lens-setup` and `proto-lens-runtime` into separate
  packages.
- Hide the constructors and record fields of message types, and make `Show`
  instances call `showMessageShort`.
- Generate explicit `NFData` instances for each type.
- Track the change to `proto-lens`: Don't use `data-default` for
  default proto values (#194).
- Use simplified lens-labels instances. (#208)

## v0.3.1.2
- Bump the upper bound to `temporary-1.3`.
- Fix warnings.

## v0.3.1.1
- Fix management of generated files between Cabal components (#171).
- Bump the lower bound on `base` to indicate we require `ghc>=8.0`.
- Use autogen-modules. (#196)

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
- Refactor the `FieldDescriptorType`. (#147)
- Add a case to proto3 enums for unknown values. (#137)
- Track consolidation of `proto-lens-descriptors` into `proto-lens`. (#140)
- Generate service definitions using promoted datatypes. (#154)
- Generate prisms for `oneof` message fields. (#160)

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
