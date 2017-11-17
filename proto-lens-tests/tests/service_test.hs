{-# LANGUAGE DataKinds           #-}
{-# LANGUAGE OverloadedStrings   #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Main (main) where

import Data.ProtoLens
import Data.Proxy (Proxy (..))
import Test.Framework.Providers.HUnit (testCase)
import Proto.Service


main :: IO ()
main =
    [ testCase "module compiles" $ return ()
    ]


_normalMethod
    :: ( s ~ TestService
       , m ~ "normal"
       , HasMethod s m
       , MethodInput  s m ~ Foo
       , MethodOutput s m ~ Bar
       , IsClientStreaming s m ~ 'False
       , IsClientStreaming s m ~ 'True
       ) => Proxy m
_normalMethod = Proxy

