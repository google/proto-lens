{- This file was auto-generated from google/protobuf/descriptor.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies,
  UndecidableInstances, MultiParamTypeClasses, FlexibleContexts,
  FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude
  #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Proto.Google.Protobuf.Descriptor'Fields where
import qualified Prelude
import qualified Data.Int
import qualified Data.Word
import qualified Data.ProtoLens
import qualified Data.ProtoLens.Message.Enum
import qualified Lens.Family2
import qualified Lens.Family2.Unchecked
import qualified Data.Default.Class
import qualified Data.Text
import qualified Data.Map
import qualified Data.ByteString
import qualified Lens.Labels

aggregateValue ::
               forall f s t a b .
                 Lens.Labels.HasLens "aggregateValue" f s t a b =>
                 Lens.Family2.LensLike f s t a b
aggregateValue
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "aggregateValue")

allowAlias ::
           forall f s t a b . Lens.Labels.HasLens "allowAlias" f s t a b =>
             Lens.Family2.LensLike f s t a b
allowAlias
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "allowAlias")

annotation ::
           forall f s t a b . Lens.Labels.HasLens "annotation" f s t a b =>
             Lens.Family2.LensLike f s t a b
annotation
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "annotation")

begin ::
      forall f s t a b . Lens.Labels.HasLens "begin" f s t a b =>
        Lens.Family2.LensLike f s t a b
begin
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "begin")

ccEnableArenas ::
               forall f s t a b .
                 Lens.Labels.HasLens "ccEnableArenas" f s t a b =>
                 Lens.Family2.LensLike f s t a b
ccEnableArenas
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "ccEnableArenas")

ccGenericServices ::
                  forall f s t a b .
                    Lens.Labels.HasLens "ccGenericServices" f s t a b =>
                    Lens.Family2.LensLike f s t a b
ccGenericServices
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "ccGenericServices")

clientStreaming ::
                forall f s t a b .
                  Lens.Labels.HasLens "clientStreaming" f s t a b =>
                  Lens.Family2.LensLike f s t a b
clientStreaming
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "clientStreaming")

csharpNamespace ::
                forall f s t a b .
                  Lens.Labels.HasLens "csharpNamespace" f s t a b =>
                  Lens.Family2.LensLike f s t a b
csharpNamespace
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "csharpNamespace")

ctype ::
      forall f s t a b . Lens.Labels.HasLens "ctype" f s t a b =>
        Lens.Family2.LensLike f s t a b
ctype
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "ctype")

defaultValue ::
             forall f s t a b . Lens.Labels.HasLens "defaultValue" f s t a b =>
               Lens.Family2.LensLike f s t a b
defaultValue
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "defaultValue")

dependency ::
           forall f s t a b . Lens.Labels.HasLens "dependency" f s t a b =>
             Lens.Family2.LensLike f s t a b
dependency
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "dependency")

deprecated ::
           forall f s t a b . Lens.Labels.HasLens "deprecated" f s t a b =>
             Lens.Family2.LensLike f s t a b
deprecated
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "deprecated")

doubleValue ::
            forall f s t a b . Lens.Labels.HasLens "doubleValue" f s t a b =>
              Lens.Family2.LensLike f s t a b
doubleValue
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "doubleValue")

end ::
    forall f s t a b . Lens.Labels.HasLens "end" f s t a b =>
      Lens.Family2.LensLike f s t a b
end
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "end")

enumType ::
         forall f s t a b . Lens.Labels.HasLens "enumType" f s t a b =>
           Lens.Family2.LensLike f s t a b
enumType
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "enumType")

extendee ::
         forall f s t a b . Lens.Labels.HasLens "extendee" f s t a b =>
           Lens.Family2.LensLike f s t a b
extendee
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "extendee")

extension ::
          forall f s t a b . Lens.Labels.HasLens "extension" f s t a b =>
            Lens.Family2.LensLike f s t a b
extension
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "extension")

