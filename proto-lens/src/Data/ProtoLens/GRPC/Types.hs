module Data.ProtoLens.GRPC.Types where

type ServerHandler       a b = a -> IO b
type ServerReaderHandler a b = IO (Maybe a) -> IO b
type ServerWriterHandler a b = a -> (b -> IO ()) -> IO ()
type ServerRWHandler     a b = a -> IO ()

