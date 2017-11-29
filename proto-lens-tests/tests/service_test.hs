{-# LANGUAGE DataKinds           #-}
{-# LANGUAGE OverloadedStrings   #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies        #-}
{-# OPTIONS_GHC -fno-warn-redundant-constraints #-}

module Main (main) where

import Data.Proxy (Proxy (..))
import Test.Framework.Providers.HUnit (testCase)
import Proto.Service
import Data.ProtoLens.Service.Types
import Data.ProtoLens.TestUtil (testMain)


-- This module will fail to compile due to @-fwarn-overlapping-patterns@ and
-- @-Werror@ if any of the constraints on the definitions below is incorrect.
main :: IO ()
main = testMain
    [ testCase "module compiles" $ return ()
    ]


_serviceMetadataTest
    :: ( s ~ TestService
       , Service s
       , ServicePackage s ~ "test.service"
       -- proto-lens generates this list in alphabetical order.
       , ServiceMethods s ~ '[ "biDiStreaming"
                             , "clientStreaming"
                             , "normal"
                             , "revMessages"
                             , "serverStreaming"
                             ]
       ) => Proxy m
_serviceMetadataTest = Proxy


_normalMethodMetadataTest
    :: ( s ~ TestService
       , m ~ "normal"
       , HasMethod s m
       , MethodInput  s m ~ Foo
       , MethodOutput s m ~ Bar
       , MethodStreamingType s m ~ 'NonStreaming
       ) => Proxy m
_normalMethodMetadataTest = Proxy


_clientStreamingMethodMetadataTest
    :: ( s ~ TestService
       , m ~ "clientStreaming"
       , HasMethod s m
       , MethodInput  s m ~ Foo
       , MethodOutput s m ~ Bar
       , MethodStreamingType s m ~ 'ClientStreaming
       ) => Proxy m
_clientStreamingMethodMetadataTest = Proxy


_serverStreamingMethodMetadataTest
    :: ( s ~ TestService
       , m ~ "serverStreaming"
       , HasMethod s m
       , MethodInput  s m ~ Foo
       , MethodOutput s m ~ Bar
       , MethodStreamingType s m ~ 'ServerStreaming
       ) => Proxy m
_serverStreamingMethodMetadataTest = Proxy


_bidiStreamingMethodMetadataTest
    :: ( s ~ TestService
       , m ~ "bidiStreaming"
       , HasMethod s m
       , MethodInput  s m ~ Foo
       , MethodOutput s m ~ Bar
       , MethodStreamingType s m ~ 'BiDiStreaming
       ) => Proxy m
_bidiStreamingMethodMetadataTest = Proxy


_revMessagesMetadataTest
    :: ( s ~ TestService
       , m ~ "revMessages"
       , HasMethod s m
       , MethodInput  s m ~ Bar
       , MethodOutput s m ~ Foo
       , MethodStreamingType s m ~ 'NonStreaming
       ) => Proxy m
_revMessagesMetadataTest = Proxy