extensionRange ::
               forall f s t a b .
                 Lens.Labels.HasLens "extensionRange" f s t a b =>
                 Lens.Family2.LensLike f s t a b
extensionRange
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "extensionRange")

field ::
      forall f s t a b . Lens.Labels.HasLens "field" f s t a b =>
        Lens.Family2.LensLike f s t a b
field
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "field")

file ::
     forall f s t a b . Lens.Labels.HasLens "file" f s t a b =>
       Lens.Family2.LensLike f s t a b
file
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "file")

goPackage ::
          forall f s t a b . Lens.Labels.HasLens "goPackage" f s t a b =>
            Lens.Family2.LensLike f s t a b
goPackage
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "goPackage")

identifierValue ::
                forall f s t a b .
                  Lens.Labels.HasLens "identifierValue" f s t a b =>
                  Lens.Family2.LensLike f s t a b
identifierValue
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "identifierValue")

inputType ::
          forall f s t a b . Lens.Labels.HasLens "inputType" f s t a b =>
            Lens.Family2.LensLike f s t a b
inputType
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "inputType")

isExtension ::
            forall f s t a b . Lens.Labels.HasLens "isExtension" f s t a b =>
              Lens.Family2.LensLike f s t a b
isExtension
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "isExtension")

javaGenerateEqualsAndHash ::
                          forall f s t a b .
                            Lens.Labels.HasLens "javaGenerateEqualsAndHash" f s t a b =>
                            Lens.Family2.LensLike f s t a b
javaGenerateEqualsAndHash
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "javaGenerateEqualsAndHash")

javaGenericServices ::
                    forall f s t a b .
                      Lens.Labels.HasLens "javaGenericServices" f s t a b =>
                      Lens.Family2.LensLike f s t a b
javaGenericServices
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "javaGenericServices")

javaMultipleFiles ::
                  forall f s t a b .
                    Lens.Labels.HasLens "javaMultipleFiles" f s t a b =>
                    Lens.Family2.LensLike f s t a b
javaMultipleFiles
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "javaMultipleFiles")

javaOuterClassname ::
                   forall f s t a b .
                     Lens.Labels.HasLens "javaOuterClassname" f s t a b =>
                     Lens.Family2.LensLike f s t a b
javaOuterClassname
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "javaOuterClassname")

javaPackage ::
            forall f s t a b . Lens.Labels.HasLens "javaPackage" f s t a b =>
              Lens.Family2.LensLike f s t a b
javaPackage
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "javaPackage")

javaStringCheckUtf8 ::
                    forall f s t a b .
                      Lens.Labels.HasLens "javaStringCheckUtf8" f s t a b =>
                      Lens.Family2.LensLike f s t a b
javaStringCheckUtf8
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "javaStringCheckUtf8")

jsonName ::
         forall f s t a b . Lens.Labels.HasLens "jsonName" f s t a b =>
           Lens.Family2.LensLike f s t a b
jsonName
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "jsonName")

jstype ::
       forall f s t a b . Lens.Labels.HasLens "jstype" f s t a b =>
         Lens.Family2.LensLike f s t a b
jstype
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "jstype")

label ::
      forall f s t a b . Lens.Labels.HasLens "label" f s t a b =>
        Lens.Family2.LensLike f s t a b
label
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "label")

lazy ::
     forall f s t a b . Lens.Labels.HasLens "lazy" f s t a b =>
       Lens.Family2.LensLike f s t a b
lazy
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "lazy")

leadingComments ::
                forall f s t a b .
                  Lens.Labels.HasLens "leadingComments" f s t a b =>
                  Lens.Family2.LensLike f s t a b
leadingComments
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "leadingComments")

leadingDetachedComments ::
                        forall f s t a b .
                          Lens.Labels.HasLens "leadingDetachedComments" f s t a b =>
                          Lens.Family2.LensLike f s t a b
leadingDetachedComments
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "leadingDetachedComments")

location ::
         forall f s t a b . Lens.Labels.HasLens "location" f s t a b =>
           Lens.Family2.LensLike f s t a b
