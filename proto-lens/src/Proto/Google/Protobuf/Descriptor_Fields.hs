{- This file was auto-generated from google/protobuf/descriptor.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies,
  UndecidableInstances, GeneralizedNewtypeDeriving,
  MultiParamTypeClasses, FlexibleContexts, FlexibleInstances,
  PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports#-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports#-}
module Proto.Google.Protobuf.Descriptor_Fields where
import qualified Prelude
import qualified Data.Int
import qualified Data.Word
import qualified Data.ProtoLens
import qualified Data.ProtoLens.Message.Enum
import qualified Data.ProtoLens.Service.Types
import qualified Lens.Family2
import qualified Lens.Family2.Unchecked
import qualified Data.Default.Class
import qualified Data.Text
import qualified Data.Map
import qualified Data.ByteString
import qualified Data.ByteString.Char8
import qualified Lens.Labels
import qualified Text.Read

aggregateValue ::
               forall f s t a b .
                 (Lens.Labels.HasLens f s t "aggregateValue" a b) =>
                 Lens.Family2.LensLike f s t a b
aggregateValue
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "aggregateValue")
allowAlias ::
           forall f s t a b . (Lens.Labels.HasLens f s t "allowAlias" a b) =>
             Lens.Family2.LensLike f s t a b
allowAlias
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "allowAlias")
annotation ::
           forall f s t a b . (Lens.Labels.HasLens f s t "annotation" a b) =>
             Lens.Family2.LensLike f s t a b
annotation
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "annotation")
begin ::
      forall f s t a b . (Lens.Labels.HasLens f s t "begin" a b) =>
        Lens.Family2.LensLike f s t a b
begin
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "begin")
ccEnableArenas ::
               forall f s t a b .
                 (Lens.Labels.HasLens f s t "ccEnableArenas" a b) =>
                 Lens.Family2.LensLike f s t a b
ccEnableArenas
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "ccEnableArenas")
ccGenericServices ::
                  forall f s t a b .
                    (Lens.Labels.HasLens f s t "ccGenericServices" a b) =>
                    Lens.Family2.LensLike f s t a b
ccGenericServices
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "ccGenericServices")
clientStreaming ::
                forall f s t a b .
                  (Lens.Labels.HasLens f s t "clientStreaming" a b) =>
                  Lens.Family2.LensLike f s t a b
clientStreaming
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "clientStreaming")
csharpNamespace ::
                forall f s t a b .
                  (Lens.Labels.HasLens f s t "csharpNamespace" a b) =>
                  Lens.Family2.LensLike f s t a b
csharpNamespace
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "csharpNamespace")
ctype ::
      forall f s t a b . (Lens.Labels.HasLens f s t "ctype" a b) =>
        Lens.Family2.LensLike f s t a b
ctype
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "ctype")
defaultValue ::
             forall f s t a b .
               (Lens.Labels.HasLens f s t "defaultValue" a b) =>
               Lens.Family2.LensLike f s t a b
defaultValue
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "defaultValue")
dependency ::
           forall f s t a b . (Lens.Labels.HasLens f s t "dependency" a b) =>
             Lens.Family2.LensLike f s t a b
dependency
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "dependency")
deprecated ::
           forall f s t a b . (Lens.Labels.HasLens f s t "deprecated" a b) =>
             Lens.Family2.LensLike f s t a b
deprecated
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "deprecated")
doubleValue ::
            forall f s t a b . (Lens.Labels.HasLens f s t "doubleValue" a b) =>
              Lens.Family2.LensLike f s t a b
doubleValue
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "doubleValue")
end ::
    forall f s t a b . (Lens.Labels.HasLens f s t "end" a b) =>
      Lens.Family2.LensLike f s t a b
end
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "end")
enumType ::
         forall f s t a b . (Lens.Labels.HasLens f s t "enumType" a b) =>
           Lens.Family2.LensLike f s t a b
enumType
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "enumType")
extendee ::
         forall f s t a b . (Lens.Labels.HasLens f s t "extendee" a b) =>
           Lens.Family2.LensLike f s t a b
