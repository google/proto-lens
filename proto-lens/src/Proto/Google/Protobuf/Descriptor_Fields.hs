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
import qualified Data.Text
import qualified Data.Map
import qualified Data.ByteString
import qualified Data.ByteString.Char8
import qualified Lens.Labels
import qualified Text.Read

aggregateValue ::
               forall f s a .
                 (Prelude.Functor f, Lens.Labels.HasLens' s "aggregateValue" a) =>
                 Lens.Family2.LensLike' f s a
aggregateValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "aggregateValue")
allowAlias ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "allowAlias" a) =>
             Lens.Family2.LensLike' f s a
allowAlias
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "allowAlias")
annotation ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "annotation" a) =>
             Lens.Family2.LensLike' f s a
annotation
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "annotation")
begin ::
      forall f s a .
        (Prelude.Functor f, Lens.Labels.HasLens' s "begin" a) =>
        Lens.Family2.LensLike' f s a
begin
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "begin")
ccEnableArenas ::
               forall f s a .
                 (Prelude.Functor f, Lens.Labels.HasLens' s "ccEnableArenas" a) =>
                 Lens.Family2.LensLike' f s a
ccEnableArenas
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "ccEnableArenas")
ccGenericServices ::
                  forall f s a .
                    (Prelude.Functor f,
                     Lens.Labels.HasLens' s "ccGenericServices" a) =>
                    Lens.Family2.LensLike' f s a
ccGenericServices
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "ccGenericServices")
clientStreaming ::
                forall f s a .
                  (Prelude.Functor f, Lens.Labels.HasLens' s "clientStreaming" a) =>
                  Lens.Family2.LensLike' f s a
clientStreaming
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "clientStreaming")
csharpNamespace ::
                forall f s a .
                  (Prelude.Functor f, Lens.Labels.HasLens' s "csharpNamespace" a) =>
                  Lens.Family2.LensLike' f s a
csharpNamespace
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "csharpNamespace")
ctype ::
      forall f s a .
        (Prelude.Functor f, Lens.Labels.HasLens' s "ctype" a) =>
        Lens.Family2.LensLike' f s a
ctype
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "ctype")
defaultValue ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "defaultValue" a) =>
               Lens.Family2.LensLike' f s a
defaultValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "defaultValue")
dependency ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "dependency" a) =>
             Lens.Family2.LensLike' f s a
dependency
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "dependency")
deprecated ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "deprecated" a) =>
             Lens.Family2.LensLike' f s a
deprecated
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "deprecated")
doubleValue ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "doubleValue" a) =>
              Lens.Family2.LensLike' f s a
doubleValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "doubleValue")
end ::
    forall f s a .
      (Prelude.Functor f, Lens.Labels.HasLens' s "end" a) =>
      Lens.Family2.LensLike' f s a
end
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "end")
enumType ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "enumType" a) =>
           Lens.Family2.LensLike' f s a
enumType
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "enumType")
extendee ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "extendee" a) =>
           Lens.Family2.LensLike' f s a
extendee
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "extendee")
extension ::
          forall f s a .
            (Prelude.Functor f, Lens.Labels.HasLens' s "extension" a) =>
            Lens.Family2.LensLike' f s a
extension
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "extension")
extensionRange ::
               forall f s a .
                 (Prelude.Functor f, Lens.Labels.HasLens' s "extensionRange" a) =>
                 Lens.Family2.LensLike' f s a
extensionRange
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "extensionRange")
field ::
      forall f s a .
        (Prelude.Functor f, Lens.Labels.HasLens' s "field" a) =>
        Lens.Family2.LensLike' f s a
field
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "field")
file ::
     forall f s a .
       (Prelude.Functor f, Lens.Labels.HasLens' s "file" a) =>
       Lens.Family2.LensLike' f s a
file
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "file")
goPackage ::
          forall f s a .
            (Prelude.Functor f, Lens.Labels.HasLens' s "goPackage" a) =>
            Lens.Family2.LensLike' f s a
goPackage
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "goPackage")
identifierValue ::
                forall f s a .
                  (Prelude.Functor f, Lens.Labels.HasLens' s "identifierValue" a) =>
                  Lens.Family2.LensLike' f s a
identifierValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "identifierValue")
inputType ::
          forall f s a .
            (Prelude.Functor f, Lens.Labels.HasLens' s "inputType" a) =>
            Lens.Family2.LensLike' f s a
inputType
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "inputType")
isExtension ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "isExtension" a) =>
              Lens.Family2.LensLike' f s a
