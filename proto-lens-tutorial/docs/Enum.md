# Enum Generation

Enums that are defined in a `.proto` file are generated as Haskell coproducts. Given instances to various typeclasses for making their use more ergonomic in code use.

An `enum` may be defined in a file `foo.proto`:
```
syntax="proto3"

enum Baz {
  BAZ1 = 0;
  BAZ2 = 1;
}
```

This will generate a `Foo` module with the a `Bar` coproduct containing three constructors:
``` haskell
data Baz = BAZ1
         | BAZ2
         | Baz'Unrecognized !Baz'UnrecognizedValue
         deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
```

Notice `Bar'Unrecognized !Bar'UnrecognizedValue`; it is there for the uncertainty of deserializing the data from a protocol buffer and this becomes the default value.

Instances generated are:

* `Data.ProtoLens.MessageEnum` for enabling safe decoding.
* `Prelude.Bounded` where `maxBound` is the maximum numbered field, and `minBound` is the minimum.
* `Prelude.Enum` where the numbering of the fields dictates the enumeration.
* `Data.Default.Class.Default` where the default value is `minBound`.
* `Data.ProtoLens.FieldDefault` same as `Default`.
