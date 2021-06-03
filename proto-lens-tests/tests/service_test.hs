{-# LANGUAGE DataKinds           #-}
{-# LANGUAGE OverloadedLabels    #-}
{-# LANGUAGE OverloadedStrings   #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies        #-}
{-# LANGUAGE TypeApplications    #-}
{-# OPTIONS_GHC -fno-warn-redundant-constraints #-}

module Main (main) where

import Control.Exception (evaluate)
import Control.Monad (void)
import Data.Proxy (Proxy (..))
import Lens.Family2 (view, toListOf)
import Test.Tasty.HUnit (testCase, (@=?))
import Proto.Service
import Data.ProtoLens.Descriptor
import Data.ProtoLens.Labels ()
import Data.ProtoLens.Service.Types
import Data.ProtoLens.TestUtil (TestTree, testMain)


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
    , testServiceDescriptor
    ]


serviceMetadataTest
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

testServiceDescriptor :: TestTree
testServiceDescriptor = testCase "testServiceDescriptor" $ do
  "TestService" @=? view #name d
  ["Normal", "RevMessages", "ClientStreaming", "ServerStreaming", "BiDiStreaming"] @=?
    toListOf (#method . traverse . #name) d
  where
    d = serviceDescriptor @TestService

