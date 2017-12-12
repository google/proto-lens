# proto-tutorial

## Message Generation

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

## Oneof Generation

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

## Enum Generation

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

## Field Overloading

When we look at having the Message:
```
syntax="proto3"

message Bar {
  int32 baz = 1;
  string bippy = 2;
}
```
we said that `baz` and `bippy` accessors are created via `HasLens'` instances. If we add a further message into the mix such as:
```
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
import Proto.Foo        as P
import Proto.Foo'Fields as P
import Microlens ((^.))

myBar :: P.Bar
myBar = def & P.baz   .~ 42
            & P.bippy .~ "querty"

main :: IO ()
main = putStrLn $ myBar ^. P.bippy
```

The second method is by using the `OverloadedLabels` extension and importing the orphan instance of `IsLabel` for `proto-lens` `LensFn` type, giving us the use of `#` for prefixing our field accessors:
``` haskell
{-# LANGUAGE OverloadedLabels #-}

import Proto.Foo        as P
import Microlens ((^.))

myBar :: P.Bar
myBar = def & #baz   .~ 42
            & #bippy .~ "querty"

main :: IO ()
main = putStrLn $ myBar ^. #bippy
```

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

## Tutorial: Setting up a basic package
In this tutorial we are gonna visit how to set up proto-lens and all its goodness. To get all the good stuff we are going to stick with `master` branch of `proto-lens`, so there is gonna be a few extra steps involved. If you want to follow along rather than pull the repo here are the steps.

### Setup

I am going to use `stack` and `hpack` to set things up. So heeeeerrrrrreeeee weeeeee go:

#### 1. Create a new stack project

`stack new proto-playground simple-hpack && cd proto-playground`

#### 2. Setup proto

Now we have our top level project we are going to create a `proto` package inside:
`stack new proto simple-hpack`

We will setup the stuff in the project first before coming back to `proto-playground`. In our `proto/src` directory we will remove `Main.hs` and replace it with a `person.proto` file with the following contents:

```protobuf
syntax="proto3";

message Person {
    string name = 1;
    int32 age = 2;

    // Address is a message defined somewhere else.
    repeated Address addresses = 3;
}

message Address {
  string street = 1;
  string zip_code = 2;
}
```

Next we will edit the `package.yaml` file to add in the things we need:

```yaml
name: person-proto

custom-setup:
  dependencies: base, Cabal, proto-lens-protoc

extra-source-files: src/**/*.proto

library:
  dependencies:
    - base
    - proto-lens
    - proto-lens-protoc

  exposed-modules:
    - Proto.Person
    - Proto.Person'Fields
```

This will autogenerate two modules `Proto.Person` where our records will be defined and `Proto.Person'Fields` where our field accessors will be defined.

The last thing we need to do here is edit `Setup.hs` to have:

```haskell
import Data.ProtoLens.Setup

main = defaultMainGeneratingProtos "src"
```

#### 3. Setup proto-playground

Here we are going to be telling `proto-playground` how to find the proto stuff we just setup and how to grab the most up to date version of `proto-lens`. First thing to do will be to edit the `stack.yaml` file as follows:

1. Under `packages` we should have:

```yaml
packages:
- .
- proto
```

2. Under `packages` we will add a new field:

```yaml
- extra-dep: true
  location:
    git: https://github.com/google/proto-lens
    commit: master
  subdirs:
    - proto-lens
    - proto-lens-protoc
    - lens-labels
```

This last one says we will grab `proto-lens` from the github repo and use the `master` commit. It is better practice to clamp this to a certain commit in real projects.

Our final step will be to add `person-proto`, along with `default-data`, `microlens`, and `proto-lens`, to our dependencies in our main project like so:

```yaml
name:                proto-playgorund
version:             0.1.0.0
#synopsis:
#description:
homepage:            https://github.com/githubuser/proto-playground#readme
license:             BSD3
author:              Author name here
maintainer:          example@example.com
copyright:           2017 Author name here
category:            Web
extra-source-files:
- README.md

dependencies:
  - base >= 4.7 && < 5
  - person-proto
  - data-default
  - microlens
  - proto-lens

executables:
  proto-wtf:
    source-dirs:      src
    main:             Main.hs
```

Alright! Let us test this puppy out! We will make a `Main.hs` in our main project so we can create and print some stuff out!

```haskell
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Proto.Person as P
import Proto.Person'Fields as P
import Data.Default
import Data.ProtoLens (showMessage)
import Lens.Micro

person :: P.Person
person =
  def & P.name      .~ "Fintan"
      & P.age       .~ 24
      & P.addresses .~ [address]
  where
    address :: P.Address
    address =
      def & P.street  .~ "Yolo street"
          & P.zipCode .~ "D8"


main :: IO ()
main = do
  putStrLn . showMessage $ person
```

