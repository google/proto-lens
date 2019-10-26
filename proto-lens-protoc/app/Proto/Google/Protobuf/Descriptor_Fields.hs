{- This file was auto-generated from google/protobuf/descriptor.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Google.Protobuf.Descriptor_Fields where
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
aggregateValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "aggregateValue" a) =>
  Lens.Family2.LensLike' f s a
aggregateValue = Data.ProtoLens.Field.field @"aggregateValue"
allowAlias ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "allowAlias" a) =>
  Lens.Family2.LensLike' f s a
allowAlias = Data.ProtoLens.Field.field @"allowAlias"
annotation ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "annotation" a) =>
  Lens.Family2.LensLike' f s a
annotation = Data.ProtoLens.Field.field @"annotation"
begin ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "begin" a) =>
  Lens.Family2.LensLike' f s a
begin = Data.ProtoLens.Field.field @"begin"
ccEnableArenas ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "ccEnableArenas" a) =>
  Lens.Family2.LensLike' f s a
ccEnableArenas = Data.ProtoLens.Field.field @"ccEnableArenas"
ccGenericServices ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "ccGenericServices" a) =>
  Lens.Family2.LensLike' f s a
ccGenericServices = Data.ProtoLens.Field.field @"ccGenericServices"
clientStreaming ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "clientStreaming" a) =>
  Lens.Family2.LensLike' f s a
clientStreaming = Data.ProtoLens.Field.field @"clientStreaming"
csharpNamespace ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "csharpNamespace" a) =>
  Lens.Family2.LensLike' f s a
csharpNamespace = Data.ProtoLens.Field.field @"csharpNamespace"
ctype ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "ctype" a) =>
  Lens.Family2.LensLike' f s a
ctype = Data.ProtoLens.Field.field @"ctype"
defaultValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "defaultValue" a) =>
  Lens.Family2.LensLike' f s a
defaultValue = Data.ProtoLens.Field.field @"defaultValue"
dependency ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "dependency" a) =>
  Lens.Family2.LensLike' f s a
dependency = Data.ProtoLens.Field.field @"dependency"
deprecated ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "deprecated" a) =>
  Lens.Family2.LensLike' f s a
deprecated = Data.ProtoLens.Field.field @"deprecated"
doubleValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "doubleValue" a) =>
  Lens.Family2.LensLike' f s a
doubleValue = Data.ProtoLens.Field.field @"doubleValue"
end ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "end" a) =>
  Lens.Family2.LensLike' f s a
end = Data.ProtoLens.Field.field @"end"
enumType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "enumType" a) =>
  Lens.Family2.LensLike' f s a
enumType = Data.ProtoLens.Field.field @"enumType"
extendee ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "extendee" a) =>
  Lens.Family2.LensLike' f s a
extendee = Data.ProtoLens.Field.field @"extendee"
extension ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "extension" a) =>
  Lens.Family2.LensLike' f s a
extension = Data.ProtoLens.Field.field @"extension"
extensionRange ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "extensionRange" a) =>
  Lens.Family2.LensLike' f s a
extensionRange = Data.ProtoLens.Field.field @"extensionRange"
field ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "field" a) =>
  Lens.Family2.LensLike' f s a
field = Data.ProtoLens.Field.field @"field"
file ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "file" a) =>
  Lens.Family2.LensLike' f s a
file = Data.ProtoLens.Field.field @"file"
goPackage ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "goPackage" a) =>
  Lens.Family2.LensLike' f s a
goPackage = Data.ProtoLens.Field.field @"goPackage"
idempotencyLevel ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "idempotencyLevel" a) =>
  Lens.Family2.LensLike' f s a
idempotencyLevel = Data.ProtoLens.Field.field @"idempotencyLevel"
identifierValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "identifierValue" a) =>
  Lens.Family2.LensLike' f s a
identifierValue = Data.ProtoLens.Field.field @"identifierValue"
inputType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "inputType" a) =>
  Lens.Family2.LensLike' f s a
inputType = Data.ProtoLens.Field.field @"inputType"
isExtension ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "isExtension" a) =>
  Lens.Family2.LensLike' f s a
isExtension = Data.ProtoLens.Field.field @"isExtension"
javaGenerateEqualsAndHash ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "javaGenerateEqualsAndHash" a) =>
  Lens.Family2.LensLike' f s a