extendee
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "extendee")
extension ::
          forall f s t a b . (Lens.Labels.HasLens f s t "extension" a b) =>
            Lens.Family2.LensLike f s t a b
extension
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "extension")
extensionRange ::
               forall f s t a b .
                 (Lens.Labels.HasLens f s t "extensionRange" a b) =>
                 Lens.Family2.LensLike f s t a b
extensionRange
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "extensionRange")
field ::
      forall f s t a b . (Lens.Labels.HasLens f s t "field" a b) =>
        Lens.Family2.LensLike f s t a b
field
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "field")
file ::
     forall f s t a b . (Lens.Labels.HasLens f s t "file" a b) =>
       Lens.Family2.LensLike f s t a b
file
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "file")
goPackage ::
          forall f s t a b . (Lens.Labels.HasLens f s t "goPackage" a b) =>
            Lens.Family2.LensLike f s t a b
goPackage
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "goPackage")
identifierValue ::
                forall f s t a b .
                  (Lens.Labels.HasLens f s t "identifierValue" a b) =>
                  Lens.Family2.LensLike f s t a b
identifierValue
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "identifierValue")
inputType ::
          forall f s t a b . (Lens.Labels.HasLens f s t "inputType" a b) =>
            Lens.Family2.LensLike f s t a b
inputType
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "inputType")
isExtension ::
            forall f s t a b . (Lens.Labels.HasLens f s t "isExtension" a b) =>
              Lens.Family2.LensLike f s t a b
isExtension
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "isExtension")
javaGenerateEqualsAndHash ::
                          forall f s t a b .
                            (Lens.Labels.HasLens f s t "javaGenerateEqualsAndHash" a b) =>
                            Lens.Family2.LensLike f s t a b
javaGenerateEqualsAndHash
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "javaGenerateEqualsAndHash")
javaGenericServices ::
                    forall f s t a b .
                      (Lens.Labels.HasLens f s t "javaGenericServices" a b) =>
                      Lens.Family2.LensLike f s t a b
javaGenericServices
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "javaGenericServices")
javaMultipleFiles ::
                  forall f s t a b .
                    (Lens.Labels.HasLens f s t "javaMultipleFiles" a b) =>
                    Lens.Family2.LensLike f s t a b
javaMultipleFiles
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "javaMultipleFiles")
javaOuterClassname ::
                   forall f s t a b .
                     (Lens.Labels.HasLens f s t "javaOuterClassname" a b) =>
                     Lens.Family2.LensLike f s t a b
javaOuterClassname
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "javaOuterClassname")
javaPackage ::
            forall f s t a b . (Lens.Labels.HasLens f s t "javaPackage" a b) =>
              Lens.Family2.LensLike f s t a b
javaPackage
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "javaPackage")
javaStringCheckUtf8 ::
                    forall f s t a b .
                      (Lens.Labels.HasLens f s t "javaStringCheckUtf8" a b) =>
                      Lens.Family2.LensLike f s t a b
javaStringCheckUtf8
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "javaStringCheckUtf8")
jsonName ::
         forall f s t a b . (Lens.Labels.HasLens f s t "jsonName" a b) =>
           Lens.Family2.LensLike f s t a b
jsonName
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "jsonName")
jstype ::
       forall f s t a b . (Lens.Labels.HasLens f s t "jstype" a b) =>
         Lens.Family2.LensLike f s t a b
jstype
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "jstype")
label ::
      forall f s t a b . (Lens.Labels.HasLens f s t "label" a b) =>
        Lens.Family2.LensLike f s t a b
label
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "label")
lazy ::
     forall f s t a b . (Lens.Labels.HasLens f s t "lazy" a b) =>
       Lens.Family2.LensLike f s t a b
lazy
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "lazy")
leadingComments ::
                forall f s t a b .
                  (Lens.Labels.HasLens f s t "leadingComments" a b) =>
                  Lens.Family2.LensLike f s t a b
leadingComments
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "leadingComments")
leadingDetachedComments ::
                        forall f s t a b .
                          (Lens.Labels.HasLens f s t "leadingDetachedComments" a b) =>
                          Lens.Family2.LensLike f s t a b
