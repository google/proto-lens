{- This file was auto-generated from google/protobuf/api.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Google.Protobuf.Api_Fields where
import qualified Data.ProtoLens.Runtime.Prelude as Prelude
import qualified Data.ProtoLens.Runtime.Data.Int as Data.Int
import qualified Data.ProtoLens.Runtime.Data.Monoid as Data.Monoid
import qualified Data.ProtoLens.Runtime.Data.Word as Data.Word
import qualified Data.ProtoLens.Runtime.Data.ProtoLens as Data.ProtoLens
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Bytes as Data.ProtoLens.Encoding.Bytes
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Growing as Data.ProtoLens.Encoding.Growing
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Parser.Unsafe as Data.ProtoLens.Encoding.Parser.Unsafe
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Wire as Data.ProtoLens.Encoding.Wire
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Field as Data.ProtoLens.Field
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Message.Enum as Data.ProtoLens.Message.Enum
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Service.Types as Data.ProtoLens.Service.Types
import qualified Data.ProtoLens.Runtime.Lens.Family2 as Lens.Family2
import qualified Data.ProtoLens.Runtime.Lens.Family2.Unchecked as Lens.Family2.Unchecked
import qualified Data.ProtoLens.Runtime.Data.Text as Data.Text
import qualified Data.ProtoLens.Runtime.Data.Map as Data.Map
import qualified Data.ProtoLens.Runtime.Data.ByteString as Data.ByteString
import qualified Data.ProtoLens.Runtime.Data.ByteString.Char8 as Data.ByteString.Char8
import qualified Data.ProtoLens.Runtime.Data.Text.Encoding as Data.Text.Encoding
import qualified Data.ProtoLens.Runtime.Data.Vector as Data.Vector
import qualified Data.ProtoLens.Runtime.Data.Vector.Generic as Data.Vector.Generic
import qualified Data.ProtoLens.Runtime.Data.Vector.Unboxed as Data.Vector.Unboxed
import qualified Data.ProtoLens.Runtime.Text.Read as Text.Read
import qualified Proto.Google.Protobuf.SourceContext
import qualified Proto.Google.Protobuf.Type
maybe'sourceContext ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'sourceContext" a) =>
  Lens.Family2.LensLike' f s a
maybe'sourceContext
  = Data.ProtoLens.Field.field @"maybe'sourceContext"
methods ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "methods" a) =>
  Lens.Family2.LensLike' f s a
methods = Data.ProtoLens.Field.field @"methods"
mixins ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "mixins" a) =>
  Lens.Family2.LensLike' f s a
mixins = Data.ProtoLens.Field.field @"mixins"
name ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "name" a) =>
  Lens.Family2.LensLike' f s a
name = Data.ProtoLens.Field.field @"name"
options ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "options" a) =>
  Lens.Family2.LensLike' f s a
options = Data.ProtoLens.Field.field @"options"
requestStreaming ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "requestStreaming" a) =>
  Lens.Family2.LensLike' f s a
requestStreaming = Data.ProtoLens.Field.field @"requestStreaming"
requestTypeUrl ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "requestTypeUrl" a) =>
  Lens.Family2.LensLike' f s a
requestTypeUrl = Data.ProtoLens.Field.field @"requestTypeUrl"
responseStreaming ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "responseStreaming" a) =>
  Lens.Family2.LensLike' f s a
responseStreaming = Data.ProtoLens.Field.field @"responseStreaming"
responseTypeUrl ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "responseTypeUrl" a) =>
  Lens.Family2.LensLike' f s a
responseTypeUrl = Data.ProtoLens.Field.field @"responseTypeUrl"
root ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "root" a) =>
  Lens.Family2.LensLike' f s a
root = Data.ProtoLens.Field.field @"root"
sourceContext ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "sourceContext" a) =>
  Lens.Family2.LensLike' f s a
sourceContext = Data.ProtoLens.Field.field @"sourceContext"
syntax ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "syntax" a) =>
  Lens.Family2.LensLike' f s a
syntax = Data.ProtoLens.Field.field @"syntax"
vec'methods ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'methods" a) =>
  Lens.Family2.LensLike' f s a
vec'methods = Data.ProtoLens.Field.field @"vec'methods"
vec'mixins ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'mixins" a) =>
  Lens.Family2.LensLike' f s a
vec'mixins = Data.ProtoLens.Field.field @"vec'mixins"
vec'options ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'options" a) =>
  Lens.Family2.LensLike' f s a
vec'options = Data.ProtoLens.Field.field @"vec'options"
version ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "version" a) =>
  Lens.Family2.LensLike' f s a
version = Data.ProtoLens.Field.field @"version"