javaGenerateEqualsAndHash
  = Data.ProtoLens.Field.field @"javaGenerateEqualsAndHash"
javaGenericServices ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "javaGenericServices" a) =>
  Lens.Family2.LensLike' f s a
javaGenericServices
  = Data.ProtoLens.Field.field @"javaGenericServices"
javaMultipleFiles ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "javaMultipleFiles" a) =>
  Lens.Family2.LensLike' f s a
javaMultipleFiles = Data.ProtoLens.Field.field @"javaMultipleFiles"
javaOuterClassname ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "javaOuterClassname" a) =>
  Lens.Family2.LensLike' f s a
javaOuterClassname
  = Data.ProtoLens.Field.field @"javaOuterClassname"
javaPackage ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "javaPackage" a) =>
  Lens.Family2.LensLike' f s a
javaPackage = Data.ProtoLens.Field.field @"javaPackage"
javaStringCheckUtf8 ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "javaStringCheckUtf8" a) =>
  Lens.Family2.LensLike' f s a
javaStringCheckUtf8
  = Data.ProtoLens.Field.field @"javaStringCheckUtf8"
jsonName ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "jsonName" a) =>
  Lens.Family2.LensLike' f s a
jsonName = Data.ProtoLens.Field.field @"jsonName"
jstype ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "jstype" a) =>
  Lens.Family2.LensLike' f s a
jstype = Data.ProtoLens.Field.field @"jstype"
label ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "label" a) =>
  Lens.Family2.LensLike' f s a
label = Data.ProtoLens.Field.field @"label"
lazy ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "lazy" a) =>
  Lens.Family2.LensLike' f s a
lazy = Data.ProtoLens.Field.field @"lazy"
leadingComments ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "leadingComments" a) =>
  Lens.Family2.LensLike' f s a
leadingComments = Data.ProtoLens.Field.field @"leadingComments"
leadingDetachedComments ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "leadingDetachedComments" a) =>
  Lens.Family2.LensLike' f s a
leadingDetachedComments
  = Data.ProtoLens.Field.field @"leadingDetachedComments"
location ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "location" a) =>
  Lens.Family2.LensLike' f s a
location = Data.ProtoLens.Field.field @"location"
mapEntry ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "mapEntry" a) =>
  Lens.Family2.LensLike' f s a
mapEntry = Data.ProtoLens.Field.field @"mapEntry"
maybe'aggregateValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'aggregateValue" a) =>
  Lens.Family2.LensLike' f s a
maybe'aggregateValue
  = Data.ProtoLens.Field.field @"maybe'aggregateValue"
maybe'allowAlias ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'allowAlias" a) =>
  Lens.Family2.LensLike' f s a
maybe'allowAlias = Data.ProtoLens.Field.field @"maybe'allowAlias"
maybe'begin ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'begin" a) =>
  Lens.Family2.LensLike' f s a
maybe'begin = Data.ProtoLens.Field.field @"maybe'begin"
maybe'ccEnableArenas ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'ccEnableArenas" a) =>
  Lens.Family2.LensLike' f s a
maybe'ccEnableArenas
  = Data.ProtoLens.Field.field @"maybe'ccEnableArenas"
maybe'ccGenericServices ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'ccGenericServices" a) =>
  Lens.Family2.LensLike' f s a
maybe'ccGenericServices
  = Data.ProtoLens.Field.field @"maybe'ccGenericServices"
maybe'clientStreaming ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'clientStreaming" a) =>
  Lens.Family2.LensLike' f s a
maybe'clientStreaming
  = Data.ProtoLens.Field.field @"maybe'clientStreaming"
maybe'csharpNamespace ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'csharpNamespace" a) =>
  Lens.Family2.LensLike' f s a
maybe'csharpNamespace
  = Data.ProtoLens.Field.field @"maybe'csharpNamespace"
maybe'ctype ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'ctype" a) =>
  Lens.Family2.LensLike' f s a
maybe'ctype = Data.ProtoLens.Field.field @"maybe'ctype"
maybe'defaultValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'defaultValue" a) =>
  Lens.Family2.LensLike' f s a
