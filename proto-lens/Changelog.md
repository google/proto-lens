# Changelog for `proto-lens`

## v0.3.1.3
- Bump the lower bound on `base` to indicate we require `ghc>=8.0`.
- Add support for ghc-8.6.

## v0.3.1.0
- Improve references to types/fields in decoding error messages (#187).
- Bump the dependency on `base` for `ghc-8.4.2`.
- Make `Registry` an instance of `Semigroup`.

## v0.3.0.0
- Remove support for `ghc-7.10`. (#136)
- Use a `.cabal` file that's auto-generated from `hpack`. (#138)
- Add buildMessageDelimited: size-delimited streams of Messages (#102)
- Add support for parsing `Any` messages in google protobuf text format (#124)
- Use the Tag newtype consistently. (#127)
- Add support for tracking unknown fields. (#129)
- Improve an error message. (#132)
- Bundle enum pattern synonyms with their type. (#136)
- Implement proto3-style "open" enums. (#137)
- Consolidate `proto-lens-descriptors` into `proto-lens`. (#140)
- Split the `Message` class into separate methods. (#139)
- Improve an error message when decoding Anys. (#146)
- Refactor the `FieldDescriptorType. (#147)
- Improve text format error messages. (#148)
- Add module `Data.ProtoLens.Service.Types`. (#154)
- Add Haddock comments to fields. (#172)

## v0.2.2.0
- Bump the dependency on `base` to support `ghc-8.2.1`.

## v0.2.1.0
- Include `base`'s modules in the reexport list.
- Use custom-setup in packages that depend on `proto-lens-protoc`.
- Allow `.proto` files to import between Haskell packages.
- Add the `proto-lens-protobuf-types` package.

## v0.2.0.1
- Make the libraries '-Wall -Werror'-clean for the latest
  version of GHC.

## v0.2.0.0
- Support OverloadedLabels with the new `lens-labels` package.
- Fix codegen for field names that are already camel-cased.
- Increase version bounds to work with Stackage lts-8.

## v0.1.0.5
- Fix the handling of packed repeated fields (#38)
- Improve space usage and time of decoding (#63)
- Print fields ordered by tag number (#40)

## v0.1.0.4
- Relaxed dependency constraints on data-default-class for
new stackage LTS.

## v0.1.0.3
- In printing and parsing protocol buffers use/interpret escape
sequences in a way compatible with the Protocol Buffer
distribution's C/C++ escaping style, closing Issues #44 and
#45. This makes the text output incompatible with previous
versions; earlier versions will misinterpret text written by this
version and this version will misinterpret text written by
previous versions.
- Support reading text protocol buffers with single quote characters
(') for string delimiters, closing Issue #20.

## v0.1.0.2
- Expose more of protoc-gen-haskell to plugins.
- Support enum aliases.
- TextFormat prints enum names instead of numbers.

## v0.1.0.1
- Support ghc-8.
- Handle .proto files without a "package" declaration (#11).

## v0.1.0.0
- Initial version.
