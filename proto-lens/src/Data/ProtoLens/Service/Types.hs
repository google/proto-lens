{-# LANGUAGE DataKinds      #-}
{-# LANGUAGE GADTs          #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE RankNTypes     #-}
{-# LANGUAGE TypeFamilies   #-}

module Data.ProtoLens.Service.Types where

import Data.ByteString (ByteString)
import qualified Data.Map as M
import Data.ProtoLens.Message (Message)


type ClientHandler       a b =           a                                        -> IO b
type ClientWriterHandler a b =           ((a -> IO ())                  -> IO ()) -> IO b
type ClientReaderHandler a b = forall r. a             -> (IO (Maybe b) -> IO r ) -> IO r
type ClientRWHandler     a b = forall r. ((a -> IO ()) ->  IO (Maybe b) -> IO r ) -> IO r

type ServerHandler       a b = a                            -> IO b
type ServerWriterHandler a b = a            -> (b -> IO ()) -> IO ()
type ServerReaderHandler a b = IO (Maybe a)                 -> IO b
type ServerRWHandler     a b = IO (Maybe a) -> (b -> IO ()) -> IO ()

type MethodName = ByteString

data SomeHandler where
  NormalHandler :: (Message a, Message b) => ServerHandler       a b -> SomeHandler
  ReaderHandler :: (Message a, Message b) => ServerReaderHandler a b -> SomeHandler
  WriterHandler :: (Message a, Message b) => ServerWriterHandler a b -> SomeHandler
  BiDiHandler   :: (Message a, Message b) => ServerRWHandler     a b -> SomeHandler

class Service s where
  packHandlers :: s -> M.Map MethodName SomeHandler

