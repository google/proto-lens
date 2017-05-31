[![Build Status](https://travis-ci.org/google/proto-lens.svg?branch=master)](https://travis-ci.org/google/proto-lens)

The proto-lens library provides an API for protocol buffers using modern Haskell
language and library patterns.  Specifically, it provides:

  * Composable field accessors via lenses
  * Simple field name resolution/overloading via type-level literals
  * Type-safe reflection and encoding/decoding of messages via GADTs

This is not an official Google product.

# Instructions

## Setup
First, install the "protoc" binary somewhere in your PATH.  You can get it by
downloading the corresponding file for your system from
https://github.com/google/protobuf/releases.  (The corresponding file will be
named something like `protoc-*-.zip`.)

## Using Cabal or Stack
`proto-lens` can be used as part of a Cabal project to auto-generate Haskell
source files from the original protocol buffer specifications (`.proto` files).

Note: if using Stack, these instructions require `v1.4.0` or newer.

First, edit the `.cabal` file of your project to:

* Specify `build-type: Custom`.
* List the .proto files in `extra-source-files`.  Note that the field belongs
  at the top level of the `.cabal` file, rather than once per
  library/executable/etc.
* List the generated modules (e.g. `Proto.Foo.Bar`) in `exposed-modules`
  or `other-modules` of the rule(s) that use them (e.g. the library or
  executables).
* Add `proto-lens-protoc` to the build-depends of those rules.
* Add a `custom-setup` clause to your .cabal file.

For example, in `foo-bar-proto.cabal`:

    ...
    build-type: Custom
    extra-source-files: src/foo/bar.proto
    ...
    custom-setup
      setup-depends: base, Cabal, proto-lens-protoc

    library
        exposed-modules: Proto.Foo.Bar
        build-depends: proto-lens-protoc, ...

Next, write a `Setup.hs` file that uses `Data.ProtoLens.Setup` and specifies the
directory containing the `.proto` files.  For example:

    import Data.ProtoLens.Setup

    main = defaultMainGeneratingProtos "src"

Then, when you run `cabal build` or `stack build`, Cabal will generate a Haskell
file from each .proto file, and use it as part of building the
library/executable/etc.

See the `proto-lens-tests` package for some more detailed examples.

## Manually running the protocol compiler
Suppose you have a file `foo.proto`. Then to generate bindings, run:

    protoc --plugin=protoc-gen-haskell=`which proto-lens-protoc` \
        --haskell_out=. foo.proto

This will generate a file `Proto/Foo.hs` which contains Haskell definitions
corresponding to the messages and fields in the protocol buffer file.

Use `--haskell_out` to control the location of the output file.

Use `--proto_path` to specify the location of input `.proto` files.  For
example, suppose we have the files `src/project/{foo,bar}.proto`, and
`bar.proto` has the line

    import "project/foo.proto";

Then running:

    protoc --plugin=protoc-gen-haskell=`which proto-lens-protoc` \
        --haskell_out=. \
        --proto_path=src \
        src/project/foo.proto src/project/bar.proto
will generate the haskell files `Proto/Project/{Foo,Bar}.hs`.

# Current differences from the standard

- Services are not supported.
- `oneof` fields are treated the same as `optional` fields.
- Extensions (proto2-only) are not supported.  `Any` messages (the proto3
  equivalent) can be used, but don't have any custom API support like in the C++
  libraries.
- Unknown fields of proto2 messages are discarded during decoding. (This is the
  correct behavior for proto3.)
- Unknown enum values cause a decoding error, instead of being preserved
  round-trip.
- Files with `import public` statements compile correctly, but don't explicitly
  reexport the definitions from those imports.
- Enum aliases (`option allow_alias = true`) are not supported; each enum value
  must map to a distinct integer constant.

# Troubleshooting

## Rebuilding
Due to [stack issue #1891](https://github.com/commercialhaskell/stack/issues/1891),
if you only change the .proto files then stack won't rebuild the package (that
is, it won't regenerate the `Proto.*` modules).

## Linking errors
Due to the limitations of how we can specify the dependencies of Setup
files, stack may try to link them against the `terminfo` package. You
may get an error from `stack build` similar to:

```
/usr/bin/ld: cannot find -ltinfo
```

On a Debian based system (like Ubuntu), the remedy is:

```
sudo apt-get install libncurses5-dev
```