leadingDetachedComments
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "leadingDetachedComments")
location ::
         forall f s t a b . (Lens.Labels.HasLens f s t "location" a b) =>
           Lens.Family2.LensLike f s t a b
location
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "location")
mapEntry ::
         forall f s t a b . (Lens.Labels.HasLens f s t "mapEntry" a b) =>
           Lens.Family2.LensLike f s t a b
mapEntry
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "mapEntry")
maybe'aggregateValue ::
                     forall f s t a b .
                       (Lens.Labels.HasLens f s t "maybe'aggregateValue" a b) =>
                       Lens.Family2.LensLike f s t a b
maybe'aggregateValue
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'aggregateValue")
maybe'allowAlias ::
                 forall f s t a b .
                   (Lens.Labels.HasLens f s t "maybe'allowAlias" a b) =>
                   Lens.Family2.LensLike f s t a b
maybe'allowAlias
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'allowAlias")
maybe'begin ::
            forall f s t a b . (Lens.Labels.HasLens f s t "maybe'begin" a b) =>
              Lens.Family2.LensLike f s t a b
maybe'begin
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'begin")
maybe'ccEnableArenas ::
                     forall f s t a b .
                       (Lens.Labels.HasLens f s t "maybe'ccEnableArenas" a b) =>
                       Lens.Family2.LensLike f s t a b
maybe'ccEnableArenas
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'ccEnableArenas")
maybe'ccGenericServices ::
                        forall f s t a b .
                          (Lens.Labels.HasLens f s t "maybe'ccGenericServices" a b) =>
                          Lens.Family2.LensLike f s t a b
maybe'ccGenericServices
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'ccGenericServices")
maybe'clientStreaming ::
                      forall f s t a b .
                        (Lens.Labels.HasLens f s t "maybe'clientStreaming" a b) =>
                        Lens.Family2.LensLike f s t a b
maybe'clientStreaming
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'clientStreaming")
maybe'csharpNamespace ::
                      forall f s t a b .
                        (Lens.Labels.HasLens f s t "maybe'csharpNamespace" a b) =>
                        Lens.Family2.LensLike f s t a b
maybe'csharpNamespace
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'csharpNamespace")
maybe'ctype ::
            forall f s t a b . (Lens.Labels.HasLens f s t "maybe'ctype" a b) =>
              Lens.Family2.LensLike f s t a b
maybe'ctype
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'ctype")
maybe'defaultValue ::
                   forall f s t a b .
                     (Lens.Labels.HasLens f s t "maybe'defaultValue" a b) =>
                     Lens.Family2.LensLike f s t a b
maybe'defaultValue
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'defaultValue")
maybe'deprecated ::
                 forall f s t a b .
                   (Lens.Labels.HasLens f s t "maybe'deprecated" a b) =>
                   Lens.Family2.LensLike f s t a b
maybe'deprecated
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'deprecated")
maybe'doubleValue ::
                  forall f s t a b .
                    (Lens.Labels.HasLens f s t "maybe'doubleValue" a b) =>
                    Lens.Family2.LensLike f s t a b
maybe'doubleValue
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'doubleValue")
maybe'end ::
          forall f s t a b . (Lens.Labels.HasLens f s t "maybe'end" a b) =>
            Lens.Family2.LensLike f s t a b
maybe'end
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'end")
maybe'extendee ::
               forall f s t a b .
                 (Lens.Labels.HasLens f s t "maybe'extendee" a b) =>
                 Lens.Family2.LensLike f s t a b
maybe'extendee
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'extendee")
maybe'goPackage ::
                forall f s t a b .
                  (Lens.Labels.HasLens f s t "maybe'goPackage" a b) =>
                  Lens.Family2.LensLike f s t a b
maybe'goPackage
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'goPackage")
maybe'identifierValue ::
                      forall f s t a b .
                        (Lens.Labels.HasLens f s t "maybe'identifierValue" a b) =>
                        Lens.Family2.LensLike f s t a b
maybe'identifierValue
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'identifierValue")
maybe'inputType ::
                forall f s t a b .
                  (Lens.Labels.HasLens f s t "maybe'inputType" a b) =>
                  Lens.Family2.LensLike f s t a b