location
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "location")

mapEntry ::
         forall f s t a b . Lens.Labels.HasLens "mapEntry" f s t a b =>
           Lens.Family2.LensLike f s t a b
mapEntry
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "mapEntry")

maybe'aggregateValue ::
                     forall f s t a b .
                       Lens.Labels.HasLens "maybe'aggregateValue" f s t a b =>
                       Lens.Family2.LensLike f s t a b
maybe'aggregateValue
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'aggregateValue")

maybe'allowAlias ::
                 forall f s t a b .
                   Lens.Labels.HasLens "maybe'allowAlias" f s t a b =>
                   Lens.Family2.LensLike f s t a b
maybe'allowAlias
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'allowAlias")

maybe'begin ::
            forall f s t a b . Lens.Labels.HasLens "maybe'begin" f s t a b =>
              Lens.Family2.LensLike f s t a b
maybe'begin
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'begin")

maybe'ccEnableArenas ::
                     forall f s t a b .
                       Lens.Labels.HasLens "maybe'ccEnableArenas" f s t a b =>
                       Lens.Family2.LensLike f s t a b
maybe'ccEnableArenas
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'ccEnableArenas")

maybe'ccGenericServices ::
                        forall f s t a b .
                          Lens.Labels.HasLens "maybe'ccGenericServices" f s t a b =>
                          Lens.Family2.LensLike f s t a b
maybe'ccGenericServices
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'ccGenericServices")

maybe'clientStreaming ::
                      forall f s t a b .
                        Lens.Labels.HasLens "maybe'clientStreaming" f s t a b =>
                        Lens.Family2.LensLike f s t a b
maybe'clientStreaming
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'clientStreaming")

maybe'csharpNamespace ::
                      forall f s t a b .
                        Lens.Labels.HasLens "maybe'csharpNamespace" f s t a b =>
                        Lens.Family2.LensLike f s t a b
maybe'csharpNamespace
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'csharpNamespace")

maybe'ctype ::
            forall f s t a b . Lens.Labels.HasLens "maybe'ctype" f s t a b =>
              Lens.Family2.LensLike f s t a b
maybe'ctype
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'ctype")

maybe'defaultValue ::
                   forall f s t a b .
                     Lens.Labels.HasLens "maybe'defaultValue" f s t a b =>
                     Lens.Family2.LensLike f s t a b
maybe'defaultValue
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'defaultValue")

maybe'deprecated ::
                 forall f s t a b .
                   Lens.Labels.HasLens "maybe'deprecated" f s t a b =>
                   Lens.Family2.LensLike f s t a b
maybe'deprecated
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'deprecated")

maybe'doubleValue ::
                  forall f s t a b .
                    Lens.Labels.HasLens "maybe'doubleValue" f s t a b =>
                    Lens.Family2.LensLike f s t a b
maybe'doubleValue
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'doubleValue")

maybe'end ::
          forall f s t a b . Lens.Labels.HasLens "maybe'end" f s t a b =>
            Lens.Family2.LensLike f s t a b
maybe'end
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'end")

maybe'extendee ::
               forall f s t a b .
                 Lens.Labels.HasLens "maybe'extendee" f s t a b =>
                 Lens.Family2.LensLike f s t a b
maybe'extendee
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'extendee")

maybe'goPackage ::
                forall f s t a b .
                  Lens.Labels.HasLens "maybe'goPackage" f s t a b =>
                  Lens.Family2.LensLike f s t a b
maybe'goPackage
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'goPackage")

maybe'identifierValue ::
                      forall f s t a b .
                        Lens.Labels.HasLens "maybe'identifierValue" f s t a b =>
                        Lens.Family2.LensLike f s t a b
maybe'identifierValue
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'identifierValue")

maybe'inputType ::
                forall f s t a b .
                  Lens.Labels.HasLens "maybe'inputType" f s t a b =>
                  Lens.Family2.LensLike f s t a b
maybe'inputType
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'inputType")

