# Coffee Order Example

In this example we will go through a more complicated data structure compared to our [Person Example](../person/README.md).

## Table of Contents

1. [Modeling Coffee Orders](#modeling-coffee-orders)
  1. [Coffee Types](#coffee-types)
  2. [Coffee](#coffee)
  3. [Generated Code](#generated-code)
    1. [Generated Records and Sum Types](#generated-records-and-sum-types)
    2. [Generated Accessors and Prisms](#generated-accessors-and-prisms)
2. [Full Code Example](#full-code-example)
3. [Did We Miss Something?](#did-we-miss-something)

## Modeling Coffee Orders

We will examine what gets generated as the data and lenses for the definitions in [order.proto](./proto/src/coffee/order.proto)
which models some way of making coffee orders at a coffee shop.

### Coffee Types
The first thing we will look at is a way of modelling a sum type of different types of Coffees. The use of individual messages over an `Enum` was for a cleaner look to the messages.

Our set of Coffee types:
``` protobuf
message Americano {}
message Latte {}
message FlatWhite {}
message Cappuccino {}
message Mocha {}
```

### Coffee
Our actual Coffee message will be a `oneof` field containing our different coffees and also carries the cost with it:
``` protobuf
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

### Generated Code
These two sets of proto statements will be generated as follows:

#### Generated Records and Sum Types
``` haskell
-- Our Coffee sum type values
data Americano = Americano
  { _Americano'_unknownFields :: !Data.ProtoLens.FieldSet }
  deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

data Latte = Latte
  { _Latte'_unknownFields :: !Data.ProtoLens.FieldSet }
  deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

data FlatWhite = FlatWhite
  { _FlatWhite'_unknownFields :: !Data.ProtoLens.FieldSet }
  deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

data Cappuccino = Cappuccino
  { _Cappuccino'_unknownFields :: !Data.ProtoLens.FieldSet }
  deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

data Mocha = Mocha
  { _Mocha'_unknownFields :: !Data.ProtoLens.FieldSet }
  deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
```

``` haskell
-- Our Coffee type
data Coffee = Coffee
  { _Coffee'cost :: !Prelude.Float
  , _Coffee'coffeeType :: !(Prelude.Maybe Coffee'CoffeeType)
  , _Coffee'_unknownFields :: !Data.ProtoLens.FieldSet
  }
  deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

data Coffee'CoffeeType = Coffee'Americano !Americano
                       | Coffee'Latte !Latte
                       | Coffee'FlatWhite !FlatWhite
                       | Coffee'Cappuccino !Cappuccino
                       | Coffee'Mocha !Mocha
                       deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)
```

To break this down, our types `Americano`, `Latte`, etc. are essentially empty messages as we defined them as such. It gets more interesting when we look at the data for `Coffee`. We have our regular `Float` value for `_Coffee'cost`. Along with that, the `oneof` was generated as a `Maybe Coffee'CoffeeType`. Now, we did not specify some `Coffee'CoffeeType` but `proto-lens` generated it for us. This is the way a sum type is generated in `proto-lens` and as we can see it is our usual sum type with constructors around our original coffees `Coffee'Americano !Americano`, `Coffee'Latter !Latte`, etc. The reason it is wrapped in a `Maybe` is because everything is optional by default in `proto3`.

#### Generated Accessors and Prisms

Now that we have looked at the Haskell representation of the data, let's look at the lenses that come with these.

``` haskell
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

We have a bunch of lenses (or prisms) to access the data relating to `Coffee`. We can inspect the possibility of a `Coffee'CoffeeType` value in a `Coffee` value by using `maybe'coffeeType`. If we want to focus on a certain coffee within that sum type, for example `Mocha` we can use `maybe'mocha`. The word "inspect" is key here, we are viewing the possibility of values. So we if we used `mocha` for viewing a `Mocha` in `Coffee` we would end up with unknown data because it could be something entirely different, such as a `FlatWhite`.<br>

What we can use them for is setting values! When we are defining the value we will know (and have to know) what type our `CoffeeType` will be. Thus we can do the following, `def & mocha .~ def` where the second `def` is secretly our empty `Mocha` value.<br>

As of commit `87efe00a0fa16b657493ba4043abd014d5c04cd3`, `Prism'` functions are also available for use on `Coffee'Type` sum. The `Prism'` functions are of of the naming convention `_Coffee'Americano`, `_Coffee'Latte`, etc. There is more information on `Prism'`s [here](https://github.com/FintanH/proto-lens/tree/docs/codelab/proto-lens-tutorial#oneof-generation)

## Full Code Example

We can find a full example using the different features [here](https://github.com/FintanH/proto-lens/blob/docs/codelab/proto-lens-tutorial/coffee-order/src/Main.hs).

## Did We Miss Something?

If you noticed anything that is missing or wrong please file an issue or make a PR :)
