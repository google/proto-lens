-- | Functions for interacting with message descriptors.
module Data.ProtoLens.Descriptor
    ( DescriptorProto
    , messageDescriptor
    ) where

import Data.ProtoLens
import Data.Proxy (Proxy)
import Proto.Google.Protobuf.Descriptor

-- | The protocol buffer message descriptor for this type.
messageDescriptor :: Message a => Proxy a -> DescriptorProto
-- Note: technically decodeMessageOrDie can fail.  However, it's
-- unlikely in practice since we encode the message ourselves
-- in proto-lens-protoc; and furthermore proto decoding is robust
-- to unknown/missing fields.
messageDescriptor = decodeMessageOrDie . packedMessageDescriptor