maybe'defaultValue
  = Data.ProtoLens.Field.field @"maybe'defaultValue"
maybe'deprecated ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'deprecated" a) =>
  Lens.Family2.LensLike' f s a
maybe'deprecated = Data.ProtoLens.Field.field @"maybe'deprecated"
maybe'doubleValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'doubleValue" a) =>
  Lens.Family2.LensLike' f s a
maybe'doubleValue = Data.ProtoLens.Field.field @"maybe'doubleValue"
maybe'end ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'end" a) =>
  Lens.Family2.LensLike' f s a
maybe'end = Data.ProtoLens.Field.field @"maybe'end"
maybe'extendee ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'extendee" a) =>
  Lens.Family2.LensLike' f s a
maybe'extendee = Data.ProtoLens.Field.field @"maybe'extendee"
maybe'goPackage ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'goPackage" a) =>
  Lens.Family2.LensLike' f s a
maybe'goPackage = Data.ProtoLens.Field.field @"maybe'goPackage"
maybe'idempotencyLevel ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'idempotencyLevel" a) =>
  Lens.Family2.LensLike' f s a
maybe'idempotencyLevel
  = Data.ProtoLens.Field.field @"maybe'idempotencyLevel"
maybe'identifierValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'identifierValue" a) =>
  Lens.Family2.LensLike' f s a
maybe'identifierValue
  = Data.ProtoLens.Field.field @"maybe'identifierValue"
maybe'inputType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'inputType" a) =>
  Lens.Family2.LensLike' f s a
maybe'inputType = Data.ProtoLens.Field.field @"maybe'inputType"
maybe'javaGenerateEqualsAndHash ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'javaGenerateEqualsAndHash" a) =>
  Lens.Family2.LensLike' f s a
maybe'javaGenerateEqualsAndHash
  = Data.ProtoLens.Field.field @"maybe'javaGenerateEqualsAndHash"
maybe'javaGenericServices ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'javaGenericServices" a) =>
  Lens.Family2.LensLike' f s a
maybe'javaGenericServices
  = Data.ProtoLens.Field.field @"maybe'javaGenericServices"
maybe'javaMultipleFiles ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'javaMultipleFiles" a) =>
  Lens.Family2.LensLike' f s a
maybe'javaMultipleFiles
  = Data.ProtoLens.Field.field @"maybe'javaMultipleFiles"
maybe'javaOuterClassname ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'javaOuterClassname" a) =>
  Lens.Family2.LensLike' f s a
maybe'javaOuterClassname
  = Data.ProtoLens.Field.field @"maybe'javaOuterClassname"
maybe'javaPackage ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'javaPackage" a) =>
  Lens.Family2.LensLike' f s a
maybe'javaPackage = Data.ProtoLens.Field.field @"maybe'javaPackage"
maybe'javaStringCheckUtf8 ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'javaStringCheckUtf8" a) =>
  Lens.Family2.LensLike' f s a
maybe'javaStringCheckUtf8
  = Data.ProtoLens.Field.field @"maybe'javaStringCheckUtf8"
maybe'jsonName ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'jsonName" a) =>
  Lens.Family2.LensLike' f s a
maybe'jsonName = Data.ProtoLens.Field.field @"maybe'jsonName"
maybe'jstype ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'jstype" a) =>
  Lens.Family2.LensLike' f s a
maybe'jstype = Data.ProtoLens.Field.field @"maybe'jstype"
maybe'label ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'label" a) =>
  Lens.Family2.LensLike' f s a
maybe'label = Data.ProtoLens.Field.field @"maybe'label"
maybe'lazy ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'lazy" a) =>
  Lens.Family2.LensLike' f s a
maybe'lazy = Data.ProtoLens.Field.field @"maybe'lazy"
maybe'leadingComments ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'leadingComments" a) =>
  Lens.Family2.LensLike' f s a
maybe'leadingComments
  = Data.ProtoLens.Field.field @"maybe'leadingComments"
maybe'mapEntry ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'mapEntry" a) =>
  Lens.Family2.LensLike' f s a
maybe'mapEntry = Data.ProtoLens.Field.field @"maybe'mapEntry"
maybe'messageSetWireFormat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'messageSetWireFormat" a) =>
  Lens.Family2.LensLike' f s a
