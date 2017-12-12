# Oneof Generation

Oneof fields within a Message are generated as fields in the records, where the field is a `Maybe` due to paritiality of deserializing. The values are defined by a coproduct type.

A Message with a `oneof` may be defined in a file `foo.proto`:
```
syntax="proto3"

message Foo {
  oneof bar {
    int32 baz = 1;
    string bippy = 2;
  }
}
```

This will generate a `Foo` module with the a `Bar` record containing the field `_Foo'bar` and and a coproduct `Foo'Bar` with constructors `Foo'Baz` and `Foo'Bippy`. On top of this `Prism'` functions will be generated for the sum type, in this case `Foo'Bar`, one for each `oneof` field:
``` haskell
data Foo = Foo{_Foo'bar :: !(Prelude.Maybe Foo'Bar),
               _Foo'_unknownFields :: !Data.ProtoLens.FieldSet}
         deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

data Foo'Bar = Foo'Baz !Data.Int.Int32
             | Foo'Bippy !Data.Text.Text
             deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

_Foo'Baz :: Lens.Labels.Prism.Prism' Foo'Bar Data.Int.Int32
_Foo'Baz
 = Lens.Labels.Prism.prism' Foo'Baz
     (\ p__ ->
        case p__ of
            Foo'Baz p__val -> Prelude.Just p__val
            _otherwise -> Prelude.Nothing)

_Foo'Bippy :: Lens.Labels.Prism.Prism' Foo'Bar Data.Text.Text
_Foo'Bippy
 = Lens.Labels.Prism.prism' Foo'Bippy
     (\ p__ ->
        case p__ of
            Foo'Bippy p__val -> Prelude.Just p__val
            _otherwise -> Prelude.Nothing)
```

The `Prism'` functions allow us to succinctly focus on one branch of the sum type for our Message, for example:
``` haskell
accessBaz :: Foo -> Maybe Int32
accessBaz foo = foo ^? maybe'bar . _Just . _Foo'Baz
```

Our regular Message instances are generated:

* `Lens.Labels.HasLens`
* `Lens.Labels.HasLens'` for the various fields. These include `maybe'*` `HasLens'` instances for viewing the `Maybe` values.
* `Data.Default.Class.Default` for having default field values.
* `Data.ProtoLens.Message` for enabling serialization by providing reflection of all of the fields that may be used by this type.