#### Troubleshooting

You may run into issues with not being able to find names and what not when trying to run `stack build`. If this is occurring then try do a `stack clean --full` and try `stack build` again.

#### Finding autogenerated files

The autogenerated files will be located in your `proto` directories `.stack-work`. If you want inspect any of the files you can open them open :)

To find the ones we create you can run:
`find . -name Person.hs`

## What do we get?

### Message and Lenses

When we build our protobuffers what is it we get? Code is autogenerated to give us two files `Person.hs` and `Person'Fields.hs` which contain our records and our field accessors respectively. This is roughly what they look like:

```haskell
-- Person.hs

module Proto.Person where
-- imports

data Address = Address{_Address'street :: !Data.Text.Text,
                       _Address'zipCode :: !Data.Text.Text,
                       _Address'_unknownFields :: !Data.ProtoLens.FieldSet}
             deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (Lens.Labels.HasLens' f Address x a, a ~ b) =>
         Lens.Labels.HasLens f Address Address x a b
-- instance definition

instance Prelude.Functor f =>
         Lens.Labels.HasLens' f Address "street" (Data.Text.Text)
         where
-- instance definition

instance Prelude.Functor f =>
         Lens.Labels.HasLens' f Address "zipCode" (Data.Text.Text)
-- instance definition

instance Data.Default.Class.Default Address where
-- instance definition

instance Data.ProtoLens.Message Address where
-- instance definition

data Person = Person{_Person'name :: !Data.Text.Text,
                     _Person'age :: !Data.Int.Int32, _Person'addresses :: ![Address],
                     _Person'_unknownFields :: !Data.ProtoLens.FieldSet}
            deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

-- same instances with different labels
```

```haskell
-- Person'Fields.hs

module Proto.Person'Fields where
-- imports

addresses ::
          forall f s t a b . (Lens.Labels.HasLens f s t "addresses" a b) =>
            Lens.Family2.LensLike f s t a b
addresses
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "addresses")

age ::
    forall f s t a b . (Lens.Labels.HasLens f s t "age" a b) =>
      Lens.Family2.LensLike f s t a b
age
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "age")

name ::
     forall f s t a b . (Lens.Labels.HasLens f s t "name" a b) =>
       Lens.Family2.LensLike f s t a b
name
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "name")

street ::
       forall f s t a b . (Lens.Labels.HasLens f s t "street" a b) =>
         Lens.Family2.LensLike f s t a b
street
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "street")

zipCode ::
        forall f s t a b . (Lens.Labels.HasLens f s t "zipCode" a b) =>
          Lens.Family2.LensLike f s t a b
zipCode
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "zipCode")
```

So we have our data types for Person and Address and they have instances for:

* HasLens
* HasLens'
  * Allows us to use lenses for interacting with our data i.e. get/set
* Default
  * Protobuffers have many default values for built in types. This allows us to default them and also forget about the pesky `*'_unknownFields` that appears in our record definition.
* Message
  * As mentioned here https://github.com/google/proto-lens/blob/master/proto-lens/src/Data/ProtoLens/Message.hs#L70-L73
    Every protocol buffer is an instance of 'Message'.
    This class enables serialization by providing reflection of all of the fields that may be used by this type.

### Building a Message

Using your favourite lens library we can create our proto data by doing the following:

```haskell
import Proto.Person as P
import Proto.Person'Fields as P

fintan :: P.Person                      -- Signal the compiler what we are creating a Person
fintan = def & P.name      .~ "Fintan"  -- set the `name` of our person
             & P.age       .~ 24        -- set the `age` of our person
             & P.addresses .~ addresses -- set the `addresses` of our person
```

## More complicated data

To show a more complicated set of data so that we can examine what gets generated as the data and lenses we can look at [order.proto](./proto/src/coffee/order.proto)
which models some way of making coffee orders at a coffee shop.

The first thing we will look at is a way of modelling a sum type of different types of Coffees. The use of individual messages over an `Enum` was for a cleaner look to the messages.

Our set of Coffee types:
```
message Americano {}
message Latte {}
message FlatWhite {}
message Cappuccino {}
message Mocha {}
```

Our actual Coffee message, which also carries the cost with it:
```
message Coffee {
  oneof coffee_type {
    Americano americano = 1;
    Latte latte= 2;
    FlatWhite flat_white = 3;
    Cappuccino cappuccino = 4;
    Mocha mocha = 5;
  }

  float cost = 6;
}

```

