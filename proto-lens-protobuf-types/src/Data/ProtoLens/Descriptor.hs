{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}
-- | Functions for interacting with message descriptors.
module Data.ProtoLens.Descriptor
    ( DescriptorProto
    , messageDescriptor
    , serviceDescriptor
    , fileDescriptor
    ) where

import Data.ProtoLens
import Data.ProtoLens.Service.Types
import Data.Proxy (Proxy(..))
import Proto.Google.Protobuf.Descriptor

-- | The protocol buffer message descriptor for a given type.
--
-- This function should be used with @TypeApplications@, e.g.:
--
-- > messageDescriptor @SomeProtoType
messageDescriptor :: forall a . Message a => DescriptorProto
-- Note: technically decodeMessageOrDie can fail.  However, it's
-- unlikely in practice since we encode the message ourselves
-- in proto-lens-protoc; and furthermore proto decoding is robust
-- to unknown/missing fields.
messageDescriptor = decodeMessageOrDie $ packedMessageDescriptor (Proxy @a)

-- | The protocol buffer service descriptor for a given service.
--
-- This function should be used with @TypeApplications@, e.g.:
--
-- > serviceDescriptor @SomeService
serviceDescriptor :: forall a . Service a => ServiceDescriptorProto
serviceDescriptor = decodeMessageOrDie $ packedServiceDescriptor (Proxy @a)

-- | The protocol buffer file descriptor containing a given type.
--
-- This function should be used with @TypeApplications@, e.g.:
--
-- > fileDescriptor @SomeProtoType
fileDescriptor :: forall a . Message a => FileDescriptorProto
fileDescriptor = decodeMessageOrDie $ packedFileDescriptor (Proxy @a)