maybe'inputType
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'inputType")
maybe'javaGenerateEqualsAndHash ::
                                forall f s t a b .
                                  (Lens.Labels.HasLens f s t "maybe'javaGenerateEqualsAndHash" a
                                     b) =>
                                  Lens.Family2.LensLike f s t a b
maybe'javaGenerateEqualsAndHash
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'javaGenerateEqualsAndHash")
maybe'javaGenericServices ::
                          forall f s t a b .
                            (Lens.Labels.HasLens f s t "maybe'javaGenericServices" a b) =>
                            Lens.Family2.LensLike f s t a b
maybe'javaGenericServices
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'javaGenericServices")
maybe'javaMultipleFiles ::
                        forall f s t a b .
                          (Lens.Labels.HasLens f s t "maybe'javaMultipleFiles" a b) =>
                          Lens.Family2.LensLike f s t a b
maybe'javaMultipleFiles
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'javaMultipleFiles")
maybe'javaOuterClassname ::
                         forall f s t a b .
                           (Lens.Labels.HasLens f s t "maybe'javaOuterClassname" a b) =>
                           Lens.Family2.LensLike f s t a b
maybe'javaOuterClassname
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'javaOuterClassname")
maybe'javaPackage ::
                  forall f s t a b .
                    (Lens.Labels.HasLens f s t "maybe'javaPackage" a b) =>
                    Lens.Family2.LensLike f s t a b
maybe'javaPackage
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'javaPackage")
maybe'javaStringCheckUtf8 ::
                          forall f s t a b .
                            (Lens.Labels.HasLens f s t "maybe'javaStringCheckUtf8" a b) =>
                            Lens.Family2.LensLike f s t a b
maybe'javaStringCheckUtf8
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'javaStringCheckUtf8")
maybe'jsonName ::
               forall f s t a b .
                 (Lens.Labels.HasLens f s t "maybe'jsonName" a b) =>
                 Lens.Family2.LensLike f s t a b
maybe'jsonName
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'jsonName")
maybe'jstype ::
             forall f s t a b .
               (Lens.Labels.HasLens f s t "maybe'jstype" a b) =>
               Lens.Family2.LensLike f s t a b
maybe'jstype
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'jstype")
maybe'label ::
            forall f s t a b . (Lens.Labels.HasLens f s t "maybe'label" a b) =>
              Lens.Family2.LensLike f s t a b
maybe'label
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'label")
maybe'lazy ::
           forall f s t a b . (Lens.Labels.HasLens f s t "maybe'lazy" a b) =>
             Lens.Family2.LensLike f s t a b
maybe'lazy
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'lazy")
maybe'leadingComments ::
                      forall f s t a b .
                        (Lens.Labels.HasLens f s t "maybe'leadingComments" a b) =>
                        Lens.Family2.LensLike f s t a b
maybe'leadingComments
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'leadingComments")
maybe'mapEntry ::
               forall f s t a b .
                 (Lens.Labels.HasLens f s t "maybe'mapEntry" a b) =>
                 Lens.Family2.LensLike f s t a b
maybe'mapEntry
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'mapEntry")
maybe'messageSetWireFormat ::
                           forall f s t a b .
                             (Lens.Labels.HasLens f s t "maybe'messageSetWireFormat" a b) =>
                             Lens.Family2.LensLike f s t a b
maybe'messageSetWireFormat
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'messageSetWireFormat")
maybe'name ::
           forall f s t a b . (Lens.Labels.HasLens f s t "maybe'name" a b) =>
             Lens.Family2.LensLike f s t a b
maybe'name
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'name")
maybe'negativeIntValue ::
                       forall f s t a b .
                         (Lens.Labels.HasLens f s t "maybe'negativeIntValue" a b) =>
                         Lens.Family2.LensLike f s t a b
maybe'negativeIntValue
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'negativeIntValue")
maybe'noStandardDescriptorAccessor ::
                                   forall f s t a b .
                                     (Lens.Labels.HasLens f s t "maybe'noStandardDescriptorAccessor"
                                        a b) =>
                                     Lens.Family2.LensLike f s t a b