isExtension
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "isExtension")
javaGenerateEqualsAndHash ::
                          forall f s a .
                            (Prelude.Functor f,
                             Lens.Labels.HasLens' s "javaGenerateEqualsAndHash" a) =>
                            Lens.Family2.LensLike' f s a
javaGenerateEqualsAndHash
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "javaGenerateEqualsAndHash")
javaGenericServices ::
                    forall f s a .
                      (Prelude.Functor f,
                       Lens.Labels.HasLens' s "javaGenericServices" a) =>
                      Lens.Family2.LensLike' f s a
javaGenericServices
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "javaGenericServices")
javaMultipleFiles ::
                  forall f s a .
                    (Prelude.Functor f,
                     Lens.Labels.HasLens' s "javaMultipleFiles" a) =>
                    Lens.Family2.LensLike' f s a
javaMultipleFiles
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "javaMultipleFiles")
javaOuterClassname ::
                   forall f s a .
                     (Prelude.Functor f,
                      Lens.Labels.HasLens' s "javaOuterClassname" a) =>
                     Lens.Family2.LensLike' f s a
javaOuterClassname
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "javaOuterClassname")
javaPackage ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "javaPackage" a) =>
              Lens.Family2.LensLike' f s a
javaPackage
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "javaPackage")
javaStringCheckUtf8 ::
                    forall f s a .
                      (Prelude.Functor f,
                       Lens.Labels.HasLens' s "javaStringCheckUtf8" a) =>
                      Lens.Family2.LensLike' f s a
javaStringCheckUtf8
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "javaStringCheckUtf8")
jsonName ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "jsonName" a) =>
           Lens.Family2.LensLike' f s a
jsonName
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "jsonName")
jstype ::
       forall f s a .
         (Prelude.Functor f, Lens.Labels.HasLens' s "jstype" a) =>
         Lens.Family2.LensLike' f s a
jstype
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "jstype")
label ::
      forall f s a .
        (Prelude.Functor f, Lens.Labels.HasLens' s "label" a) =>
        Lens.Family2.LensLike' f s a
label
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "label")
lazy ::
     forall f s a .
       (Prelude.Functor f, Lens.Labels.HasLens' s "lazy" a) =>
       Lens.Family2.LensLike' f s a
lazy
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "lazy")
leadingComments ::
                forall f s a .
                  (Prelude.Functor f, Lens.Labels.HasLens' s "leadingComments" a) =>
                  Lens.Family2.LensLike' f s a
leadingComments
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "leadingComments")
leadingDetachedComments ::
                        forall f s a .
                          (Prelude.Functor f,
                           Lens.Labels.HasLens' s "leadingDetachedComments" a) =>
                          Lens.Family2.LensLike' f s a
leadingDetachedComments
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "leadingDetachedComments")
location ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "location" a) =>
           Lens.Family2.LensLike' f s a
location
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "location")
mapEntry ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "mapEntry" a) =>
           Lens.Family2.LensLike' f s a
