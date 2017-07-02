{-# LANGUAGE OverloadedStrings #-}
module Main where

import Proto.Oneof
import Data.ProtoLens
import Lens.Family2 ((&), (.~))
import qualified Data.ByteString.Char8 as C
import Data.ByteString.Builder (Builder, byteString)

import Data.ProtoLens.TestUtil

defFoo :: Foo
defFoo = def

taggedValue :: String -> Builder
taggedValue = tagged 2 . Lengthy . byteString . C.pack


main :: IO ()
main = testMain
    [ serializeTo "default" defFoo "" mempty
    , serializeTo "to first oneof field"
        (defFoo & bippy .~ "querty" & baz .~ 42)
        "baz: 42"
        (tagged 1 $ VarInt 42)
    , serializeTo "to second oneof field"
        (defFoo & baz .~ 42 & bippy .~ "querty")
        "bippy: \"querty\""
        (tagged 2 $ Lengthy "querty")
    -- Check that we can tolerate missing keys and values.
    , deserializeFrom "from first oneof field"
        (Just $ defFoo & baz .~ 42)
        $ tagged 1 $ VarInt $ 42
    , deserializeFrom "from second oneof field"
        (Just $ defFoo & bippy .~ "querty")
        $ tagged 2 $ Lengthy "querty"
    ]