maybe'noStandardDescriptorAccessor
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'noStandardDescriptorAccessor")
maybe'number ::
             forall f s t a b .
               (Lens.Labels.HasLens f s t "maybe'number" a b) =>
               Lens.Family2.LensLike f s t a b
maybe'number
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'number")
maybe'objcClassPrefix ::
                      forall f s t a b .
                        (Lens.Labels.HasLens f s t "maybe'objcClassPrefix" a b) =>
                        Lens.Family2.LensLike f s t a b
maybe'objcClassPrefix
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'objcClassPrefix")
maybe'oneofIndex ::
                 forall f s t a b .
                   (Lens.Labels.HasLens f s t "maybe'oneofIndex" a b) =>
                   Lens.Family2.LensLike f s t a b
maybe'oneofIndex
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'oneofIndex")
maybe'optimizeFor ::
                  forall f s t a b .
                    (Lens.Labels.HasLens f s t "maybe'optimizeFor" a b) =>
                    Lens.Family2.LensLike f s t a b
maybe'optimizeFor
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'optimizeFor")
maybe'options ::
              forall f s t a b .
                (Lens.Labels.HasLens f s t "maybe'options" a b) =>
                Lens.Family2.LensLike f s t a b
maybe'options
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'options")
maybe'outputType ::
                 forall f s t a b .
                   (Lens.Labels.HasLens f s t "maybe'outputType" a b) =>
                   Lens.Family2.LensLike f s t a b
maybe'outputType
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'outputType")
maybe'package ::
              forall f s t a b .
                (Lens.Labels.HasLens f s t "maybe'package" a b) =>
                Lens.Family2.LensLike f s t a b
maybe'package
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'package")
maybe'packed ::
             forall f s t a b .
               (Lens.Labels.HasLens f s t "maybe'packed" a b) =>
               Lens.Family2.LensLike f s t a b
maybe'packed
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'packed")
maybe'positiveIntValue ::
                       forall f s t a b .
                         (Lens.Labels.HasLens f s t "maybe'positiveIntValue" a b) =>
                         Lens.Family2.LensLike f s t a b
maybe'positiveIntValue
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'positiveIntValue")
maybe'pyGenericServices ::
                        forall f s t a b .
                          (Lens.Labels.HasLens f s t "maybe'pyGenericServices" a b) =>
                          Lens.Family2.LensLike f s t a b
maybe'pyGenericServices
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'pyGenericServices")
maybe'serverStreaming ::
                      forall f s t a b .
                        (Lens.Labels.HasLens f s t "maybe'serverStreaming" a b) =>
                        Lens.Family2.LensLike f s t a b
maybe'serverStreaming
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'serverStreaming")
maybe'sourceCodeInfo ::
                     forall f s t a b .
                       (Lens.Labels.HasLens f s t "maybe'sourceCodeInfo" a b) =>
                       Lens.Family2.LensLike f s t a b
maybe'sourceCodeInfo
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'sourceCodeInfo")
maybe'sourceFile ::
                 forall f s t a b .
                   (Lens.Labels.HasLens f s t "maybe'sourceFile" a b) =>
                   Lens.Family2.LensLike f s t a b
maybe'sourceFile
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'sourceFile")
maybe'start ::
            forall f s t a b . (Lens.Labels.HasLens f s t "maybe'start" a b) =>
              Lens.Family2.LensLike f s t a b
maybe'start
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'start")
maybe'stringValue ::
                  forall f s t a b .
                    (Lens.Labels.HasLens f s t "maybe'stringValue" a b) =>
                    Lens.Family2.LensLike f s t a b
maybe'stringValue
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'stringValue")
maybe'syntax ::
             forall f s t a b .
               (Lens.Labels.HasLens f s t "maybe'syntax" a b) =>
               Lens.Family2.LensLike f s t a b
maybe'syntax
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'syntax")
maybe'trailingComments ::
                       forall f s t a b .
                         (Lens.Labels.HasLens f s t "maybe'trailingComments" a b) =>
                         Lens.Family2.LensLike f s t a b
