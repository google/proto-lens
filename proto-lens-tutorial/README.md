# proto-lens-tutorial

## Table of Contents

1. [Message Generation](#message-generation)
2. [Oneof Generation](#oneof-generation)
3. [Enum Generation](#enum-generation)
4. [Field Overloading](#field-overloading)
5. [Any](#any)
6. [Repeated](#repeated)
7. [Map](#map)
8. [Lens Laws](#lens-laws)
9. [Example: Person](./person/README.md)
10. [Example: Coffee Order](./coffee-order/README.md)

## Message Generation

`message`s that are defined in a `.proto` file are generated as Haskell records. Given instances to various typeclasses for making their use more ergonomic in code use.

A `message` may be defined in a file `foo.proto`:
``` protobuf
syntax="proto3";

message Bar {
  int32 baz = 1;
  string bippy = 2;
}
```

This will generate a `Foo` module with the a `Bar` record containing fields `_Bar'baz` and `_Bar'bippy`:
``` haskell
data Bar = Bar
  { _Bar'baz   :: !Prelude.Float
  , _Bar'bippy :: !Data.Text.Text
  , _Foo'_unknownFields :: !Data.ProtoLens.FieldSet
  }
  deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
```

Notice `_Foo'_unknownFields :: !Data.ProtoLens.FieldSet`; it is there for the uncertainty of deserializing the data from a protocol buffer encountering non-conformant data.

Instances generated are:

* `Lens.Labels.HasLens`
* `Lens.Labels.HasLens'` for the various fields.
* `Data.Default.Class.Default` for having default field values.
* `Data.ProtoLens.Message` for enabling serialization by providing reflection of all of the fields that may be used by this type.

## Oneof Generation

`oneof` fields within a `message` are generated as fields in the records, where the field is a `Maybe` due to paritiality of deserializing. The values are defined by a coproduct type.

A `message` with a `oneof` may be defined in a file `foo.proto`:
``` protobuf
syntax="proto3";

message Foo {
  oneof bar {
    int32 baz = 1;
    string bippy = 2;
  }
}
```

This will generate a `Foo` module with the a `Bar` record containing the field `_Foo'bar` and a coproduct `Foo'Bar` with constructors `Foo'Baz` and `Foo'Bippy`. On top of this, `Prism'` functions will be generated for the sum type, in this case `Foo'Bar`, one for each `oneof` field:
``` haskell
data Foo = Foo
  { _Foo'bar :: !(Prelude.Maybe Foo'Bar)
  , _Foo'_unknownFields :: !Data.ProtoLens.FieldSet
  }
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
import Lens.Labels.Prism

accessBaz :: Foo -> Maybe Int32
accessBaz foo = foo
             ^? maybe'bar -- We want to look at the 'bar' oneof field
              . _Just     -- We only care if this value is set with a `Just`
              . _Foo'Baz  -- Focus on the 'baz' branch of our sum type

-- | Creates a 'Foo' with an incoming 'Int32'
createFoo :: Int32 -> Foo
createFoo i = def & maybe'bar .~ (_Just # _Foo'Baz # i)

-- | Sets a new `bippy` value
updateFoo :: String -> Foo -> Foo
updateFoo s foo = foo ?~ _Foo'Bippy # s
```

Our regular instances are generated:

* `Lens.Labels.HasLens`
* `Lens.Labels.HasLens'` for the various fields. These include `maybe'*` `HasLens'` instances for viewing the `Maybe` values.
* `Data.Default.Class.Default` for having default field values.
* `Data.ProtoLens.Message` for enabling serialization by providing reflection of all of the fields that may be used by this type.

## Enum Generation

`enum`s that are defined in a `.proto` file are generated as Haskell coproducts. Given instances to various typeclasses for making their use more ergonomic in code use.

An `enum` may be defined in a file `foo.proto`:
``` protobuf
syntax="proto3";

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

## Field Overloading

When we look at having the `message`:
``` protobuf
syntax="proto3";

message Bar {
  int32 baz = 1;
  string bippy = 2;
}
```
we said that `baz` and `bippy` accessors are created via `HasLens'` instances. If we add a further message into the mix such as:
``` protobuf
message Foo {
  string baz = 1;
}
```
we can see that `baz` is common to both `Bar` and `Foo`. The difference will be that the instances for `HasLens'` will be:
``` haskell
instance Prelude.Functor f =>
         Lens.Labels.HasLens' f Foo "baz" (Data.Text.Text)

instance Prelude.Functor f =>
        Lens.Labels.HasLens' f Bar "baz" (Data.Int.Int32)
```
The fields are overloaded on the symbol `baz` but connect `Foo` to `Text` and `Bar` to `Int32`. Then we can find that there is one, polymorphic definition in the `Foo'Fields.hs` file:
``` haskell
baz ::
    forall f s t a b . (Lens.Labels.HasLens f s t "baz" a b) =>
      Lens.Family2.LensLike f s t a b
baz
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "baz")
```

The use of `baz` can be done in two ways and which way you choose is up to you and your style. The first is by importing the `*'Fields.hs` module, for example:
``` haskell
import Microlens           ((^.))
import Proto.Foo        as P
import Proto.Foo'Fields as P

myBar :: P.Bar
myBar = def & P.baz   .~ 42
            & P.bippy .~ "querty"

main :: IO ()
main = putStrLn $ myBar ^. P.bippy
```

The second method is by using the `OverloadedLabels` extension and importing the orphan instance of `IsLabel` for `proto-lens` `LensFn` type, giving us the use of `#` for prefixing our field accessors. To bring this instance into scope we need to also import `Lens.Labels.Unrwapped`:
``` haskell
{-# LANGUAGE OverloadedLabels #-}

import Lens.Labels.Unwrapped ()
import Microlens             ((^.))
import Proto.Foo          as P

myBar :: P.Bar
myBar = def & #baz   .~ 42
            & #bippy .~ "querty"

main :: IO ()
main = putStrLn $ myBar ^. #bippy
```

## Any

An `Any` field stands for any arbitrary message and thus is represented by an arbitrary blob of bytes. We can see this as a placeholder for any user defined message where the message becomes concrete when we unpack it to some message we have chosen. There are two utility functions for packing any `Message a` into an `Any` and its dual for unpacking an `Any` into a `Message a`. These functions are called `pack` and `unpack` rsepectively and their type signatures are below:

``` haskell
pack :: forall a. Message a => a -> Any
unpack :: forall a. Message a => Any -> Either UnpackError a
```

## Repeated

`repeated` fields signify that the type of the field is a list of values, narturally fitting to the `[a]` type in Haskell. For example:
``` protobuf
message Foo {
  repeated int32 a = 1;
  repeated int32 b = 2 [packed=true];
}
```
generates:
``` haskell
data Foo = Foo
  { _Foo'a :: ![Data.Int.Int32]
  , _Foo'b :: ![Data.Int.Int32]
  , _Foo'_unknownFields :: !Data.ProtoLens.FieldSet
  }
  deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
```

## Map

`map` fields signify that the type of the field is mapping from one value to another, narturally fitting to the `Data.Map a b` type in Haskell. For exmaple:
``` protobuf
message Foo {
  map<int32, string> bar = 1;
}
```
generates:
``` haskell
data Foo = Foo
  { _Foo'bar :: !(Data.Map.Map Data.Int.Int32 Data.Text.Text)
  , _Foo'_unknownFields :: !Data.ProtoLens.FieldSet
  }
  deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

data Foo'BarEntry = Foo'BarEntry
  { _Foo'BarEntry'key :: !Data.Int.Int32
  , _Foo'BarEntry'value :: !Data.Text.Text
  , _Foo'BarEntry'_unknownFields :: !Data.ProtoLens.FieldSet
  }
  deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
```

`Foo'BarEntry` is generated due to [backwards compatability](https://developers.google.com/protocol-buffers/docs/proto3#maps), so we can ignore this generated code and focus on the fact that we can treat this data as a regular Haskell `Map`.

## Lens Laws

Underneath there is a function that is used for creating lenses, `maybeLens`. `maybeLens` does not satisfy the lens laws, which expect that `set l (view l x) == x`.
For example:
``` haskell
set (maybeLens 'a') (view (maybeLens 'a') Nothing) == Just 'a'
```

However, this is the behavior generally expected by users, and only matters if we're explicitly checking whether a field is set.

Another pitfall is when interacting with `oneof` fields it is possible to clear exisitng values. For example if we have the following proto:

``` protobuf
message Foo {
  oneof bar {
    int32 baz = 1;
    string bippy = 2;
  }
}
```
we can end up doing the following:
``` haskell
fooVal :: P.Foo
fooVal = def & P.maybe'baz ?~ 42

fooVal' :: P.Foo
fooVal' = fooVal & P.maybe'bippy .~ Nothing

main :: IO ()
main = do
  print fooVal  -- outputs: Foo {_Foo'bar = Just (Foo'Baz 42), _Foo'_unknownFields = []}
  print fooVal' -- outputs: Foo {_Foo'bar = Nothing, _Foo'_unknownFields = []}
```
We have cleared the previously set `Just (Foo'Baz 42)` value by doing `P.maybe'bippy .~ Nothing`. To try and avoid this it would be best to organise your code by using the `Prism'` functions for `oneof` fields instead.