These two sets of proto statements will be generated as follows:

``` haskell
-- Our Coffee sum type values
data Americano = Americano{_Americano'_unknownFields ::
                           !Data.ProtoLens.FieldSet}
               deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

data Latte = Latte{_Latte'_unknownFields ::
                   !Data.ProtoLens.FieldSet}
           deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

data FlatWhite = FlatWhite{_FlatWhite'_unknownFields ::
                           !Data.ProtoLens.FieldSet}
               deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

data Cappuccino = Cappuccino{_Cappuccino'_unknownFields ::
                             !Data.ProtoLens.FieldSet}
                deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

data Mocha = Mocha{_Mocha'_unknownFields ::
                   !Data.ProtoLens.FieldSet}
           deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
```

``` haskell
-- Our Coffee type
data Coffee = Coffee{_Coffee'cost :: !Prelude.Float,
                     _Coffee'coffeeType :: !(Prelude.Maybe Coffee'CoffeeType),
                     _Coffee'_unknownFields :: !Data.ProtoLens.FieldSet}
            deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

data Coffee'CoffeeType = Coffee'Americano !Americano
                       | Coffee'Latte !Latte
                       | Coffee'FlatWhite !FlatWhite
                       | Coffee'Cappuccino !Cappuccino
                       | Coffee'Mocha !Mocha
                       deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
```

To break this down, our types `Americano`, `Latte`, etc. are essentially empty messages as we defined them as such. It gets more interesting when we look at the data for `Coffee`. We have our regular `Float` value for `_Coffee'cost`. Along with that `oneof` was generated as a `Maybe Coffee'CoffeeType`. Now, we did not specify some `Coffee'CoffeeType` but `proto-lens` generated it for us. This is the way a sum type is generated in `proto-lens` and as we can see it is our usual sum type with constructors around our original coffees `Coffee'Americano !Americano`, `Coffee'Latter !Latte`, etc. The reason it is wrapped in a `Maybe` is because everything is optional by default in `proto3`.

Now that we have looked at the Haskell representation of the data, let's look at the lenses that come with these. 

```haskell
instance Prelude.Functor f =>
         Lens.Labels.HasLens' f Coffee "maybe'coffeeType"
           (Prelude.Maybe Coffee'CoffeeType)
         where
-- definition

instance Prelude.Functor f =>
         Lens.Labels.HasLens' f Coffee "maybe'americano"
           (Prelude.Maybe Americano)
         where
-- definition

instance Prelude.Functor f =>
         Lens.Labels.HasLens' f Coffee "americano" (Americano)
         where
-- definition

instance Prelude.Functor f =>
         Lens.Labels.HasLens' f Coffee "maybe'latte" (Prelude.Maybe Latte)
         where
-- definition

instance Prelude.Functor f =>
         Lens.Labels.HasLens' f Coffee "latte" (Latte)
         where
-- definition

instance Prelude.Functor f =>
         Lens.Labels.HasLens' f Coffee "maybe'flatWhite"
           (Prelude.Maybe FlatWhite)
         where
-- definition

instance Prelude.Functor f =>
         Lens.Labels.HasLens' f Coffee "flatWhite" (FlatWhite)
         where
-- definition

instance Prelude.Functor f =>
         Lens.Labels.HasLens' f Coffee "maybe'cappuccino"
           (Prelude.Maybe Cappuccino)
         where
-- definition

instance Prelude.Functor f =>
         Lens.Labels.HasLens' f Coffee "cappuccino" (Cappuccino)
         where
-- definition

instance Prelude.Functor f =>
         Lens.Labels.HasLens' f Coffee "maybe'mocha" (Prelude.Maybe Mocha)
         where
-- definition

instance Prelude.Functor f =>
         Lens.Labels.HasLens' f Coffee "mocha" (Mocha)
         where
-- definition
```

We have a bunch of lenses (or prisms) to access the data relating to `Coffee`. We can inspect the possibility of a `Coffee'CoffeeType` value in a `Coffee` value by using `maybe'coffeeType`. If we want to focus on a certain coffee within that sum type, for example `Mocha` we can use `maybe'mocha`. The word "inspect" is key here, we are viewing the possibility of values. So we cannot use `mocha` for viewing a `Mocha` in `Coffee` because it could be something entirely different, such as a `FlatWhite`. What we can use them for is setting values! When we are defining the value we will know (and have to know) what type our `CoffeeType` will be. Thus we can do something like `def & mocha .~ def` where the second `def` is secretly our empty `Mocha` value.