maybe'javaGenerateEqualsAndHash ::
                                forall f s t a b .
                                  Lens.Labels.HasLens "maybe'javaGenerateEqualsAndHash" f s t a b =>
                                  Lens.Family2.LensLike f s t a b
maybe'javaGenerateEqualsAndHash
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'javaGenerateEqualsAndHash")

maybe'javaGenericServices ::
                          forall f s t a b .
                            Lens.Labels.HasLens "maybe'javaGenericServices" f s t a b =>
                            Lens.Family2.LensLike f s t a b
maybe'javaGenericServices
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'javaGenericServices")

maybe'javaMultipleFiles ::
                        forall f s t a b .
                          Lens.Labels.HasLens "maybe'javaMultipleFiles" f s t a b =>
                          Lens.Family2.LensLike f s t a b
maybe'javaMultipleFiles
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'javaMultipleFiles")

maybe'javaOuterClassname ::
                         forall f s t a b .
                           Lens.Labels.HasLens "maybe'javaOuterClassname" f s t a b =>
                           Lens.Family2.LensLike f s t a b
maybe'javaOuterClassname
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'javaOuterClassname")

maybe'javaPackage ::
                  forall f s t a b .
                    Lens.Labels.HasLens "maybe'javaPackage" f s t a b =>
                    Lens.Family2.LensLike f s t a b
maybe'javaPackage
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'javaPackage")

maybe'javaStringCheckUtf8 ::
                          forall f s t a b .
                            Lens.Labels.HasLens "maybe'javaStringCheckUtf8" f s t a b =>
                            Lens.Family2.LensLike f s t a b
maybe'javaStringCheckUtf8
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'javaStringCheckUtf8")

maybe'jsonName ::
               forall f s t a b .
                 Lens.Labels.HasLens "maybe'jsonName" f s t a b =>
                 Lens.Family2.LensLike f s t a b
maybe'jsonName
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'jsonName")

maybe'jstype ::
             forall f s t a b . Lens.Labels.HasLens "maybe'jstype" f s t a b =>
               Lens.Family2.LensLike f s t a b
maybe'jstype
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'jstype")

maybe'label ::
            forall f s t a b . Lens.Labels.HasLens "maybe'label" f s t a b =>
              Lens.Family2.LensLike f s t a b
maybe'label
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'label")

maybe'lazy ::
           forall f s t a b . Lens.Labels.HasLens "maybe'lazy" f s t a b =>
             Lens.Family2.LensLike f s t a b
maybe'lazy
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'lazy")

maybe'leadingComments ::
                      forall f s t a b .
                        Lens.Labels.HasLens "maybe'leadingComments" f s t a b =>
                        Lens.Family2.LensLike f s t a b
maybe'leadingComments
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'leadingComments")

maybe'mapEntry ::
               forall f s t a b .
                 Lens.Labels.HasLens "maybe'mapEntry" f s t a b =>
                 Lens.Family2.LensLike f s t a b
maybe'mapEntry
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'mapEntry")

maybe'messageSetWireFormat ::
                           forall f s t a b .
                             Lens.Labels.HasLens "maybe'messageSetWireFormat" f s t a b =>
                             Lens.Family2.LensLike f s t a b
maybe'messageSetWireFormat
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'messageSetWireFormat")

maybe'name ::
           forall f s t a b . Lens.Labels.HasLens "maybe'name" f s t a b =>
             Lens.Family2.LensLike f s t a b
maybe'name
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'name")

maybe'negativeIntValue ::
                       forall f s t a b .
                         Lens.Labels.HasLens "maybe'negativeIntValue" f s t a b =>
                         Lens.Family2.LensLike f s t a b
maybe'negativeIntValue
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'negativeIntValue")

maybe'noStandardDescriptorAccessor ::
                                   forall f s t a b .
                                     Lens.Labels.HasLens "maybe'noStandardDescriptorAccessor" f s t
                                       a b =>
                                     Lens.Family2.LensLike f s t a b
