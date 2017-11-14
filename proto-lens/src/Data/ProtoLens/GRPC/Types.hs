{-# LANGUAGE GADTs #-}

module Data.ProtoLens.GRPC.Types where

type ServerHandler       a b = a                                 -> IO b
type ServerReaderHandler a b =      IO (Maybe a)                 -> IO b
type ServerWriterHandler a b = a                 -> (b -> IO ()) -> IO ()
type ServerRWHandler     a b = a -> IO (Maybe a) -> (b -> IO ()) -> IO ()

data SomeHandler where
  NormalHandler :: ServerHandler a b       -> SomeHandler
  ReaderHandler :: ServerReaderHandler a b -> SomeHandler
  WriterHandler :: ServerWriterHandler a b -> SomeHandler
  BiDiHandler   :: ServerRWHandler a b     -> SomeHandler

class Service s where
  packHandlers :: s -> [SomeHandler]