maybe'trailingComments
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'trailingComments")
maybe'type' ::
            forall f s t a b . (Lens.Labels.HasLens f s t "maybe'type'" a b) =>
              Lens.Family2.LensLike f s t a b
maybe'type'
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'type'")
maybe'typeName ::
               forall f s t a b .
                 (Lens.Labels.HasLens f s t "maybe'typeName" a b) =>
                 Lens.Family2.LensLike f s t a b
maybe'typeName
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'typeName")
maybe'weak ::
           forall f s t a b . (Lens.Labels.HasLens f s t "maybe'weak" a b) =>
             Lens.Family2.LensLike f s t a b
maybe'weak
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'weak")
messageSetWireFormat ::
                     forall f s t a b .
                       (Lens.Labels.HasLens f s t "messageSetWireFormat" a b) =>
                       Lens.Family2.LensLike f s t a b
messageSetWireFormat
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "messageSetWireFormat")
messageType ::
            forall f s t a b . (Lens.Labels.HasLens f s t "messageType" a b) =>
              Lens.Family2.LensLike f s t a b
messageType
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "messageType")
method ::
       forall f s t a b . (Lens.Labels.HasLens f s t "method" a b) =>
         Lens.Family2.LensLike f s t a b
method
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "method")
name ::
     forall f s t a b . (Lens.Labels.HasLens f s t "name" a b) =>
       Lens.Family2.LensLike f s t a b
name
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "name")
namePart ::
         forall f s t a b . (Lens.Labels.HasLens f s t "namePart" a b) =>
           Lens.Family2.LensLike f s t a b
namePart
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "namePart")
negativeIntValue ::
                 forall f s t a b .
                   (Lens.Labels.HasLens f s t "negativeIntValue" a b) =>
                   Lens.Family2.LensLike f s t a b
negativeIntValue
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "negativeIntValue")
nestedType ::
           forall f s t a b . (Lens.Labels.HasLens f s t "nestedType" a b) =>
             Lens.Family2.LensLike f s t a b
nestedType
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "nestedType")
noStandardDescriptorAccessor ::
                             forall f s t a b .
                               (Lens.Labels.HasLens f s t "noStandardDescriptorAccessor" a b) =>
                               Lens.Family2.LensLike f s t a b
noStandardDescriptorAccessor
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "noStandardDescriptorAccessor")
number ::
       forall f s t a b . (Lens.Labels.HasLens f s t "number" a b) =>
         Lens.Family2.LensLike f s t a b
number
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "number")
objcClassPrefix ::
                forall f s t a b .
                  (Lens.Labels.HasLens f s t "objcClassPrefix" a b) =>
                  Lens.Family2.LensLike f s t a b
objcClassPrefix
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "objcClassPrefix")
oneofDecl ::
          forall f s t a b . (Lens.Labels.HasLens f s t "oneofDecl" a b) =>
            Lens.Family2.LensLike f s t a b
oneofDecl
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "oneofDecl")
oneofIndex ::
           forall f s t a b . (Lens.Labels.HasLens f s t "oneofIndex" a b) =>
             Lens.Family2.LensLike f s t a b
oneofIndex
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "oneofIndex")
optimizeFor ::
            forall f s t a b . (Lens.Labels.HasLens f s t "optimizeFor" a b) =>
              Lens.Family2.LensLike f s t a b
optimizeFor
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "optimizeFor")
options ::
        forall f s t a b . (Lens.Labels.HasLens f s t "options" a b) =>
          Lens.Family2.LensLike f s t a b
options
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "options")
outputType ::
           forall f s t a b . (Lens.Labels.HasLens f s t "outputType" a b) =>
             Lens.Family2.LensLike f s t a b
outputType
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "outputType")
package ::
        forall f s t a b . (Lens.Labels.HasLens f s t "package" a b) =>
          Lens.Family2.LensLike f s t a b
package
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "package")
packed ::
       forall f s t a b . (Lens.Labels.HasLens f s t "packed" a b) =>
         Lens.Family2.LensLike f s t a b
