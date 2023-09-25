{- This file was auto-generated from google/protobuf/type.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Google.Protobuf.Type_Fields where
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
import qualified Proto.Google.Protobuf.Any
import qualified Proto.Google.Protobuf.SourceContext
cardinality ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "cardinality" a) =>
  Lens.Family2.LensLike' f s a
cardinality = Data.ProtoLens.Field.field @"cardinality"
defaultValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "defaultValue" a) =>
  Lens.Family2.LensLike' f s a
defaultValue = Data.ProtoLens.Field.field @"defaultValue"
enumvalue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "enumvalue" a) =>
  Lens.Family2.LensLike' f s a
enumvalue = Data.ProtoLens.Field.field @"enumvalue"
fields ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "fields" a) =>
  Lens.Family2.LensLike' f s a
fields = Data.ProtoLens.Field.field @"fields"
jsonName ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "jsonName" a) =>
  Lens.Family2.LensLike' f s a
jsonName = Data.ProtoLens.Field.field @"jsonName"
kind ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "kind" a) =>
  Lens.Family2.LensLike' f s a
kind = Data.ProtoLens.Field.field @"kind"
maybe'sourceContext ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'sourceContext" a) =>
  Lens.Family2.LensLike' f s a
maybe'sourceContext
  = Data.ProtoLens.Field.field @"maybe'sourceContext"
maybe'value ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'value" a) =>
  Lens.Family2.LensLike' f s a
maybe'value = Data.ProtoLens.Field.field @"maybe'value"
name ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "name" a) =>
  Lens.Family2.LensLike' f s a
name = Data.ProtoLens.Field.field @"name"
number ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "number" a) =>
  Lens.Family2.LensLike' f s a
number = Data.ProtoLens.Field.field @"number"
oneofIndex ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "oneofIndex" a) =>
  Lens.Family2.LensLike' f s a
oneofIndex = Data.ProtoLens.Field.field @"oneofIndex"
oneofs ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "oneofs" a) =>
  Lens.Family2.LensLike' f s a
oneofs = Data.ProtoLens.Field.field @"oneofs"
options ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "options" a) =>
  Lens.Family2.LensLike' f s a
options = Data.ProtoLens.Field.field @"options"
packed ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "packed" a) =>
  Lens.Family2.LensLike' f s a
packed = Data.ProtoLens.Field.field @"packed"
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
typeUrl ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "typeUrl" a) =>
  Lens.Family2.LensLike' f s a
typeUrl = Data.ProtoLens.Field.field @"typeUrl"
value ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "value" a) =>
  Lens.Family2.LensLike' f s a
value = Data.ProtoLens.Field.field @"value"
vec'enumvalue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'enumvalue" a) =>
  Lens.Family2.LensLike' f s a
vec'enumvalue = Data.ProtoLens.Field.field @"vec'enumvalue"
vec'fields ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'fields" a) =>
  Lens.Family2.LensLike' f s a
vec'fields = Data.ProtoLens.Field.field @"vec'fields"
vec'oneofs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'oneofs" a) =>
  Lens.Family2.LensLike' f s a
vec'oneofs = Data.ProtoLens.Field.field @"vec'oneofs"
vec'options ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'options" a) =>
  Lens.Family2.LensLike' f s a
vec'options = Data.ProtoLens.Field.field @"vec'options"