maybe'messageSetWireFormat
  = Data.ProtoLens.Field.field @"maybe'messageSetWireFormat"
maybe'name ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'name" a) =>
  Lens.Family2.LensLike' f s a
maybe'name = Data.ProtoLens.Field.field @"maybe'name"
maybe'negativeIntValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'negativeIntValue" a) =>
  Lens.Family2.LensLike' f s a
maybe'negativeIntValue
  = Data.ProtoLens.Field.field @"maybe'negativeIntValue"
maybe'noStandardDescriptorAccessor ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'noStandardDescriptorAccessor" a) =>
  Lens.Family2.LensLike' f s a
maybe'noStandardDescriptorAccessor
  = Data.ProtoLens.Field.field @"maybe'noStandardDescriptorAccessor"
maybe'number ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'number" a) =>
  Lens.Family2.LensLike' f s a
maybe'number = Data.ProtoLens.Field.field @"maybe'number"
maybe'objcClassPrefix ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'objcClassPrefix" a) =>
  Lens.Family2.LensLike' f s a
maybe'objcClassPrefix
  = Data.ProtoLens.Field.field @"maybe'objcClassPrefix"
maybe'oneofIndex ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'oneofIndex" a) =>
  Lens.Family2.LensLike' f s a
maybe'oneofIndex = Data.ProtoLens.Field.field @"maybe'oneofIndex"
maybe'optimizeFor ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'optimizeFor" a) =>
  Lens.Family2.LensLike' f s a
maybe'optimizeFor = Data.ProtoLens.Field.field @"maybe'optimizeFor"
maybe'options ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'options" a) =>
  Lens.Family2.LensLike' f s a
maybe'options = Data.ProtoLens.Field.field @"maybe'options"
maybe'outputType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'outputType" a) =>
  Lens.Family2.LensLike' f s a
maybe'outputType = Data.ProtoLens.Field.field @"maybe'outputType"
maybe'package ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'package" a) =>
  Lens.Family2.LensLike' f s a
maybe'package = Data.ProtoLens.Field.field @"maybe'package"
maybe'packed ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'packed" a) =>
  Lens.Family2.LensLike' f s a
maybe'packed = Data.ProtoLens.Field.field @"maybe'packed"
maybe'phpClassPrefix ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'phpClassPrefix" a) =>
  Lens.Family2.LensLike' f s a
maybe'phpClassPrefix
  = Data.ProtoLens.Field.field @"maybe'phpClassPrefix"
maybe'phpGenericServices ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'phpGenericServices" a) =>
  Lens.Family2.LensLike' f s a
maybe'phpGenericServices
  = Data.ProtoLens.Field.field @"maybe'phpGenericServices"
maybe'phpMetadataNamespace ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'phpMetadataNamespace" a) =>
  Lens.Family2.LensLike' f s a
maybe'phpMetadataNamespace
  = Data.ProtoLens.Field.field @"maybe'phpMetadataNamespace"
maybe'phpNamespace ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'phpNamespace" a) =>
  Lens.Family2.LensLike' f s a
maybe'phpNamespace
  = Data.ProtoLens.Field.field @"maybe'phpNamespace"
maybe'positiveIntValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'positiveIntValue" a) =>
  Lens.Family2.LensLike' f s a
maybe'positiveIntValue
  = Data.ProtoLens.Field.field @"maybe'positiveIntValue"
maybe'pyGenericServices ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'pyGenericServices" a) =>
  Lens.Family2.LensLike' f s a
maybe'pyGenericServices
  = Data.ProtoLens.Field.field @"maybe'pyGenericServices"
maybe'rubyPackage ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'rubyPackage" a) =>
  Lens.Family2.LensLike' f s a
maybe'rubyPackage = Data.ProtoLens.Field.field @"maybe'rubyPackage"
maybe'serverStreaming ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'serverStreaming" a) =>
  Lens.Family2.LensLike' f s a
maybe'serverStreaming
  = Data.ProtoLens.Field.field @"maybe'serverStreaming"
maybe'sourceCodeInfo ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'sourceCodeInfo" a) =>
  Lens.Family2.LensLike' f s a
maybe'sourceCodeInfo
  = Data.ProtoLens.Field.field @"maybe'sourceCodeInfo"