maybe'noStandardDescriptorAccessor
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'noStandardDescriptorAccessor")

maybe'number ::
             forall f s t a b . Lens.Labels.HasLens "maybe'number" f s t a b =>
               Lens.Family2.LensLike f s t a b
maybe'number
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'number")

maybe'objcClassPrefix ::
                      forall f s t a b .
                        Lens.Labels.HasLens "maybe'objcClassPrefix" f s t a b =>
                        Lens.Family2.LensLike f s t a b
maybe'objcClassPrefix
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'objcClassPrefix")

maybe'oneofIndex ::
                 forall f s t a b .
                   Lens.Labels.HasLens "maybe'oneofIndex" f s t a b =>
                   Lens.Family2.LensLike f s t a b
maybe'oneofIndex
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'oneofIndex")

maybe'optimizeFor ::
                  forall f s t a b .
                    Lens.Labels.HasLens "maybe'optimizeFor" f s t a b =>
                    Lens.Family2.LensLike f s t a b
maybe'optimizeFor
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'optimizeFor")

maybe'options ::
              forall f s t a b . Lens.Labels.HasLens "maybe'options" f s t a b =>
                Lens.Family2.LensLike f s t a b
maybe'options
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'options")

maybe'outputType ::
                 forall f s t a b .
                   Lens.Labels.HasLens "maybe'outputType" f s t a b =>
                   Lens.Family2.LensLike f s t a b
maybe'outputType
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'outputType")

maybe'package ::
              forall f s t a b . Lens.Labels.HasLens "maybe'package" f s t a b =>
                Lens.Family2.LensLike f s t a b
maybe'package
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'package")

maybe'packed ::
             forall f s t a b . Lens.Labels.HasLens "maybe'packed" f s t a b =>
               Lens.Family2.LensLike f s t a b
maybe'packed
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'packed")

maybe'positiveIntValue ::
                       forall f s t a b .
                         Lens.Labels.HasLens "maybe'positiveIntValue" f s t a b =>
                         Lens.Family2.LensLike f s t a b
maybe'positiveIntValue
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'positiveIntValue")

maybe'pyGenericServices ::
                        forall f s t a b .
                          Lens.Labels.HasLens "maybe'pyGenericServices" f s t a b =>
                          Lens.Family2.LensLike f s t a b
maybe'pyGenericServices
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'pyGenericServices")

maybe'serverStreaming ::
                      forall f s t a b .
                        Lens.Labels.HasLens "maybe'serverStreaming" f s t a b =>
                        Lens.Family2.LensLike f s t a b
maybe'serverStreaming
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'serverStreaming")

maybe'sourceCodeInfo ::
                     forall f s t a b .
                       Lens.Labels.HasLens "maybe'sourceCodeInfo" f s t a b =>
                       Lens.Family2.LensLike f s t a b
maybe'sourceCodeInfo
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'sourceCodeInfo")

maybe'sourceFile ::
                 forall f s t a b .
                   Lens.Labels.HasLens "maybe'sourceFile" f s t a b =>
                   Lens.Family2.LensLike f s t a b
maybe'sourceFile
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'sourceFile")

maybe'start ::
            forall f s t a b . Lens.Labels.HasLens "maybe'start" f s t a b =>
              Lens.Family2.LensLike f s t a b
maybe'start
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'start")

maybe'stringValue ::
                  forall f s t a b .
                    Lens.Labels.HasLens "maybe'stringValue" f s t a b =>
                    Lens.Family2.LensLike f s t a b
maybe'stringValue
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'stringValue")

maybe'syntax ::
             forall f s t a b . Lens.Labels.HasLens "maybe'syntax" f s t a b =>
               Lens.Family2.LensLike f s t a b
maybe'syntax
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'syntax")

maybe'trailingComments ::
                       forall f s t a b .
                         Lens.Labels.HasLens "maybe'trailingComments" f s t a b =>
                         Lens.Family2.LensLike f s t a b
maybe'trailingComments
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'trailingComments")

