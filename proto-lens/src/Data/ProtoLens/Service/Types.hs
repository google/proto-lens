{-# LANGUAGE DataKinds             #-}
{-# LANGUAGE FlexibleContexts      #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE GADTs                 #-}
{-# LANGUAGE KindSignatures        #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE RankNTypes            #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE TypeOperators         #-}

module Data.ProtoLens.Service.Types where

import Data.Proxy (Proxy)
import GHC.TypeLits
import Data.ByteString (ByteString)
import qualified Data.Map as M
import Data.ProtoLens.Message (Message)

-- | Reifies the fact that there is a 'HasMethod' instance for every symbol
-- claimed by the 'ServiceMethods' associated type.
class HasAllMethods s (ms :: [Symbol])
instance HasAllMethods s '[]
instance (HasAllMethods s ms, HasMethod s m) => HasAllMethods s (m ': ms)


class HasAllMethods s (ServiceMethods s) => Service s where
  type ServiceName s    :: Symbol
  type ServiceMethods s :: [Symbol]


class ( KnownSymbol m
      , Message (MethodInput s m)
      , Message (MethodOutput s m)
      ) => HasMethod s (m :: Symbol) where
  methodPath :: Proxy s -> Proxy m -> ByteString
  type MethodInput       s m :: *
  type MethodOutput      s m :: *
  type IsServerStreaming s m :: Bool
  type IsClientStreaming s m :: Bool