maybe'sourceFile ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'sourceFile" a) =>
  Lens.Family2.LensLike' f s a
maybe'sourceFile = Data.ProtoLens.Field.field @"maybe'sourceFile"
maybe'start ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'start" a) =>
  Lens.Family2.LensLike' f s a
maybe'start = Data.ProtoLens.Field.field @"maybe'start"
maybe'stringValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'stringValue" a) =>
  Lens.Family2.LensLike' f s a
maybe'stringValue = Data.ProtoLens.Field.field @"maybe'stringValue"
maybe'swiftPrefix ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'swiftPrefix" a) =>
  Lens.Family2.LensLike' f s a
maybe'swiftPrefix = Data.ProtoLens.Field.field @"maybe'swiftPrefix"
maybe'syntax ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'syntax" a) =>
  Lens.Family2.LensLike' f s a
maybe'syntax = Data.ProtoLens.Field.field @"maybe'syntax"
maybe'trailingComments ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'trailingComments" a) =>
  Lens.Family2.LensLike' f s a
maybe'trailingComments
  = Data.ProtoLens.Field.field @"maybe'trailingComments"
maybe'type' ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'type'" a) =>
  Lens.Family2.LensLike' f s a
maybe'type' = Data.ProtoLens.Field.field @"maybe'type'"
maybe'typeName ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'typeName" a) =>
  Lens.Family2.LensLike' f s a
maybe'typeName = Data.ProtoLens.Field.field @"maybe'typeName"
maybe'weak ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'weak" a) =>
  Lens.Family2.LensLike' f s a
maybe'weak = Data.ProtoLens.Field.field @"maybe'weak"
messageSetWireFormat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "messageSetWireFormat" a) =>
  Lens.Family2.LensLike' f s a
messageSetWireFormat
  = Data.ProtoLens.Field.field @"messageSetWireFormat"
messageType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "messageType" a) =>
  Lens.Family2.LensLike' f s a
messageType = Data.ProtoLens.Field.field @"messageType"
method ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "method" a) =>
  Lens.Family2.LensLike' f s a
method = Data.ProtoLens.Field.field @"method"
name ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "name" a) =>
  Lens.Family2.LensLike' f s a
name = Data.ProtoLens.Field.field @"name"
namePart ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "namePart" a) =>
  Lens.Family2.LensLike' f s a
namePart = Data.ProtoLens.Field.field @"namePart"
negativeIntValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "negativeIntValue" a) =>
  Lens.Family2.LensLike' f s a
negativeIntValue = Data.ProtoLens.Field.field @"negativeIntValue"
nestedType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "nestedType" a) =>
  Lens.Family2.LensLike' f s a
nestedType = Data.ProtoLens.Field.field @"nestedType"
noStandardDescriptorAccessor ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "noStandardDescriptorAccessor" a) =>
  Lens.Family2.LensLike' f s a
noStandardDescriptorAccessor
  = Data.ProtoLens.Field.field @"noStandardDescriptorAccessor"
number ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "number" a) =>
  Lens.Family2.LensLike' f s a
number = Data.ProtoLens.Field.field @"number"
objcClassPrefix ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "objcClassPrefix" a) =>
  Lens.Family2.LensLike' f s a
objcClassPrefix = Data.ProtoLens.Field.field @"objcClassPrefix"
oneofDecl ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "oneofDecl" a) =>
  Lens.Family2.LensLike' f s a
oneofDecl = Data.ProtoLens.Field.field @"oneofDecl"
oneofIndex ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "oneofIndex" a) =>
  Lens.Family2.LensLike' f s a
oneofIndex = Data.ProtoLens.Field.field @"oneofIndex"
optimizeFor ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "optimizeFor" a) =>
  Lens.Family2.LensLike' f s a
optimizeFor = Data.ProtoLens.Field.field @"optimizeFor"
options ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "options" a) =>
  Lens.Family2.LensLike' f s a
options = Data.ProtoLens.Field.field @"options"
outputType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "outputType" a) =>
  Lens.Family2.LensLike' f s a
outputType = Data.ProtoLens.Field.field @"outputType"
package ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "package" a) =>
  Lens.Family2.LensLike' f s a
package = Data.ProtoLens.Field.field @"package"
packed ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "packed" a) =>
  Lens.Family2.LensLike' f s a