maybe'type' ::
            forall f s t a b . Lens.Labels.HasLens "maybe'type'" f s t a b =>
              Lens.Family2.LensLike f s t a b
maybe'type'
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'type'")

maybe'typeName ::
               forall f s t a b .
                 Lens.Labels.HasLens "maybe'typeName" f s t a b =>
                 Lens.Family2.LensLike f s t a b
maybe'typeName
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'typeName")

maybe'weak ::
           forall f s t a b . Lens.Labels.HasLens "maybe'weak" f s t a b =>
             Lens.Family2.LensLike f s t a b
maybe'weak
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'weak")

messageSetWireFormat ::
                     forall f s t a b .
                       Lens.Labels.HasLens "messageSetWireFormat" f s t a b =>
                       Lens.Family2.LensLike f s t a b
messageSetWireFormat
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "messageSetWireFormat")

messageType ::
            forall f s t a b . Lens.Labels.HasLens "messageType" f s t a b =>
              Lens.Family2.LensLike f s t a b
messageType
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "messageType")

method ::
       forall f s t a b . Lens.Labels.HasLens "method" f s t a b =>
         Lens.Family2.LensLike f s t a b
method
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "method")

name ::
     forall f s t a b . Lens.Labels.HasLens "name" f s t a b =>
       Lens.Family2.LensLike f s t a b
name
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "name")

namePart ::
         forall f s t a b . Lens.Labels.HasLens "namePart" f s t a b =>
           Lens.Family2.LensLike f s t a b
namePart
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "namePart")

negativeIntValue ::
                 forall f s t a b .
                   Lens.Labels.HasLens "negativeIntValue" f s t a b =>
                   Lens.Family2.LensLike f s t a b
negativeIntValue
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "negativeIntValue")

nestedType ::
           forall f s t a b . Lens.Labels.HasLens "nestedType" f s t a b =>
             Lens.Family2.LensLike f s t a b
nestedType
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "nestedType")

noStandardDescriptorAccessor ::
                             forall f s t a b .
                               Lens.Labels.HasLens "noStandardDescriptorAccessor" f s t a b =>
                               Lens.Family2.LensLike f s t a b
noStandardDescriptorAccessor
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "noStandardDescriptorAccessor")

number ::
       forall f s t a b . Lens.Labels.HasLens "number" f s t a b =>
         Lens.Family2.LensLike f s t a b
number
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "number")

objcClassPrefix ::
                forall f s t a b .
                  Lens.Labels.HasLens "objcClassPrefix" f s t a b =>
                  Lens.Family2.LensLike f s t a b
objcClassPrefix
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "objcClassPrefix")

oneofDecl ::
          forall f s t a b . Lens.Labels.HasLens "oneofDecl" f s t a b =>
            Lens.Family2.LensLike f s t a b
oneofDecl
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "oneofDecl")

oneofIndex ::
           forall f s t a b . Lens.Labels.HasLens "oneofIndex" f s t a b =>
             Lens.Family2.LensLike f s t a b
oneofIndex
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "oneofIndex")

optimizeFor ::
            forall f s t a b . Lens.Labels.HasLens "optimizeFor" f s t a b =>
              Lens.Family2.LensLike f s t a b
optimizeFor
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "optimizeFor")

options ::
        forall f s t a b . Lens.Labels.HasLens "options" f s t a b =>
          Lens.Family2.LensLike f s t a b
options
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "options")

outputType ::
           forall f s t a b . Lens.Labels.HasLens "outputType" f s t a b =>
             Lens.Family2.LensLike f s t a b
outputType
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "outputType")

package ::
        forall f s t a b . Lens.Labels.HasLens "package" f s t a b =>
          Lens.Family2.LensLike f s t a b
package
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "package")

packed ::
       forall f s t a b . Lens.Labels.HasLens "packed" f s t a b =>
         Lens.Family2.LensLike f s t a b
packed
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "packed")