mapEntry
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "mapEntry")
maybe'aggregateValue ::
                     forall f s a .
                       (Prelude.Functor f,
                        Lens.Labels.HasLens' s "maybe'aggregateValue" a) =>
                       Lens.Family2.LensLike' f s a
maybe'aggregateValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'aggregateValue")
maybe'allowAlias ::
                 forall f s a .
                   (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'allowAlias" a) =>
                   Lens.Family2.LensLike' f s a
maybe'allowAlias
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'allowAlias")
maybe'begin ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'begin" a) =>
              Lens.Family2.LensLike' f s a
maybe'begin
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'begin")
maybe'ccEnableArenas ::
                     forall f s a .
                       (Prelude.Functor f,
                        Lens.Labels.HasLens' s "maybe'ccEnableArenas" a) =>
                       Lens.Family2.LensLike' f s a
maybe'ccEnableArenas
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'ccEnableArenas")
maybe'ccGenericServices ::
                        forall f s a .
                          (Prelude.Functor f,
                           Lens.Labels.HasLens' s "maybe'ccGenericServices" a) =>
                          Lens.Family2.LensLike' f s a
maybe'ccGenericServices
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'ccGenericServices")
maybe'clientStreaming ::
                      forall f s a .
                        (Prelude.Functor f,
                         Lens.Labels.HasLens' s "maybe'clientStreaming" a) =>
                        Lens.Family2.LensLike' f s a
maybe'clientStreaming
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'clientStreaming")
maybe'csharpNamespace ::
                      forall f s a .
                        (Prelude.Functor f,
                         Lens.Labels.HasLens' s "maybe'csharpNamespace" a) =>
                        Lens.Family2.LensLike' f s a
maybe'csharpNamespace
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'csharpNamespace")
maybe'ctype ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'ctype" a) =>
              Lens.Family2.LensLike' f s a
maybe'ctype
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'ctype")
maybe'defaultValue ::
                   forall f s a .
                     (Prelude.Functor f,
                      Lens.Labels.HasLens' s "maybe'defaultValue" a) =>
                     Lens.Family2.LensLike' f s a
maybe'defaultValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'defaultValue")
maybe'deprecated ::
                 forall f s a .
                   (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'deprecated" a) =>
                   Lens.Family2.LensLike' f s a
maybe'deprecated
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'deprecated")
maybe'doubleValue ::
                  forall f s a .
                    (Prelude.Functor f,
                     Lens.Labels.HasLens' s "maybe'doubleValue" a) =>
                    Lens.Family2.LensLike' f s a
maybe'doubleValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'doubleValue")
maybe'end ::
          forall f s a .
            (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'end" a) =>
            Lens.Family2.LensLike' f s a
maybe'end
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'end")
maybe'extendee ::
               forall f s a .
                 (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'extendee" a) =>
                 Lens.Family2.LensLike' f s a
maybe'extendee
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'extendee")
maybe'goPackage ::
                forall f s a .
                  (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'goPackage" a) =>
                  Lens.Family2.LensLike' f s a
maybe'goPackage
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'goPackage")
maybe'identifierValue ::
                      forall f s a .
                        (Prelude.Functor f,
                         Lens.Labels.HasLens' s "maybe'identifierValue" a) =>
                        Lens.Family2.LensLike' f s a
maybe'identifierValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'identifierValue")
maybe'inputType ::
                forall f s a .
                  (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'inputType" a) =>
                  Lens.Family2.LensLike' f s a
maybe'inputType
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'inputType")
maybe'javaGenerateEqualsAndHash ::
                                forall f s a .
                                  (Prelude.Functor f,
                                   Lens.Labels.HasLens' s "maybe'javaGenerateEqualsAndHash" a) =>
                                  Lens.Family2.LensLike' f s a
maybe'javaGenerateEqualsAndHash
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'javaGenerateEqualsAndHash")
maybe'javaGenericServices ::
                          forall f s a .
                            (Prelude.Functor f,
                             Lens.Labels.HasLens' s "maybe'javaGenericServices" a) =>
                            Lens.Family2.LensLike' f s a
maybe'javaGenericServices
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'javaGenericServices")
maybe'javaMultipleFiles ::
                        forall f s a .
                          (Prelude.Functor f,
                           Lens.Labels.HasLens' s "maybe'javaMultipleFiles" a) =>
                          Lens.Family2.LensLike' f s a
maybe'javaMultipleFiles
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'javaMultipleFiles")
maybe'javaOuterClassname ::
                         forall f s a .
                           (Prelude.Functor f,
                            Lens.Labels.HasLens' s "maybe'javaOuterClassname" a) =>
                           Lens.Family2.LensLike' f s a
maybe'javaOuterClassname
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'javaOuterClassname")
maybe'javaPackage ::
                  forall f s a .
                    (Prelude.Functor f,
                     Lens.Labels.HasLens' s "maybe'javaPackage" a) =>
                    Lens.Family2.LensLike' f s a
maybe'javaPackage
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'javaPackage")
maybe'javaStringCheckUtf8 ::
                          forall f s a .
                            (Prelude.Functor f,
                             Lens.Labels.HasLens' s "maybe'javaStringCheckUtf8" a) =>
                            Lens.Family2.LensLike' f s a
maybe'javaStringCheckUtf8
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'javaStringCheckUtf8")
maybe'jsonName ::
               forall f s a .
                 (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'jsonName" a) =>
                 Lens.Family2.LensLike' f s a
maybe'jsonName
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'jsonName")
maybe'jstype ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'jstype" a) =>
               Lens.Family2.LensLike' f s a
maybe'jstype
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'jstype")
maybe'label ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'label" a) =>
              Lens.Family2.LensLike' f s a
maybe'label
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'label")
maybe'lazy ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'lazy" a) =>
             Lens.Family2.LensLike' f s a
maybe'lazy
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'lazy")
maybe'leadingComments ::
                      forall f s a .
                        (Prelude.Functor f,
                         Lens.Labels.HasLens' s "maybe'leadingComments" a) =>
                        Lens.Family2.LensLike' f s a
maybe'leadingComments
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'leadingComments")
maybe'mapEntry ::
               forall f s a .
                 (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'mapEntry" a) =>
                 Lens.Family2.LensLike' f s a
maybe'mapEntry
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'mapEntry")
maybe'messageSetWireFormat ::
                           forall f s a .
                             (Prelude.Functor f,
                              Lens.Labels.HasLens' s "maybe'messageSetWireFormat" a) =>
                             Lens.Family2.LensLike' f s a
maybe'messageSetWireFormat
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'messageSetWireFormat")
maybe'name ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'name" a) =>
             Lens.Family2.LensLike' f s a
maybe'name
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'name")
maybe'negativeIntValue ::
                       forall f s a .
                         (Prelude.Functor f,
                          Lens.Labels.HasLens' s "maybe'negativeIntValue" a) =>
                         Lens.Family2.LensLike' f s a
maybe'negativeIntValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'negativeIntValue")
maybe'noStandardDescriptorAccessor ::
                                   forall f s a .
                                     (Prelude.Functor f,
                                      Lens.Labels.HasLens' s "maybe'noStandardDescriptorAccessor"
                                        a) =>
                                     Lens.Family2.LensLike' f s a
maybe'noStandardDescriptorAccessor
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'noStandardDescriptorAccessor")
maybe'number ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'number" a) =>
               Lens.Family2.LensLike' f s a
maybe'number
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'number")
maybe'objcClassPrefix ::
                      forall f s a .
                        (Prelude.Functor f,
                         Lens.Labels.HasLens' s "maybe'objcClassPrefix" a) =>
                        Lens.Family2.LensLike' f s a
maybe'objcClassPrefix
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'objcClassPrefix")
maybe'oneofIndex ::
                 forall f s a .
                   (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'oneofIndex" a) =>
                   Lens.Family2.LensLike' f s a
maybe'oneofIndex
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'oneofIndex")
maybe'optimizeFor ::
                  forall f s a .
                    (Prelude.Functor f,
                     Lens.Labels.HasLens' s "maybe'optimizeFor" a) =>
                    Lens.Family2.LensLike' f s a
maybe'optimizeFor
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'optimizeFor")
maybe'options ::
              forall f s a .
                (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'options" a) =>
                Lens.Family2.LensLike' f s a
maybe'options
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'options")
maybe'outputType ::
                 forall f s a .
                   (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'outputType" a) =>
                   Lens.Family2.LensLike' f s a
maybe'outputType
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'outputType")
maybe'package ::
              forall f s a .
                (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'package" a) =>
                Lens.Family2.LensLike' f s a
maybe'package
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'package")
maybe'packed ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'packed" a) =>
               Lens.Family2.LensLike' f s a
maybe'packed
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'packed")
maybe'positiveIntValue ::
                       forall f s a .
                         (Prelude.Functor f,
                          Lens.Labels.HasLens' s "maybe'positiveIntValue" a) =>
                         Lens.Family2.LensLike' f s a
maybe'positiveIntValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'positiveIntValue")
maybe'pyGenericServices ::
                        forall f s a .
                          (Prelude.Functor f,
                           Lens.Labels.HasLens' s "maybe'pyGenericServices" a) =>
                          Lens.Family2.LensLike' f s a
maybe'pyGenericServices
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'pyGenericServices")
maybe'serverStreaming ::
                      forall f s a .
                        (Prelude.Functor f,
                         Lens.Labels.HasLens' s "maybe'serverStreaming" a) =>
                        Lens.Family2.LensLike' f s a
maybe'serverStreaming
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'serverStreaming")
maybe'sourceCodeInfo ::
                     forall f s a .
                       (Prelude.Functor f,
                        Lens.Labels.HasLens' s "maybe'sourceCodeInfo" a) =>
                       Lens.Family2.LensLike' f s a
maybe'sourceCodeInfo
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'sourceCodeInfo")
maybe'sourceFile ::
                 forall f s a .
                   (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'sourceFile" a) =>
                   Lens.Family2.LensLike' f s a
maybe'sourceFile
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'sourceFile")
maybe'start ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'start" a) =>
              Lens.Family2.LensLike' f s a
maybe'start
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'start")
maybe'stringValue ::
                  forall f s a .
                    (Prelude.Functor f,
                     Lens.Labels.HasLens' s "maybe'stringValue" a) =>
                    Lens.Family2.LensLike' f s a
maybe'stringValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'stringValue")
maybe'syntax ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'syntax" a) =>
               Lens.Family2.LensLike' f s a
maybe'syntax
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'syntax")
maybe'trailingComments ::
                       forall f s a .
                         (Prelude.Functor f,
                          Lens.Labels.HasLens' s "maybe'trailingComments" a) =>
                         Lens.Family2.LensLike' f s a
maybe'trailingComments
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'trailingComments")
maybe'type' ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'type'" a) =>
              Lens.Family2.LensLike' f s a
maybe'type'
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'type'")
maybe'typeName ::
               forall f s a .
                 (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'typeName" a) =>
                 Lens.Family2.LensLike' f s a
maybe'typeName
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'typeName")
maybe'weak ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'weak" a) =>
             Lens.Family2.LensLike' f s a
maybe'weak
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'weak")
messageSetWireFormat ::
                     forall f s a .
                       (Prelude.Functor f,
                        Lens.Labels.HasLens' s "messageSetWireFormat" a) =>
                       Lens.Family2.LensLike' f s a
messageSetWireFormat
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "messageSetWireFormat")
messageType ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "messageType" a) =>
              Lens.Family2.LensLike' f s a
messageType
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "messageType")
method ::
       forall f s a .
         (Prelude.Functor f, Lens.Labels.HasLens' s "method" a) =>
         Lens.Family2.LensLike' f s a
method
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "method")
name ::
     forall f s a .
       (Prelude.Functor f, Lens.Labels.HasLens' s "name" a) =>
       Lens.Family2.LensLike' f s a
name
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "name")
namePart ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "namePart" a) =>
           Lens.Family2.LensLike' f s a
namePart
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "namePart")
negativeIntValue ::
                 forall f s a .
                   (Prelude.Functor f, Lens.Labels.HasLens' s "negativeIntValue" a) =>
                   Lens.Family2.LensLike' f s a
negativeIntValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "negativeIntValue")
nestedType ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "nestedType" a) =>
             Lens.Family2.LensLike' f s a
nestedType
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "nestedType")
noStandardDescriptorAccessor ::
                             forall f s a .
                               (Prelude.Functor f,
                                Lens.Labels.HasLens' s "noStandardDescriptorAccessor" a) =>
                               Lens.Family2.LensLike' f s a
noStandardDescriptorAccessor
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "noStandardDescriptorAccessor")
number ::
       forall f s a .
         (Prelude.Functor f, Lens.Labels.HasLens' s "number" a) =>
         Lens.Family2.LensLike' f s a
number
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "number")
objcClassPrefix ::
                forall f s a .
                  (Prelude.Functor f, Lens.Labels.HasLens' s "objcClassPrefix" a) =>
                  Lens.Family2.LensLike' f s a
objcClassPrefix
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "objcClassPrefix")
oneofDecl ::
          forall f s a .
            (Prelude.Functor f, Lens.Labels.HasLens' s "oneofDecl" a) =>
            Lens.Family2.LensLike' f s a
oneofDecl
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "oneofDecl")
oneofIndex ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "oneofIndex" a) =>
             Lens.Family2.LensLike' f s a
oneofIndex
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "oneofIndex")
optimizeFor ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "optimizeFor" a) =>
              Lens.Family2.LensLike' f s a
optimizeFor
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "optimizeFor")
options ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "options" a) =>
          Lens.Family2.LensLike' f s a
options
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "options")
outputType ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "outputType" a) =>
             Lens.Family2.LensLike' f s a
outputType
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "outputType")
package ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "package" a) =>
          Lens.Family2.LensLike' f s a
package
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "package")
packed ::
       forall f s a .
         (Prelude.Functor f, Lens.Labels.HasLens' s "packed" a) =>
         Lens.Family2.LensLike' f s a
packed
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "packed")
path ::
     forall f s a .
       (Prelude.Functor f, Lens.Labels.HasLens' s "path" a) =>
       Lens.Family2.LensLike' f s a
path
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "path")
positiveIntValue ::
                 forall f s a .
                   (Prelude.Functor f, Lens.Labels.HasLens' s "positiveIntValue" a) =>
                   Lens.Family2.LensLike' f s a
positiveIntValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "positiveIntValue")
publicDependency ::
                 forall f s a .
                   (Prelude.Functor f, Lens.Labels.HasLens' s "publicDependency" a) =>
                   Lens.Family2.LensLike' f s a
publicDependency
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "publicDependency")
pyGenericServices ::
                  forall f s a .
                    (Prelude.Functor f,
                     Lens.Labels.HasLens' s "pyGenericServices" a) =>
                    Lens.Family2.LensLike' f s a
pyGenericServices
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "pyGenericServices")
reservedName ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "reservedName" a) =>
               Lens.Family2.LensLike' f s a
reservedName
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "reservedName")
reservedRange ::
              forall f s a .
                (Prelude.Functor f, Lens.Labels.HasLens' s "reservedRange" a) =>
                Lens.Family2.LensLike' f s a
reservedRange
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "reservedRange")
serverStreaming ::
                forall f s a .
                  (Prelude.Functor f, Lens.Labels.HasLens' s "serverStreaming" a) =>
                  Lens.Family2.LensLike' f s a
serverStreaming
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "serverStreaming")
service ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "service" a) =>
          Lens.Family2.LensLike' f s a
service
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "service")
sourceCodeInfo ::
               forall f s a .
                 (Prelude.Functor f, Lens.Labels.HasLens' s "sourceCodeInfo" a) =>
                 Lens.Family2.LensLike' f s a
sourceCodeInfo
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "sourceCodeInfo")
sourceFile ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "sourceFile" a) =>
             Lens.Family2.LensLike' f s a
sourceFile
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "sourceFile")
span ::
     forall f s a .
       (Prelude.Functor f, Lens.Labels.HasLens' s "span" a) =>
       Lens.Family2.LensLike' f s a
span
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "span")
start ::
      forall f s a .
        (Prelude.Functor f, Lens.Labels.HasLens' s "start" a) =>
        Lens.Family2.LensLike' f s a
start
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "start")
stringValue ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "stringValue" a) =>
              Lens.Family2.LensLike' f s a
stringValue
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "stringValue")
syntax ::
       forall f s a .
         (Prelude.Functor f, Lens.Labels.HasLens' s "syntax" a) =>
         Lens.Family2.LensLike' f s a
syntax
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "syntax")
trailingComments ::
                 forall f s a .
                   (Prelude.Functor f, Lens.Labels.HasLens' s "trailingComments" a) =>
                   Lens.Family2.LensLike' f s a
trailingComments
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "trailingComments")
type' ::
      forall f s a .
        (Prelude.Functor f, Lens.Labels.HasLens' s "type'" a) =>
        Lens.Family2.LensLike' f s a
type'
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "type'")
typeName ::
         forall f s a .
           (Prelude.Functor f, Lens.Labels.HasLens' s "typeName" a) =>
           Lens.Family2.LensLike' f s a
typeName
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "typeName")
uninterpretedOption ::
                    forall f s a .
                      (Prelude.Functor f,
                       Lens.Labels.HasLens' s "uninterpretedOption" a) =>
                      Lens.Family2.LensLike' f s a
uninterpretedOption
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "uninterpretedOption")
value ::
      forall f s a .
        (Prelude.Functor f, Lens.Labels.HasLens' s "value" a) =>
        Lens.Family2.LensLike' f s a
value
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "value")
weak ::
     forall f s a .
       (Prelude.Functor f, Lens.Labels.HasLens' s "weak" a) =>
       Lens.Family2.LensLike' f s a
weak
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "weak")
weakDependency ::
               forall f s a .
                 (Prelude.Functor f, Lens.Labels.HasLens' s "weakDependency" a) =>
                 Lens.Family2.LensLike' f s a
weakDependency
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "weakDependency")