{-# LANGUAGE DataKinds           #-}
{-# LANGUAGE OverloadedStrings   #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies        #-}
{-# OPTIONS_GHC -fno-warn-redundant-constraints #-}

module Main (main) where

import Control.Exception (evaluate)
import Control.Monad (void)
import Data.ProtoLens (defMessage)
import Data.Proxy (Proxy (..))
import Lens.Family2 (set)
import Test.Framework (testGroup, Test)
import Test.Framework.Providers.HUnit (testCase)
import Test.HUnit ((@=?))
import Proto.Service
import Data.ProtoLens.Service.Types
import Data.ProtoLens.TestUtil (testMain)
import Proto.Google.Protobuf.Descriptor_Fields (deprecated)


main :: IO ()
main = testMain
    [ testCase "module compiles" $ do
        -- Use these variables in a monomorphic context to verify that
        -- their contexts are all correct.
        void $ evaluate serviceMetadataTest
        void $ evaluate normalMethodMetadataTest
        void $ evaluate clientStreamingMethodMetadataTest
        void $ evaluate serverStreamingMethodMetadataTest
        void $ evaluate bidiStreamingMethodMetadataTest
        void $ evaluate revMessagesMetadataTest
    , testMethodOption
    ]


serviceMetadataTest
    :: ( s ~ TestService
       , Service s
       , ServicePackage s ~ "test.service"
       -- proto-lens generates this list in alphabetical order.
       , ServiceMethods s ~ '[ "biDiStreaming"
                             , "clientStreaming"
                             , "deprecated"
                             , "normal"
                             , "revMessages"
                             , "serverStreaming"
                             ]
       ) => Proxy m
serviceMetadataTest = Proxy


normalMethodMetadataTest
    :: ( s ~ TestService
       , m ~ "normal"
       , HasMethod s m
       , MethodInput  s m ~ Foo
       , MethodOutput s m ~ Bar
       , MethodStreamingType s m ~ 'NonStreaming
       ) => Proxy m
normalMethodMetadataTest = Proxy


clientStreamingMethodMetadataTest
    :: ( s ~ TestService
       , m ~ "clientStreaming"
       , HasMethod s m
       , MethodInput  s m ~ Foo
       , MethodOutput s m ~ Bar
       , MethodStreamingType s m ~ 'ClientStreaming
       ) => Proxy m
clientStreamingMethodMetadataTest = Proxy


serverStreamingMethodMetadataTest
    :: ( s ~ TestService
       , m ~ "serverStreaming"
       , HasMethod s m
       , MethodInput  s m ~ Foo
       , MethodOutput s m ~ Bar
       , MethodStreamingType s m ~ 'ServerStreaming
       ) => Proxy m
serverStreamingMethodMetadataTest = Proxy


bidiStreamingMethodMetadataTest
    :: ( s ~ TestService
       , m ~ "biDiStreaming"
       , HasMethod s m
       , MethodInput  s m ~ Foo
       , MethodOutput s m ~ Bar
       , MethodStreamingType s m ~ 'BiDiStreaming
       ) => Proxy m
bidiStreamingMethodMetadataTest = Proxy


revMessagesMetadataTest
    :: ( s ~ TestService
       , m ~ "revMessages"
       , HasMethod s m
       , MethodInput  s m ~ Bar
       , MethodOutput s m ~ Foo
       , MethodStreamingType s m ~ 'NonStreaming
       ) => Proxy m
revMessagesMetadataTest = Proxy

testMethodOption :: Test
testMethodOption = testGroup "methodOption"
    [ testCase "default" $
        defMessage
            @=? methodOptions TestService (Proxy :: Proxy "normal")
    , testCase "deprecated" $
        set deprecated True defMessage
            @=? methodOptions TestService (Proxy :: Proxy "deprecated")
    ]