path ::
     forall f s t a b . Lens.Labels.HasLens "path" f s t a b =>
       Lens.Family2.LensLike f s t a b
path
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "path")

positiveIntValue ::
                 forall f s t a b .
                   Lens.Labels.HasLens "positiveIntValue" f s t a b =>
                   Lens.Family2.LensLike f s t a b
positiveIntValue
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "positiveIntValue")

publicDependency ::
                 forall f s t a b .
                   Lens.Labels.HasLens "publicDependency" f s t a b =>
                   Lens.Family2.LensLike f s t a b
publicDependency
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "publicDependency")

pyGenericServices ::
                  forall f s t a b .
                    Lens.Labels.HasLens "pyGenericServices" f s t a b =>
                    Lens.Family2.LensLike f s t a b
pyGenericServices
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "pyGenericServices")

reservedName ::
             forall f s t a b . Lens.Labels.HasLens "reservedName" f s t a b =>
               Lens.Family2.LensLike f s t a b
reservedName
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "reservedName")

reservedRange ::
              forall f s t a b . Lens.Labels.HasLens "reservedRange" f s t a b =>
                Lens.Family2.LensLike f s t a b
reservedRange
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "reservedRange")

serverStreaming ::
                forall f s t a b .
                  Lens.Labels.HasLens "serverStreaming" f s t a b =>
                  Lens.Family2.LensLike f s t a b
serverStreaming
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "serverStreaming")

service ::
        forall f s t a b . Lens.Labels.HasLens "service" f s t a b =>
          Lens.Family2.LensLike f s t a b
service
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "service")

sourceCodeInfo ::
               forall f s t a b .
                 Lens.Labels.HasLens "sourceCodeInfo" f s t a b =>
                 Lens.Family2.LensLike f s t a b
sourceCodeInfo
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "sourceCodeInfo")

sourceFile ::
           forall f s t a b . Lens.Labels.HasLens "sourceFile" f s t a b =>
             Lens.Family2.LensLike f s t a b
sourceFile
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "sourceFile")

span ::
     forall f s t a b . Lens.Labels.HasLens "span" f s t a b =>
       Lens.Family2.LensLike f s t a b
span
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "span")

start ::
      forall f s t a b . Lens.Labels.HasLens "start" f s t a b =>
        Lens.Family2.LensLike f s t a b
start
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "start")

stringValue ::
            forall f s t a b . Lens.Labels.HasLens "stringValue" f s t a b =>
              Lens.Family2.LensLike f s t a b
stringValue
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "stringValue")

syntax ::
       forall f s t a b . Lens.Labels.HasLens "syntax" f s t a b =>
         Lens.Family2.LensLike f s t a b
syntax
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "syntax")

trailingComments ::
                 forall f s t a b .
                   Lens.Labels.HasLens "trailingComments" f s t a b =>
                   Lens.Family2.LensLike f s t a b
trailingComments
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "trailingComments")

type' ::
      forall f s t a b . Lens.Labels.HasLens "type'" f s t a b =>
        Lens.Family2.LensLike f s t a b
type'
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "type'")

typeName ::
         forall f s t a b . Lens.Labels.HasLens "typeName" f s t a b =>
           Lens.Family2.LensLike f s t a b
typeName
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "typeName")

uninterpretedOption ::
                    forall f s t a b .
                      Lens.Labels.HasLens "uninterpretedOption" f s t a b =>
                      Lens.Family2.LensLike f s t a b
uninterpretedOption
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "uninterpretedOption")

value ::
      forall f s t a b . Lens.Labels.HasLens "value" f s t a b =>
        Lens.Family2.LensLike f s t a b
value
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "value")

weak ::
     forall f s t a b . Lens.Labels.HasLens "weak" f s t a b =>
       Lens.Family2.LensLike f s t a b
weak
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "weak")

weakDependency ::
               forall f s t a b .
                 Lens.Labels.HasLens "weakDependency" f s t a b =>
                 Lens.Family2.LensLike f s t a b
weakDependency
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "weakDependency")