packed = Data.ProtoLens.Field.field @"packed"
path ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "path" a) =>
  Lens.Family2.LensLike' f s a
path = Data.ProtoLens.Field.field @"path"
phpClassPrefix ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "phpClassPrefix" a) =>
  Lens.Family2.LensLike' f s a
phpClassPrefix = Data.ProtoLens.Field.field @"phpClassPrefix"
phpGenericServices ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "phpGenericServices" a) =>
  Lens.Family2.LensLike' f s a
phpGenericServices
  = Data.ProtoLens.Field.field @"phpGenericServices"
phpMetadataNamespace ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "phpMetadataNamespace" a) =>
  Lens.Family2.LensLike' f s a
phpMetadataNamespace
  = Data.ProtoLens.Field.field @"phpMetadataNamespace"
phpNamespace ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "phpNamespace" a) =>
  Lens.Family2.LensLike' f s a
phpNamespace = Data.ProtoLens.Field.field @"phpNamespace"
positiveIntValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "positiveIntValue" a) =>
  Lens.Family2.LensLike' f s a
positiveIntValue = Data.ProtoLens.Field.field @"positiveIntValue"
publicDependency ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "publicDependency" a) =>
  Lens.Family2.LensLike' f s a
publicDependency = Data.ProtoLens.Field.field @"publicDependency"
pyGenericServices ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "pyGenericServices" a) =>
  Lens.Family2.LensLike' f s a
pyGenericServices = Data.ProtoLens.Field.field @"pyGenericServices"
reservedName ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "reservedName" a) =>
  Lens.Family2.LensLike' f s a
reservedName = Data.ProtoLens.Field.field @"reservedName"
reservedRange ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "reservedRange" a) =>
  Lens.Family2.LensLike' f s a
reservedRange = Data.ProtoLens.Field.field @"reservedRange"
rubyPackage ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "rubyPackage" a) =>
  Lens.Family2.LensLike' f s a
rubyPackage = Data.ProtoLens.Field.field @"rubyPackage"
serverStreaming ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "serverStreaming" a) =>
  Lens.Family2.LensLike' f s a
serverStreaming = Data.ProtoLens.Field.field @"serverStreaming"
service ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "service" a) =>
  Lens.Family2.LensLike' f s a
service = Data.ProtoLens.Field.field @"service"
sourceCodeInfo ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "sourceCodeInfo" a) =>
  Lens.Family2.LensLike' f s a
sourceCodeInfo = Data.ProtoLens.Field.field @"sourceCodeInfo"
sourceFile ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "sourceFile" a) =>
  Lens.Family2.LensLike' f s a
sourceFile = Data.ProtoLens.Field.field @"sourceFile"
span ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "span" a) =>
  Lens.Family2.LensLike' f s a
span = Data.ProtoLens.Field.field @"span"
start ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "start" a) =>
  Lens.Family2.LensLike' f s a
start = Data.ProtoLens.Field.field @"start"
stringValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "stringValue" a) =>
  Lens.Family2.LensLike' f s a
stringValue = Data.ProtoLens.Field.field @"stringValue"
swiftPrefix ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "swiftPrefix" a) =>
  Lens.Family2.LensLike' f s a
swiftPrefix = Data.ProtoLens.Field.field @"swiftPrefix"
syntax ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "syntax" a) =>
  Lens.Family2.LensLike' f s a
syntax = Data.ProtoLens.Field.field @"syntax"
trailingComments ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "trailingComments" a) =>
  Lens.Family2.LensLike' f s a
trailingComments = Data.ProtoLens.Field.field @"trailingComments"
type' ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "type'" a) =>
  Lens.Family2.LensLike' f s a
type' = Data.ProtoLens.Field.field @"type'"
typeName ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "typeName" a) =>
  Lens.Family2.LensLike' f s a
typeName = Data.ProtoLens.Field.field @"typeName"
uninterpretedOption ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "uninterpretedOption" a) =>
  Lens.Family2.LensLike' f s a
uninterpretedOption
  = Data.ProtoLens.Field.field @"uninterpretedOption"
value ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "value" a) =>
  Lens.Family2.LensLike' f s a
