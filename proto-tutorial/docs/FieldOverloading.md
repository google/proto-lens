# Field Overloading

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