packed
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "packed")
path ::
     forall f s t a b . (Lens.Labels.HasLens f s t "path" a b) =>
       Lens.Family2.LensLike f s t a b
path
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "path")
positiveIntValue ::
                 forall f s t a b .
                   (Lens.Labels.HasLens f s t "positiveIntValue" a b) =>
                   Lens.Family2.LensLike f s t a b
positiveIntValue
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "positiveIntValue")
publicDependency ::
                 forall f s t a b .
                   (Lens.Labels.HasLens f s t "publicDependency" a b) =>
                   Lens.Family2.LensLike f s t a b
publicDependency
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "publicDependency")
pyGenericServices ::
                  forall f s t a b .
                    (Lens.Labels.HasLens f s t "pyGenericServices" a b) =>
                    Lens.Family2.LensLike f s t a b
pyGenericServices
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "pyGenericServices")
reservedName ::
             forall f s t a b .
               (Lens.Labels.HasLens f s t "reservedName" a b) =>
               Lens.Family2.LensLike f s t a b
reservedName
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "reservedName")
reservedRange ::
              forall f s t a b .
                (Lens.Labels.HasLens f s t "reservedRange" a b) =>
                Lens.Family2.LensLike f s t a b
reservedRange
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "reservedRange")
serverStreaming ::
                forall f s t a b .
                  (Lens.Labels.HasLens f s t "serverStreaming" a b) =>
                  Lens.Family2.LensLike f s t a b
serverStreaming
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "serverStreaming")
service ::
        forall f s t a b . (Lens.Labels.HasLens f s t "service" a b) =>
          Lens.Family2.LensLike f s t a b
service
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "service")
sourceCodeInfo ::
               forall f s t a b .
                 (Lens.Labels.HasLens f s t "sourceCodeInfo" a b) =>
                 Lens.Family2.LensLike f s t a b
sourceCodeInfo
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "sourceCodeInfo")
sourceFile ::
           forall f s t a b . (Lens.Labels.HasLens f s t "sourceFile" a b) =>
             Lens.Family2.LensLike f s t a b
sourceFile
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "sourceFile")
span ::
     forall f s t a b . (Lens.Labels.HasLens f s t "span" a b) =>
       Lens.Family2.LensLike f s t a b
span
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "span")
start ::
      forall f s t a b . (Lens.Labels.HasLens f s t "start" a b) =>
        Lens.Family2.LensLike f s t a b
start
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "start")
stringValue ::
            forall f s t a b . (Lens.Labels.HasLens f s t "stringValue" a b) =>
              Lens.Family2.LensLike f s t a b
stringValue
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "stringValue")
syntax ::
       forall f s t a b . (Lens.Labels.HasLens f s t "syntax" a b) =>
         Lens.Family2.LensLike f s t a b
syntax
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "syntax")
trailingComments ::
                 forall f s t a b .
                   (Lens.Labels.HasLens f s t "trailingComments" a b) =>
                   Lens.Family2.LensLike f s t a b
trailingComments
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "trailingComments")
type' ::
      forall f s t a b . (Lens.Labels.HasLens f s t "type'" a b) =>
        Lens.Family2.LensLike f s t a b
type'
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "type'")
typeName ::
         forall f s t a b . (Lens.Labels.HasLens f s t "typeName" a b) =>
           Lens.Family2.LensLike f s t a b
typeName
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "typeName")
uninterpretedOption ::
                    forall f s t a b .
                      (Lens.Labels.HasLens f s t "uninterpretedOption" a b) =>
                      Lens.Family2.LensLike f s t a b
uninterpretedOption
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "uninterpretedOption")
value ::
      forall f s t a b . (Lens.Labels.HasLens f s t "value" a b) =>
        Lens.Family2.LensLike f s t a b
value
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "value")
weak ::
     forall f s t a b . (Lens.Labels.HasLens f s t "weak" a b) =>
       Lens.Family2.LensLike f s t a b
weak
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "weak")
weakDependency ::
               forall f s t a b .
                 (Lens.Labels.HasLens f s t "weakDependency" a b) =>
                 Lens.Family2.LensLike f s t a b
weakDependency
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "weakDependency")