value = Data.ProtoLens.Field.field @"value"
vec'annotation ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'annotation" a) =>
  Lens.Family2.LensLike' f s a
vec'annotation = Data.ProtoLens.Field.field @"vec'annotation"
vec'dependency ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'dependency" a) =>
  Lens.Family2.LensLike' f s a
vec'dependency = Data.ProtoLens.Field.field @"vec'dependency"
vec'enumType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'enumType" a) =>
  Lens.Family2.LensLike' f s a
vec'enumType = Data.ProtoLens.Field.field @"vec'enumType"
vec'extension ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'extension" a) =>
  Lens.Family2.LensLike' f s a
vec'extension = Data.ProtoLens.Field.field @"vec'extension"
vec'extensionRange ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'extensionRange" a) =>
  Lens.Family2.LensLike' f s a
vec'extensionRange
  = Data.ProtoLens.Field.field @"vec'extensionRange"
vec'field ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'field" a) =>
  Lens.Family2.LensLike' f s a
vec'field = Data.ProtoLens.Field.field @"vec'field"
vec'file ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'file" a) =>
  Lens.Family2.LensLike' f s a
vec'file = Data.ProtoLens.Field.field @"vec'file"
vec'leadingDetachedComments ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'leadingDetachedComments" a) =>
  Lens.Family2.LensLike' f s a
vec'leadingDetachedComments
  = Data.ProtoLens.Field.field @"vec'leadingDetachedComments"
vec'location ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'location" a) =>
  Lens.Family2.LensLike' f s a
vec'location = Data.ProtoLens.Field.field @"vec'location"
vec'messageType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'messageType" a) =>
  Lens.Family2.LensLike' f s a
vec'messageType = Data.ProtoLens.Field.field @"vec'messageType"
vec'method ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'method" a) =>
  Lens.Family2.LensLike' f s a
vec'method = Data.ProtoLens.Field.field @"vec'method"
vec'name ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'name" a) =>
  Lens.Family2.LensLike' f s a
vec'name = Data.ProtoLens.Field.field @"vec'name"
vec'nestedType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'nestedType" a) =>
  Lens.Family2.LensLike' f s a
vec'nestedType = Data.ProtoLens.Field.field @"vec'nestedType"
vec'oneofDecl ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'oneofDecl" a) =>
  Lens.Family2.LensLike' f s a
vec'oneofDecl = Data.ProtoLens.Field.field @"vec'oneofDecl"
vec'path ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'path" a) =>
  Lens.Family2.LensLike' f s a
vec'path = Data.ProtoLens.Field.field @"vec'path"
vec'publicDependency ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'publicDependency" a) =>
  Lens.Family2.LensLike' f s a
vec'publicDependency
  = Data.ProtoLens.Field.field @"vec'publicDependency"
vec'reservedName ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'reservedName" a) =>
  Lens.Family2.LensLike' f s a
vec'reservedName = Data.ProtoLens.Field.field @"vec'reservedName"
vec'reservedRange ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'reservedRange" a) =>
  Lens.Family2.LensLike' f s a
vec'reservedRange = Data.ProtoLens.Field.field @"vec'reservedRange"
vec'service ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'service" a) =>
  Lens.Family2.LensLike' f s a
vec'service = Data.ProtoLens.Field.field @"vec'service"
vec'span ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'span" a) =>
  Lens.Family2.LensLike' f s a
vec'span = Data.ProtoLens.Field.field @"vec'span"
vec'uninterpretedOption ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'uninterpretedOption" a) =>
  Lens.Family2.LensLike' f s a
vec'uninterpretedOption
  = Data.ProtoLens.Field.field @"vec'uninterpretedOption"
vec'value ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'value" a) =>
  Lens.Family2.LensLike' f s a
vec'value = Data.ProtoLens.Field.field @"vec'value"
vec'weakDependency ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'weakDependency" a) =>
  Lens.Family2.LensLike' f s a
vec'weakDependency
  = Data.ProtoLens.Field.field @"vec'weakDependency"
weak ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "weak" a) =>
  Lens.Family2.LensLike' f s a
weak = Data.ProtoLens.Field.field @"weak"
weakDependency ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "weakDependency" a) =>
  Lens.Family2.LensLike' f s a
weakDependency = Data.ProtoLens.Field.field @"weakDependency"