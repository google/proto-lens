## Any

`TODO: Explain Any`

## Repeated

`repeated` fields signify that the type of the field is a list of values, narturally fitting to the `[a]` type in Haskell. For example:
```
message Foo {
  repeated int32 a = 1;
  repeated int32 b = 2 [packed=true];
}
```
generates:
``` haskell 
data Foo = Foo{_Foo'a :: ![Data.Int.Int32],
               _Foo'b :: ![Data.Int.Int32],
               _Foo'_unknownFields :: !Data.ProtoLens.FieldSet}
         deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
```

## Map

`map` fields signify that the type of the field is mapping from one value to another, narturally fitting to the `Data.Map a b` type in Haskell. For exmaple:
```
message Foo {
  map<int32, string> bar = 1;
}
```
generates:
``` haskell 
data Foo = Foo{_Foo'bar ::
               !(Data.Map.Map Data.Int.Int32 Data.Text.Text),
               _Foo'_unknownFields :: !Data.ProtoLens.FieldSet}
         deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
         
data Foo'BarEntry = Foo'BarEntry{_Foo'BarEntry'key ::
                                !Data.Int.Int32,
                                _Foo'BarEntry'value :: !Data.Text.Text,
                                _Foo'BarEntry'_unknownFields :: !Data.ProtoLens.FieldSet}
                 deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
```
`TODO: What is the Foo'BarEntry for? Is there anything significant about map`

## Lens Laws

`TODO: Explain why the lens laws are not adhered to for optional fields and oneofs`