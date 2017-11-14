{-# LANGUAGE GADTs #-}

module Data.ProtoLens.GRPC.Types where

import Data.ProtoLens.Message (Message)


type ServerHandler       a b = a                                 -> IO b
type ServerReaderHandler a b =      IO (Maybe a)                 -> IO b
type ServerWriterHandler a b = a                 -> (b -> IO ()) -> IO ()
type ServerRWHandler     a b = a -> IO (Maybe a) -> (b -> IO ()) -> IO ()

data SomeHandler where
  NormalHandler :: (Message a, Message b) => ServerHandler       a b -> SomeHandler
  ReaderHandler :: (Message a, Message b) => ServerReaderHandler a b -> SomeHandler
  WriterHandler :: (Message a, Message b) => ServerWriterHandler a b -> SomeHandler
  BiDiHandler   :: (Message a, Message b) => ServerRWHandler     a b -> SomeHandler

class Service s where
  packHandlers :: s -> [SomeHandler]

