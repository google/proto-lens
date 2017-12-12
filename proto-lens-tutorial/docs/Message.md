# Message Generation

Messages that are defined in a `.proto` file are generated as Haskell records. Given instances to various typeclasses for making their use more ergonomic in code use.

A `message` may be defined in a file `foo.proto`:
```
syntax="proto3"

message Bar {
  int32 baz = 1;
  string bippy = 2;
}
```

This will generate a `Foo` module with the a `Bar` record containing fields `_Bar'baz` and `_Bar'bippy`:
``` haskell
data Bar = Bar{_Bar'baz   :: !Prelude.Float,
               _Bar'bippy :: !Data.Text.Text,
               _Foo'_unknownFields :: !Data.ProtoLens.FieldSet}
           deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
```

Notice `_Foo'_unknownFields :: !Data.ProtoLens.FieldSet`; it is there for the uncertainty of deserializing the data from a protocol buffer encountering non-conformant data.

Instances generated are:

* `Lens.Labels.HasLens`
* `Lens.Labels.HasLens'` for the various fields.
* `Data.Default.Class.Default` for having default field values.
* `Data.ProtoLens.Message` for enabling serialization by providing reflection of all of the fields that may be used by this type.
