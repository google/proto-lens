{- This file was auto-generated from google/protobuf/descriptor.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Google.Protobuf.Descriptor (
        DescriptorProto(), DescriptorProto'ExtensionRange(),
        DescriptorProto'ReservedRange(), Edition(..), Edition(),
        EnumDescriptorProto(), EnumDescriptorProto'EnumReservedRange(),
        EnumOptions(), EnumValueDescriptorProto(), EnumValueOptions(),
        ExtensionRangeOptions(), ExtensionRangeOptions'Declaration(),
        ExtensionRangeOptions'VerificationState(..),
        ExtensionRangeOptions'VerificationState(), FeatureSet(),
        FeatureSet'EnumType(..), FeatureSet'EnumType(),
        FeatureSet'FieldPresence(..), FeatureSet'FieldPresence(),
        FeatureSet'JsonFormat(..), FeatureSet'JsonFormat(),
        FeatureSet'MessageEncoding(..), FeatureSet'MessageEncoding(),
        FeatureSet'RepeatedFieldEncoding(..),
        FeatureSet'RepeatedFieldEncoding(), FeatureSet'Utf8Validation(..),
        FeatureSet'Utf8Validation(), FeatureSetDefaults(),
        FeatureSetDefaults'FeatureSetEditionDefault(),
        FieldDescriptorProto(), FieldDescriptorProto'Label(..),
        FieldDescriptorProto'Label(), FieldDescriptorProto'Type(..),
        FieldDescriptorProto'Type(), FieldOptions(),
        FieldOptions'CType(..), FieldOptions'CType(),
        FieldOptions'EditionDefault(), FieldOptions'FeatureSupport(),
        FieldOptions'JSType(..), FieldOptions'JSType(),
        FieldOptions'OptionRetention(..), FieldOptions'OptionRetention(),
        FieldOptions'OptionTargetType(..), FieldOptions'OptionTargetType(),
        FileDescriptorProto(), FileDescriptorSet(), FileOptions(),
        FileOptions'OptimizeMode(..), FileOptions'OptimizeMode(),
        GeneratedCodeInfo(), GeneratedCodeInfo'Annotation(),
        GeneratedCodeInfo'Annotation'Semantic(..),
        GeneratedCodeInfo'Annotation'Semantic(), MessageOptions(),
        MethodDescriptorProto(), MethodOptions(),
        MethodOptions'IdempotencyLevel(..),
        MethodOptions'IdempotencyLevel(), OneofDescriptorProto(),
        OneofOptions(), ServiceDescriptorProto(), ServiceOptions(),
        SourceCodeInfo(), SourceCodeInfo'Location(), UninterpretedOption(),
        UninterpretedOption'NamePart()
    ) where
import qualified Data.ProtoLens.Runtime.Control.DeepSeq as Control.DeepSeq
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Prism as Data.ProtoLens.Prism
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
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.name' @:: Lens' DescriptorProto Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'name' @:: Lens' DescriptorProto (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.field' @:: Lens' DescriptorProto [FieldDescriptorProto]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'field' @:: Lens' DescriptorProto (Data.Vector.Vector FieldDescriptorProto)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.extension' @:: Lens' DescriptorProto [FieldDescriptorProto]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'extension' @:: Lens' DescriptorProto (Data.Vector.Vector FieldDescriptorProto)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.nestedType' @:: Lens' DescriptorProto [DescriptorProto]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'nestedType' @:: Lens' DescriptorProto (Data.Vector.Vector DescriptorProto)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.enumType' @:: Lens' DescriptorProto [EnumDescriptorProto]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'enumType' @:: Lens' DescriptorProto (Data.Vector.Vector EnumDescriptorProto)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.extensionRange' @:: Lens' DescriptorProto [DescriptorProto'ExtensionRange]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'extensionRange' @:: Lens' DescriptorProto (Data.Vector.Vector DescriptorProto'ExtensionRange)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.oneofDecl' @:: Lens' DescriptorProto [OneofDescriptorProto]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'oneofDecl' @:: Lens' DescriptorProto (Data.Vector.Vector OneofDescriptorProto)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.options' @:: Lens' DescriptorProto MessageOptions@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'options' @:: Lens' DescriptorProto (Prelude.Maybe MessageOptions)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.reservedRange' @:: Lens' DescriptorProto [DescriptorProto'ReservedRange]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'reservedRange' @:: Lens' DescriptorProto (Data.Vector.Vector DescriptorProto'ReservedRange)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.reservedName' @:: Lens' DescriptorProto [Data.Text.Text]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'reservedName' @:: Lens' DescriptorProto (Data.Vector.Vector Data.Text.Text)@ -}
data DescriptorProto
  = DescriptorProto'_constructor {_DescriptorProto'name :: !(Prelude.Maybe Data.Text.Text),
                                  _DescriptorProto'field :: !(Data.Vector.Vector FieldDescriptorProto),
                                  _DescriptorProto'extension :: !(Data.Vector.Vector FieldDescriptorProto),
                                  _DescriptorProto'nestedType :: !(Data.Vector.Vector DescriptorProto),
                                  _DescriptorProto'enumType :: !(Data.Vector.Vector EnumDescriptorProto),
                                  _DescriptorProto'extensionRange :: !(Data.Vector.Vector DescriptorProto'ExtensionRange),
                                  _DescriptorProto'oneofDecl :: !(Data.Vector.Vector OneofDescriptorProto),
                                  _DescriptorProto'options :: !(Prelude.Maybe MessageOptions),
                                  _DescriptorProto'reservedRange :: !(Data.Vector.Vector DescriptorProto'ReservedRange),
                                  _DescriptorProto'reservedName :: !(Data.Vector.Vector Data.Text.Text),
                                  _DescriptorProto'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show DescriptorProto where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField DescriptorProto "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'name
           (\ x__ y__ -> x__ {_DescriptorProto'name = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField DescriptorProto "maybe'name" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'name
           (\ x__ y__ -> x__ {_DescriptorProto'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField DescriptorProto "field" [FieldDescriptorProto] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'field
           (\ x__ y__ -> x__ {_DescriptorProto'field = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField DescriptorProto "vec'field" (Data.Vector.Vector FieldDescriptorProto) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'field
           (\ x__ y__ -> x__ {_DescriptorProto'field = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField DescriptorProto "extension" [FieldDescriptorProto] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'extension
           (\ x__ y__ -> x__ {_DescriptorProto'extension = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField DescriptorProto "vec'extension" (Data.Vector.Vector FieldDescriptorProto) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'extension
           (\ x__ y__ -> x__ {_DescriptorProto'extension = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField DescriptorProto "nestedType" [DescriptorProto] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'nestedType
           (\ x__ y__ -> x__ {_DescriptorProto'nestedType = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField DescriptorProto "vec'nestedType" (Data.Vector.Vector DescriptorProto) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'nestedType
           (\ x__ y__ -> x__ {_DescriptorProto'nestedType = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField DescriptorProto "enumType" [EnumDescriptorProto] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'enumType
           (\ x__ y__ -> x__ {_DescriptorProto'enumType = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField DescriptorProto "vec'enumType" (Data.Vector.Vector EnumDescriptorProto) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'enumType
           (\ x__ y__ -> x__ {_DescriptorProto'enumType = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField DescriptorProto "extensionRange" [DescriptorProto'ExtensionRange] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'extensionRange
           (\ x__ y__ -> x__ {_DescriptorProto'extensionRange = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField DescriptorProto "vec'extensionRange" (Data.Vector.Vector DescriptorProto'ExtensionRange) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'extensionRange
           (\ x__ y__ -> x__ {_DescriptorProto'extensionRange = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField DescriptorProto "oneofDecl" [OneofDescriptorProto] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'oneofDecl
           (\ x__ y__ -> x__ {_DescriptorProto'oneofDecl = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField DescriptorProto "vec'oneofDecl" (Data.Vector.Vector OneofDescriptorProto) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'oneofDecl
           (\ x__ y__ -> x__ {_DescriptorProto'oneofDecl = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField DescriptorProto "options" MessageOptions where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'options
           (\ x__ y__ -> x__ {_DescriptorProto'options = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField DescriptorProto "maybe'options" (Prelude.Maybe MessageOptions) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'options
           (\ x__ y__ -> x__ {_DescriptorProto'options = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField DescriptorProto "reservedRange" [DescriptorProto'ReservedRange] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'reservedRange
           (\ x__ y__ -> x__ {_DescriptorProto'reservedRange = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField DescriptorProto "vec'reservedRange" (Data.Vector.Vector DescriptorProto'ReservedRange) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'reservedRange
           (\ x__ y__ -> x__ {_DescriptorProto'reservedRange = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField DescriptorProto "reservedName" [Data.Text.Text] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'reservedName
           (\ x__ y__ -> x__ {_DescriptorProto'reservedName = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField DescriptorProto "vec'reservedName" (Data.Vector.Vector Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'reservedName
           (\ x__ y__ -> x__ {_DescriptorProto'reservedName = y__}))
        Prelude.id
instance Data.ProtoLens.Message DescriptorProto where
  messageName _ = Data.Text.pack "google.protobuf.DescriptorProto"
  packedMessageDescriptor _
    = "\n\
      \\SIDescriptorProto\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2;\n\
      \\ENQfield\CAN\STX \ETX(\v2%.google.protobuf.FieldDescriptorProtoR\ENQfield\DC2C\n\
      \\textension\CAN\ACK \ETX(\v2%.google.protobuf.FieldDescriptorProtoR\textension\DC2A\n\
      \\vnested_type\CAN\ETX \ETX(\v2 .google.protobuf.DescriptorProtoR\n\
      \nestedType\DC2A\n\
      \\tenum_type\CAN\EOT \ETX(\v2$.google.protobuf.EnumDescriptorProtoR\benumType\DC2X\n\
      \\SIextension_range\CAN\ENQ \ETX(\v2/.google.protobuf.DescriptorProto.ExtensionRangeR\SOextensionRange\DC2D\n\
      \\n\
      \oneof_decl\CAN\b \ETX(\v2%.google.protobuf.OneofDescriptorProtoR\toneofDecl\DC29\n\
      \\aoptions\CAN\a \SOH(\v2\US.google.protobuf.MessageOptionsR\aoptions\DC2U\n\
      \\SOreserved_range\CAN\t \ETX(\v2..google.protobuf.DescriptorProto.ReservedRangeR\rreservedRange\DC2#\n\
      \\rreserved_name\CAN\n\
      \ \ETX(\tR\freservedName\SUBz\n\
      \\SOExtensionRange\DC2\DC4\n\
      \\ENQstart\CAN\SOH \SOH(\ENQR\ENQstart\DC2\DLE\n\
      \\ETXend\CAN\STX \SOH(\ENQR\ETXend\DC2@\n\
      \\aoptions\CAN\ETX \SOH(\v2&.google.protobuf.ExtensionRangeOptionsR\aoptions\SUB7\n\
      \\rReservedRange\DC2\DC4\n\
      \\ENQstart\CAN\SOH \SOH(\ENQR\ENQstart\DC2\DLE\n\
      \\ETXend\CAN\STX \SOH(\ENQR\ETXend"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'name")) ::
              Data.ProtoLens.FieldDescriptor DescriptorProto
        field__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "field"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor FieldDescriptorProto)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"field")) ::
              Data.ProtoLens.FieldDescriptor DescriptorProto
        extension__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "extension"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor FieldDescriptorProto)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"extension")) ::
              Data.ProtoLens.FieldDescriptor DescriptorProto
        nestedType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "nested_type"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor DescriptorProto)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"nestedType")) ::
              Data.ProtoLens.FieldDescriptor DescriptorProto
        enumType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "enum_type"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor EnumDescriptorProto)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"enumType")) ::
              Data.ProtoLens.FieldDescriptor DescriptorProto
        extensionRange__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "extension_range"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor DescriptorProto'ExtensionRange)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"extensionRange")) ::
              Data.ProtoLens.FieldDescriptor DescriptorProto
        oneofDecl__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "oneof_decl"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor OneofDescriptorProto)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"oneofDecl")) ::
              Data.ProtoLens.FieldDescriptor DescriptorProto
        options__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "options"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor MessageOptions)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'options")) ::
              Data.ProtoLens.FieldDescriptor DescriptorProto
        reservedRange__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "reserved_range"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor DescriptorProto'ReservedRange)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"reservedRange")) ::
              Data.ProtoLens.FieldDescriptor DescriptorProto
        reservedName__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "reserved_name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"reservedName")) ::
              Data.ProtoLens.FieldDescriptor DescriptorProto
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, name__field_descriptor),
           (Data.ProtoLens.Tag 2, field__field_descriptor),
           (Data.ProtoLens.Tag 6, extension__field_descriptor),
           (Data.ProtoLens.Tag 3, nestedType__field_descriptor),
           (Data.ProtoLens.Tag 4, enumType__field_descriptor),
           (Data.ProtoLens.Tag 5, extensionRange__field_descriptor),
           (Data.ProtoLens.Tag 8, oneofDecl__field_descriptor),
           (Data.ProtoLens.Tag 7, options__field_descriptor),
           (Data.ProtoLens.Tag 9, reservedRange__field_descriptor),
           (Data.ProtoLens.Tag 10, reservedName__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _DescriptorProto'_unknownFields
        (\ x__ y__ -> x__ {_DescriptorProto'_unknownFields = y__})
  defMessage
    = DescriptorProto'_constructor
        {_DescriptorProto'name = Prelude.Nothing,
         _DescriptorProto'field = Data.Vector.Generic.empty,
         _DescriptorProto'extension = Data.Vector.Generic.empty,
         _DescriptorProto'nestedType = Data.Vector.Generic.empty,
         _DescriptorProto'enumType = Data.Vector.Generic.empty,
         _DescriptorProto'extensionRange = Data.Vector.Generic.empty,
         _DescriptorProto'oneofDecl = Data.Vector.Generic.empty,
         _DescriptorProto'options = Prelude.Nothing,
         _DescriptorProto'reservedRange = Data.Vector.Generic.empty,
         _DescriptorProto'reservedName = Data.Vector.Generic.empty,
         _DescriptorProto'_unknownFields = []}
  parseMessage
    = let
        loop ::
          DescriptorProto
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld EnumDescriptorProto
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld FieldDescriptorProto
                -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld DescriptorProto'ExtensionRange
                   -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld FieldDescriptorProto
                      -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld DescriptorProto
                         -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld OneofDescriptorProto
                            -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Text.Text
                               -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld DescriptorProto'ReservedRange
                                  -> Data.ProtoLens.Encoding.Bytes.Parser DescriptorProto
        loop
          x
          mutable'enumType
          mutable'extension
          mutable'extensionRange
          mutable'field
          mutable'nestedType
          mutable'oneofDecl
          mutable'reservedName
          mutable'reservedRange
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'enumType <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                           (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                              mutable'enumType)
                      frozen'extension <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                            (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                               mutable'extension)
                      frozen'extensionRange <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                 (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                    mutable'extensionRange)
                      frozen'field <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'field)
                      frozen'nestedType <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                             (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                mutable'nestedType)
                      frozen'oneofDecl <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                            (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                               mutable'oneofDecl)
                      frozen'reservedName <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                               (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                  mutable'reservedName)
                      frozen'reservedRange <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                   mutable'reservedRange)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields
                           (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'enumType")
                              frozen'enumType
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'extension")
                                 frozen'extension
                                 (Lens.Family2.set
                                    (Data.ProtoLens.Field.field @"vec'extensionRange")
                                    frozen'extensionRange
                                    (Lens.Family2.set
                                       (Data.ProtoLens.Field.field @"vec'field")
                                       frozen'field
                                       (Lens.Family2.set
                                          (Data.ProtoLens.Field.field @"vec'nestedType")
                                          frozen'nestedType
                                          (Lens.Family2.set
                                             (Data.ProtoLens.Field.field @"vec'oneofDecl")
                                             frozen'oneofDecl
                                             (Lens.Family2.set
                                                (Data.ProtoLens.Field.field @"vec'reservedName")
                                                frozen'reservedName
                                                (Lens.Family2.set
                                                   (Data.ProtoLens.Field.field @"vec'reservedRange")
                                                   frozen'reservedRange
                                                   x)))))))))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "name"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"name") y x)
                                  mutable'enumType
                                  mutable'extension
                                  mutable'extensionRange
                                  mutable'field
                                  mutable'nestedType
                                  mutable'oneofDecl
                                  mutable'reservedName
                                  mutable'reservedRange
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "field"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'field y)
                                loop
                                  x
                                  mutable'enumType
                                  mutable'extension
                                  mutable'extensionRange
                                  v
                                  mutable'nestedType
                                  mutable'oneofDecl
                                  mutable'reservedName
                                  mutable'reservedRange
                        50
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "extension"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'extension y)
                                loop
                                  x
                                  mutable'enumType
                                  v
                                  mutable'extensionRange
                                  mutable'field
                                  mutable'nestedType
                                  mutable'oneofDecl
                                  mutable'reservedName
                                  mutable'reservedRange
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "nested_type"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'nestedType y)
                                loop
                                  x
                                  mutable'enumType
                                  mutable'extension
                                  mutable'extensionRange
                                  mutable'field
                                  v
                                  mutable'oneofDecl
                                  mutable'reservedName
                                  mutable'reservedRange
                        34
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "enum_type"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'enumType y)
                                loop
                                  x
                                  v
                                  mutable'extension
                                  mutable'extensionRange
                                  mutable'field
                                  mutable'nestedType
                                  mutable'oneofDecl
                                  mutable'reservedName
                                  mutable'reservedRange
                        42
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "extension_range"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'extensionRange y)
                                loop
                                  x
                                  mutable'enumType
                                  mutable'extension
                                  v
                                  mutable'field
                                  mutable'nestedType
                                  mutable'oneofDecl
                                  mutable'reservedName
                                  mutable'reservedRange
                        66
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "oneof_decl"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'oneofDecl y)
                                loop
                                  x
                                  mutable'enumType
                                  mutable'extension
                                  mutable'extensionRange
                                  mutable'field
                                  mutable'nestedType
                                  v
                                  mutable'reservedName
                                  mutable'reservedRange
                        58
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "options"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"options") y x)
                                  mutable'enumType
                                  mutable'extension
                                  mutable'extensionRange
                                  mutable'field
                                  mutable'nestedType
                                  mutable'oneofDecl
                                  mutable'reservedName
                                  mutable'reservedRange
                        74
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "reserved_range"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'reservedRange y)
                                loop
                                  x
                                  mutable'enumType
                                  mutable'extension
                                  mutable'extensionRange
                                  mutable'field
                                  mutable'nestedType
                                  mutable'oneofDecl
                                  mutable'reservedName
                                  v
                        82
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.getText
                                              (Prelude.fromIntegral len))
                                        "reserved_name"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'reservedName y)
                                loop
                                  x
                                  mutable'enumType
                                  mutable'extension
                                  mutable'extensionRange
                                  mutable'field
                                  mutable'nestedType
                                  mutable'oneofDecl
                                  v
                                  mutable'reservedRange
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'enumType
                                  mutable'extension
                                  mutable'extensionRange
                                  mutable'field
                                  mutable'nestedType
                                  mutable'oneofDecl
                                  mutable'reservedName
                                  mutable'reservedRange
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'enumType <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                    Data.ProtoLens.Encoding.Growing.new
              mutable'extension <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                     Data.ProtoLens.Encoding.Growing.new
              mutable'extensionRange <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                          Data.ProtoLens.Encoding.Growing.new
              mutable'field <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                 Data.ProtoLens.Encoding.Growing.new
              mutable'nestedType <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                      Data.ProtoLens.Encoding.Growing.new
              mutable'oneofDecl <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                     Data.ProtoLens.Encoding.Growing.new
              mutable'reservedName <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        Data.ProtoLens.Encoding.Growing.new
              mutable'reservedRange <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                         Data.ProtoLens.Encoding.Growing.new
              loop
                Data.ProtoLens.defMessage
                mutable'enumType
                mutable'extension
                mutable'extensionRange
                mutable'field
                mutable'nestedType
                mutable'oneofDecl
                mutable'reservedName
                mutable'reservedRange)
          "DescriptorProto"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'name") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.Text.Encoding.encodeUtf8
                          _v))
             ((Data.Monoid.<>)
                (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                   (\ _v
                      -> (Data.Monoid.<>)
                           (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                           ((Prelude..)
                              (\ bs
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                         (Prelude.fromIntegral (Data.ByteString.length bs)))
                                      (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                              Data.ProtoLens.encodeMessage
                              _v))
                   (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'field") _x))
                ((Data.Monoid.<>)
                   (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                      (\ _v
                         -> (Data.Monoid.<>)
                              (Data.ProtoLens.Encoding.Bytes.putVarInt 50)
                              ((Prelude..)
                                 (\ bs
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                            (Prelude.fromIntegral (Data.ByteString.length bs)))
                                         (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                 Data.ProtoLens.encodeMessage
                                 _v))
                      (Lens.Family2.view
                         (Data.ProtoLens.Field.field @"vec'extension") _x))
                   ((Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                         (\ _v
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                                 ((Prelude..)
                                    (\ bs
                                       -> (Data.Monoid.<>)
                                            (Data.ProtoLens.Encoding.Bytes.putVarInt
                                               (Prelude.fromIntegral (Data.ByteString.length bs)))
                                            (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                    Data.ProtoLens.encodeMessage
                                    _v))
                         (Lens.Family2.view
                            (Data.ProtoLens.Field.field @"vec'nestedType") _x))
                      ((Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                            (\ _v
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                                    ((Prelude..)
                                       (\ bs
                                          -> (Data.Monoid.<>)
                                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                  (Prelude.fromIntegral
                                                     (Data.ByteString.length bs)))
                                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                       Data.ProtoLens.encodeMessage
                                       _v))
                            (Lens.Family2.view
                               (Data.ProtoLens.Field.field @"vec'enumType") _x))
                         ((Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                               (\ _v
                                  -> (Data.Monoid.<>)
                                       (Data.ProtoLens.Encoding.Bytes.putVarInt 42)
                                       ((Prelude..)
                                          (\ bs
                                             -> (Data.Monoid.<>)
                                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                     (Prelude.fromIntegral
                                                        (Data.ByteString.length bs)))
                                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                          Data.ProtoLens.encodeMessage
                                          _v))
                               (Lens.Family2.view
                                  (Data.ProtoLens.Field.field @"vec'extensionRange") _x))
                            ((Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                                  (\ _v
                                     -> (Data.Monoid.<>)
                                          (Data.ProtoLens.Encoding.Bytes.putVarInt 66)
                                          ((Prelude..)
                                             (\ bs
                                                -> (Data.Monoid.<>)
                                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                        (Prelude.fromIntegral
                                                           (Data.ByteString.length bs)))
                                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                             Data.ProtoLens.encodeMessage
                                             _v))
                                  (Lens.Family2.view
                                     (Data.ProtoLens.Field.field @"vec'oneofDecl") _x))
                               ((Data.Monoid.<>)
                                  (case
                                       Lens.Family2.view
                                         (Data.ProtoLens.Field.field @"maybe'options") _x
                                   of
                                     Prelude.Nothing -> Data.Monoid.mempty
                                     (Prelude.Just _v)
                                       -> (Data.Monoid.<>)
                                            (Data.ProtoLens.Encoding.Bytes.putVarInt 58)
                                            ((Prelude..)
                                               (\ bs
                                                  -> (Data.Monoid.<>)
                                                       (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                          (Prelude.fromIntegral
                                                             (Data.ByteString.length bs)))
                                                       (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                               Data.ProtoLens.encodeMessage
                                               _v))
                                  ((Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                                        (\ _v
                                           -> (Data.Monoid.<>)
                                                (Data.ProtoLens.Encoding.Bytes.putVarInt 74)
                                                ((Prelude..)
                                                   (\ bs
                                                      -> (Data.Monoid.<>)
                                                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                              (Prelude.fromIntegral
                                                                 (Data.ByteString.length bs)))
                                                           (Data.ProtoLens.Encoding.Bytes.putBytes
                                                              bs))
                                                   Data.ProtoLens.encodeMessage
                                                   _v))
                                        (Lens.Family2.view
                                           (Data.ProtoLens.Field.field @"vec'reservedRange") _x))
                                     ((Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                                           (\ _v
                                              -> (Data.Monoid.<>)
                                                   (Data.ProtoLens.Encoding.Bytes.putVarInt 82)
                                                   ((Prelude..)
                                                      (\ bs
                                                         -> (Data.Monoid.<>)
                                                              (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                 (Prelude.fromIntegral
                                                                    (Data.ByteString.length bs)))
                                                              (Data.ProtoLens.Encoding.Bytes.putBytes
                                                                 bs))
                                                      Data.Text.Encoding.encodeUtf8
                                                      _v))
                                           (Lens.Family2.view
                                              (Data.ProtoLens.Field.field @"vec'reservedName") _x))
                                        (Data.ProtoLens.Encoding.Wire.buildFieldSet
                                           (Lens.Family2.view
                                              Data.ProtoLens.unknownFields _x)))))))))))
instance Control.DeepSeq.NFData DescriptorProto where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_DescriptorProto'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_DescriptorProto'name x__)
                (Control.DeepSeq.deepseq
                   (_DescriptorProto'field x__)
                   (Control.DeepSeq.deepseq
                      (_DescriptorProto'extension x__)
                      (Control.DeepSeq.deepseq
                         (_DescriptorProto'nestedType x__)
                         (Control.DeepSeq.deepseq
                            (_DescriptorProto'enumType x__)
                            (Control.DeepSeq.deepseq
                               (_DescriptorProto'extensionRange x__)
                               (Control.DeepSeq.deepseq
                                  (_DescriptorProto'oneofDecl x__)
                                  (Control.DeepSeq.deepseq
                                     (_DescriptorProto'options x__)
                                     (Control.DeepSeq.deepseq
                                        (_DescriptorProto'reservedRange x__)
                                        (Control.DeepSeq.deepseq
                                           (_DescriptorProto'reservedName x__) ()))))))))))
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.start' @:: Lens' DescriptorProto'ExtensionRange Data.Int.Int32@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'start' @:: Lens' DescriptorProto'ExtensionRange (Prelude.Maybe Data.Int.Int32)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.end' @:: Lens' DescriptorProto'ExtensionRange Data.Int.Int32@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'end' @:: Lens' DescriptorProto'ExtensionRange (Prelude.Maybe Data.Int.Int32)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.options' @:: Lens' DescriptorProto'ExtensionRange ExtensionRangeOptions@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'options' @:: Lens' DescriptorProto'ExtensionRange (Prelude.Maybe ExtensionRangeOptions)@ -}
data DescriptorProto'ExtensionRange
  = DescriptorProto'ExtensionRange'_constructor {_DescriptorProto'ExtensionRange'start :: !(Prelude.Maybe Data.Int.Int32),
                                                 _DescriptorProto'ExtensionRange'end :: !(Prelude.Maybe Data.Int.Int32),
                                                 _DescriptorProto'ExtensionRange'options :: !(Prelude.Maybe ExtensionRangeOptions),
                                                 _DescriptorProto'ExtensionRange'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show DescriptorProto'ExtensionRange where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField DescriptorProto'ExtensionRange "start" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'ExtensionRange'start
           (\ x__ y__ -> x__ {_DescriptorProto'ExtensionRange'start = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField DescriptorProto'ExtensionRange "maybe'start" (Prelude.Maybe Data.Int.Int32) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'ExtensionRange'start
           (\ x__ y__ -> x__ {_DescriptorProto'ExtensionRange'start = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField DescriptorProto'ExtensionRange "end" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'ExtensionRange'end
           (\ x__ y__ -> x__ {_DescriptorProto'ExtensionRange'end = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField DescriptorProto'ExtensionRange "maybe'end" (Prelude.Maybe Data.Int.Int32) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'ExtensionRange'end
           (\ x__ y__ -> x__ {_DescriptorProto'ExtensionRange'end = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField DescriptorProto'ExtensionRange "options" ExtensionRangeOptions where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'ExtensionRange'options
           (\ x__ y__ -> x__ {_DescriptorProto'ExtensionRange'options = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField DescriptorProto'ExtensionRange "maybe'options" (Prelude.Maybe ExtensionRangeOptions) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'ExtensionRange'options
           (\ x__ y__ -> x__ {_DescriptorProto'ExtensionRange'options = y__}))
        Prelude.id
instance Data.ProtoLens.Message DescriptorProto'ExtensionRange where
  messageName _
    = Data.Text.pack "google.protobuf.DescriptorProto.ExtensionRange"
  packedMessageDescriptor _
    = "\n\
      \\SOExtensionRange\DC2\DC4\n\
      \\ENQstart\CAN\SOH \SOH(\ENQR\ENQstart\DC2\DLE\n\
      \\ETXend\CAN\STX \SOH(\ENQR\ETXend\DC2@\n\
      \\aoptions\CAN\ETX \SOH(\v2&.google.protobuf.ExtensionRangeOptionsR\aoptions"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        start__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "start"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'start")) ::
              Data.ProtoLens.FieldDescriptor DescriptorProto'ExtensionRange
        end__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "end"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'end")) ::
              Data.ProtoLens.FieldDescriptor DescriptorProto'ExtensionRange
        options__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "options"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ExtensionRangeOptions)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'options")) ::
              Data.ProtoLens.FieldDescriptor DescriptorProto'ExtensionRange
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, start__field_descriptor),
           (Data.ProtoLens.Tag 2, end__field_descriptor),
           (Data.ProtoLens.Tag 3, options__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _DescriptorProto'ExtensionRange'_unknownFields
        (\ x__ y__
           -> x__ {_DescriptorProto'ExtensionRange'_unknownFields = y__})
  defMessage
    = DescriptorProto'ExtensionRange'_constructor
        {_DescriptorProto'ExtensionRange'start = Prelude.Nothing,
         _DescriptorProto'ExtensionRange'end = Prelude.Nothing,
         _DescriptorProto'ExtensionRange'options = Prelude.Nothing,
         _DescriptorProto'ExtensionRange'_unknownFields = []}
  parseMessage
    = let
        loop ::
          DescriptorProto'ExtensionRange
          -> Data.ProtoLens.Encoding.Bytes.Parser DescriptorProto'ExtensionRange
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "start"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"start") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "end"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"end") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "options"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"options") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ExtensionRange"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'start") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                       ((Prelude..)
                          Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'end") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                          ((Prelude..)
                             Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'options") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage
                                _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData DescriptorProto'ExtensionRange where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_DescriptorProto'ExtensionRange'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_DescriptorProto'ExtensionRange'start x__)
                (Control.DeepSeq.deepseq
                   (_DescriptorProto'ExtensionRange'end x__)
                   (Control.DeepSeq.deepseq
                      (_DescriptorProto'ExtensionRange'options x__) ())))
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.start' @:: Lens' DescriptorProto'ReservedRange Data.Int.Int32@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'start' @:: Lens' DescriptorProto'ReservedRange (Prelude.Maybe Data.Int.Int32)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.end' @:: Lens' DescriptorProto'ReservedRange Data.Int.Int32@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'end' @:: Lens' DescriptorProto'ReservedRange (Prelude.Maybe Data.Int.Int32)@ -}
data DescriptorProto'ReservedRange
  = DescriptorProto'ReservedRange'_constructor {_DescriptorProto'ReservedRange'start :: !(Prelude.Maybe Data.Int.Int32),
                                                _DescriptorProto'ReservedRange'end :: !(Prelude.Maybe Data.Int.Int32),
                                                _DescriptorProto'ReservedRange'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show DescriptorProto'ReservedRange where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField DescriptorProto'ReservedRange "start" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'ReservedRange'start
           (\ x__ y__ -> x__ {_DescriptorProto'ReservedRange'start = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField DescriptorProto'ReservedRange "maybe'start" (Prelude.Maybe Data.Int.Int32) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'ReservedRange'start
           (\ x__ y__ -> x__ {_DescriptorProto'ReservedRange'start = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField DescriptorProto'ReservedRange "end" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'ReservedRange'end
           (\ x__ y__ -> x__ {_DescriptorProto'ReservedRange'end = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField DescriptorProto'ReservedRange "maybe'end" (Prelude.Maybe Data.Int.Int32) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DescriptorProto'ReservedRange'end
           (\ x__ y__ -> x__ {_DescriptorProto'ReservedRange'end = y__}))
        Prelude.id
instance Data.ProtoLens.Message DescriptorProto'ReservedRange where
  messageName _
    = Data.Text.pack "google.protobuf.DescriptorProto.ReservedRange"
  packedMessageDescriptor _
    = "\n\
      \\rReservedRange\DC2\DC4\n\
      \\ENQstart\CAN\SOH \SOH(\ENQR\ENQstart\DC2\DLE\n\
      \\ETXend\CAN\STX \SOH(\ENQR\ETXend"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        start__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "start"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'start")) ::
              Data.ProtoLens.FieldDescriptor DescriptorProto'ReservedRange
        end__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "end"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'end")) ::
              Data.ProtoLens.FieldDescriptor DescriptorProto'ReservedRange
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, start__field_descriptor),
           (Data.ProtoLens.Tag 2, end__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _DescriptorProto'ReservedRange'_unknownFields
        (\ x__ y__
           -> x__ {_DescriptorProto'ReservedRange'_unknownFields = y__})
  defMessage
    = DescriptorProto'ReservedRange'_constructor
        {_DescriptorProto'ReservedRange'start = Prelude.Nothing,
         _DescriptorProto'ReservedRange'end = Prelude.Nothing,
         _DescriptorProto'ReservedRange'_unknownFields = []}
  parseMessage
    = let
        loop ::
          DescriptorProto'ReservedRange
          -> Data.ProtoLens.Encoding.Bytes.Parser DescriptorProto'ReservedRange
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "start"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"start") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "end"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"end") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ReservedRange"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'start") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                       ((Prelude..)
                          Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'end") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                          ((Prelude..)
                             Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData DescriptorProto'ReservedRange where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_DescriptorProto'ReservedRange'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_DescriptorProto'ReservedRange'start x__)
                (Control.DeepSeq.deepseq
                   (_DescriptorProto'ReservedRange'end x__) ()))
data Edition
  = EDITION_UNKNOWN |
    EDITION_1_TEST_ONLY |
    EDITION_2_TEST_ONLY |
    EDITION_LEGACY |
    EDITION_PROTO2 |
    EDITION_PROTO3 |
    EDITION_2023 |
    EDITION_2024 |
    EDITION_99997_TEST_ONLY |
    EDITION_99998_TEST_ONLY |
    EDITION_99999_TEST_ONLY |
    EDITION_MAX
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum Edition where
  maybeToEnum 0 = Prelude.Just EDITION_UNKNOWN
  maybeToEnum 1 = Prelude.Just EDITION_1_TEST_ONLY
  maybeToEnum 2 = Prelude.Just EDITION_2_TEST_ONLY
  maybeToEnum 900 = Prelude.Just EDITION_LEGACY
  maybeToEnum 998 = Prelude.Just EDITION_PROTO2
  maybeToEnum 999 = Prelude.Just EDITION_PROTO3
  maybeToEnum 1000 = Prelude.Just EDITION_2023
  maybeToEnum 1001 = Prelude.Just EDITION_2024
  maybeToEnum 99997 = Prelude.Just EDITION_99997_TEST_ONLY
  maybeToEnum 99998 = Prelude.Just EDITION_99998_TEST_ONLY
  maybeToEnum 99999 = Prelude.Just EDITION_99999_TEST_ONLY
  maybeToEnum 2147483647 = Prelude.Just EDITION_MAX
  maybeToEnum _ = Prelude.Nothing
  showEnum EDITION_UNKNOWN = "EDITION_UNKNOWN"
  showEnum EDITION_LEGACY = "EDITION_LEGACY"
  showEnum EDITION_PROTO2 = "EDITION_PROTO2"
  showEnum EDITION_PROTO3 = "EDITION_PROTO3"
  showEnum EDITION_2023 = "EDITION_2023"
  showEnum EDITION_2024 = "EDITION_2024"
  showEnum EDITION_1_TEST_ONLY = "EDITION_1_TEST_ONLY"
  showEnum EDITION_2_TEST_ONLY = "EDITION_2_TEST_ONLY"
  showEnum EDITION_99997_TEST_ONLY = "EDITION_99997_TEST_ONLY"
  showEnum EDITION_99998_TEST_ONLY = "EDITION_99998_TEST_ONLY"
  showEnum EDITION_99999_TEST_ONLY = "EDITION_99999_TEST_ONLY"
  showEnum EDITION_MAX = "EDITION_MAX"
  readEnum k
    | (Prelude.==) k "EDITION_UNKNOWN" = Prelude.Just EDITION_UNKNOWN
    | (Prelude.==) k "EDITION_LEGACY" = Prelude.Just EDITION_LEGACY
    | (Prelude.==) k "EDITION_PROTO2" = Prelude.Just EDITION_PROTO2
    | (Prelude.==) k "EDITION_PROTO3" = Prelude.Just EDITION_PROTO3
    | (Prelude.==) k "EDITION_2023" = Prelude.Just EDITION_2023
    | (Prelude.==) k "EDITION_2024" = Prelude.Just EDITION_2024
    | (Prelude.==) k "EDITION_1_TEST_ONLY"
    = Prelude.Just EDITION_1_TEST_ONLY
    | (Prelude.==) k "EDITION_2_TEST_ONLY"
    = Prelude.Just EDITION_2_TEST_ONLY
    | (Prelude.==) k "EDITION_99997_TEST_ONLY"
    = Prelude.Just EDITION_99997_TEST_ONLY
    | (Prelude.==) k "EDITION_99998_TEST_ONLY"
    = Prelude.Just EDITION_99998_TEST_ONLY
    | (Prelude.==) k "EDITION_99999_TEST_ONLY"
    = Prelude.Just EDITION_99999_TEST_ONLY
    | (Prelude.==) k "EDITION_MAX" = Prelude.Just EDITION_MAX
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded Edition where
  minBound = EDITION_UNKNOWN
  maxBound = EDITION_MAX
instance Prelude.Enum Edition where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum Edition: " (Prelude.show k__)))
        Prelude.id
        (Data.ProtoLens.maybeToEnum k__)
  fromEnum EDITION_UNKNOWN = 0
  fromEnum EDITION_1_TEST_ONLY = 1
  fromEnum EDITION_2_TEST_ONLY = 2
  fromEnum EDITION_LEGACY = 900
  fromEnum EDITION_PROTO2 = 998
  fromEnum EDITION_PROTO3 = 999
  fromEnum EDITION_2023 = 1000
  fromEnum EDITION_2024 = 1001
  fromEnum EDITION_99997_TEST_ONLY = 99997
  fromEnum EDITION_99998_TEST_ONLY = 99998
  fromEnum EDITION_99999_TEST_ONLY = 99999
  fromEnum EDITION_MAX = 2147483647
  succ EDITION_MAX
    = Prelude.error
        "Edition.succ: bad argument EDITION_MAX. This value would be out of bounds."
  succ EDITION_UNKNOWN = EDITION_1_TEST_ONLY
  succ EDITION_1_TEST_ONLY = EDITION_2_TEST_ONLY
  succ EDITION_2_TEST_ONLY = EDITION_LEGACY
  succ EDITION_LEGACY = EDITION_PROTO2
  succ EDITION_PROTO2 = EDITION_PROTO3
  succ EDITION_PROTO3 = EDITION_2023
  succ EDITION_2023 = EDITION_2024
  succ EDITION_2024 = EDITION_99997_TEST_ONLY
  succ EDITION_99997_TEST_ONLY = EDITION_99998_TEST_ONLY
  succ EDITION_99998_TEST_ONLY = EDITION_99999_TEST_ONLY
  succ EDITION_99999_TEST_ONLY = EDITION_MAX
  pred EDITION_UNKNOWN
    = Prelude.error
        "Edition.pred: bad argument EDITION_UNKNOWN. This value would be out of bounds."
  pred EDITION_1_TEST_ONLY = EDITION_UNKNOWN
  pred EDITION_2_TEST_ONLY = EDITION_1_TEST_ONLY
  pred EDITION_LEGACY = EDITION_2_TEST_ONLY
  pred EDITION_PROTO2 = EDITION_LEGACY
  pred EDITION_PROTO3 = EDITION_PROTO2
  pred EDITION_2023 = EDITION_PROTO3
  pred EDITION_2024 = EDITION_2023
  pred EDITION_99997_TEST_ONLY = EDITION_2024
  pred EDITION_99998_TEST_ONLY = EDITION_99997_TEST_ONLY
  pred EDITION_99999_TEST_ONLY = EDITION_99998_TEST_ONLY
  pred EDITION_MAX = EDITION_99999_TEST_ONLY
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault Edition where
  fieldDefault = EDITION_UNKNOWN
instance Control.DeepSeq.NFData Edition where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.name' @:: Lens' EnumDescriptorProto Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'name' @:: Lens' EnumDescriptorProto (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.value' @:: Lens' EnumDescriptorProto [EnumValueDescriptorProto]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'value' @:: Lens' EnumDescriptorProto (Data.Vector.Vector EnumValueDescriptorProto)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.options' @:: Lens' EnumDescriptorProto EnumOptions@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'options' @:: Lens' EnumDescriptorProto (Prelude.Maybe EnumOptions)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.reservedRange' @:: Lens' EnumDescriptorProto [EnumDescriptorProto'EnumReservedRange]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'reservedRange' @:: Lens' EnumDescriptorProto (Data.Vector.Vector EnumDescriptorProto'EnumReservedRange)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.reservedName' @:: Lens' EnumDescriptorProto [Data.Text.Text]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'reservedName' @:: Lens' EnumDescriptorProto (Data.Vector.Vector Data.Text.Text)@ -}
data EnumDescriptorProto
  = EnumDescriptorProto'_constructor {_EnumDescriptorProto'name :: !(Prelude.Maybe Data.Text.Text),
                                      _EnumDescriptorProto'value :: !(Data.Vector.Vector EnumValueDescriptorProto),
                                      _EnumDescriptorProto'options :: !(Prelude.Maybe EnumOptions),
                                      _EnumDescriptorProto'reservedRange :: !(Data.Vector.Vector EnumDescriptorProto'EnumReservedRange),
                                      _EnumDescriptorProto'reservedName :: !(Data.Vector.Vector Data.Text.Text),
                                      _EnumDescriptorProto'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show EnumDescriptorProto where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField EnumDescriptorProto "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumDescriptorProto'name
           (\ x__ y__ -> x__ {_EnumDescriptorProto'name = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField EnumDescriptorProto "maybe'name" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumDescriptorProto'name
           (\ x__ y__ -> x__ {_EnumDescriptorProto'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField EnumDescriptorProto "value" [EnumValueDescriptorProto] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumDescriptorProto'value
           (\ x__ y__ -> x__ {_EnumDescriptorProto'value = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField EnumDescriptorProto "vec'value" (Data.Vector.Vector EnumValueDescriptorProto) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumDescriptorProto'value
           (\ x__ y__ -> x__ {_EnumDescriptorProto'value = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField EnumDescriptorProto "options" EnumOptions where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumDescriptorProto'options
           (\ x__ y__ -> x__ {_EnumDescriptorProto'options = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField EnumDescriptorProto "maybe'options" (Prelude.Maybe EnumOptions) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumDescriptorProto'options
           (\ x__ y__ -> x__ {_EnumDescriptorProto'options = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField EnumDescriptorProto "reservedRange" [EnumDescriptorProto'EnumReservedRange] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumDescriptorProto'reservedRange
           (\ x__ y__ -> x__ {_EnumDescriptorProto'reservedRange = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField EnumDescriptorProto "vec'reservedRange" (Data.Vector.Vector EnumDescriptorProto'EnumReservedRange) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumDescriptorProto'reservedRange
           (\ x__ y__ -> x__ {_EnumDescriptorProto'reservedRange = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField EnumDescriptorProto "reservedName" [Data.Text.Text] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumDescriptorProto'reservedName
           (\ x__ y__ -> x__ {_EnumDescriptorProto'reservedName = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField EnumDescriptorProto "vec'reservedName" (Data.Vector.Vector Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumDescriptorProto'reservedName
           (\ x__ y__ -> x__ {_EnumDescriptorProto'reservedName = y__}))
        Prelude.id
instance Data.ProtoLens.Message EnumDescriptorProto where
  messageName _
    = Data.Text.pack "google.protobuf.EnumDescriptorProto"
  packedMessageDescriptor _
    = "\n\
      \\DC3EnumDescriptorProto\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2?\n\
      \\ENQvalue\CAN\STX \ETX(\v2).google.protobuf.EnumValueDescriptorProtoR\ENQvalue\DC26\n\
      \\aoptions\CAN\ETX \SOH(\v2\FS.google.protobuf.EnumOptionsR\aoptions\DC2]\n\
      \\SOreserved_range\CAN\EOT \ETX(\v26.google.protobuf.EnumDescriptorProto.EnumReservedRangeR\rreservedRange\DC2#\n\
      \\rreserved_name\CAN\ENQ \ETX(\tR\freservedName\SUB;\n\
      \\DC1EnumReservedRange\DC2\DC4\n\
      \\ENQstart\CAN\SOH \SOH(\ENQR\ENQstart\DC2\DLE\n\
      \\ETXend\CAN\STX \SOH(\ENQR\ETXend"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'name")) ::
              Data.ProtoLens.FieldDescriptor EnumDescriptorProto
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor EnumValueDescriptorProto)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor EnumDescriptorProto
        options__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "options"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor EnumOptions)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'options")) ::
              Data.ProtoLens.FieldDescriptor EnumDescriptorProto
        reservedRange__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "reserved_range"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor EnumDescriptorProto'EnumReservedRange)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"reservedRange")) ::
              Data.ProtoLens.FieldDescriptor EnumDescriptorProto
        reservedName__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "reserved_name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"reservedName")) ::
              Data.ProtoLens.FieldDescriptor EnumDescriptorProto
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, name__field_descriptor),
           (Data.ProtoLens.Tag 2, value__field_descriptor),
           (Data.ProtoLens.Tag 3, options__field_descriptor),
           (Data.ProtoLens.Tag 4, reservedRange__field_descriptor),
           (Data.ProtoLens.Tag 5, reservedName__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _EnumDescriptorProto'_unknownFields
        (\ x__ y__ -> x__ {_EnumDescriptorProto'_unknownFields = y__})
  defMessage
    = EnumDescriptorProto'_constructor
        {_EnumDescriptorProto'name = Prelude.Nothing,
         _EnumDescriptorProto'value = Data.Vector.Generic.empty,
         _EnumDescriptorProto'options = Prelude.Nothing,
         _EnumDescriptorProto'reservedRange = Data.Vector.Generic.empty,
         _EnumDescriptorProto'reservedName = Data.Vector.Generic.empty,
         _EnumDescriptorProto'_unknownFields = []}
  parseMessage
    = let
        loop ::
          EnumDescriptorProto
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Text.Text
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld EnumDescriptorProto'EnumReservedRange
                -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld EnumValueDescriptorProto
                   -> Data.ProtoLens.Encoding.Bytes.Parser EnumDescriptorProto
        loop x mutable'reservedName mutable'reservedRange mutable'value
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'reservedName <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                               (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                  mutable'reservedName)
                      frozen'reservedRange <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                   mutable'reservedRange)
                      frozen'value <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'value)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields
                           (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'reservedName")
                              frozen'reservedName
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'reservedRange")
                                 frozen'reservedRange
                                 (Lens.Family2.set
                                    (Data.ProtoLens.Field.field @"vec'value") frozen'value x))))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "name"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"name") y x)
                                  mutable'reservedName
                                  mutable'reservedRange
                                  mutable'value
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "value"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'value y)
                                loop x mutable'reservedName mutable'reservedRange v
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "options"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"options") y x)
                                  mutable'reservedName
                                  mutable'reservedRange
                                  mutable'value
                        34
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "reserved_range"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'reservedRange y)
                                loop x mutable'reservedName v mutable'value
                        42
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.getText
                                              (Prelude.fromIntegral len))
                                        "reserved_name"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'reservedName y)
                                loop x v mutable'reservedRange mutable'value
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'reservedName
                                  mutable'reservedRange
                                  mutable'value
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'reservedName <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        Data.ProtoLens.Encoding.Growing.new
              mutable'reservedRange <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                         Data.ProtoLens.Encoding.Growing.new
              mutable'value <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                 Data.ProtoLens.Encoding.Growing.new
              loop
                Data.ProtoLens.defMessage
                mutable'reservedName
                mutable'reservedRange
                mutable'value)
          "EnumDescriptorProto"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'name") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.Text.Encoding.encodeUtf8
                          _v))
             ((Data.Monoid.<>)
                (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                   (\ _v
                      -> (Data.Monoid.<>)
                           (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                           ((Prelude..)
                              (\ bs
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                         (Prelude.fromIntegral (Data.ByteString.length bs)))
                                      (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                              Data.ProtoLens.encodeMessage
                              _v))
                   (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'value") _x))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'options") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage
                                _v))
                   ((Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                         (\ _v
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                                 ((Prelude..)
                                    (\ bs
                                       -> (Data.Monoid.<>)
                                            (Data.ProtoLens.Encoding.Bytes.putVarInt
                                               (Prelude.fromIntegral (Data.ByteString.length bs)))
                                            (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                    Data.ProtoLens.encodeMessage
                                    _v))
                         (Lens.Family2.view
                            (Data.ProtoLens.Field.field @"vec'reservedRange") _x))
                      ((Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                            (\ _v
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt 42)
                                    ((Prelude..)
                                       (\ bs
                                          -> (Data.Monoid.<>)
                                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                  (Prelude.fromIntegral
                                                     (Data.ByteString.length bs)))
                                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                       Data.Text.Encoding.encodeUtf8
                                       _v))
                            (Lens.Family2.view
                               (Data.ProtoLens.Field.field @"vec'reservedName") _x))
                         (Data.ProtoLens.Encoding.Wire.buildFieldSet
                            (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))
instance Control.DeepSeq.NFData EnumDescriptorProto where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_EnumDescriptorProto'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_EnumDescriptorProto'name x__)
                (Control.DeepSeq.deepseq
                   (_EnumDescriptorProto'value x__)
                   (Control.DeepSeq.deepseq
                      (_EnumDescriptorProto'options x__)
                      (Control.DeepSeq.deepseq
                         (_EnumDescriptorProto'reservedRange x__)
                         (Control.DeepSeq.deepseq
                            (_EnumDescriptorProto'reservedName x__) ())))))
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.start' @:: Lens' EnumDescriptorProto'EnumReservedRange Data.Int.Int32@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'start' @:: Lens' EnumDescriptorProto'EnumReservedRange (Prelude.Maybe Data.Int.Int32)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.end' @:: Lens' EnumDescriptorProto'EnumReservedRange Data.Int.Int32@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'end' @:: Lens' EnumDescriptorProto'EnumReservedRange (Prelude.Maybe Data.Int.Int32)@ -}
data EnumDescriptorProto'EnumReservedRange
  = EnumDescriptorProto'EnumReservedRange'_constructor {_EnumDescriptorProto'EnumReservedRange'start :: !(Prelude.Maybe Data.Int.Int32),
                                                        _EnumDescriptorProto'EnumReservedRange'end :: !(Prelude.Maybe Data.Int.Int32),
                                                        _EnumDescriptorProto'EnumReservedRange'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show EnumDescriptorProto'EnumReservedRange where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField EnumDescriptorProto'EnumReservedRange "start" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumDescriptorProto'EnumReservedRange'start
           (\ x__ y__
              -> x__ {_EnumDescriptorProto'EnumReservedRange'start = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField EnumDescriptorProto'EnumReservedRange "maybe'start" (Prelude.Maybe Data.Int.Int32) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumDescriptorProto'EnumReservedRange'start
           (\ x__ y__
              -> x__ {_EnumDescriptorProto'EnumReservedRange'start = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField EnumDescriptorProto'EnumReservedRange "end" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumDescriptorProto'EnumReservedRange'end
           (\ x__ y__
              -> x__ {_EnumDescriptorProto'EnumReservedRange'end = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField EnumDescriptorProto'EnumReservedRange "maybe'end" (Prelude.Maybe Data.Int.Int32) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumDescriptorProto'EnumReservedRange'end
           (\ x__ y__
              -> x__ {_EnumDescriptorProto'EnumReservedRange'end = y__}))
        Prelude.id
instance Data.ProtoLens.Message EnumDescriptorProto'EnumReservedRange where
  messageName _
    = Data.Text.pack
        "google.protobuf.EnumDescriptorProto.EnumReservedRange"
  packedMessageDescriptor _
    = "\n\
      \\DC1EnumReservedRange\DC2\DC4\n\
      \\ENQstart\CAN\SOH \SOH(\ENQR\ENQstart\DC2\DLE\n\
      \\ETXend\CAN\STX \SOH(\ENQR\ETXend"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        start__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "start"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'start")) ::
              Data.ProtoLens.FieldDescriptor EnumDescriptorProto'EnumReservedRange
        end__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "end"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'end")) ::
              Data.ProtoLens.FieldDescriptor EnumDescriptorProto'EnumReservedRange
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, start__field_descriptor),
           (Data.ProtoLens.Tag 2, end__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _EnumDescriptorProto'EnumReservedRange'_unknownFields
        (\ x__ y__
           -> x__
                {_EnumDescriptorProto'EnumReservedRange'_unknownFields = y__})
  defMessage
    = EnumDescriptorProto'EnumReservedRange'_constructor
        {_EnumDescriptorProto'EnumReservedRange'start = Prelude.Nothing,
         _EnumDescriptorProto'EnumReservedRange'end = Prelude.Nothing,
         _EnumDescriptorProto'EnumReservedRange'_unknownFields = []}
  parseMessage
    = let
        loop ::
          EnumDescriptorProto'EnumReservedRange
          -> Data.ProtoLens.Encoding.Bytes.Parser EnumDescriptorProto'EnumReservedRange
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "start"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"start") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "end"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"end") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "EnumReservedRange"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'start") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                       ((Prelude..)
                          Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'end") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                          ((Prelude..)
                             Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData EnumDescriptorProto'EnumReservedRange where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_EnumDescriptorProto'EnumReservedRange'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_EnumDescriptorProto'EnumReservedRange'start x__)
                (Control.DeepSeq.deepseq
                   (_EnumDescriptorProto'EnumReservedRange'end x__) ()))
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.allowAlias' @:: Lens' EnumOptions Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'allowAlias' @:: Lens' EnumOptions (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.deprecated' @:: Lens' EnumOptions Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'deprecated' @:: Lens' EnumOptions (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.deprecatedLegacyJsonFieldConflicts' @:: Lens' EnumOptions Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'deprecatedLegacyJsonFieldConflicts' @:: Lens' EnumOptions (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.features' @:: Lens' EnumOptions FeatureSet@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'features' @:: Lens' EnumOptions (Prelude.Maybe FeatureSet)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.uninterpretedOption' @:: Lens' EnumOptions [UninterpretedOption]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'uninterpretedOption' @:: Lens' EnumOptions (Data.Vector.Vector UninterpretedOption)@ -}
data EnumOptions
  = EnumOptions'_constructor {_EnumOptions'allowAlias :: !(Prelude.Maybe Prelude.Bool),
                              _EnumOptions'deprecated :: !(Prelude.Maybe Prelude.Bool),
                              _EnumOptions'deprecatedLegacyJsonFieldConflicts :: !(Prelude.Maybe Prelude.Bool),
                              _EnumOptions'features :: !(Prelude.Maybe FeatureSet),
                              _EnumOptions'uninterpretedOption :: !(Data.Vector.Vector UninterpretedOption),
                              _EnumOptions'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show EnumOptions where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField EnumOptions "allowAlias" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumOptions'allowAlias
           (\ x__ y__ -> x__ {_EnumOptions'allowAlias = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField EnumOptions "maybe'allowAlias" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumOptions'allowAlias
           (\ x__ y__ -> x__ {_EnumOptions'allowAlias = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField EnumOptions "deprecated" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumOptions'deprecated
           (\ x__ y__ -> x__ {_EnumOptions'deprecated = y__}))
        (Data.ProtoLens.maybeLens Prelude.False)
instance Data.ProtoLens.Field.HasField EnumOptions "maybe'deprecated" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumOptions'deprecated
           (\ x__ y__ -> x__ {_EnumOptions'deprecated = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField EnumOptions "deprecatedLegacyJsonFieldConflicts" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumOptions'deprecatedLegacyJsonFieldConflicts
           (\ x__ y__
              -> x__ {_EnumOptions'deprecatedLegacyJsonFieldConflicts = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField EnumOptions "maybe'deprecatedLegacyJsonFieldConflicts" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumOptions'deprecatedLegacyJsonFieldConflicts
           (\ x__ y__
              -> x__ {_EnumOptions'deprecatedLegacyJsonFieldConflicts = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField EnumOptions "features" FeatureSet where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumOptions'features
           (\ x__ y__ -> x__ {_EnumOptions'features = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField EnumOptions "maybe'features" (Prelude.Maybe FeatureSet) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumOptions'features
           (\ x__ y__ -> x__ {_EnumOptions'features = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField EnumOptions "uninterpretedOption" [UninterpretedOption] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumOptions'uninterpretedOption
           (\ x__ y__ -> x__ {_EnumOptions'uninterpretedOption = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField EnumOptions "vec'uninterpretedOption" (Data.Vector.Vector UninterpretedOption) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumOptions'uninterpretedOption
           (\ x__ y__ -> x__ {_EnumOptions'uninterpretedOption = y__}))
        Prelude.id
instance Data.ProtoLens.Message EnumOptions where
  messageName _ = Data.Text.pack "google.protobuf.EnumOptions"
  packedMessageDescriptor _
    = "\n\
      \\vEnumOptions\DC2\US\n\
      \\vallow_alias\CAN\STX \SOH(\bR\n\
      \allowAlias\DC2%\n\
      \\n\
      \deprecated\CAN\ETX \SOH(\b:\ENQfalseR\n\
      \deprecated\DC2V\n\
      \&deprecated_legacy_json_field_conflicts\CAN\ACK \SOH(\bR\"deprecatedLegacyJsonFieldConflictsB\STX\CAN\SOH\DC27\n\
      \\bfeatures\CAN\a \SOH(\v2\ESC.google.protobuf.FeatureSetR\bfeatures\DC2X\n\
      \\DC4uninterpreted_option\CAN\231\a \ETX(\v2$.google.protobuf.UninterpretedOptionR\DC3uninterpretedOption*\t\b\232\a\DLE\128\128\128\128\STXJ\EOT\b\ENQ\DLE\ACK"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        allowAlias__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "allow_alias"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'allowAlias")) ::
              Data.ProtoLens.FieldDescriptor EnumOptions
        deprecated__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "deprecated"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'deprecated")) ::
              Data.ProtoLens.FieldDescriptor EnumOptions
        deprecatedLegacyJsonFieldConflicts__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "deprecated_legacy_json_field_conflicts"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field
                    @"maybe'deprecatedLegacyJsonFieldConflicts")) ::
              Data.ProtoLens.FieldDescriptor EnumOptions
        features__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "features"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor FeatureSet)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'features")) ::
              Data.ProtoLens.FieldDescriptor EnumOptions
        uninterpretedOption__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "uninterpreted_option"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor UninterpretedOption)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"uninterpretedOption")) ::
              Data.ProtoLens.FieldDescriptor EnumOptions
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 2, allowAlias__field_descriptor),
           (Data.ProtoLens.Tag 3, deprecated__field_descriptor),
           (Data.ProtoLens.Tag 6, 
            deprecatedLegacyJsonFieldConflicts__field_descriptor),
           (Data.ProtoLens.Tag 7, features__field_descriptor),
           (Data.ProtoLens.Tag 999, uninterpretedOption__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _EnumOptions'_unknownFields
        (\ x__ y__ -> x__ {_EnumOptions'_unknownFields = y__})
  defMessage
    = EnumOptions'_constructor
        {_EnumOptions'allowAlias = Prelude.Nothing,
         _EnumOptions'deprecated = Prelude.Nothing,
         _EnumOptions'deprecatedLegacyJsonFieldConflicts = Prelude.Nothing,
         _EnumOptions'features = Prelude.Nothing,
         _EnumOptions'uninterpretedOption = Data.Vector.Generic.empty,
         _EnumOptions'_unknownFields = []}
  parseMessage
    = let
        loop ::
          EnumOptions
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld UninterpretedOption
             -> Data.ProtoLens.Encoding.Bytes.Parser EnumOptions
        loop x mutable'uninterpretedOption
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'uninterpretedOption <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                      (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                         mutable'uninterpretedOption)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields
                           (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'uninterpretedOption")
                              frozen'uninterpretedOption
                              x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "allow_alias"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"allowAlias") y x)
                                  mutable'uninterpretedOption
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "deprecated"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"deprecated") y x)
                                  mutable'uninterpretedOption
                        48
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "deprecated_legacy_json_field_conflicts"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field
                                        @"deprecatedLegacyJsonFieldConflicts")
                                     y
                                     x)
                                  mutable'uninterpretedOption
                        58
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "features"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"features") y x)
                                  mutable'uninterpretedOption
                        7994
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "uninterpreted_option"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'uninterpretedOption y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'uninterpretedOption
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'uninterpretedOption <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                               Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'uninterpretedOption)
          "EnumOptions"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view
                    (Data.ProtoLens.Field.field @"maybe'allowAlias") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                       ((Prelude..)
                          Data.ProtoLens.Encoding.Bytes.putVarInt
                          (\ b -> if b then 1 else 0)
                          _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view
                       (Data.ProtoLens.Field.field @"maybe'deprecated") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                          ((Prelude..)
                             Data.ProtoLens.Encoding.Bytes.putVarInt
                             (\ b -> if b then 1 else 0)
                             _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view
                          (Data.ProtoLens.Field.field
                             @"maybe'deprecatedLegacyJsonFieldConflicts")
                          _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 48)
                             ((Prelude..)
                                Data.ProtoLens.Encoding.Bytes.putVarInt
                                (\ b -> if b then 1 else 0)
                                _v))
                   ((Data.Monoid.<>)
                      (case
                           Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'features") _x
                       of
                         Prelude.Nothing -> Data.Monoid.mempty
                         (Prelude.Just _v)
                           -> (Data.Monoid.<>)
                                (Data.ProtoLens.Encoding.Bytes.putVarInt 58)
                                ((Prelude..)
                                   (\ bs
                                      -> (Data.Monoid.<>)
                                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                                              (Prelude.fromIntegral (Data.ByteString.length bs)))
                                           (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                   Data.ProtoLens.encodeMessage
                                   _v))
                      ((Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                            (\ _v
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt 7994)
                                    ((Prelude..)
                                       (\ bs
                                          -> (Data.Monoid.<>)
                                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                  (Prelude.fromIntegral
                                                     (Data.ByteString.length bs)))
                                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                       Data.ProtoLens.encodeMessage
                                       _v))
                            (Lens.Family2.view
                               (Data.ProtoLens.Field.field @"vec'uninterpretedOption") _x))
                         (Data.ProtoLens.Encoding.Wire.buildFieldSet
                            (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))
instance Control.DeepSeq.NFData EnumOptions where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_EnumOptions'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_EnumOptions'allowAlias x__)
                (Control.DeepSeq.deepseq
                   (_EnumOptions'deprecated x__)
                   (Control.DeepSeq.deepseq
                      (_EnumOptions'deprecatedLegacyJsonFieldConflicts x__)
                      (Control.DeepSeq.deepseq
                         (_EnumOptions'features x__)
                         (Control.DeepSeq.deepseq
                            (_EnumOptions'uninterpretedOption x__) ())))))
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.name' @:: Lens' EnumValueDescriptorProto Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'name' @:: Lens' EnumValueDescriptorProto (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.number' @:: Lens' EnumValueDescriptorProto Data.Int.Int32@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'number' @:: Lens' EnumValueDescriptorProto (Prelude.Maybe Data.Int.Int32)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.options' @:: Lens' EnumValueDescriptorProto EnumValueOptions@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'options' @:: Lens' EnumValueDescriptorProto (Prelude.Maybe EnumValueOptions)@ -}
data EnumValueDescriptorProto
  = EnumValueDescriptorProto'_constructor {_EnumValueDescriptorProto'name :: !(Prelude.Maybe Data.Text.Text),
                                           _EnumValueDescriptorProto'number :: !(Prelude.Maybe Data.Int.Int32),
                                           _EnumValueDescriptorProto'options :: !(Prelude.Maybe EnumValueOptions),
                                           _EnumValueDescriptorProto'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show EnumValueDescriptorProto where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField EnumValueDescriptorProto "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumValueDescriptorProto'name
           (\ x__ y__ -> x__ {_EnumValueDescriptorProto'name = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField EnumValueDescriptorProto "maybe'name" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumValueDescriptorProto'name
           (\ x__ y__ -> x__ {_EnumValueDescriptorProto'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField EnumValueDescriptorProto "number" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumValueDescriptorProto'number
           (\ x__ y__ -> x__ {_EnumValueDescriptorProto'number = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField EnumValueDescriptorProto "maybe'number" (Prelude.Maybe Data.Int.Int32) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumValueDescriptorProto'number
           (\ x__ y__ -> x__ {_EnumValueDescriptorProto'number = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField EnumValueDescriptorProto "options" EnumValueOptions where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumValueDescriptorProto'options
           (\ x__ y__ -> x__ {_EnumValueDescriptorProto'options = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField EnumValueDescriptorProto "maybe'options" (Prelude.Maybe EnumValueOptions) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumValueDescriptorProto'options
           (\ x__ y__ -> x__ {_EnumValueDescriptorProto'options = y__}))
        Prelude.id
instance Data.ProtoLens.Message EnumValueDescriptorProto where
  messageName _
    = Data.Text.pack "google.protobuf.EnumValueDescriptorProto"
  packedMessageDescriptor _
    = "\n\
      \\CANEnumValueDescriptorProto\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2\SYN\n\
      \\ACKnumber\CAN\STX \SOH(\ENQR\ACKnumber\DC2;\n\
      \\aoptions\CAN\ETX \SOH(\v2!.google.protobuf.EnumValueOptionsR\aoptions"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'name")) ::
              Data.ProtoLens.FieldDescriptor EnumValueDescriptorProto
        number__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "number"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'number")) ::
              Data.ProtoLens.FieldDescriptor EnumValueDescriptorProto
        options__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "options"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor EnumValueOptions)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'options")) ::
              Data.ProtoLens.FieldDescriptor EnumValueDescriptorProto
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, name__field_descriptor),
           (Data.ProtoLens.Tag 2, number__field_descriptor),
           (Data.ProtoLens.Tag 3, options__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _EnumValueDescriptorProto'_unknownFields
        (\ x__ y__ -> x__ {_EnumValueDescriptorProto'_unknownFields = y__})
  defMessage
    = EnumValueDescriptorProto'_constructor
        {_EnumValueDescriptorProto'name = Prelude.Nothing,
         _EnumValueDescriptorProto'number = Prelude.Nothing,
         _EnumValueDescriptorProto'options = Prelude.Nothing,
         _EnumValueDescriptorProto'_unknownFields = []}
  parseMessage
    = let
        loop ::
          EnumValueDescriptorProto
          -> Data.ProtoLens.Encoding.Bytes.Parser EnumValueDescriptorProto
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "name"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"name") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "number"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"number") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "options"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"options") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "EnumValueDescriptorProto"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'name") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.Text.Encoding.encodeUtf8
                          _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'number") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                          ((Prelude..)
                             Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'options") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage
                                _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData EnumValueDescriptorProto where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_EnumValueDescriptorProto'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_EnumValueDescriptorProto'name x__)
                (Control.DeepSeq.deepseq
                   (_EnumValueDescriptorProto'number x__)
                   (Control.DeepSeq.deepseq
                      (_EnumValueDescriptorProto'options x__) ())))
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.deprecated' @:: Lens' EnumValueOptions Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'deprecated' @:: Lens' EnumValueOptions (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.features' @:: Lens' EnumValueOptions FeatureSet@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'features' @:: Lens' EnumValueOptions (Prelude.Maybe FeatureSet)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.debugRedact' @:: Lens' EnumValueOptions Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'debugRedact' @:: Lens' EnumValueOptions (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.featureSupport' @:: Lens' EnumValueOptions FieldOptions'FeatureSupport@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'featureSupport' @:: Lens' EnumValueOptions (Prelude.Maybe FieldOptions'FeatureSupport)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.uninterpretedOption' @:: Lens' EnumValueOptions [UninterpretedOption]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'uninterpretedOption' @:: Lens' EnumValueOptions (Data.Vector.Vector UninterpretedOption)@ -}
data EnumValueOptions
  = EnumValueOptions'_constructor {_EnumValueOptions'deprecated :: !(Prelude.Maybe Prelude.Bool),
                                   _EnumValueOptions'features :: !(Prelude.Maybe FeatureSet),
                                   _EnumValueOptions'debugRedact :: !(Prelude.Maybe Prelude.Bool),
                                   _EnumValueOptions'featureSupport :: !(Prelude.Maybe FieldOptions'FeatureSupport),
                                   _EnumValueOptions'uninterpretedOption :: !(Data.Vector.Vector UninterpretedOption),
                                   _EnumValueOptions'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show EnumValueOptions where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField EnumValueOptions "deprecated" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumValueOptions'deprecated
           (\ x__ y__ -> x__ {_EnumValueOptions'deprecated = y__}))
        (Data.ProtoLens.maybeLens Prelude.False)
instance Data.ProtoLens.Field.HasField EnumValueOptions "maybe'deprecated" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumValueOptions'deprecated
           (\ x__ y__ -> x__ {_EnumValueOptions'deprecated = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField EnumValueOptions "features" FeatureSet where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumValueOptions'features
           (\ x__ y__ -> x__ {_EnumValueOptions'features = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField EnumValueOptions "maybe'features" (Prelude.Maybe FeatureSet) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumValueOptions'features
           (\ x__ y__ -> x__ {_EnumValueOptions'features = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField EnumValueOptions "debugRedact" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumValueOptions'debugRedact
           (\ x__ y__ -> x__ {_EnumValueOptions'debugRedact = y__}))
        (Data.ProtoLens.maybeLens Prelude.False)
instance Data.ProtoLens.Field.HasField EnumValueOptions "maybe'debugRedact" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumValueOptions'debugRedact
           (\ x__ y__ -> x__ {_EnumValueOptions'debugRedact = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField EnumValueOptions "featureSupport" FieldOptions'FeatureSupport where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumValueOptions'featureSupport
           (\ x__ y__ -> x__ {_EnumValueOptions'featureSupport = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField EnumValueOptions "maybe'featureSupport" (Prelude.Maybe FieldOptions'FeatureSupport) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumValueOptions'featureSupport
           (\ x__ y__ -> x__ {_EnumValueOptions'featureSupport = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField EnumValueOptions "uninterpretedOption" [UninterpretedOption] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumValueOptions'uninterpretedOption
           (\ x__ y__ -> x__ {_EnumValueOptions'uninterpretedOption = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField EnumValueOptions "vec'uninterpretedOption" (Data.Vector.Vector UninterpretedOption) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumValueOptions'uninterpretedOption
           (\ x__ y__ -> x__ {_EnumValueOptions'uninterpretedOption = y__}))
        Prelude.id
instance Data.ProtoLens.Message EnumValueOptions where
  messageName _ = Data.Text.pack "google.protobuf.EnumValueOptions"
  packedMessageDescriptor _
    = "\n\
      \\DLEEnumValueOptions\DC2%\n\
      \\n\
      \deprecated\CAN\SOH \SOH(\b:\ENQfalseR\n\
      \deprecated\DC27\n\
      \\bfeatures\CAN\STX \SOH(\v2\ESC.google.protobuf.FeatureSetR\bfeatures\DC2(\n\
      \\fdebug_redact\CAN\ETX \SOH(\b:\ENQfalseR\vdebugRedact\DC2U\n\
      \\SIfeature_support\CAN\EOT \SOH(\v2,.google.protobuf.FieldOptions.FeatureSupportR\SOfeatureSupport\DC2X\n\
      \\DC4uninterpreted_option\CAN\231\a \ETX(\v2$.google.protobuf.UninterpretedOptionR\DC3uninterpretedOption*\t\b\232\a\DLE\128\128\128\128\STX"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        deprecated__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "deprecated"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'deprecated")) ::
              Data.ProtoLens.FieldDescriptor EnumValueOptions
        features__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "features"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor FeatureSet)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'features")) ::
              Data.ProtoLens.FieldDescriptor EnumValueOptions
        debugRedact__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "debug_redact"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'debugRedact")) ::
              Data.ProtoLens.FieldDescriptor EnumValueOptions
        featureSupport__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "feature_support"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor FieldOptions'FeatureSupport)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'featureSupport")) ::
              Data.ProtoLens.FieldDescriptor EnumValueOptions
        uninterpretedOption__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "uninterpreted_option"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor UninterpretedOption)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"uninterpretedOption")) ::
              Data.ProtoLens.FieldDescriptor EnumValueOptions
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, deprecated__field_descriptor),
           (Data.ProtoLens.Tag 2, features__field_descriptor),
           (Data.ProtoLens.Tag 3, debugRedact__field_descriptor),
           (Data.ProtoLens.Tag 4, featureSupport__field_descriptor),
           (Data.ProtoLens.Tag 999, uninterpretedOption__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _EnumValueOptions'_unknownFields
        (\ x__ y__ -> x__ {_EnumValueOptions'_unknownFields = y__})
  defMessage
    = EnumValueOptions'_constructor
        {_EnumValueOptions'deprecated = Prelude.Nothing,
         _EnumValueOptions'features = Prelude.Nothing,
         _EnumValueOptions'debugRedact = Prelude.Nothing,
         _EnumValueOptions'featureSupport = Prelude.Nothing,
         _EnumValueOptions'uninterpretedOption = Data.Vector.Generic.empty,
         _EnumValueOptions'_unknownFields = []}
  parseMessage
    = let
        loop ::
          EnumValueOptions
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld UninterpretedOption
             -> Data.ProtoLens.Encoding.Bytes.Parser EnumValueOptions
        loop x mutable'uninterpretedOption
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'uninterpretedOption <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                      (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                         mutable'uninterpretedOption)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields
                           (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'uninterpretedOption")
                              frozen'uninterpretedOption
                              x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "deprecated"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"deprecated") y x)
                                  mutable'uninterpretedOption
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "features"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"features") y x)
                                  mutable'uninterpretedOption
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "debug_redact"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"debugRedact") y x)
                                  mutable'uninterpretedOption
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "feature_support"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"featureSupport") y x)
                                  mutable'uninterpretedOption
                        7994
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "uninterpreted_option"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'uninterpretedOption y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'uninterpretedOption
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'uninterpretedOption <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                               Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'uninterpretedOption)
          "EnumValueOptions"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view
                    (Data.ProtoLens.Field.field @"maybe'deprecated") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                       ((Prelude..)
                          Data.ProtoLens.Encoding.Bytes.putVarInt
                          (\ b -> if b then 1 else 0)
                          _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'features") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage
                             _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view
                          (Data.ProtoLens.Field.field @"maybe'debugRedact") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                             ((Prelude..)
                                Data.ProtoLens.Encoding.Bytes.putVarInt
                                (\ b -> if b then 1 else 0)
                                _v))
                   ((Data.Monoid.<>)
                      (case
                           Lens.Family2.view
                             (Data.ProtoLens.Field.field @"maybe'featureSupport") _x
                       of
                         Prelude.Nothing -> Data.Monoid.mempty
                         (Prelude.Just _v)
                           -> (Data.Monoid.<>)
                                (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                                ((Prelude..)
                                   (\ bs
                                      -> (Data.Monoid.<>)
                                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                                              (Prelude.fromIntegral (Data.ByteString.length bs)))
                                           (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                   Data.ProtoLens.encodeMessage
                                   _v))
                      ((Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                            (\ _v
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt 7994)
                                    ((Prelude..)
                                       (\ bs
                                          -> (Data.Monoid.<>)
                                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                  (Prelude.fromIntegral
                                                     (Data.ByteString.length bs)))
                                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                       Data.ProtoLens.encodeMessage
                                       _v))
                            (Lens.Family2.view
                               (Data.ProtoLens.Field.field @"vec'uninterpretedOption") _x))
                         (Data.ProtoLens.Encoding.Wire.buildFieldSet
                            (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))
instance Control.DeepSeq.NFData EnumValueOptions where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_EnumValueOptions'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_EnumValueOptions'deprecated x__)
                (Control.DeepSeq.deepseq
                   (_EnumValueOptions'features x__)
                   (Control.DeepSeq.deepseq
                      (_EnumValueOptions'debugRedact x__)
                      (Control.DeepSeq.deepseq
                         (_EnumValueOptions'featureSupport x__)
                         (Control.DeepSeq.deepseq
                            (_EnumValueOptions'uninterpretedOption x__) ())))))
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.uninterpretedOption' @:: Lens' ExtensionRangeOptions [UninterpretedOption]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'uninterpretedOption' @:: Lens' ExtensionRangeOptions (Data.Vector.Vector UninterpretedOption)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.declaration' @:: Lens' ExtensionRangeOptions [ExtensionRangeOptions'Declaration]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'declaration' @:: Lens' ExtensionRangeOptions (Data.Vector.Vector ExtensionRangeOptions'Declaration)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.features' @:: Lens' ExtensionRangeOptions FeatureSet@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'features' @:: Lens' ExtensionRangeOptions (Prelude.Maybe FeatureSet)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.verification' @:: Lens' ExtensionRangeOptions ExtensionRangeOptions'VerificationState@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'verification' @:: Lens' ExtensionRangeOptions (Prelude.Maybe ExtensionRangeOptions'VerificationState)@ -}
data ExtensionRangeOptions
  = ExtensionRangeOptions'_constructor {_ExtensionRangeOptions'uninterpretedOption :: !(Data.Vector.Vector UninterpretedOption),
                                        _ExtensionRangeOptions'declaration :: !(Data.Vector.Vector ExtensionRangeOptions'Declaration),
                                        _ExtensionRangeOptions'features :: !(Prelude.Maybe FeatureSet),
                                        _ExtensionRangeOptions'verification :: !(Prelude.Maybe ExtensionRangeOptions'VerificationState),
                                        _ExtensionRangeOptions'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ExtensionRangeOptions where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ExtensionRangeOptions "uninterpretedOption" [UninterpretedOption] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ExtensionRangeOptions'uninterpretedOption
           (\ x__ y__
              -> x__ {_ExtensionRangeOptions'uninterpretedOption = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField ExtensionRangeOptions "vec'uninterpretedOption" (Data.Vector.Vector UninterpretedOption) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ExtensionRangeOptions'uninterpretedOption
           (\ x__ y__
              -> x__ {_ExtensionRangeOptions'uninterpretedOption = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ExtensionRangeOptions "declaration" [ExtensionRangeOptions'Declaration] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ExtensionRangeOptions'declaration
           (\ x__ y__ -> x__ {_ExtensionRangeOptions'declaration = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField ExtensionRangeOptions "vec'declaration" (Data.Vector.Vector ExtensionRangeOptions'Declaration) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ExtensionRangeOptions'declaration
           (\ x__ y__ -> x__ {_ExtensionRangeOptions'declaration = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ExtensionRangeOptions "features" FeatureSet where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ExtensionRangeOptions'features
           (\ x__ y__ -> x__ {_ExtensionRangeOptions'features = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField ExtensionRangeOptions "maybe'features" (Prelude.Maybe FeatureSet) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ExtensionRangeOptions'features
           (\ x__ y__ -> x__ {_ExtensionRangeOptions'features = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ExtensionRangeOptions "verification" ExtensionRangeOptions'VerificationState where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ExtensionRangeOptions'verification
           (\ x__ y__ -> x__ {_ExtensionRangeOptions'verification = y__}))
        (Data.ProtoLens.maybeLens ExtensionRangeOptions'UNVERIFIED)
instance Data.ProtoLens.Field.HasField ExtensionRangeOptions "maybe'verification" (Prelude.Maybe ExtensionRangeOptions'VerificationState) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ExtensionRangeOptions'verification
           (\ x__ y__ -> x__ {_ExtensionRangeOptions'verification = y__}))
        Prelude.id
instance Data.ProtoLens.Message ExtensionRangeOptions where
  messageName _
    = Data.Text.pack "google.protobuf.ExtensionRangeOptions"
  packedMessageDescriptor _
    = "\n\
      \\NAKExtensionRangeOptions\DC2X\n\
      \\DC4uninterpreted_option\CAN\231\a \ETX(\v2$.google.protobuf.UninterpretedOptionR\DC3uninterpretedOption\DC2Y\n\
      \\vdeclaration\CAN\STX \ETX(\v22.google.protobuf.ExtensionRangeOptions.DeclarationR\vdeclarationB\ETX\136\SOH\STX\DC27\n\
      \\bfeatures\CAN2 \SOH(\v2\ESC.google.protobuf.FeatureSetR\bfeatures\DC2m\n\
      \\fverification\CAN\ETX \SOH(\SO28.google.protobuf.ExtensionRangeOptions.VerificationState:\n\
      \UNVERIFIEDR\fverificationB\ETX\136\SOH\STX\SUB\148\SOH\n\
      \\vDeclaration\DC2\SYN\n\
      \\ACKnumber\CAN\SOH \SOH(\ENQR\ACKnumber\DC2\ESC\n\
      \\tfull_name\CAN\STX \SOH(\tR\bfullName\DC2\DC2\n\
      \\EOTtype\CAN\ETX \SOH(\tR\EOTtype\DC2\SUB\n\
      \\breserved\CAN\ENQ \SOH(\bR\breserved\DC2\SUB\n\
      \\brepeated\CAN\ACK \SOH(\bR\brepeatedJ\EOT\b\EOT\DLE\ENQ\"4\n\
      \\DC1VerificationState\DC2\SI\n\
      \\vDECLARATION\DLE\NUL\DC2\SO\n\
      \\n\
      \UNVERIFIED\DLE\SOH*\t\b\232\a\DLE\128\128\128\128\STX"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        uninterpretedOption__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "uninterpreted_option"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor UninterpretedOption)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"uninterpretedOption")) ::
              Data.ProtoLens.FieldDescriptor ExtensionRangeOptions
        declaration__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "declaration"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ExtensionRangeOptions'Declaration)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"declaration")) ::
              Data.ProtoLens.FieldDescriptor ExtensionRangeOptions
        features__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "features"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor FeatureSet)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'features")) ::
              Data.ProtoLens.FieldDescriptor ExtensionRangeOptions
        verification__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "verification"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor ExtensionRangeOptions'VerificationState)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'verification")) ::
              Data.ProtoLens.FieldDescriptor ExtensionRangeOptions
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 999, uninterpretedOption__field_descriptor),
           (Data.ProtoLens.Tag 2, declaration__field_descriptor),
           (Data.ProtoLens.Tag 50, features__field_descriptor),
           (Data.ProtoLens.Tag 3, verification__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ExtensionRangeOptions'_unknownFields
        (\ x__ y__ -> x__ {_ExtensionRangeOptions'_unknownFields = y__})
  defMessage
    = ExtensionRangeOptions'_constructor
        {_ExtensionRangeOptions'uninterpretedOption = Data.Vector.Generic.empty,
         _ExtensionRangeOptions'declaration = Data.Vector.Generic.empty,
         _ExtensionRangeOptions'features = Prelude.Nothing,
         _ExtensionRangeOptions'verification = Prelude.Nothing,
         _ExtensionRangeOptions'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ExtensionRangeOptions
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld ExtensionRangeOptions'Declaration
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld UninterpretedOption
                -> Data.ProtoLens.Encoding.Bytes.Parser ExtensionRangeOptions
        loop x mutable'declaration mutable'uninterpretedOption
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'declaration <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                              (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                 mutable'declaration)
                      frozen'uninterpretedOption <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                      (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                         mutable'uninterpretedOption)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields
                           (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'declaration")
                              frozen'declaration
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'uninterpretedOption")
                                 frozen'uninterpretedOption
                                 x)))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        7994
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "uninterpreted_option"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'uninterpretedOption y)
                                loop x mutable'declaration v
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "declaration"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'declaration y)
                                loop x v mutable'uninterpretedOption
                        402
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "features"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"features") y x)
                                  mutable'declaration
                                  mutable'uninterpretedOption
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "verification"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"verification") y x)
                                  mutable'declaration
                                  mutable'uninterpretedOption
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'declaration
                                  mutable'uninterpretedOption
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'declaration <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       Data.ProtoLens.Encoding.Growing.new
              mutable'uninterpretedOption <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                               Data.ProtoLens.Encoding.Growing.new
              loop
                Data.ProtoLens.defMessage
                mutable'declaration
                mutable'uninterpretedOption)
          "ExtensionRangeOptions"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                (\ _v
                   -> (Data.Monoid.<>)
                        (Data.ProtoLens.Encoding.Bytes.putVarInt 7994)
                        ((Prelude..)
                           (\ bs
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (Prelude.fromIntegral (Data.ByteString.length bs)))
                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           Data.ProtoLens.encodeMessage
                           _v))
                (Lens.Family2.view
                   (Data.ProtoLens.Field.field @"vec'uninterpretedOption") _x))
             ((Data.Monoid.<>)
                (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                   (\ _v
                      -> (Data.Monoid.<>)
                           (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                           ((Prelude..)
                              (\ bs
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                         (Prelude.fromIntegral (Data.ByteString.length bs)))
                                      (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                              Data.ProtoLens.encodeMessage
                              _v))
                   (Lens.Family2.view
                      (Data.ProtoLens.Field.field @"vec'declaration") _x))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'features") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 402)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage
                                _v))
                   ((Data.Monoid.<>)
                      (case
                           Lens.Family2.view
                             (Data.ProtoLens.Field.field @"maybe'verification") _x
                       of
                         Prelude.Nothing -> Data.Monoid.mempty
                         (Prelude.Just _v)
                           -> (Data.Monoid.<>)
                                (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                                ((Prelude..)
                                   ((Prelude..)
                                      Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                                   Prelude.fromEnum
                                   _v))
                      (Data.ProtoLens.Encoding.Wire.buildFieldSet
                         (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))
instance Control.DeepSeq.NFData ExtensionRangeOptions where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ExtensionRangeOptions'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_ExtensionRangeOptions'uninterpretedOption x__)
                (Control.DeepSeq.deepseq
                   (_ExtensionRangeOptions'declaration x__)
                   (Control.DeepSeq.deepseq
                      (_ExtensionRangeOptions'features x__)
                      (Control.DeepSeq.deepseq
                         (_ExtensionRangeOptions'verification x__) ()))))
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.number' @:: Lens' ExtensionRangeOptions'Declaration Data.Int.Int32@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'number' @:: Lens' ExtensionRangeOptions'Declaration (Prelude.Maybe Data.Int.Int32)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.fullName' @:: Lens' ExtensionRangeOptions'Declaration Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'fullName' @:: Lens' ExtensionRangeOptions'Declaration (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.type'' @:: Lens' ExtensionRangeOptions'Declaration Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'type'' @:: Lens' ExtensionRangeOptions'Declaration (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.reserved' @:: Lens' ExtensionRangeOptions'Declaration Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'reserved' @:: Lens' ExtensionRangeOptions'Declaration (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.repeated' @:: Lens' ExtensionRangeOptions'Declaration Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'repeated' @:: Lens' ExtensionRangeOptions'Declaration (Prelude.Maybe Prelude.Bool)@ -}
data ExtensionRangeOptions'Declaration
  = ExtensionRangeOptions'Declaration'_constructor {_ExtensionRangeOptions'Declaration'number :: !(Prelude.Maybe Data.Int.Int32),
                                                    _ExtensionRangeOptions'Declaration'fullName :: !(Prelude.Maybe Data.Text.Text),
                                                    _ExtensionRangeOptions'Declaration'type' :: !(Prelude.Maybe Data.Text.Text),
                                                    _ExtensionRangeOptions'Declaration'reserved :: !(Prelude.Maybe Prelude.Bool),
                                                    _ExtensionRangeOptions'Declaration'repeated :: !(Prelude.Maybe Prelude.Bool),
                                                    _ExtensionRangeOptions'Declaration'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ExtensionRangeOptions'Declaration where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ExtensionRangeOptions'Declaration "number" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ExtensionRangeOptions'Declaration'number
           (\ x__ y__
              -> x__ {_ExtensionRangeOptions'Declaration'number = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField ExtensionRangeOptions'Declaration "maybe'number" (Prelude.Maybe Data.Int.Int32) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ExtensionRangeOptions'Declaration'number
           (\ x__ y__
              -> x__ {_ExtensionRangeOptions'Declaration'number = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ExtensionRangeOptions'Declaration "fullName" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ExtensionRangeOptions'Declaration'fullName
           (\ x__ y__
              -> x__ {_ExtensionRangeOptions'Declaration'fullName = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField ExtensionRangeOptions'Declaration "maybe'fullName" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ExtensionRangeOptions'Declaration'fullName
           (\ x__ y__
              -> x__ {_ExtensionRangeOptions'Declaration'fullName = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ExtensionRangeOptions'Declaration "type'" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ExtensionRangeOptions'Declaration'type'
           (\ x__ y__
              -> x__ {_ExtensionRangeOptions'Declaration'type' = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField ExtensionRangeOptions'Declaration "maybe'type'" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ExtensionRangeOptions'Declaration'type'
           (\ x__ y__
              -> x__ {_ExtensionRangeOptions'Declaration'type' = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ExtensionRangeOptions'Declaration "reserved" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ExtensionRangeOptions'Declaration'reserved
           (\ x__ y__
              -> x__ {_ExtensionRangeOptions'Declaration'reserved = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField ExtensionRangeOptions'Declaration "maybe'reserved" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ExtensionRangeOptions'Declaration'reserved
           (\ x__ y__
              -> x__ {_ExtensionRangeOptions'Declaration'reserved = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ExtensionRangeOptions'Declaration "repeated" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ExtensionRangeOptions'Declaration'repeated
           (\ x__ y__
              -> x__ {_ExtensionRangeOptions'Declaration'repeated = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField ExtensionRangeOptions'Declaration "maybe'repeated" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ExtensionRangeOptions'Declaration'repeated
           (\ x__ y__
              -> x__ {_ExtensionRangeOptions'Declaration'repeated = y__}))
        Prelude.id
instance Data.ProtoLens.Message ExtensionRangeOptions'Declaration where
  messageName _
    = Data.Text.pack
        "google.protobuf.ExtensionRangeOptions.Declaration"
  packedMessageDescriptor _
    = "\n\
      \\vDeclaration\DC2\SYN\n\
      \\ACKnumber\CAN\SOH \SOH(\ENQR\ACKnumber\DC2\ESC\n\
      \\tfull_name\CAN\STX \SOH(\tR\bfullName\DC2\DC2\n\
      \\EOTtype\CAN\ETX \SOH(\tR\EOTtype\DC2\SUB\n\
      \\breserved\CAN\ENQ \SOH(\bR\breserved\DC2\SUB\n\
      \\brepeated\CAN\ACK \SOH(\bR\brepeatedJ\EOT\b\EOT\DLE\ENQ"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        number__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "number"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'number")) ::
              Data.ProtoLens.FieldDescriptor ExtensionRangeOptions'Declaration
        fullName__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "full_name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'fullName")) ::
              Data.ProtoLens.FieldDescriptor ExtensionRangeOptions'Declaration
        type'__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "type"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'type'")) ::
              Data.ProtoLens.FieldDescriptor ExtensionRangeOptions'Declaration
        reserved__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "reserved"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'reserved")) ::
              Data.ProtoLens.FieldDescriptor ExtensionRangeOptions'Declaration
        repeated__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "repeated"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'repeated")) ::
              Data.ProtoLens.FieldDescriptor ExtensionRangeOptions'Declaration
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, number__field_descriptor),
           (Data.ProtoLens.Tag 2, fullName__field_descriptor),
           (Data.ProtoLens.Tag 3, type'__field_descriptor),
           (Data.ProtoLens.Tag 5, reserved__field_descriptor),
           (Data.ProtoLens.Tag 6, repeated__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ExtensionRangeOptions'Declaration'_unknownFields
        (\ x__ y__
           -> x__ {_ExtensionRangeOptions'Declaration'_unknownFields = y__})
  defMessage
    = ExtensionRangeOptions'Declaration'_constructor
        {_ExtensionRangeOptions'Declaration'number = Prelude.Nothing,
         _ExtensionRangeOptions'Declaration'fullName = Prelude.Nothing,
         _ExtensionRangeOptions'Declaration'type' = Prelude.Nothing,
         _ExtensionRangeOptions'Declaration'reserved = Prelude.Nothing,
         _ExtensionRangeOptions'Declaration'repeated = Prelude.Nothing,
         _ExtensionRangeOptions'Declaration'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ExtensionRangeOptions'Declaration
          -> Data.ProtoLens.Encoding.Bytes.Parser ExtensionRangeOptions'Declaration
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "number"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"number") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "full_name"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"fullName") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "type"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"type'") y x)
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "reserved"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"reserved") y x)
                        48
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "repeated"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"repeated") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Declaration"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'number") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                       ((Prelude..)
                          Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'fullName") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.Text.Encoding.encodeUtf8
                             _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'type'") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.Text.Encoding.encodeUtf8
                                _v))
                   ((Data.Monoid.<>)
                      (case
                           Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'reserved") _x
                       of
                         Prelude.Nothing -> Data.Monoid.mempty
                         (Prelude.Just _v)
                           -> (Data.Monoid.<>)
                                (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                ((Prelude..)
                                   Data.ProtoLens.Encoding.Bytes.putVarInt
                                   (\ b -> if b then 1 else 0)
                                   _v))
                      ((Data.Monoid.<>)
                         (case
                              Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'repeated") _x
                          of
                            Prelude.Nothing -> Data.Monoid.mempty
                            (Prelude.Just _v)
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt 48)
                                   ((Prelude..)
                                      Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (\ b -> if b then 1 else 0)
                                      _v))
                         (Data.ProtoLens.Encoding.Wire.buildFieldSet
                            (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))
instance Control.DeepSeq.NFData ExtensionRangeOptions'Declaration where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ExtensionRangeOptions'Declaration'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_ExtensionRangeOptions'Declaration'number x__)
                (Control.DeepSeq.deepseq
                   (_ExtensionRangeOptions'Declaration'fullName x__)
                   (Control.DeepSeq.deepseq
                      (_ExtensionRangeOptions'Declaration'type' x__)
                      (Control.DeepSeq.deepseq
                         (_ExtensionRangeOptions'Declaration'reserved x__)
                         (Control.DeepSeq.deepseq
                            (_ExtensionRangeOptions'Declaration'repeated x__) ())))))
data ExtensionRangeOptions'VerificationState
  = ExtensionRangeOptions'DECLARATION |
    ExtensionRangeOptions'UNVERIFIED
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum ExtensionRangeOptions'VerificationState where
  maybeToEnum 0 = Prelude.Just ExtensionRangeOptions'DECLARATION
  maybeToEnum 1 = Prelude.Just ExtensionRangeOptions'UNVERIFIED
  maybeToEnum _ = Prelude.Nothing
  showEnum ExtensionRangeOptions'DECLARATION = "DECLARATION"
  showEnum ExtensionRangeOptions'UNVERIFIED = "UNVERIFIED"
  readEnum k
    | (Prelude.==) k "DECLARATION"
    = Prelude.Just ExtensionRangeOptions'DECLARATION
    | (Prelude.==) k "UNVERIFIED"
    = Prelude.Just ExtensionRangeOptions'UNVERIFIED
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded ExtensionRangeOptions'VerificationState where
  minBound = ExtensionRangeOptions'DECLARATION
  maxBound = ExtensionRangeOptions'UNVERIFIED
instance Prelude.Enum ExtensionRangeOptions'VerificationState where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum VerificationState: "
              (Prelude.show k__)))
        Prelude.id
        (Data.ProtoLens.maybeToEnum k__)
  fromEnum ExtensionRangeOptions'DECLARATION = 0
  fromEnum ExtensionRangeOptions'UNVERIFIED = 1
  succ ExtensionRangeOptions'UNVERIFIED
    = Prelude.error
        "ExtensionRangeOptions'VerificationState.succ: bad argument ExtensionRangeOptions'UNVERIFIED. This value would be out of bounds."
  succ ExtensionRangeOptions'DECLARATION
    = ExtensionRangeOptions'UNVERIFIED
  pred ExtensionRangeOptions'DECLARATION
    = Prelude.error
        "ExtensionRangeOptions'VerificationState.pred: bad argument ExtensionRangeOptions'DECLARATION. This value would be out of bounds."
  pred ExtensionRangeOptions'UNVERIFIED
    = ExtensionRangeOptions'DECLARATION
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault ExtensionRangeOptions'VerificationState where
  fieldDefault = ExtensionRangeOptions'DECLARATION
instance Control.DeepSeq.NFData ExtensionRangeOptions'VerificationState where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.fieldPresence' @:: Lens' FeatureSet FeatureSet'FieldPresence@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'fieldPresence' @:: Lens' FeatureSet (Prelude.Maybe FeatureSet'FieldPresence)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.enumType' @:: Lens' FeatureSet FeatureSet'EnumType@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'enumType' @:: Lens' FeatureSet (Prelude.Maybe FeatureSet'EnumType)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.repeatedFieldEncoding' @:: Lens' FeatureSet FeatureSet'RepeatedFieldEncoding@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'repeatedFieldEncoding' @:: Lens' FeatureSet (Prelude.Maybe FeatureSet'RepeatedFieldEncoding)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.utf8Validation' @:: Lens' FeatureSet FeatureSet'Utf8Validation@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'utf8Validation' @:: Lens' FeatureSet (Prelude.Maybe FeatureSet'Utf8Validation)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.messageEncoding' @:: Lens' FeatureSet FeatureSet'MessageEncoding@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'messageEncoding' @:: Lens' FeatureSet (Prelude.Maybe FeatureSet'MessageEncoding)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.jsonFormat' @:: Lens' FeatureSet FeatureSet'JsonFormat@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'jsonFormat' @:: Lens' FeatureSet (Prelude.Maybe FeatureSet'JsonFormat)@ -}
data FeatureSet
  = FeatureSet'_constructor {_FeatureSet'fieldPresence :: !(Prelude.Maybe FeatureSet'FieldPresence),
                             _FeatureSet'enumType :: !(Prelude.Maybe FeatureSet'EnumType),
                             _FeatureSet'repeatedFieldEncoding :: !(Prelude.Maybe FeatureSet'RepeatedFieldEncoding),
                             _FeatureSet'utf8Validation :: !(Prelude.Maybe FeatureSet'Utf8Validation),
                             _FeatureSet'messageEncoding :: !(Prelude.Maybe FeatureSet'MessageEncoding),
                             _FeatureSet'jsonFormat :: !(Prelude.Maybe FeatureSet'JsonFormat),
                             _FeatureSet'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show FeatureSet where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField FeatureSet "fieldPresence" FeatureSet'FieldPresence where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FeatureSet'fieldPresence
           (\ x__ y__ -> x__ {_FeatureSet'fieldPresence = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FeatureSet "maybe'fieldPresence" (Prelude.Maybe FeatureSet'FieldPresence) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FeatureSet'fieldPresence
           (\ x__ y__ -> x__ {_FeatureSet'fieldPresence = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FeatureSet "enumType" FeatureSet'EnumType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FeatureSet'enumType
           (\ x__ y__ -> x__ {_FeatureSet'enumType = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FeatureSet "maybe'enumType" (Prelude.Maybe FeatureSet'EnumType) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FeatureSet'enumType
           (\ x__ y__ -> x__ {_FeatureSet'enumType = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FeatureSet "repeatedFieldEncoding" FeatureSet'RepeatedFieldEncoding where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FeatureSet'repeatedFieldEncoding
           (\ x__ y__ -> x__ {_FeatureSet'repeatedFieldEncoding = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FeatureSet "maybe'repeatedFieldEncoding" (Prelude.Maybe FeatureSet'RepeatedFieldEncoding) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FeatureSet'repeatedFieldEncoding
           (\ x__ y__ -> x__ {_FeatureSet'repeatedFieldEncoding = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FeatureSet "utf8Validation" FeatureSet'Utf8Validation where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FeatureSet'utf8Validation
           (\ x__ y__ -> x__ {_FeatureSet'utf8Validation = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FeatureSet "maybe'utf8Validation" (Prelude.Maybe FeatureSet'Utf8Validation) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FeatureSet'utf8Validation
           (\ x__ y__ -> x__ {_FeatureSet'utf8Validation = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FeatureSet "messageEncoding" FeatureSet'MessageEncoding where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FeatureSet'messageEncoding
           (\ x__ y__ -> x__ {_FeatureSet'messageEncoding = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FeatureSet "maybe'messageEncoding" (Prelude.Maybe FeatureSet'MessageEncoding) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FeatureSet'messageEncoding
           (\ x__ y__ -> x__ {_FeatureSet'messageEncoding = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FeatureSet "jsonFormat" FeatureSet'JsonFormat where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FeatureSet'jsonFormat
           (\ x__ y__ -> x__ {_FeatureSet'jsonFormat = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FeatureSet "maybe'jsonFormat" (Prelude.Maybe FeatureSet'JsonFormat) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FeatureSet'jsonFormat
           (\ x__ y__ -> x__ {_FeatureSet'jsonFormat = y__}))
        Prelude.id
instance Data.ProtoLens.Message FeatureSet where
  messageName _ = Data.Text.pack "google.protobuf.FeatureSet"
  packedMessageDescriptor _
    = "\n\
      \\n\
      \FeatureSet\DC2\145\SOH\n\
      \\SOfield_presence\CAN\SOH \SOH(\SO2).google.protobuf.FeatureSet.FieldPresenceR\rfieldPresenceB?\136\SOH\SOH\152\SOH\EOT\152\SOH\SOH\162\SOH\r\DC2\bEXPLICIT\CAN\132\a\162\SOH\r\DC2\bIMPLICIT\CAN\231\a\162\SOH\r\DC2\bEXPLICIT\CAN\232\a\178\SOH\ETX\b\232\a\DC2l\n\
      \\tenum_type\CAN\STX \SOH(\SO2$.google.protobuf.FeatureSet.EnumTypeR\benumTypeB)\136\SOH\SOH\152\SOH\ACK\152\SOH\SOH\162\SOH\v\DC2\ACKCLOSED\CAN\132\a\162\SOH\t\DC2\EOTOPEN\CAN\231\a\178\SOH\ETX\b\232\a\DC2\152\SOH\n\
      \\ETBrepeated_field_encoding\CAN\ETX \SOH(\SO21.google.protobuf.FeatureSet.RepeatedFieldEncodingR\NAKrepeatedFieldEncodingB-\136\SOH\SOH\152\SOH\EOT\152\SOH\SOH\162\SOH\r\DC2\bEXPANDED\CAN\132\a\162\SOH\v\DC2\ACKPACKED\CAN\231\a\178\SOH\ETX\b\232\a\DC2~\n\
      \\SIutf8_validation\CAN\EOT \SOH(\SO2*.google.protobuf.FeatureSet.Utf8ValidationR\SOutf8ValidationB)\136\SOH\SOH\152\SOH\EOT\152\SOH\SOH\162\SOH\t\DC2\EOTNONE\CAN\132\a\162\SOH\v\DC2\ACKVERIFY\CAN\231\a\178\SOH\ETX\b\232\a\DC2~\n\
      \\DLEmessage_encoding\CAN\ENQ \SOH(\SO2+.google.protobuf.FeatureSet.MessageEncodingR\SImessageEncodingB&\136\SOH\SOH\152\SOH\EOT\152\SOH\SOH\162\SOH\DC4\DC2\SILENGTH_PREFIXED\CAN\132\a\178\SOH\ETX\b\232\a\DC2\130\SOH\n\
      \\vjson_format\CAN\ACK \SOH(\SO2&.google.protobuf.FeatureSet.JsonFormatR\n\
      \jsonFormatB9\136\SOH\SOH\152\SOH\ETX\152\SOH\ACK\152\SOH\SOH\162\SOH\ETB\DC2\DC2LEGACY_BEST_EFFORT\CAN\132\a\162\SOH\n\
      \\DC2\ENQALLOW\CAN\231\a\178\SOH\ETX\b\232\a\"\\\n\
      \\rFieldPresence\DC2\SUB\n\
      \\SYNFIELD_PRESENCE_UNKNOWN\DLE\NUL\DC2\f\n\
      \\bEXPLICIT\DLE\SOH\DC2\f\n\
      \\bIMPLICIT\DLE\STX\DC2\DC3\n\
      \\SILEGACY_REQUIRED\DLE\ETX\"7\n\
      \\bEnumType\DC2\NAK\n\
      \\DC1ENUM_TYPE_UNKNOWN\DLE\NUL\DC2\b\n\
      \\EOTOPEN\DLE\SOH\DC2\n\
      \\n\
      \\ACKCLOSED\DLE\STX\"V\n\
      \\NAKRepeatedFieldEncoding\DC2#\n\
      \\USREPEATED_FIELD_ENCODING_UNKNOWN\DLE\NUL\DC2\n\
      \\n\
      \\ACKPACKED\DLE\SOH\DC2\f\n\
      \\bEXPANDED\DLE\STX\"I\n\
      \\SOUtf8Validation\DC2\ESC\n\
      \\ETBUTF8_VALIDATION_UNKNOWN\DLE\NUL\DC2\n\
      \\n\
      \\ACKVERIFY\DLE\STX\DC2\b\n\
      \\EOTNONE\DLE\ETX\"\EOT\b\SOH\DLE\SOH\"S\n\
      \\SIMessageEncoding\DC2\FS\n\
      \\CANMESSAGE_ENCODING_UNKNOWN\DLE\NUL\DC2\DC3\n\
      \\SILENGTH_PREFIXED\DLE\SOH\DC2\r\n\
      \\tDELIMITED\DLE\STX\"H\n\
      \\n\
      \JsonFormat\DC2\ETB\n\
      \\DC3JSON_FORMAT_UNKNOWN\DLE\NUL\DC2\t\n\
      \\ENQALLOW\DLE\SOH\DC2\SYN\n\
      \\DC2LEGACY_BEST_EFFORT\DLE\STX*\ACK\b\232\a\DLE\139N*\ACK\b\139N\DLE\144N*\ACK\b\144N\DLE\145NJ\ACK\b\231\a\DLE\232\a"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        fieldPresence__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "field_presence"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor FeatureSet'FieldPresence)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'fieldPresence")) ::
              Data.ProtoLens.FieldDescriptor FeatureSet
        enumType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "enum_type"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor FeatureSet'EnumType)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'enumType")) ::
              Data.ProtoLens.FieldDescriptor FeatureSet
        repeatedFieldEncoding__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "repeated_field_encoding"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor FeatureSet'RepeatedFieldEncoding)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'repeatedFieldEncoding")) ::
              Data.ProtoLens.FieldDescriptor FeatureSet
        utf8Validation__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "utf8_validation"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor FeatureSet'Utf8Validation)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'utf8Validation")) ::
              Data.ProtoLens.FieldDescriptor FeatureSet
        messageEncoding__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "message_encoding"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor FeatureSet'MessageEncoding)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'messageEncoding")) ::
              Data.ProtoLens.FieldDescriptor FeatureSet
        jsonFormat__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "json_format"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor FeatureSet'JsonFormat)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'jsonFormat")) ::
              Data.ProtoLens.FieldDescriptor FeatureSet
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, fieldPresence__field_descriptor),
           (Data.ProtoLens.Tag 2, enumType__field_descriptor),
           (Data.ProtoLens.Tag 3, repeatedFieldEncoding__field_descriptor),
           (Data.ProtoLens.Tag 4, utf8Validation__field_descriptor),
           (Data.ProtoLens.Tag 5, messageEncoding__field_descriptor),
           (Data.ProtoLens.Tag 6, jsonFormat__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _FeatureSet'_unknownFields
        (\ x__ y__ -> x__ {_FeatureSet'_unknownFields = y__})
  defMessage
    = FeatureSet'_constructor
        {_FeatureSet'fieldPresence = Prelude.Nothing,
         _FeatureSet'enumType = Prelude.Nothing,
         _FeatureSet'repeatedFieldEncoding = Prelude.Nothing,
         _FeatureSet'utf8Validation = Prelude.Nothing,
         _FeatureSet'messageEncoding = Prelude.Nothing,
         _FeatureSet'jsonFormat = Prelude.Nothing,
         _FeatureSet'_unknownFields = []}
  parseMessage
    = let
        loop ::
          FeatureSet -> Data.ProtoLens.Encoding.Bytes.Parser FeatureSet
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "field_presence"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"fieldPresence") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "enum_type"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"enumType") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "repeated_field_encoding"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"repeatedFieldEncoding") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "utf8_validation"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"utf8Validation") y x)
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "message_encoding"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"messageEncoding") y x)
                        48
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "json_format"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"jsonFormat") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "FeatureSet"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view
                    (Data.ProtoLens.Field.field @"maybe'fieldPresence") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                       ((Prelude..)
                          ((Prelude..)
                             Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                          Prelude.fromEnum
                          _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'enumType") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                          ((Prelude..)
                             ((Prelude..)
                                Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                             Prelude.fromEnum
                             _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view
                          (Data.ProtoLens.Field.field @"maybe'repeatedFieldEncoding") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                             ((Prelude..)
                                ((Prelude..)
                                   Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                                Prelude.fromEnum
                                _v))
                   ((Data.Monoid.<>)
                      (case
                           Lens.Family2.view
                             (Data.ProtoLens.Field.field @"maybe'utf8Validation") _x
                       of
                         Prelude.Nothing -> Data.Monoid.mempty
                         (Prelude.Just _v)
                           -> (Data.Monoid.<>)
                                (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                                ((Prelude..)
                                   ((Prelude..)
                                      Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                                   Prelude.fromEnum
                                   _v))
                      ((Data.Monoid.<>)
                         (case
                              Lens.Family2.view
                                (Data.ProtoLens.Field.field @"maybe'messageEncoding") _x
                          of
                            Prelude.Nothing -> Data.Monoid.mempty
                            (Prelude.Just _v)
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                   ((Prelude..)
                                      ((Prelude..)
                                         Data.ProtoLens.Encoding.Bytes.putVarInt
                                         Prelude.fromIntegral)
                                      Prelude.fromEnum
                                      _v))
                         ((Data.Monoid.<>)
                            (case
                                 Lens.Family2.view
                                   (Data.ProtoLens.Field.field @"maybe'jsonFormat") _x
                             of
                               Prelude.Nothing -> Data.Monoid.mempty
                               (Prelude.Just _v)
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt 48)
                                      ((Prelude..)
                                         ((Prelude..)
                                            Data.ProtoLens.Encoding.Bytes.putVarInt
                                            Prelude.fromIntegral)
                                         Prelude.fromEnum
                                         _v))
                            (Data.ProtoLens.Encoding.Wire.buildFieldSet
                               (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))))
instance Control.DeepSeq.NFData FeatureSet where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_FeatureSet'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_FeatureSet'fieldPresence x__)
                (Control.DeepSeq.deepseq
                   (_FeatureSet'enumType x__)
                   (Control.DeepSeq.deepseq
                      (_FeatureSet'repeatedFieldEncoding x__)
                      (Control.DeepSeq.deepseq
                         (_FeatureSet'utf8Validation x__)
                         (Control.DeepSeq.deepseq
                            (_FeatureSet'messageEncoding x__)
                            (Control.DeepSeq.deepseq (_FeatureSet'jsonFormat x__) ()))))))
data FeatureSet'EnumType
  = FeatureSet'ENUM_TYPE_UNKNOWN |
    FeatureSet'OPEN |
    FeatureSet'CLOSED
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum FeatureSet'EnumType where
  maybeToEnum 0 = Prelude.Just FeatureSet'ENUM_TYPE_UNKNOWN
  maybeToEnum 1 = Prelude.Just FeatureSet'OPEN
  maybeToEnum 2 = Prelude.Just FeatureSet'CLOSED
  maybeToEnum _ = Prelude.Nothing
  showEnum FeatureSet'ENUM_TYPE_UNKNOWN = "ENUM_TYPE_UNKNOWN"
  showEnum FeatureSet'OPEN = "OPEN"
  showEnum FeatureSet'CLOSED = "CLOSED"
  readEnum k
    | (Prelude.==) k "ENUM_TYPE_UNKNOWN"
    = Prelude.Just FeatureSet'ENUM_TYPE_UNKNOWN
    | (Prelude.==) k "OPEN" = Prelude.Just FeatureSet'OPEN
    | (Prelude.==) k "CLOSED" = Prelude.Just FeatureSet'CLOSED
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded FeatureSet'EnumType where
  minBound = FeatureSet'ENUM_TYPE_UNKNOWN
  maxBound = FeatureSet'CLOSED
instance Prelude.Enum FeatureSet'EnumType where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum EnumType: " (Prelude.show k__)))
        Prelude.id
        (Data.ProtoLens.maybeToEnum k__)
  fromEnum FeatureSet'ENUM_TYPE_UNKNOWN = 0
  fromEnum FeatureSet'OPEN = 1
  fromEnum FeatureSet'CLOSED = 2
  succ FeatureSet'CLOSED
    = Prelude.error
        "FeatureSet'EnumType.succ: bad argument FeatureSet'CLOSED. This value would be out of bounds."
  succ FeatureSet'ENUM_TYPE_UNKNOWN = FeatureSet'OPEN
  succ FeatureSet'OPEN = FeatureSet'CLOSED
  pred FeatureSet'ENUM_TYPE_UNKNOWN
    = Prelude.error
        "FeatureSet'EnumType.pred: bad argument FeatureSet'ENUM_TYPE_UNKNOWN. This value would be out of bounds."
  pred FeatureSet'OPEN = FeatureSet'ENUM_TYPE_UNKNOWN
  pred FeatureSet'CLOSED = FeatureSet'OPEN
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault FeatureSet'EnumType where
  fieldDefault = FeatureSet'ENUM_TYPE_UNKNOWN
instance Control.DeepSeq.NFData FeatureSet'EnumType where
  rnf x__ = Prelude.seq x__ ()
data FeatureSet'FieldPresence
  = FeatureSet'FIELD_PRESENCE_UNKNOWN |
    FeatureSet'EXPLICIT |
    FeatureSet'IMPLICIT |
    FeatureSet'LEGACY_REQUIRED
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum FeatureSet'FieldPresence where
  maybeToEnum 0 = Prelude.Just FeatureSet'FIELD_PRESENCE_UNKNOWN
  maybeToEnum 1 = Prelude.Just FeatureSet'EXPLICIT
  maybeToEnum 2 = Prelude.Just FeatureSet'IMPLICIT
  maybeToEnum 3 = Prelude.Just FeatureSet'LEGACY_REQUIRED
  maybeToEnum _ = Prelude.Nothing
  showEnum FeatureSet'FIELD_PRESENCE_UNKNOWN
    = "FIELD_PRESENCE_UNKNOWN"
  showEnum FeatureSet'EXPLICIT = "EXPLICIT"
  showEnum FeatureSet'IMPLICIT = "IMPLICIT"
  showEnum FeatureSet'LEGACY_REQUIRED = "LEGACY_REQUIRED"
  readEnum k
    | (Prelude.==) k "FIELD_PRESENCE_UNKNOWN"
    = Prelude.Just FeatureSet'FIELD_PRESENCE_UNKNOWN
    | (Prelude.==) k "EXPLICIT" = Prelude.Just FeatureSet'EXPLICIT
    | (Prelude.==) k "IMPLICIT" = Prelude.Just FeatureSet'IMPLICIT
    | (Prelude.==) k "LEGACY_REQUIRED"
    = Prelude.Just FeatureSet'LEGACY_REQUIRED
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded FeatureSet'FieldPresence where
  minBound = FeatureSet'FIELD_PRESENCE_UNKNOWN
  maxBound = FeatureSet'LEGACY_REQUIRED
instance Prelude.Enum FeatureSet'FieldPresence where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum FieldPresence: "
              (Prelude.show k__)))
        Prelude.id
        (Data.ProtoLens.maybeToEnum k__)
  fromEnum FeatureSet'FIELD_PRESENCE_UNKNOWN = 0
  fromEnum FeatureSet'EXPLICIT = 1
  fromEnum FeatureSet'IMPLICIT = 2
  fromEnum FeatureSet'LEGACY_REQUIRED = 3
  succ FeatureSet'LEGACY_REQUIRED
    = Prelude.error
        "FeatureSet'FieldPresence.succ: bad argument FeatureSet'LEGACY_REQUIRED. This value would be out of bounds."
  succ FeatureSet'FIELD_PRESENCE_UNKNOWN = FeatureSet'EXPLICIT
  succ FeatureSet'EXPLICIT = FeatureSet'IMPLICIT
  succ FeatureSet'IMPLICIT = FeatureSet'LEGACY_REQUIRED
  pred FeatureSet'FIELD_PRESENCE_UNKNOWN
    = Prelude.error
        "FeatureSet'FieldPresence.pred: bad argument FeatureSet'FIELD_PRESENCE_UNKNOWN. This value would be out of bounds."
  pred FeatureSet'EXPLICIT = FeatureSet'FIELD_PRESENCE_UNKNOWN
  pred FeatureSet'IMPLICIT = FeatureSet'EXPLICIT
  pred FeatureSet'LEGACY_REQUIRED = FeatureSet'IMPLICIT
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault FeatureSet'FieldPresence where
  fieldDefault = FeatureSet'FIELD_PRESENCE_UNKNOWN
instance Control.DeepSeq.NFData FeatureSet'FieldPresence where
  rnf x__ = Prelude.seq x__ ()
data FeatureSet'JsonFormat
  = FeatureSet'JSON_FORMAT_UNKNOWN |
    FeatureSet'ALLOW |
    FeatureSet'LEGACY_BEST_EFFORT
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum FeatureSet'JsonFormat where
  maybeToEnum 0 = Prelude.Just FeatureSet'JSON_FORMAT_UNKNOWN
  maybeToEnum 1 = Prelude.Just FeatureSet'ALLOW
  maybeToEnum 2 = Prelude.Just FeatureSet'LEGACY_BEST_EFFORT
  maybeToEnum _ = Prelude.Nothing
  showEnum FeatureSet'JSON_FORMAT_UNKNOWN = "JSON_FORMAT_UNKNOWN"
  showEnum FeatureSet'ALLOW = "ALLOW"
  showEnum FeatureSet'LEGACY_BEST_EFFORT = "LEGACY_BEST_EFFORT"
  readEnum k
    | (Prelude.==) k "JSON_FORMAT_UNKNOWN"
    = Prelude.Just FeatureSet'JSON_FORMAT_UNKNOWN
    | (Prelude.==) k "ALLOW" = Prelude.Just FeatureSet'ALLOW
    | (Prelude.==) k "LEGACY_BEST_EFFORT"
    = Prelude.Just FeatureSet'LEGACY_BEST_EFFORT
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded FeatureSet'JsonFormat where
  minBound = FeatureSet'JSON_FORMAT_UNKNOWN
  maxBound = FeatureSet'LEGACY_BEST_EFFORT
instance Prelude.Enum FeatureSet'JsonFormat where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum JsonFormat: " (Prelude.show k__)))
        Prelude.id
        (Data.ProtoLens.maybeToEnum k__)
  fromEnum FeatureSet'JSON_FORMAT_UNKNOWN = 0
  fromEnum FeatureSet'ALLOW = 1
  fromEnum FeatureSet'LEGACY_BEST_EFFORT = 2
  succ FeatureSet'LEGACY_BEST_EFFORT
    = Prelude.error
        "FeatureSet'JsonFormat.succ: bad argument FeatureSet'LEGACY_BEST_EFFORT. This value would be out of bounds."
  succ FeatureSet'JSON_FORMAT_UNKNOWN = FeatureSet'ALLOW
  succ FeatureSet'ALLOW = FeatureSet'LEGACY_BEST_EFFORT
  pred FeatureSet'JSON_FORMAT_UNKNOWN
    = Prelude.error
        "FeatureSet'JsonFormat.pred: bad argument FeatureSet'JSON_FORMAT_UNKNOWN. This value would be out of bounds."
  pred FeatureSet'ALLOW = FeatureSet'JSON_FORMAT_UNKNOWN
  pred FeatureSet'LEGACY_BEST_EFFORT = FeatureSet'ALLOW
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault FeatureSet'JsonFormat where
  fieldDefault = FeatureSet'JSON_FORMAT_UNKNOWN
instance Control.DeepSeq.NFData FeatureSet'JsonFormat where
  rnf x__ = Prelude.seq x__ ()
data FeatureSet'MessageEncoding
  = FeatureSet'MESSAGE_ENCODING_UNKNOWN |
    FeatureSet'LENGTH_PREFIXED |
    FeatureSet'DELIMITED
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum FeatureSet'MessageEncoding where
  maybeToEnum 0 = Prelude.Just FeatureSet'MESSAGE_ENCODING_UNKNOWN
  maybeToEnum 1 = Prelude.Just FeatureSet'LENGTH_PREFIXED
  maybeToEnum 2 = Prelude.Just FeatureSet'DELIMITED
  maybeToEnum _ = Prelude.Nothing
  showEnum FeatureSet'MESSAGE_ENCODING_UNKNOWN
    = "MESSAGE_ENCODING_UNKNOWN"
  showEnum FeatureSet'LENGTH_PREFIXED = "LENGTH_PREFIXED"
  showEnum FeatureSet'DELIMITED = "DELIMITED"
  readEnum k
    | (Prelude.==) k "MESSAGE_ENCODING_UNKNOWN"
    = Prelude.Just FeatureSet'MESSAGE_ENCODING_UNKNOWN
    | (Prelude.==) k "LENGTH_PREFIXED"
    = Prelude.Just FeatureSet'LENGTH_PREFIXED
    | (Prelude.==) k "DELIMITED" = Prelude.Just FeatureSet'DELIMITED
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded FeatureSet'MessageEncoding where
  minBound = FeatureSet'MESSAGE_ENCODING_UNKNOWN
  maxBound = FeatureSet'DELIMITED
instance Prelude.Enum FeatureSet'MessageEncoding where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum MessageEncoding: "
              (Prelude.show k__)))
        Prelude.id
        (Data.ProtoLens.maybeToEnum k__)
  fromEnum FeatureSet'MESSAGE_ENCODING_UNKNOWN = 0
  fromEnum FeatureSet'LENGTH_PREFIXED = 1
  fromEnum FeatureSet'DELIMITED = 2
  succ FeatureSet'DELIMITED
    = Prelude.error
        "FeatureSet'MessageEncoding.succ: bad argument FeatureSet'DELIMITED. This value would be out of bounds."
  succ FeatureSet'MESSAGE_ENCODING_UNKNOWN
    = FeatureSet'LENGTH_PREFIXED
  succ FeatureSet'LENGTH_PREFIXED = FeatureSet'DELIMITED
  pred FeatureSet'MESSAGE_ENCODING_UNKNOWN
    = Prelude.error
        "FeatureSet'MessageEncoding.pred: bad argument FeatureSet'MESSAGE_ENCODING_UNKNOWN. This value would be out of bounds."
  pred FeatureSet'LENGTH_PREFIXED
    = FeatureSet'MESSAGE_ENCODING_UNKNOWN
  pred FeatureSet'DELIMITED = FeatureSet'LENGTH_PREFIXED
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault FeatureSet'MessageEncoding where
  fieldDefault = FeatureSet'MESSAGE_ENCODING_UNKNOWN
instance Control.DeepSeq.NFData FeatureSet'MessageEncoding where
  rnf x__ = Prelude.seq x__ ()
data FeatureSet'RepeatedFieldEncoding
  = FeatureSet'REPEATED_FIELD_ENCODING_UNKNOWN |
    FeatureSet'PACKED |
    FeatureSet'EXPANDED
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum FeatureSet'RepeatedFieldEncoding where
  maybeToEnum 0
    = Prelude.Just FeatureSet'REPEATED_FIELD_ENCODING_UNKNOWN
  maybeToEnum 1 = Prelude.Just FeatureSet'PACKED
  maybeToEnum 2 = Prelude.Just FeatureSet'EXPANDED
  maybeToEnum _ = Prelude.Nothing
  showEnum FeatureSet'REPEATED_FIELD_ENCODING_UNKNOWN
    = "REPEATED_FIELD_ENCODING_UNKNOWN"
  showEnum FeatureSet'PACKED = "PACKED"
  showEnum FeatureSet'EXPANDED = "EXPANDED"
  readEnum k
    | (Prelude.==) k "REPEATED_FIELD_ENCODING_UNKNOWN"
    = Prelude.Just FeatureSet'REPEATED_FIELD_ENCODING_UNKNOWN
    | (Prelude.==) k "PACKED" = Prelude.Just FeatureSet'PACKED
    | (Prelude.==) k "EXPANDED" = Prelude.Just FeatureSet'EXPANDED
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded FeatureSet'RepeatedFieldEncoding where
  minBound = FeatureSet'REPEATED_FIELD_ENCODING_UNKNOWN
  maxBound = FeatureSet'EXPANDED
instance Prelude.Enum FeatureSet'RepeatedFieldEncoding where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum RepeatedFieldEncoding: "
              (Prelude.show k__)))
        Prelude.id
        (Data.ProtoLens.maybeToEnum k__)
  fromEnum FeatureSet'REPEATED_FIELD_ENCODING_UNKNOWN = 0
  fromEnum FeatureSet'PACKED = 1
  fromEnum FeatureSet'EXPANDED = 2
  succ FeatureSet'EXPANDED
    = Prelude.error
        "FeatureSet'RepeatedFieldEncoding.succ: bad argument FeatureSet'EXPANDED. This value would be out of bounds."
  succ FeatureSet'REPEATED_FIELD_ENCODING_UNKNOWN = FeatureSet'PACKED
  succ FeatureSet'PACKED = FeatureSet'EXPANDED
  pred FeatureSet'REPEATED_FIELD_ENCODING_UNKNOWN
    = Prelude.error
        "FeatureSet'RepeatedFieldEncoding.pred: bad argument FeatureSet'REPEATED_FIELD_ENCODING_UNKNOWN. This value would be out of bounds."
  pred FeatureSet'PACKED = FeatureSet'REPEATED_FIELD_ENCODING_UNKNOWN
  pred FeatureSet'EXPANDED = FeatureSet'PACKED
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault FeatureSet'RepeatedFieldEncoding where
  fieldDefault = FeatureSet'REPEATED_FIELD_ENCODING_UNKNOWN
instance Control.DeepSeq.NFData FeatureSet'RepeatedFieldEncoding where
  rnf x__ = Prelude.seq x__ ()
data FeatureSet'Utf8Validation
  = FeatureSet'UTF8_VALIDATION_UNKNOWN |
    FeatureSet'VERIFY |
    FeatureSet'NONE
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum FeatureSet'Utf8Validation where
  maybeToEnum 0 = Prelude.Just FeatureSet'UTF8_VALIDATION_UNKNOWN
  maybeToEnum 2 = Prelude.Just FeatureSet'VERIFY
  maybeToEnum 3 = Prelude.Just FeatureSet'NONE
  maybeToEnum _ = Prelude.Nothing
  showEnum FeatureSet'UTF8_VALIDATION_UNKNOWN
    = "UTF8_VALIDATION_UNKNOWN"
  showEnum FeatureSet'VERIFY = "VERIFY"
  showEnum FeatureSet'NONE = "NONE"
  readEnum k
    | (Prelude.==) k "UTF8_VALIDATION_UNKNOWN"
    = Prelude.Just FeatureSet'UTF8_VALIDATION_UNKNOWN
    | (Prelude.==) k "VERIFY" = Prelude.Just FeatureSet'VERIFY
    | (Prelude.==) k "NONE" = Prelude.Just FeatureSet'NONE
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded FeatureSet'Utf8Validation where
  minBound = FeatureSet'UTF8_VALIDATION_UNKNOWN
  maxBound = FeatureSet'NONE
instance Prelude.Enum FeatureSet'Utf8Validation where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum Utf8Validation: "
              (Prelude.show k__)))
        Prelude.id
        (Data.ProtoLens.maybeToEnum k__)
  fromEnum FeatureSet'UTF8_VALIDATION_UNKNOWN = 0
  fromEnum FeatureSet'VERIFY = 2
  fromEnum FeatureSet'NONE = 3
  succ FeatureSet'NONE
    = Prelude.error
        "FeatureSet'Utf8Validation.succ: bad argument FeatureSet'NONE. This value would be out of bounds."
  succ FeatureSet'UTF8_VALIDATION_UNKNOWN = FeatureSet'VERIFY
  succ FeatureSet'VERIFY = FeatureSet'NONE
  pred FeatureSet'UTF8_VALIDATION_UNKNOWN
    = Prelude.error
        "FeatureSet'Utf8Validation.pred: bad argument FeatureSet'UTF8_VALIDATION_UNKNOWN. This value would be out of bounds."
  pred FeatureSet'VERIFY = FeatureSet'UTF8_VALIDATION_UNKNOWN
  pred FeatureSet'NONE = FeatureSet'VERIFY
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault FeatureSet'Utf8Validation where
  fieldDefault = FeatureSet'UTF8_VALIDATION_UNKNOWN
instance Control.DeepSeq.NFData FeatureSet'Utf8Validation where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.defaults' @:: Lens' FeatureSetDefaults [FeatureSetDefaults'FeatureSetEditionDefault]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'defaults' @:: Lens' FeatureSetDefaults (Data.Vector.Vector FeatureSetDefaults'FeatureSetEditionDefault)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.minimumEdition' @:: Lens' FeatureSetDefaults Edition@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'minimumEdition' @:: Lens' FeatureSetDefaults (Prelude.Maybe Edition)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maximumEdition' @:: Lens' FeatureSetDefaults Edition@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'maximumEdition' @:: Lens' FeatureSetDefaults (Prelude.Maybe Edition)@ -}
data FeatureSetDefaults
  = FeatureSetDefaults'_constructor {_FeatureSetDefaults'defaults :: !(Data.Vector.Vector FeatureSetDefaults'FeatureSetEditionDefault),
                                     _FeatureSetDefaults'minimumEdition :: !(Prelude.Maybe Edition),
                                     _FeatureSetDefaults'maximumEdition :: !(Prelude.Maybe Edition),
                                     _FeatureSetDefaults'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show FeatureSetDefaults where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField FeatureSetDefaults "defaults" [FeatureSetDefaults'FeatureSetEditionDefault] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FeatureSetDefaults'defaults
           (\ x__ y__ -> x__ {_FeatureSetDefaults'defaults = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField FeatureSetDefaults "vec'defaults" (Data.Vector.Vector FeatureSetDefaults'FeatureSetEditionDefault) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FeatureSetDefaults'defaults
           (\ x__ y__ -> x__ {_FeatureSetDefaults'defaults = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FeatureSetDefaults "minimumEdition" Edition where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FeatureSetDefaults'minimumEdition
           (\ x__ y__ -> x__ {_FeatureSetDefaults'minimumEdition = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FeatureSetDefaults "maybe'minimumEdition" (Prelude.Maybe Edition) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FeatureSetDefaults'minimumEdition
           (\ x__ y__ -> x__ {_FeatureSetDefaults'minimumEdition = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FeatureSetDefaults "maximumEdition" Edition where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FeatureSetDefaults'maximumEdition
           (\ x__ y__ -> x__ {_FeatureSetDefaults'maximumEdition = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FeatureSetDefaults "maybe'maximumEdition" (Prelude.Maybe Edition) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FeatureSetDefaults'maximumEdition
           (\ x__ y__ -> x__ {_FeatureSetDefaults'maximumEdition = y__}))
        Prelude.id
instance Data.ProtoLens.Message FeatureSetDefaults where
  messageName _ = Data.Text.pack "google.protobuf.FeatureSetDefaults"
  packedMessageDescriptor _
    = "\n\
      \\DC2FeatureSetDefaults\DC2X\n\
      \\bdefaults\CAN\SOH \ETX(\v2<.google.protobuf.FeatureSetDefaults.FeatureSetEditionDefaultR\bdefaults\DC2A\n\
      \\SIminimum_edition\CAN\EOT \SOH(\SO2\CAN.google.protobuf.EditionR\SOminimumEdition\DC2A\n\
      \\SImaximum_edition\CAN\ENQ \SOH(\SO2\CAN.google.protobuf.EditionR\SOmaximumEdition\SUB\248\SOH\n\
      \\CANFeatureSetEditionDefault\DC22\n\
      \\aedition\CAN\ETX \SOH(\SO2\CAN.google.protobuf.EditionR\aedition\DC2N\n\
      \\DC4overridable_features\CAN\EOT \SOH(\v2\ESC.google.protobuf.FeatureSetR\DC3overridableFeatures\DC2B\n\
      \\SOfixed_features\CAN\ENQ \SOH(\v2\ESC.google.protobuf.FeatureSetR\rfixedFeaturesJ\EOT\b\SOH\DLE\STXJ\EOT\b\STX\DLE\ETXR\bfeatures"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        defaults__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "defaults"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor FeatureSetDefaults'FeatureSetEditionDefault)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"defaults")) ::
              Data.ProtoLens.FieldDescriptor FeatureSetDefaults
        minimumEdition__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "minimum_edition"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Edition)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'minimumEdition")) ::
              Data.ProtoLens.FieldDescriptor FeatureSetDefaults
        maximumEdition__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "maximum_edition"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Edition)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'maximumEdition")) ::
              Data.ProtoLens.FieldDescriptor FeatureSetDefaults
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, defaults__field_descriptor),
           (Data.ProtoLens.Tag 4, minimumEdition__field_descriptor),
           (Data.ProtoLens.Tag 5, maximumEdition__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _FeatureSetDefaults'_unknownFields
        (\ x__ y__ -> x__ {_FeatureSetDefaults'_unknownFields = y__})
  defMessage
    = FeatureSetDefaults'_constructor
        {_FeatureSetDefaults'defaults = Data.Vector.Generic.empty,
         _FeatureSetDefaults'minimumEdition = Prelude.Nothing,
         _FeatureSetDefaults'maximumEdition = Prelude.Nothing,
         _FeatureSetDefaults'_unknownFields = []}
  parseMessage
    = let
        loop ::
          FeatureSetDefaults
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld FeatureSetDefaults'FeatureSetEditionDefault
             -> Data.ProtoLens.Encoding.Bytes.Parser FeatureSetDefaults
        loop x mutable'defaults
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'defaults <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                           (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                              mutable'defaults)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields
                           (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'defaults") frozen'defaults x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "defaults"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'defaults y)
                                loop x v
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "minimum_edition"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"minimumEdition") y x)
                                  mutable'defaults
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "maximum_edition"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"maximumEdition") y x)
                                  mutable'defaults
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'defaults
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'defaults <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                    Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'defaults)
          "FeatureSetDefaults"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                (\ _v
                   -> (Data.Monoid.<>)
                        (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                        ((Prelude..)
                           (\ bs
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (Prelude.fromIntegral (Data.ByteString.length bs)))
                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           Data.ProtoLens.encodeMessage
                           _v))
                (Lens.Family2.view
                   (Data.ProtoLens.Field.field @"vec'defaults") _x))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view
                       (Data.ProtoLens.Field.field @"maybe'minimumEdition") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                          ((Prelude..)
                             ((Prelude..)
                                Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                             Prelude.fromEnum
                             _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view
                          (Data.ProtoLens.Field.field @"maybe'maximumEdition") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                             ((Prelude..)
                                ((Prelude..)
                                   Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                                Prelude.fromEnum
                                _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData FeatureSetDefaults where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_FeatureSetDefaults'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_FeatureSetDefaults'defaults x__)
                (Control.DeepSeq.deepseq
                   (_FeatureSetDefaults'minimumEdition x__)
                   (Control.DeepSeq.deepseq
                      (_FeatureSetDefaults'maximumEdition x__) ())))
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.edition' @:: Lens' FeatureSetDefaults'FeatureSetEditionDefault Edition@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'edition' @:: Lens' FeatureSetDefaults'FeatureSetEditionDefault (Prelude.Maybe Edition)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.overridableFeatures' @:: Lens' FeatureSetDefaults'FeatureSetEditionDefault FeatureSet@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'overridableFeatures' @:: Lens' FeatureSetDefaults'FeatureSetEditionDefault (Prelude.Maybe FeatureSet)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.fixedFeatures' @:: Lens' FeatureSetDefaults'FeatureSetEditionDefault FeatureSet@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'fixedFeatures' @:: Lens' FeatureSetDefaults'FeatureSetEditionDefault (Prelude.Maybe FeatureSet)@ -}
data FeatureSetDefaults'FeatureSetEditionDefault
  = FeatureSetDefaults'FeatureSetEditionDefault'_constructor {_FeatureSetDefaults'FeatureSetEditionDefault'edition :: !(Prelude.Maybe Edition),
                                                              _FeatureSetDefaults'FeatureSetEditionDefault'overridableFeatures :: !(Prelude.Maybe FeatureSet),
                                                              _FeatureSetDefaults'FeatureSetEditionDefault'fixedFeatures :: !(Prelude.Maybe FeatureSet),
                                                              _FeatureSetDefaults'FeatureSetEditionDefault'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show FeatureSetDefaults'FeatureSetEditionDefault where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField FeatureSetDefaults'FeatureSetEditionDefault "edition" Edition where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FeatureSetDefaults'FeatureSetEditionDefault'edition
           (\ x__ y__
              -> x__
                   {_FeatureSetDefaults'FeatureSetEditionDefault'edition = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FeatureSetDefaults'FeatureSetEditionDefault "maybe'edition" (Prelude.Maybe Edition) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FeatureSetDefaults'FeatureSetEditionDefault'edition
           (\ x__ y__
              -> x__
                   {_FeatureSetDefaults'FeatureSetEditionDefault'edition = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FeatureSetDefaults'FeatureSetEditionDefault "overridableFeatures" FeatureSet where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FeatureSetDefaults'FeatureSetEditionDefault'overridableFeatures
           (\ x__ y__
              -> x__
                   {_FeatureSetDefaults'FeatureSetEditionDefault'overridableFeatures = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField FeatureSetDefaults'FeatureSetEditionDefault "maybe'overridableFeatures" (Prelude.Maybe FeatureSet) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FeatureSetDefaults'FeatureSetEditionDefault'overridableFeatures
           (\ x__ y__
              -> x__
                   {_FeatureSetDefaults'FeatureSetEditionDefault'overridableFeatures = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FeatureSetDefaults'FeatureSetEditionDefault "fixedFeatures" FeatureSet where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FeatureSetDefaults'FeatureSetEditionDefault'fixedFeatures
           (\ x__ y__
              -> x__
                   {_FeatureSetDefaults'FeatureSetEditionDefault'fixedFeatures = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField FeatureSetDefaults'FeatureSetEditionDefault "maybe'fixedFeatures" (Prelude.Maybe FeatureSet) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FeatureSetDefaults'FeatureSetEditionDefault'fixedFeatures
           (\ x__ y__
              -> x__
                   {_FeatureSetDefaults'FeatureSetEditionDefault'fixedFeatures = y__}))
        Prelude.id
instance Data.ProtoLens.Message FeatureSetDefaults'FeatureSetEditionDefault where
  messageName _
    = Data.Text.pack
        "google.protobuf.FeatureSetDefaults.FeatureSetEditionDefault"
  packedMessageDescriptor _
    = "\n\
      \\CANFeatureSetEditionDefault\DC22\n\
      \\aedition\CAN\ETX \SOH(\SO2\CAN.google.protobuf.EditionR\aedition\DC2N\n\
      \\DC4overridable_features\CAN\EOT \SOH(\v2\ESC.google.protobuf.FeatureSetR\DC3overridableFeatures\DC2B\n\
      \\SOfixed_features\CAN\ENQ \SOH(\v2\ESC.google.protobuf.FeatureSetR\rfixedFeaturesJ\EOT\b\SOH\DLE\STXJ\EOT\b\STX\DLE\ETXR\bfeatures"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        edition__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "edition"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Edition)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'edition")) ::
              Data.ProtoLens.FieldDescriptor FeatureSetDefaults'FeatureSetEditionDefault
        overridableFeatures__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "overridable_features"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor FeatureSet)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'overridableFeatures")) ::
              Data.ProtoLens.FieldDescriptor FeatureSetDefaults'FeatureSetEditionDefault
        fixedFeatures__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "fixed_features"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor FeatureSet)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'fixedFeatures")) ::
              Data.ProtoLens.FieldDescriptor FeatureSetDefaults'FeatureSetEditionDefault
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 3, edition__field_descriptor),
           (Data.ProtoLens.Tag 4, overridableFeatures__field_descriptor),
           (Data.ProtoLens.Tag 5, fixedFeatures__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _FeatureSetDefaults'FeatureSetEditionDefault'_unknownFields
        (\ x__ y__
           -> x__
                {_FeatureSetDefaults'FeatureSetEditionDefault'_unknownFields = y__})
  defMessage
    = FeatureSetDefaults'FeatureSetEditionDefault'_constructor
        {_FeatureSetDefaults'FeatureSetEditionDefault'edition = Prelude.Nothing,
         _FeatureSetDefaults'FeatureSetEditionDefault'overridableFeatures = Prelude.Nothing,
         _FeatureSetDefaults'FeatureSetEditionDefault'fixedFeatures = Prelude.Nothing,
         _FeatureSetDefaults'FeatureSetEditionDefault'_unknownFields = []}
  parseMessage
    = let
        loop ::
          FeatureSetDefaults'FeatureSetEditionDefault
          -> Data.ProtoLens.Encoding.Bytes.Parser FeatureSetDefaults'FeatureSetEditionDefault
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "edition"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"edition") y x)
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "overridable_features"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"overridableFeatures") y x)
                        42
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "fixed_features"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"fixedFeatures") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "FeatureSetEditionDefault"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'edition") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                       ((Prelude..)
                          ((Prelude..)
                             Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                          Prelude.fromEnum
                          _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view
                       (Data.ProtoLens.Field.field @"maybe'overridableFeatures") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage
                             _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view
                          (Data.ProtoLens.Field.field @"maybe'fixedFeatures") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 42)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage
                                _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData FeatureSetDefaults'FeatureSetEditionDefault where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_FeatureSetDefaults'FeatureSetEditionDefault'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_FeatureSetDefaults'FeatureSetEditionDefault'edition x__)
                (Control.DeepSeq.deepseq
                   (_FeatureSetDefaults'FeatureSetEditionDefault'overridableFeatures
                      x__)
                   (Control.DeepSeq.deepseq
                      (_FeatureSetDefaults'FeatureSetEditionDefault'fixedFeatures x__)
                      ())))
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.name' @:: Lens' FieldDescriptorProto Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'name' @:: Lens' FieldDescriptorProto (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.number' @:: Lens' FieldDescriptorProto Data.Int.Int32@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'number' @:: Lens' FieldDescriptorProto (Prelude.Maybe Data.Int.Int32)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.label' @:: Lens' FieldDescriptorProto FieldDescriptorProto'Label@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'label' @:: Lens' FieldDescriptorProto (Prelude.Maybe FieldDescriptorProto'Label)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.type'' @:: Lens' FieldDescriptorProto FieldDescriptorProto'Type@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'type'' @:: Lens' FieldDescriptorProto (Prelude.Maybe FieldDescriptorProto'Type)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.typeName' @:: Lens' FieldDescriptorProto Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'typeName' @:: Lens' FieldDescriptorProto (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.extendee' @:: Lens' FieldDescriptorProto Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'extendee' @:: Lens' FieldDescriptorProto (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.defaultValue' @:: Lens' FieldDescriptorProto Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'defaultValue' @:: Lens' FieldDescriptorProto (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.oneofIndex' @:: Lens' FieldDescriptorProto Data.Int.Int32@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'oneofIndex' @:: Lens' FieldDescriptorProto (Prelude.Maybe Data.Int.Int32)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.jsonName' @:: Lens' FieldDescriptorProto Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'jsonName' @:: Lens' FieldDescriptorProto (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.options' @:: Lens' FieldDescriptorProto FieldOptions@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'options' @:: Lens' FieldDescriptorProto (Prelude.Maybe FieldOptions)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.proto3Optional' @:: Lens' FieldDescriptorProto Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'proto3Optional' @:: Lens' FieldDescriptorProto (Prelude.Maybe Prelude.Bool)@ -}
data FieldDescriptorProto
  = FieldDescriptorProto'_constructor {_FieldDescriptorProto'name :: !(Prelude.Maybe Data.Text.Text),
                                       _FieldDescriptorProto'number :: !(Prelude.Maybe Data.Int.Int32),
                                       _FieldDescriptorProto'label :: !(Prelude.Maybe FieldDescriptorProto'Label),
                                       _FieldDescriptorProto'type' :: !(Prelude.Maybe FieldDescriptorProto'Type),
                                       _FieldDescriptorProto'typeName :: !(Prelude.Maybe Data.Text.Text),
                                       _FieldDescriptorProto'extendee :: !(Prelude.Maybe Data.Text.Text),
                                       _FieldDescriptorProto'defaultValue :: !(Prelude.Maybe Data.Text.Text),
                                       _FieldDescriptorProto'oneofIndex :: !(Prelude.Maybe Data.Int.Int32),
                                       _FieldDescriptorProto'jsonName :: !(Prelude.Maybe Data.Text.Text),
                                       _FieldDescriptorProto'options :: !(Prelude.Maybe FieldOptions),
                                       _FieldDescriptorProto'proto3Optional :: !(Prelude.Maybe Prelude.Bool),
                                       _FieldDescriptorProto'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show FieldDescriptorProto where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField FieldDescriptorProto "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldDescriptorProto'name
           (\ x__ y__ -> x__ {_FieldDescriptorProto'name = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FieldDescriptorProto "maybe'name" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldDescriptorProto'name
           (\ x__ y__ -> x__ {_FieldDescriptorProto'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FieldDescriptorProto "number" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldDescriptorProto'number
           (\ x__ y__ -> x__ {_FieldDescriptorProto'number = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FieldDescriptorProto "maybe'number" (Prelude.Maybe Data.Int.Int32) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldDescriptorProto'number
           (\ x__ y__ -> x__ {_FieldDescriptorProto'number = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FieldDescriptorProto "label" FieldDescriptorProto'Label where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldDescriptorProto'label
           (\ x__ y__ -> x__ {_FieldDescriptorProto'label = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FieldDescriptorProto "maybe'label" (Prelude.Maybe FieldDescriptorProto'Label) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldDescriptorProto'label
           (\ x__ y__ -> x__ {_FieldDescriptorProto'label = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FieldDescriptorProto "type'" FieldDescriptorProto'Type where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldDescriptorProto'type'
           (\ x__ y__ -> x__ {_FieldDescriptorProto'type' = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FieldDescriptorProto "maybe'type'" (Prelude.Maybe FieldDescriptorProto'Type) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldDescriptorProto'type'
           (\ x__ y__ -> x__ {_FieldDescriptorProto'type' = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FieldDescriptorProto "typeName" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldDescriptorProto'typeName
           (\ x__ y__ -> x__ {_FieldDescriptorProto'typeName = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FieldDescriptorProto "maybe'typeName" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldDescriptorProto'typeName
           (\ x__ y__ -> x__ {_FieldDescriptorProto'typeName = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FieldDescriptorProto "extendee" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldDescriptorProto'extendee
           (\ x__ y__ -> x__ {_FieldDescriptorProto'extendee = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FieldDescriptorProto "maybe'extendee" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldDescriptorProto'extendee
           (\ x__ y__ -> x__ {_FieldDescriptorProto'extendee = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FieldDescriptorProto "defaultValue" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldDescriptorProto'defaultValue
           (\ x__ y__ -> x__ {_FieldDescriptorProto'defaultValue = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FieldDescriptorProto "maybe'defaultValue" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldDescriptorProto'defaultValue
           (\ x__ y__ -> x__ {_FieldDescriptorProto'defaultValue = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FieldDescriptorProto "oneofIndex" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldDescriptorProto'oneofIndex
           (\ x__ y__ -> x__ {_FieldDescriptorProto'oneofIndex = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FieldDescriptorProto "maybe'oneofIndex" (Prelude.Maybe Data.Int.Int32) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldDescriptorProto'oneofIndex
           (\ x__ y__ -> x__ {_FieldDescriptorProto'oneofIndex = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FieldDescriptorProto "jsonName" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldDescriptorProto'jsonName
           (\ x__ y__ -> x__ {_FieldDescriptorProto'jsonName = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FieldDescriptorProto "maybe'jsonName" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldDescriptorProto'jsonName
           (\ x__ y__ -> x__ {_FieldDescriptorProto'jsonName = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FieldDescriptorProto "options" FieldOptions where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldDescriptorProto'options
           (\ x__ y__ -> x__ {_FieldDescriptorProto'options = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField FieldDescriptorProto "maybe'options" (Prelude.Maybe FieldOptions) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldDescriptorProto'options
           (\ x__ y__ -> x__ {_FieldDescriptorProto'options = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FieldDescriptorProto "proto3Optional" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldDescriptorProto'proto3Optional
           (\ x__ y__ -> x__ {_FieldDescriptorProto'proto3Optional = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FieldDescriptorProto "maybe'proto3Optional" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldDescriptorProto'proto3Optional
           (\ x__ y__ -> x__ {_FieldDescriptorProto'proto3Optional = y__}))
        Prelude.id
instance Data.ProtoLens.Message FieldDescriptorProto where
  messageName _
    = Data.Text.pack "google.protobuf.FieldDescriptorProto"
  packedMessageDescriptor _
    = "\n\
      \\DC4FieldDescriptorProto\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2\SYN\n\
      \\ACKnumber\CAN\ETX \SOH(\ENQR\ACKnumber\DC2A\n\
      \\ENQlabel\CAN\EOT \SOH(\SO2+.google.protobuf.FieldDescriptorProto.LabelR\ENQlabel\DC2>\n\
      \\EOTtype\CAN\ENQ \SOH(\SO2*.google.protobuf.FieldDescriptorProto.TypeR\EOTtype\DC2\ESC\n\
      \\ttype_name\CAN\ACK \SOH(\tR\btypeName\DC2\SUB\n\
      \\bextendee\CAN\STX \SOH(\tR\bextendee\DC2#\n\
      \\rdefault_value\CAN\a \SOH(\tR\fdefaultValue\DC2\US\n\
      \\voneof_index\CAN\t \SOH(\ENQR\n\
      \oneofIndex\DC2\ESC\n\
      \\tjson_name\CAN\n\
      \ \SOH(\tR\bjsonName\DC27\n\
      \\aoptions\CAN\b \SOH(\v2\GS.google.protobuf.FieldOptionsR\aoptions\DC2'\n\
      \\SIproto3_optional\CAN\DC1 \SOH(\bR\SOproto3Optional\"\182\STX\n\
      \\EOTType\DC2\SI\n\
      \\vTYPE_DOUBLE\DLE\SOH\DC2\SO\n\
      \\n\
      \TYPE_FLOAT\DLE\STX\DC2\SO\n\
      \\n\
      \TYPE_INT64\DLE\ETX\DC2\SI\n\
      \\vTYPE_UINT64\DLE\EOT\DC2\SO\n\
      \\n\
      \TYPE_INT32\DLE\ENQ\DC2\DLE\n\
      \\fTYPE_FIXED64\DLE\ACK\DC2\DLE\n\
      \\fTYPE_FIXED32\DLE\a\DC2\r\n\
      \\tTYPE_BOOL\DLE\b\DC2\SI\n\
      \\vTYPE_STRING\DLE\t\DC2\SO\n\
      \\n\
      \TYPE_GROUP\DLE\n\
      \\DC2\DLE\n\
      \\fTYPE_MESSAGE\DLE\v\DC2\SO\n\
      \\n\
      \TYPE_BYTES\DLE\f\DC2\SI\n\
      \\vTYPE_UINT32\DLE\r\DC2\r\n\
      \\tTYPE_ENUM\DLE\SO\DC2\DC1\n\
      \\rTYPE_SFIXED32\DLE\SI\DC2\DC1\n\
      \\rTYPE_SFIXED64\DLE\DLE\DC2\SI\n\
      \\vTYPE_SINT32\DLE\DC1\DC2\SI\n\
      \\vTYPE_SINT64\DLE\DC2\"C\n\
      \\ENQLabel\DC2\DC2\n\
      \\SOLABEL_OPTIONAL\DLE\SOH\DC2\DC2\n\
      \\SOLABEL_REPEATED\DLE\ETX\DC2\DC2\n\
      \\SOLABEL_REQUIRED\DLE\STX"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'name")) ::
              Data.ProtoLens.FieldDescriptor FieldDescriptorProto
        number__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "number"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'number")) ::
              Data.ProtoLens.FieldDescriptor FieldDescriptorProto
        label__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "label"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor FieldDescriptorProto'Label)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'label")) ::
              Data.ProtoLens.FieldDescriptor FieldDescriptorProto
        type'__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "type"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor FieldDescriptorProto'Type)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'type'")) ::
              Data.ProtoLens.FieldDescriptor FieldDescriptorProto
        typeName__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "type_name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'typeName")) ::
              Data.ProtoLens.FieldDescriptor FieldDescriptorProto
        extendee__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "extendee"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'extendee")) ::
              Data.ProtoLens.FieldDescriptor FieldDescriptorProto
        defaultValue__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "default_value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'defaultValue")) ::
              Data.ProtoLens.FieldDescriptor FieldDescriptorProto
        oneofIndex__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "oneof_index"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'oneofIndex")) ::
              Data.ProtoLens.FieldDescriptor FieldDescriptorProto
        jsonName__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "json_name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'jsonName")) ::
              Data.ProtoLens.FieldDescriptor FieldDescriptorProto
        options__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "options"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor FieldOptions)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'options")) ::
              Data.ProtoLens.FieldDescriptor FieldDescriptorProto
        proto3Optional__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "proto3_optional"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'proto3Optional")) ::
              Data.ProtoLens.FieldDescriptor FieldDescriptorProto
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, name__field_descriptor),
           (Data.ProtoLens.Tag 3, number__field_descriptor),
           (Data.ProtoLens.Tag 4, label__field_descriptor),
           (Data.ProtoLens.Tag 5, type'__field_descriptor),
           (Data.ProtoLens.Tag 6, typeName__field_descriptor),
           (Data.ProtoLens.Tag 2, extendee__field_descriptor),
           (Data.ProtoLens.Tag 7, defaultValue__field_descriptor),
           (Data.ProtoLens.Tag 9, oneofIndex__field_descriptor),
           (Data.ProtoLens.Tag 10, jsonName__field_descriptor),
           (Data.ProtoLens.Tag 8, options__field_descriptor),
           (Data.ProtoLens.Tag 17, proto3Optional__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _FieldDescriptorProto'_unknownFields
        (\ x__ y__ -> x__ {_FieldDescriptorProto'_unknownFields = y__})
  defMessage
    = FieldDescriptorProto'_constructor
        {_FieldDescriptorProto'name = Prelude.Nothing,
         _FieldDescriptorProto'number = Prelude.Nothing,
         _FieldDescriptorProto'label = Prelude.Nothing,
         _FieldDescriptorProto'type' = Prelude.Nothing,
         _FieldDescriptorProto'typeName = Prelude.Nothing,
         _FieldDescriptorProto'extendee = Prelude.Nothing,
         _FieldDescriptorProto'defaultValue = Prelude.Nothing,
         _FieldDescriptorProto'oneofIndex = Prelude.Nothing,
         _FieldDescriptorProto'jsonName = Prelude.Nothing,
         _FieldDescriptorProto'options = Prelude.Nothing,
         _FieldDescriptorProto'proto3Optional = Prelude.Nothing,
         _FieldDescriptorProto'_unknownFields = []}
  parseMessage
    = let
        loop ::
          FieldDescriptorProto
          -> Data.ProtoLens.Encoding.Bytes.Parser FieldDescriptorProto
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "name"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"name") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "number"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"number") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "label"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"label") y x)
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "type"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"type'") y x)
                        50
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "type_name"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"typeName") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "extendee"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"extendee") y x)
                        58
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "default_value"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"defaultValue") y x)
                        72
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "oneof_index"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"oneofIndex") y x)
                        82
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "json_name"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"jsonName") y x)
                        66
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "options"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"options") y x)
                        136
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "proto3_optional"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"proto3Optional") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "FieldDescriptorProto"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'name") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.Text.Encoding.encodeUtf8
                          _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'number") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                          ((Prelude..)
                             Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'label") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                             ((Prelude..)
                                ((Prelude..)
                                   Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                                Prelude.fromEnum
                                _v))
                   ((Data.Monoid.<>)
                      (case
                           Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'type'") _x
                       of
                         Prelude.Nothing -> Data.Monoid.mempty
                         (Prelude.Just _v)
                           -> (Data.Monoid.<>)
                                (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                ((Prelude..)
                                   ((Prelude..)
                                      Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                                   Prelude.fromEnum
                                   _v))
                      ((Data.Monoid.<>)
                         (case
                              Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'typeName") _x
                          of
                            Prelude.Nothing -> Data.Monoid.mempty
                            (Prelude.Just _v)
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt 50)
                                   ((Prelude..)
                                      (\ bs
                                         -> (Data.Monoid.<>)
                                              (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                 (Prelude.fromIntegral (Data.ByteString.length bs)))
                                              (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                      Data.Text.Encoding.encodeUtf8
                                      _v))
                         ((Data.Monoid.<>)
                            (case
                                 Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'extendee") _x
                             of
                               Prelude.Nothing -> Data.Monoid.mempty
                               (Prelude.Just _v)
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                                      ((Prelude..)
                                         (\ bs
                                            -> (Data.Monoid.<>)
                                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                    (Prelude.fromIntegral
                                                       (Data.ByteString.length bs)))
                                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                         Data.Text.Encoding.encodeUtf8
                                         _v))
                            ((Data.Monoid.<>)
                               (case
                                    Lens.Family2.view
                                      (Data.ProtoLens.Field.field @"maybe'defaultValue") _x
                                of
                                  Prelude.Nothing -> Data.Monoid.mempty
                                  (Prelude.Just _v)
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt 58)
                                         ((Prelude..)
                                            (\ bs
                                               -> (Data.Monoid.<>)
                                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                       (Prelude.fromIntegral
                                                          (Data.ByteString.length bs)))
                                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                            Data.Text.Encoding.encodeUtf8
                                            _v))
                               ((Data.Monoid.<>)
                                  (case
                                       Lens.Family2.view
                                         (Data.ProtoLens.Field.field @"maybe'oneofIndex") _x
                                   of
                                     Prelude.Nothing -> Data.Monoid.mempty
                                     (Prelude.Just _v)
                                       -> (Data.Monoid.<>)
                                            (Data.ProtoLens.Encoding.Bytes.putVarInt 72)
                                            ((Prelude..)
                                               Data.ProtoLens.Encoding.Bytes.putVarInt
                                               Prelude.fromIntegral
                                               _v))
                                  ((Data.Monoid.<>)
                                     (case
                                          Lens.Family2.view
                                            (Data.ProtoLens.Field.field @"maybe'jsonName") _x
                                      of
                                        Prelude.Nothing -> Data.Monoid.mempty
                                        (Prelude.Just _v)
                                          -> (Data.Monoid.<>)
                                               (Data.ProtoLens.Encoding.Bytes.putVarInt 82)
                                               ((Prelude..)
                                                  (\ bs
                                                     -> (Data.Monoid.<>)
                                                          (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                             (Prelude.fromIntegral
                                                                (Data.ByteString.length bs)))
                                                          (Data.ProtoLens.Encoding.Bytes.putBytes
                                                             bs))
                                                  Data.Text.Encoding.encodeUtf8
                                                  _v))
                                     ((Data.Monoid.<>)
                                        (case
                                             Lens.Family2.view
                                               (Data.ProtoLens.Field.field @"maybe'options") _x
                                         of
                                           Prelude.Nothing -> Data.Monoid.mempty
                                           (Prelude.Just _v)
                                             -> (Data.Monoid.<>)
                                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 66)
                                                  ((Prelude..)
                                                     (\ bs
                                                        -> (Data.Monoid.<>)
                                                             (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                (Prelude.fromIntegral
                                                                   (Data.ByteString.length bs)))
                                                             (Data.ProtoLens.Encoding.Bytes.putBytes
                                                                bs))
                                                     Data.ProtoLens.encodeMessage
                                                     _v))
                                        ((Data.Monoid.<>)
                                           (case
                                                Lens.Family2.view
                                                  (Data.ProtoLens.Field.field
                                                     @"maybe'proto3Optional")
                                                  _x
                                            of
                                              Prelude.Nothing -> Data.Monoid.mempty
                                              (Prelude.Just _v)
                                                -> (Data.Monoid.<>)
                                                     (Data.ProtoLens.Encoding.Bytes.putVarInt 136)
                                                     ((Prelude..)
                                                        Data.ProtoLens.Encoding.Bytes.putVarInt
                                                        (\ b -> if b then 1 else 0)
                                                        _v))
                                           (Data.ProtoLens.Encoding.Wire.buildFieldSet
                                              (Lens.Family2.view
                                                 Data.ProtoLens.unknownFields _x))))))))))))
instance Control.DeepSeq.NFData FieldDescriptorProto where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_FieldDescriptorProto'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_FieldDescriptorProto'name x__)
                (Control.DeepSeq.deepseq
                   (_FieldDescriptorProto'number x__)
                   (Control.DeepSeq.deepseq
                      (_FieldDescriptorProto'label x__)
                      (Control.DeepSeq.deepseq
                         (_FieldDescriptorProto'type' x__)
                         (Control.DeepSeq.deepseq
                            (_FieldDescriptorProto'typeName x__)
                            (Control.DeepSeq.deepseq
                               (_FieldDescriptorProto'extendee x__)
                               (Control.DeepSeq.deepseq
                                  (_FieldDescriptorProto'defaultValue x__)
                                  (Control.DeepSeq.deepseq
                                     (_FieldDescriptorProto'oneofIndex x__)
                                     (Control.DeepSeq.deepseq
                                        (_FieldDescriptorProto'jsonName x__)
                                        (Control.DeepSeq.deepseq
                                           (_FieldDescriptorProto'options x__)
                                           (Control.DeepSeq.deepseq
                                              (_FieldDescriptorProto'proto3Optional x__)
                                              ())))))))))))
data FieldDescriptorProto'Label
  = FieldDescriptorProto'LABEL_OPTIONAL |
    FieldDescriptorProto'LABEL_REQUIRED |
    FieldDescriptorProto'LABEL_REPEATED
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum FieldDescriptorProto'Label where
  maybeToEnum 1 = Prelude.Just FieldDescriptorProto'LABEL_OPTIONAL
  maybeToEnum 2 = Prelude.Just FieldDescriptorProto'LABEL_REQUIRED
  maybeToEnum 3 = Prelude.Just FieldDescriptorProto'LABEL_REPEATED
  maybeToEnum _ = Prelude.Nothing
  showEnum FieldDescriptorProto'LABEL_OPTIONAL = "LABEL_OPTIONAL"
  showEnum FieldDescriptorProto'LABEL_REPEATED = "LABEL_REPEATED"
  showEnum FieldDescriptorProto'LABEL_REQUIRED = "LABEL_REQUIRED"
  readEnum k
    | (Prelude.==) k "LABEL_OPTIONAL"
    = Prelude.Just FieldDescriptorProto'LABEL_OPTIONAL
    | (Prelude.==) k "LABEL_REPEATED"
    = Prelude.Just FieldDescriptorProto'LABEL_REPEATED
    | (Prelude.==) k "LABEL_REQUIRED"
    = Prelude.Just FieldDescriptorProto'LABEL_REQUIRED
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded FieldDescriptorProto'Label where
  minBound = FieldDescriptorProto'LABEL_OPTIONAL
  maxBound = FieldDescriptorProto'LABEL_REPEATED
instance Prelude.Enum FieldDescriptorProto'Label where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum Label: " (Prelude.show k__)))
        Prelude.id
        (Data.ProtoLens.maybeToEnum k__)
  fromEnum FieldDescriptorProto'LABEL_OPTIONAL = 1
  fromEnum FieldDescriptorProto'LABEL_REQUIRED = 2
  fromEnum FieldDescriptorProto'LABEL_REPEATED = 3
  succ FieldDescriptorProto'LABEL_REPEATED
    = Prelude.error
        "FieldDescriptorProto'Label.succ: bad argument FieldDescriptorProto'LABEL_REPEATED. This value would be out of bounds."
  succ FieldDescriptorProto'LABEL_OPTIONAL
    = FieldDescriptorProto'LABEL_REQUIRED
  succ FieldDescriptorProto'LABEL_REQUIRED
    = FieldDescriptorProto'LABEL_REPEATED
  pred FieldDescriptorProto'LABEL_OPTIONAL
    = Prelude.error
        "FieldDescriptorProto'Label.pred: bad argument FieldDescriptorProto'LABEL_OPTIONAL. This value would be out of bounds."
  pred FieldDescriptorProto'LABEL_REQUIRED
    = FieldDescriptorProto'LABEL_OPTIONAL
  pred FieldDescriptorProto'LABEL_REPEATED
    = FieldDescriptorProto'LABEL_REQUIRED
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault FieldDescriptorProto'Label where
  fieldDefault = FieldDescriptorProto'LABEL_OPTIONAL
instance Control.DeepSeq.NFData FieldDescriptorProto'Label where
  rnf x__ = Prelude.seq x__ ()
data FieldDescriptorProto'Type
  = FieldDescriptorProto'TYPE_DOUBLE |
    FieldDescriptorProto'TYPE_FLOAT |
    FieldDescriptorProto'TYPE_INT64 |
    FieldDescriptorProto'TYPE_UINT64 |
    FieldDescriptorProto'TYPE_INT32 |
    FieldDescriptorProto'TYPE_FIXED64 |
    FieldDescriptorProto'TYPE_FIXED32 |
    FieldDescriptorProto'TYPE_BOOL |
    FieldDescriptorProto'TYPE_STRING |
    FieldDescriptorProto'TYPE_GROUP |
    FieldDescriptorProto'TYPE_MESSAGE |
    FieldDescriptorProto'TYPE_BYTES |
    FieldDescriptorProto'TYPE_UINT32 |
    FieldDescriptorProto'TYPE_ENUM |
    FieldDescriptorProto'TYPE_SFIXED32 |
    FieldDescriptorProto'TYPE_SFIXED64 |
    FieldDescriptorProto'TYPE_SINT32 |
    FieldDescriptorProto'TYPE_SINT64
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum FieldDescriptorProto'Type where
  maybeToEnum 1 = Prelude.Just FieldDescriptorProto'TYPE_DOUBLE
  maybeToEnum 2 = Prelude.Just FieldDescriptorProto'TYPE_FLOAT
  maybeToEnum 3 = Prelude.Just FieldDescriptorProto'TYPE_INT64
  maybeToEnum 4 = Prelude.Just FieldDescriptorProto'TYPE_UINT64
  maybeToEnum 5 = Prelude.Just FieldDescriptorProto'TYPE_INT32
  maybeToEnum 6 = Prelude.Just FieldDescriptorProto'TYPE_FIXED64
  maybeToEnum 7 = Prelude.Just FieldDescriptorProto'TYPE_FIXED32
  maybeToEnum 8 = Prelude.Just FieldDescriptorProto'TYPE_BOOL
  maybeToEnum 9 = Prelude.Just FieldDescriptorProto'TYPE_STRING
  maybeToEnum 10 = Prelude.Just FieldDescriptorProto'TYPE_GROUP
  maybeToEnum 11 = Prelude.Just FieldDescriptorProto'TYPE_MESSAGE
  maybeToEnum 12 = Prelude.Just FieldDescriptorProto'TYPE_BYTES
  maybeToEnum 13 = Prelude.Just FieldDescriptorProto'TYPE_UINT32
  maybeToEnum 14 = Prelude.Just FieldDescriptorProto'TYPE_ENUM
  maybeToEnum 15 = Prelude.Just FieldDescriptorProto'TYPE_SFIXED32
  maybeToEnum 16 = Prelude.Just FieldDescriptorProto'TYPE_SFIXED64
  maybeToEnum 17 = Prelude.Just FieldDescriptorProto'TYPE_SINT32
  maybeToEnum 18 = Prelude.Just FieldDescriptorProto'TYPE_SINT64
  maybeToEnum _ = Prelude.Nothing
  showEnum FieldDescriptorProto'TYPE_DOUBLE = "TYPE_DOUBLE"
  showEnum FieldDescriptorProto'TYPE_FLOAT = "TYPE_FLOAT"
  showEnum FieldDescriptorProto'TYPE_INT64 = "TYPE_INT64"
  showEnum FieldDescriptorProto'TYPE_UINT64 = "TYPE_UINT64"
  showEnum FieldDescriptorProto'TYPE_INT32 = "TYPE_INT32"
  showEnum FieldDescriptorProto'TYPE_FIXED64 = "TYPE_FIXED64"
  showEnum FieldDescriptorProto'TYPE_FIXED32 = "TYPE_FIXED32"
  showEnum FieldDescriptorProto'TYPE_BOOL = "TYPE_BOOL"
  showEnum FieldDescriptorProto'TYPE_STRING = "TYPE_STRING"
  showEnum FieldDescriptorProto'TYPE_GROUP = "TYPE_GROUP"
  showEnum FieldDescriptorProto'TYPE_MESSAGE = "TYPE_MESSAGE"
  showEnum FieldDescriptorProto'TYPE_BYTES = "TYPE_BYTES"
  showEnum FieldDescriptorProto'TYPE_UINT32 = "TYPE_UINT32"
  showEnum FieldDescriptorProto'TYPE_ENUM = "TYPE_ENUM"
  showEnum FieldDescriptorProto'TYPE_SFIXED32 = "TYPE_SFIXED32"
  showEnum FieldDescriptorProto'TYPE_SFIXED64 = "TYPE_SFIXED64"
  showEnum FieldDescriptorProto'TYPE_SINT32 = "TYPE_SINT32"
  showEnum FieldDescriptorProto'TYPE_SINT64 = "TYPE_SINT64"
  readEnum k
    | (Prelude.==) k "TYPE_DOUBLE"
    = Prelude.Just FieldDescriptorProto'TYPE_DOUBLE
    | (Prelude.==) k "TYPE_FLOAT"
    = Prelude.Just FieldDescriptorProto'TYPE_FLOAT
    | (Prelude.==) k "TYPE_INT64"
    = Prelude.Just FieldDescriptorProto'TYPE_INT64
    | (Prelude.==) k "TYPE_UINT64"
    = Prelude.Just FieldDescriptorProto'TYPE_UINT64
    | (Prelude.==) k "TYPE_INT32"
    = Prelude.Just FieldDescriptorProto'TYPE_INT32
    | (Prelude.==) k "TYPE_FIXED64"
    = Prelude.Just FieldDescriptorProto'TYPE_FIXED64
    | (Prelude.==) k "TYPE_FIXED32"
    = Prelude.Just FieldDescriptorProto'TYPE_FIXED32
    | (Prelude.==) k "TYPE_BOOL"
    = Prelude.Just FieldDescriptorProto'TYPE_BOOL
    | (Prelude.==) k "TYPE_STRING"
    = Prelude.Just FieldDescriptorProto'TYPE_STRING
    | (Prelude.==) k "TYPE_GROUP"
    = Prelude.Just FieldDescriptorProto'TYPE_GROUP
    | (Prelude.==) k "TYPE_MESSAGE"
    = Prelude.Just FieldDescriptorProto'TYPE_MESSAGE
    | (Prelude.==) k "TYPE_BYTES"
    = Prelude.Just FieldDescriptorProto'TYPE_BYTES
    | (Prelude.==) k "TYPE_UINT32"
    = Prelude.Just FieldDescriptorProto'TYPE_UINT32
    | (Prelude.==) k "TYPE_ENUM"
    = Prelude.Just FieldDescriptorProto'TYPE_ENUM
    | (Prelude.==) k "TYPE_SFIXED32"
    = Prelude.Just FieldDescriptorProto'TYPE_SFIXED32
    | (Prelude.==) k "TYPE_SFIXED64"
    = Prelude.Just FieldDescriptorProto'TYPE_SFIXED64
    | (Prelude.==) k "TYPE_SINT32"
    = Prelude.Just FieldDescriptorProto'TYPE_SINT32
    | (Prelude.==) k "TYPE_SINT64"
    = Prelude.Just FieldDescriptorProto'TYPE_SINT64
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded FieldDescriptorProto'Type where
  minBound = FieldDescriptorProto'TYPE_DOUBLE
  maxBound = FieldDescriptorProto'TYPE_SINT64
instance Prelude.Enum FieldDescriptorProto'Type where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum Type: " (Prelude.show k__)))
        Prelude.id
        (Data.ProtoLens.maybeToEnum k__)
  fromEnum FieldDescriptorProto'TYPE_DOUBLE = 1
  fromEnum FieldDescriptorProto'TYPE_FLOAT = 2
  fromEnum FieldDescriptorProto'TYPE_INT64 = 3
  fromEnum FieldDescriptorProto'TYPE_UINT64 = 4
  fromEnum FieldDescriptorProto'TYPE_INT32 = 5
  fromEnum FieldDescriptorProto'TYPE_FIXED64 = 6
  fromEnum FieldDescriptorProto'TYPE_FIXED32 = 7
  fromEnum FieldDescriptorProto'TYPE_BOOL = 8
  fromEnum FieldDescriptorProto'TYPE_STRING = 9
  fromEnum FieldDescriptorProto'TYPE_GROUP = 10
  fromEnum FieldDescriptorProto'TYPE_MESSAGE = 11
  fromEnum FieldDescriptorProto'TYPE_BYTES = 12
  fromEnum FieldDescriptorProto'TYPE_UINT32 = 13
  fromEnum FieldDescriptorProto'TYPE_ENUM = 14
  fromEnum FieldDescriptorProto'TYPE_SFIXED32 = 15
  fromEnum FieldDescriptorProto'TYPE_SFIXED64 = 16
  fromEnum FieldDescriptorProto'TYPE_SINT32 = 17
  fromEnum FieldDescriptorProto'TYPE_SINT64 = 18
  succ FieldDescriptorProto'TYPE_SINT64
    = Prelude.error
        "FieldDescriptorProto'Type.succ: bad argument FieldDescriptorProto'TYPE_SINT64. This value would be out of bounds."
  succ FieldDescriptorProto'TYPE_DOUBLE
    = FieldDescriptorProto'TYPE_FLOAT
  succ FieldDescriptorProto'TYPE_FLOAT
    = FieldDescriptorProto'TYPE_INT64
  succ FieldDescriptorProto'TYPE_INT64
    = FieldDescriptorProto'TYPE_UINT64
  succ FieldDescriptorProto'TYPE_UINT64
    = FieldDescriptorProto'TYPE_INT32
  succ FieldDescriptorProto'TYPE_INT32
    = FieldDescriptorProto'TYPE_FIXED64
  succ FieldDescriptorProto'TYPE_FIXED64
    = FieldDescriptorProto'TYPE_FIXED32
  succ FieldDescriptorProto'TYPE_FIXED32
    = FieldDescriptorProto'TYPE_BOOL
  succ FieldDescriptorProto'TYPE_BOOL
    = FieldDescriptorProto'TYPE_STRING
  succ FieldDescriptorProto'TYPE_STRING
    = FieldDescriptorProto'TYPE_GROUP
  succ FieldDescriptorProto'TYPE_GROUP
    = FieldDescriptorProto'TYPE_MESSAGE
  succ FieldDescriptorProto'TYPE_MESSAGE
    = FieldDescriptorProto'TYPE_BYTES
  succ FieldDescriptorProto'TYPE_BYTES
    = FieldDescriptorProto'TYPE_UINT32
  succ FieldDescriptorProto'TYPE_UINT32
    = FieldDescriptorProto'TYPE_ENUM
  succ FieldDescriptorProto'TYPE_ENUM
    = FieldDescriptorProto'TYPE_SFIXED32
  succ FieldDescriptorProto'TYPE_SFIXED32
    = FieldDescriptorProto'TYPE_SFIXED64
  succ FieldDescriptorProto'TYPE_SFIXED64
    = FieldDescriptorProto'TYPE_SINT32
  succ FieldDescriptorProto'TYPE_SINT32
    = FieldDescriptorProto'TYPE_SINT64
  pred FieldDescriptorProto'TYPE_DOUBLE
    = Prelude.error
        "FieldDescriptorProto'Type.pred: bad argument FieldDescriptorProto'TYPE_DOUBLE. This value would be out of bounds."
  pred FieldDescriptorProto'TYPE_FLOAT
    = FieldDescriptorProto'TYPE_DOUBLE
  pred FieldDescriptorProto'TYPE_INT64
    = FieldDescriptorProto'TYPE_FLOAT
  pred FieldDescriptorProto'TYPE_UINT64
    = FieldDescriptorProto'TYPE_INT64
  pred FieldDescriptorProto'TYPE_INT32
    = FieldDescriptorProto'TYPE_UINT64
  pred FieldDescriptorProto'TYPE_FIXED64
    = FieldDescriptorProto'TYPE_INT32
  pred FieldDescriptorProto'TYPE_FIXED32
    = FieldDescriptorProto'TYPE_FIXED64
  pred FieldDescriptorProto'TYPE_BOOL
    = FieldDescriptorProto'TYPE_FIXED32
  pred FieldDescriptorProto'TYPE_STRING
    = FieldDescriptorProto'TYPE_BOOL
  pred FieldDescriptorProto'TYPE_GROUP
    = FieldDescriptorProto'TYPE_STRING
  pred FieldDescriptorProto'TYPE_MESSAGE
    = FieldDescriptorProto'TYPE_GROUP
  pred FieldDescriptorProto'TYPE_BYTES
    = FieldDescriptorProto'TYPE_MESSAGE
  pred FieldDescriptorProto'TYPE_UINT32
    = FieldDescriptorProto'TYPE_BYTES
  pred FieldDescriptorProto'TYPE_ENUM
    = FieldDescriptorProto'TYPE_UINT32
  pred FieldDescriptorProto'TYPE_SFIXED32
    = FieldDescriptorProto'TYPE_ENUM
  pred FieldDescriptorProto'TYPE_SFIXED64
    = FieldDescriptorProto'TYPE_SFIXED32
  pred FieldDescriptorProto'TYPE_SINT32
    = FieldDescriptorProto'TYPE_SFIXED64
  pred FieldDescriptorProto'TYPE_SINT64
    = FieldDescriptorProto'TYPE_SINT32
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault FieldDescriptorProto'Type where
  fieldDefault = FieldDescriptorProto'TYPE_DOUBLE
instance Control.DeepSeq.NFData FieldDescriptorProto'Type where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.ctype' @:: Lens' FieldOptions FieldOptions'CType@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'ctype' @:: Lens' FieldOptions (Prelude.Maybe FieldOptions'CType)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.packed' @:: Lens' FieldOptions Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'packed' @:: Lens' FieldOptions (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.jstype' @:: Lens' FieldOptions FieldOptions'JSType@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'jstype' @:: Lens' FieldOptions (Prelude.Maybe FieldOptions'JSType)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.lazy' @:: Lens' FieldOptions Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'lazy' @:: Lens' FieldOptions (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.unverifiedLazy' @:: Lens' FieldOptions Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'unverifiedLazy' @:: Lens' FieldOptions (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.deprecated' @:: Lens' FieldOptions Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'deprecated' @:: Lens' FieldOptions (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.weak' @:: Lens' FieldOptions Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'weak' @:: Lens' FieldOptions (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.debugRedact' @:: Lens' FieldOptions Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'debugRedact' @:: Lens' FieldOptions (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.retention' @:: Lens' FieldOptions FieldOptions'OptionRetention@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'retention' @:: Lens' FieldOptions (Prelude.Maybe FieldOptions'OptionRetention)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.targets' @:: Lens' FieldOptions [FieldOptions'OptionTargetType]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'targets' @:: Lens' FieldOptions (Data.Vector.Vector FieldOptions'OptionTargetType)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.editionDefaults' @:: Lens' FieldOptions [FieldOptions'EditionDefault]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'editionDefaults' @:: Lens' FieldOptions (Data.Vector.Vector FieldOptions'EditionDefault)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.features' @:: Lens' FieldOptions FeatureSet@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'features' @:: Lens' FieldOptions (Prelude.Maybe FeatureSet)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.featureSupport' @:: Lens' FieldOptions FieldOptions'FeatureSupport@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'featureSupport' @:: Lens' FieldOptions (Prelude.Maybe FieldOptions'FeatureSupport)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.uninterpretedOption' @:: Lens' FieldOptions [UninterpretedOption]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'uninterpretedOption' @:: Lens' FieldOptions (Data.Vector.Vector UninterpretedOption)@ -}
data FieldOptions
  = FieldOptions'_constructor {_FieldOptions'ctype :: !(Prelude.Maybe FieldOptions'CType),
                               _FieldOptions'packed :: !(Prelude.Maybe Prelude.Bool),
                               _FieldOptions'jstype :: !(Prelude.Maybe FieldOptions'JSType),
                               _FieldOptions'lazy :: !(Prelude.Maybe Prelude.Bool),
                               _FieldOptions'unverifiedLazy :: !(Prelude.Maybe Prelude.Bool),
                               _FieldOptions'deprecated :: !(Prelude.Maybe Prelude.Bool),
                               _FieldOptions'weak :: !(Prelude.Maybe Prelude.Bool),
                               _FieldOptions'debugRedact :: !(Prelude.Maybe Prelude.Bool),
                               _FieldOptions'retention :: !(Prelude.Maybe FieldOptions'OptionRetention),
                               _FieldOptions'targets :: !(Data.Vector.Vector FieldOptions'OptionTargetType),
                               _FieldOptions'editionDefaults :: !(Data.Vector.Vector FieldOptions'EditionDefault),
                               _FieldOptions'features :: !(Prelude.Maybe FeatureSet),
                               _FieldOptions'featureSupport :: !(Prelude.Maybe FieldOptions'FeatureSupport),
                               _FieldOptions'uninterpretedOption :: !(Data.Vector.Vector UninterpretedOption),
                               _FieldOptions'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show FieldOptions where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField FieldOptions "ctype" FieldOptions'CType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'ctype (\ x__ y__ -> x__ {_FieldOptions'ctype = y__}))
        (Data.ProtoLens.maybeLens FieldOptions'STRING)
instance Data.ProtoLens.Field.HasField FieldOptions "maybe'ctype" (Prelude.Maybe FieldOptions'CType) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'ctype (\ x__ y__ -> x__ {_FieldOptions'ctype = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FieldOptions "packed" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'packed
           (\ x__ y__ -> x__ {_FieldOptions'packed = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FieldOptions "maybe'packed" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'packed
           (\ x__ y__ -> x__ {_FieldOptions'packed = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FieldOptions "jstype" FieldOptions'JSType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'jstype
           (\ x__ y__ -> x__ {_FieldOptions'jstype = y__}))
        (Data.ProtoLens.maybeLens FieldOptions'JS_NORMAL)
instance Data.ProtoLens.Field.HasField FieldOptions "maybe'jstype" (Prelude.Maybe FieldOptions'JSType) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'jstype
           (\ x__ y__ -> x__ {_FieldOptions'jstype = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FieldOptions "lazy" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'lazy (\ x__ y__ -> x__ {_FieldOptions'lazy = y__}))
        (Data.ProtoLens.maybeLens Prelude.False)
instance Data.ProtoLens.Field.HasField FieldOptions "maybe'lazy" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'lazy (\ x__ y__ -> x__ {_FieldOptions'lazy = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FieldOptions "unverifiedLazy" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'unverifiedLazy
           (\ x__ y__ -> x__ {_FieldOptions'unverifiedLazy = y__}))
        (Data.ProtoLens.maybeLens Prelude.False)
instance Data.ProtoLens.Field.HasField FieldOptions "maybe'unverifiedLazy" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'unverifiedLazy
           (\ x__ y__ -> x__ {_FieldOptions'unverifiedLazy = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FieldOptions "deprecated" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'deprecated
           (\ x__ y__ -> x__ {_FieldOptions'deprecated = y__}))
        (Data.ProtoLens.maybeLens Prelude.False)
instance Data.ProtoLens.Field.HasField FieldOptions "maybe'deprecated" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'deprecated
           (\ x__ y__ -> x__ {_FieldOptions'deprecated = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FieldOptions "weak" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'weak (\ x__ y__ -> x__ {_FieldOptions'weak = y__}))
        (Data.ProtoLens.maybeLens Prelude.False)
instance Data.ProtoLens.Field.HasField FieldOptions "maybe'weak" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'weak (\ x__ y__ -> x__ {_FieldOptions'weak = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FieldOptions "debugRedact" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'debugRedact
           (\ x__ y__ -> x__ {_FieldOptions'debugRedact = y__}))
        (Data.ProtoLens.maybeLens Prelude.False)
instance Data.ProtoLens.Field.HasField FieldOptions "maybe'debugRedact" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'debugRedact
           (\ x__ y__ -> x__ {_FieldOptions'debugRedact = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FieldOptions "retention" FieldOptions'OptionRetention where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'retention
           (\ x__ y__ -> x__ {_FieldOptions'retention = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FieldOptions "maybe'retention" (Prelude.Maybe FieldOptions'OptionRetention) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'retention
           (\ x__ y__ -> x__ {_FieldOptions'retention = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FieldOptions "targets" [FieldOptions'OptionTargetType] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'targets
           (\ x__ y__ -> x__ {_FieldOptions'targets = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField FieldOptions "vec'targets" (Data.Vector.Vector FieldOptions'OptionTargetType) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'targets
           (\ x__ y__ -> x__ {_FieldOptions'targets = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FieldOptions "editionDefaults" [FieldOptions'EditionDefault] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'editionDefaults
           (\ x__ y__ -> x__ {_FieldOptions'editionDefaults = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField FieldOptions "vec'editionDefaults" (Data.Vector.Vector FieldOptions'EditionDefault) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'editionDefaults
           (\ x__ y__ -> x__ {_FieldOptions'editionDefaults = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FieldOptions "features" FeatureSet where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'features
           (\ x__ y__ -> x__ {_FieldOptions'features = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField FieldOptions "maybe'features" (Prelude.Maybe FeatureSet) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'features
           (\ x__ y__ -> x__ {_FieldOptions'features = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FieldOptions "featureSupport" FieldOptions'FeatureSupport where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'featureSupport
           (\ x__ y__ -> x__ {_FieldOptions'featureSupport = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField FieldOptions "maybe'featureSupport" (Prelude.Maybe FieldOptions'FeatureSupport) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'featureSupport
           (\ x__ y__ -> x__ {_FieldOptions'featureSupport = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FieldOptions "uninterpretedOption" [UninterpretedOption] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'uninterpretedOption
           (\ x__ y__ -> x__ {_FieldOptions'uninterpretedOption = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField FieldOptions "vec'uninterpretedOption" (Data.Vector.Vector UninterpretedOption) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'uninterpretedOption
           (\ x__ y__ -> x__ {_FieldOptions'uninterpretedOption = y__}))
        Prelude.id
instance Data.ProtoLens.Message FieldOptions where
  messageName _ = Data.Text.pack "google.protobuf.FieldOptions"
  packedMessageDescriptor _
    = "\n\
      \\fFieldOptions\DC2A\n\
      \\ENQctype\CAN\SOH \SOH(\SO2#.google.protobuf.FieldOptions.CType:\ACKSTRINGR\ENQctype\DC2\SYN\n\
      \\ACKpacked\CAN\STX \SOH(\bR\ACKpacked\DC2G\n\
      \\ACKjstype\CAN\ACK \SOH(\SO2$.google.protobuf.FieldOptions.JSType:\tJS_NORMALR\ACKjstype\DC2\EM\n\
      \\EOTlazy\CAN\ENQ \SOH(\b:\ENQfalseR\EOTlazy\DC2.\n\
      \\SIunverified_lazy\CAN\SI \SOH(\b:\ENQfalseR\SOunverifiedLazy\DC2%\n\
      \\n\
      \deprecated\CAN\ETX \SOH(\b:\ENQfalseR\n\
      \deprecated\DC2\EM\n\
      \\EOTweak\CAN\n\
      \ \SOH(\b:\ENQfalseR\EOTweak\DC2(\n\
      \\fdebug_redact\CAN\DLE \SOH(\b:\ENQfalseR\vdebugRedact\DC2K\n\
      \\tretention\CAN\DC1 \SOH(\SO2-.google.protobuf.FieldOptions.OptionRetentionR\tretention\DC2H\n\
      \\atargets\CAN\DC3 \ETX(\SO2..google.protobuf.FieldOptions.OptionTargetTypeR\atargets\DC2W\n\
      \\DLEedition_defaults\CAN\DC4 \ETX(\v2,.google.protobuf.FieldOptions.EditionDefaultR\SIeditionDefaults\DC27\n\
      \\bfeatures\CAN\NAK \SOH(\v2\ESC.google.protobuf.FeatureSetR\bfeatures\DC2U\n\
      \\SIfeature_support\CAN\SYN \SOH(\v2,.google.protobuf.FieldOptions.FeatureSupportR\SOfeatureSupport\DC2X\n\
      \\DC4uninterpreted_option\CAN\231\a \ETX(\v2$.google.protobuf.UninterpretedOptionR\DC3uninterpretedOption\SUBZ\n\
      \\SOEditionDefault\DC22\n\
      \\aedition\CAN\ETX \SOH(\SO2\CAN.google.protobuf.EditionR\aedition\DC2\DC4\n\
      \\ENQvalue\CAN\STX \SOH(\tR\ENQvalue\SUB\150\STX\n\
      \\SOFeatureSupport\DC2G\n\
      \\DC2edition_introduced\CAN\SOH \SOH(\SO2\CAN.google.protobuf.EditionR\DC1editionIntroduced\DC2G\n\
      \\DC2edition_deprecated\CAN\STX \SOH(\SO2\CAN.google.protobuf.EditionR\DC1editionDeprecated\DC2/\n\
      \\DC3deprecation_warning\CAN\ETX \SOH(\tR\DC2deprecationWarning\DC2A\n\
      \\SIedition_removed\CAN\EOT \SOH(\SO2\CAN.google.protobuf.EditionR\SOeditionRemoved\"/\n\
      \\ENQCType\DC2\n\
      \\n\
      \\ACKSTRING\DLE\NUL\DC2\b\n\
      \\EOTCORD\DLE\SOH\DC2\DLE\n\
      \\fSTRING_PIECE\DLE\STX\"5\n\
      \\ACKJSType\DC2\r\n\
      \\tJS_NORMAL\DLE\NUL\DC2\r\n\
      \\tJS_STRING\DLE\SOH\DC2\r\n\
      \\tJS_NUMBER\DLE\STX\"U\n\
      \\SIOptionRetention\DC2\NAK\n\
      \\DC1RETENTION_UNKNOWN\DLE\NUL\DC2\NAK\n\
      \\DC1RETENTION_RUNTIME\DLE\SOH\DC2\DC4\n\
      \\DLERETENTION_SOURCE\DLE\STX\"\140\STX\n\
      \\DLEOptionTargetType\DC2\ETB\n\
      \\DC3TARGET_TYPE_UNKNOWN\DLE\NUL\DC2\DC4\n\
      \\DLETARGET_TYPE_FILE\DLE\SOH\DC2\US\n\
      \\ESCTARGET_TYPE_EXTENSION_RANGE\DLE\STX\DC2\ETB\n\
      \\DC3TARGET_TYPE_MESSAGE\DLE\ETX\DC2\NAK\n\
      \\DC1TARGET_TYPE_FIELD\DLE\EOT\DC2\NAK\n\
      \\DC1TARGET_TYPE_ONEOF\DLE\ENQ\DC2\DC4\n\
      \\DLETARGET_TYPE_ENUM\DLE\ACK\DC2\SUB\n\
      \\SYNTARGET_TYPE_ENUM_ENTRY\DLE\a\DC2\ETB\n\
      \\DC3TARGET_TYPE_SERVICE\DLE\b\DC2\SYN\n\
      \\DC2TARGET_TYPE_METHOD\DLE\t*\t\b\232\a\DLE\128\128\128\128\STXJ\EOT\b\EOT\DLE\ENQJ\EOT\b\DC2\DLE\DC3"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        ctype__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "ctype"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor FieldOptions'CType)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'ctype")) ::
              Data.ProtoLens.FieldDescriptor FieldOptions
        packed__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "packed"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'packed")) ::
              Data.ProtoLens.FieldDescriptor FieldOptions
        jstype__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "jstype"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor FieldOptions'JSType)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'jstype")) ::
              Data.ProtoLens.FieldDescriptor FieldOptions
        lazy__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "lazy"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'lazy")) ::
              Data.ProtoLens.FieldDescriptor FieldOptions
        unverifiedLazy__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "unverified_lazy"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'unverifiedLazy")) ::
              Data.ProtoLens.FieldDescriptor FieldOptions
        deprecated__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "deprecated"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'deprecated")) ::
              Data.ProtoLens.FieldDescriptor FieldOptions
        weak__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "weak"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'weak")) ::
              Data.ProtoLens.FieldDescriptor FieldOptions
        debugRedact__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "debug_redact"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'debugRedact")) ::
              Data.ProtoLens.FieldDescriptor FieldOptions
        retention__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "retention"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor FieldOptions'OptionRetention)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'retention")) ::
              Data.ProtoLens.FieldDescriptor FieldOptions
        targets__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "targets"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor FieldOptions'OptionTargetType)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"targets")) ::
              Data.ProtoLens.FieldDescriptor FieldOptions
        editionDefaults__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "edition_defaults"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor FieldOptions'EditionDefault)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"editionDefaults")) ::
              Data.ProtoLens.FieldDescriptor FieldOptions
        features__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "features"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor FeatureSet)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'features")) ::
              Data.ProtoLens.FieldDescriptor FieldOptions
        featureSupport__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "feature_support"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor FieldOptions'FeatureSupport)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'featureSupport")) ::
              Data.ProtoLens.FieldDescriptor FieldOptions
        uninterpretedOption__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "uninterpreted_option"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor UninterpretedOption)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"uninterpretedOption")) ::
              Data.ProtoLens.FieldDescriptor FieldOptions
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, ctype__field_descriptor),
           (Data.ProtoLens.Tag 2, packed__field_descriptor),
           (Data.ProtoLens.Tag 6, jstype__field_descriptor),
           (Data.ProtoLens.Tag 5, lazy__field_descriptor),
           (Data.ProtoLens.Tag 15, unverifiedLazy__field_descriptor),
           (Data.ProtoLens.Tag 3, deprecated__field_descriptor),
           (Data.ProtoLens.Tag 10, weak__field_descriptor),
           (Data.ProtoLens.Tag 16, debugRedact__field_descriptor),
           (Data.ProtoLens.Tag 17, retention__field_descriptor),
           (Data.ProtoLens.Tag 19, targets__field_descriptor),
           (Data.ProtoLens.Tag 20, editionDefaults__field_descriptor),
           (Data.ProtoLens.Tag 21, features__field_descriptor),
           (Data.ProtoLens.Tag 22, featureSupport__field_descriptor),
           (Data.ProtoLens.Tag 999, uninterpretedOption__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _FieldOptions'_unknownFields
        (\ x__ y__ -> x__ {_FieldOptions'_unknownFields = y__})
  defMessage
    = FieldOptions'_constructor
        {_FieldOptions'ctype = Prelude.Nothing,
         _FieldOptions'packed = Prelude.Nothing,
         _FieldOptions'jstype = Prelude.Nothing,
         _FieldOptions'lazy = Prelude.Nothing,
         _FieldOptions'unverifiedLazy = Prelude.Nothing,
         _FieldOptions'deprecated = Prelude.Nothing,
         _FieldOptions'weak = Prelude.Nothing,
         _FieldOptions'debugRedact = Prelude.Nothing,
         _FieldOptions'retention = Prelude.Nothing,
         _FieldOptions'targets = Data.Vector.Generic.empty,
         _FieldOptions'editionDefaults = Data.Vector.Generic.empty,
         _FieldOptions'features = Prelude.Nothing,
         _FieldOptions'featureSupport = Prelude.Nothing,
         _FieldOptions'uninterpretedOption = Data.Vector.Generic.empty,
         _FieldOptions'_unknownFields = []}
  parseMessage
    = let
        loop ::
          FieldOptions
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld FieldOptions'EditionDefault
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld FieldOptions'OptionTargetType
                -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld UninterpretedOption
                   -> Data.ProtoLens.Encoding.Bytes.Parser FieldOptions
        loop
          x
          mutable'editionDefaults
          mutable'targets
          mutable'uninterpretedOption
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'editionDefaults <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                  (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                     mutable'editionDefaults)
                      frozen'targets <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                          (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                             mutable'targets)
                      frozen'uninterpretedOption <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                      (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                         mutable'uninterpretedOption)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields
                           (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'editionDefaults")
                              frozen'editionDefaults
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'targets")
                                 frozen'targets
                                 (Lens.Family2.set
                                    (Data.ProtoLens.Field.field @"vec'uninterpretedOption")
                                    frozen'uninterpretedOption
                                    x))))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "ctype"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"ctype") y x)
                                  mutable'editionDefaults
                                  mutable'targets
                                  mutable'uninterpretedOption
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "packed"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"packed") y x)
                                  mutable'editionDefaults
                                  mutable'targets
                                  mutable'uninterpretedOption
                        48
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "jstype"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"jstype") y x)
                                  mutable'editionDefaults
                                  mutable'targets
                                  mutable'uninterpretedOption
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "lazy"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"lazy") y x)
                                  mutable'editionDefaults
                                  mutable'targets
                                  mutable'uninterpretedOption
                        120
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "unverified_lazy"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"unverifiedLazy") y x)
                                  mutable'editionDefaults
                                  mutable'targets
                                  mutable'uninterpretedOption
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "deprecated"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"deprecated") y x)
                                  mutable'editionDefaults
                                  mutable'targets
                                  mutable'uninterpretedOption
                        80
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "weak"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"weak") y x)
                                  mutable'editionDefaults
                                  mutable'targets
                                  mutable'uninterpretedOption
                        128
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "debug_redact"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"debugRedact") y x)
                                  mutable'editionDefaults
                                  mutable'targets
                                  mutable'uninterpretedOption
                        136
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "retention"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"retention") y x)
                                  mutable'editionDefaults
                                  mutable'targets
                                  mutable'uninterpretedOption
                        152
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (Prelude.fmap
                                           Prelude.toEnum
                                           (Prelude.fmap
                                              Prelude.fromIntegral
                                              Data.ProtoLens.Encoding.Bytes.getVarInt))
                                        "targets"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'targets y)
                                loop x mutable'editionDefaults v mutable'uninterpretedOption
                        154
                          -> do y <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                        Data.ProtoLens.Encoding.Bytes.isolate
                                          (Prelude.fromIntegral len)
                                          ((let
                                              ploop qs
                                                = do packedEnd <- Data.ProtoLens.Encoding.Bytes.atEnd
                                                     if packedEnd then
                                                         Prelude.return qs
                                                     else
                                                         do !q <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                                                    (Prelude.fmap
                                                                       Prelude.toEnum
                                                                       (Prelude.fmap
                                                                          Prelude.fromIntegral
                                                                          Data.ProtoLens.Encoding.Bytes.getVarInt))
                                                                    "targets"
                                                            qs' <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                                     (Data.ProtoLens.Encoding.Growing.append
                                                                        qs q)
                                                            ploop qs'
                                            in ploop)
                                             mutable'targets)
                                loop x mutable'editionDefaults y mutable'uninterpretedOption
                        162
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "edition_defaults"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'editionDefaults y)
                                loop x v mutable'targets mutable'uninterpretedOption
                        170
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "features"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"features") y x)
                                  mutable'editionDefaults
                                  mutable'targets
                                  mutable'uninterpretedOption
                        178
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "feature_support"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"featureSupport") y x)
                                  mutable'editionDefaults
                                  mutable'targets
                                  mutable'uninterpretedOption
                        7994
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "uninterpreted_option"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'uninterpretedOption y)
                                loop x mutable'editionDefaults mutable'targets v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'editionDefaults
                                  mutable'targets
                                  mutable'uninterpretedOption
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'editionDefaults <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                           Data.ProtoLens.Encoding.Growing.new
              mutable'targets <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                   Data.ProtoLens.Encoding.Growing.new
              mutable'uninterpretedOption <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                               Data.ProtoLens.Encoding.Growing.new
              loop
                Data.ProtoLens.defMessage
                mutable'editionDefaults
                mutable'targets
                mutable'uninterpretedOption)
          "FieldOptions"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'ctype") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                       ((Prelude..)
                          ((Prelude..)
                             Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                          Prelude.fromEnum
                          _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'packed") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                          ((Prelude..)
                             Data.ProtoLens.Encoding.Bytes.putVarInt
                             (\ b -> if b then 1 else 0)
                             _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'jstype") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 48)
                             ((Prelude..)
                                ((Prelude..)
                                   Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                                Prelude.fromEnum
                                _v))
                   ((Data.Monoid.<>)
                      (case
                           Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'lazy") _x
                       of
                         Prelude.Nothing -> Data.Monoid.mempty
                         (Prelude.Just _v)
                           -> (Data.Monoid.<>)
                                (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                ((Prelude..)
                                   Data.ProtoLens.Encoding.Bytes.putVarInt
                                   (\ b -> if b then 1 else 0)
                                   _v))
                      ((Data.Monoid.<>)
                         (case
                              Lens.Family2.view
                                (Data.ProtoLens.Field.field @"maybe'unverifiedLazy") _x
                          of
                            Prelude.Nothing -> Data.Monoid.mempty
                            (Prelude.Just _v)
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt 120)
                                   ((Prelude..)
                                      Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (\ b -> if b then 1 else 0)
                                      _v))
                         ((Data.Monoid.<>)
                            (case
                                 Lens.Family2.view
                                   (Data.ProtoLens.Field.field @"maybe'deprecated") _x
                             of
                               Prelude.Nothing -> Data.Monoid.mempty
                               (Prelude.Just _v)
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                                      ((Prelude..)
                                         Data.ProtoLens.Encoding.Bytes.putVarInt
                                         (\ b -> if b then 1 else 0)
                                         _v))
                            ((Data.Monoid.<>)
                               (case
                                    Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'weak") _x
                                of
                                  Prelude.Nothing -> Data.Monoid.mempty
                                  (Prelude.Just _v)
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt 80)
                                         ((Prelude..)
                                            Data.ProtoLens.Encoding.Bytes.putVarInt
                                            (\ b -> if b then 1 else 0)
                                            _v))
                               ((Data.Monoid.<>)
                                  (case
                                       Lens.Family2.view
                                         (Data.ProtoLens.Field.field @"maybe'debugRedact") _x
                                   of
                                     Prelude.Nothing -> Data.Monoid.mempty
                                     (Prelude.Just _v)
                                       -> (Data.Monoid.<>)
                                            (Data.ProtoLens.Encoding.Bytes.putVarInt 128)
                                            ((Prelude..)
                                               Data.ProtoLens.Encoding.Bytes.putVarInt
                                               (\ b -> if b then 1 else 0)
                                               _v))
                                  ((Data.Monoid.<>)
                                     (case
                                          Lens.Family2.view
                                            (Data.ProtoLens.Field.field @"maybe'retention") _x
                                      of
                                        Prelude.Nothing -> Data.Monoid.mempty
                                        (Prelude.Just _v)
                                          -> (Data.Monoid.<>)
                                               (Data.ProtoLens.Encoding.Bytes.putVarInt 136)
                                               ((Prelude..)
                                                  ((Prelude..)
                                                     Data.ProtoLens.Encoding.Bytes.putVarInt
                                                     Prelude.fromIntegral)
                                                  Prelude.fromEnum
                                                  _v))
                                     ((Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                                           (\ _v
                                              -> (Data.Monoid.<>)
                                                   (Data.ProtoLens.Encoding.Bytes.putVarInt 152)
                                                   ((Prelude..)
                                                      ((Prelude..)
                                                         Data.ProtoLens.Encoding.Bytes.putVarInt
                                                         Prelude.fromIntegral)
                                                      Prelude.fromEnum
                                                      _v))
                                           (Lens.Family2.view
                                              (Data.ProtoLens.Field.field @"vec'targets") _x))
                                        ((Data.Monoid.<>)
                                           (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                                              (\ _v
                                                 -> (Data.Monoid.<>)
                                                      (Data.ProtoLens.Encoding.Bytes.putVarInt 162)
                                                      ((Prelude..)
                                                         (\ bs
                                                            -> (Data.Monoid.<>)
                                                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                    (Prelude.fromIntegral
                                                                       (Data.ByteString.length bs)))
                                                                 (Data.ProtoLens.Encoding.Bytes.putBytes
                                                                    bs))
                                                         Data.ProtoLens.encodeMessage
                                                         _v))
                                              (Lens.Family2.view
                                                 (Data.ProtoLens.Field.field @"vec'editionDefaults")
                                                 _x))
                                           ((Data.Monoid.<>)
                                              (case
                                                   Lens.Family2.view
                                                     (Data.ProtoLens.Field.field @"maybe'features")
                                                     _x
                                               of
                                                 Prelude.Nothing -> Data.Monoid.mempty
                                                 (Prelude.Just _v)
                                                   -> (Data.Monoid.<>)
                                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                           170)
                                                        ((Prelude..)
                                                           (\ bs
                                                              -> (Data.Monoid.<>)
                                                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                      (Prelude.fromIntegral
                                                                         (Data.ByteString.length
                                                                            bs)))
                                                                   (Data.ProtoLens.Encoding.Bytes.putBytes
                                                                      bs))
                                                           Data.ProtoLens.encodeMessage
                                                           _v))
                                              ((Data.Monoid.<>)
                                                 (case
                                                      Lens.Family2.view
                                                        (Data.ProtoLens.Field.field
                                                           @"maybe'featureSupport")
                                                        _x
                                                  of
                                                    Prelude.Nothing -> Data.Monoid.mempty
                                                    (Prelude.Just _v)
                                                      -> (Data.Monoid.<>)
                                                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                              178)
                                                           ((Prelude..)
                                                              (\ bs
                                                                 -> (Data.Monoid.<>)
                                                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                         (Prelude.fromIntegral
                                                                            (Data.ByteString.length
                                                                               bs)))
                                                                      (Data.ProtoLens.Encoding.Bytes.putBytes
                                                                         bs))
                                                              Data.ProtoLens.encodeMessage
                                                              _v))
                                                 ((Data.Monoid.<>)
                                                    (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                                                       (\ _v
                                                          -> (Data.Monoid.<>)
                                                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                  7994)
                                                               ((Prelude..)
                                                                  (\ bs
                                                                     -> (Data.Monoid.<>)
                                                                          (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                             (Prelude.fromIntegral
                                                                                (Data.ByteString.length
                                                                                   bs)))
                                                                          (Data.ProtoLens.Encoding.Bytes.putBytes
                                                                             bs))
                                                                  Data.ProtoLens.encodeMessage
                                                                  _v))
                                                       (Lens.Family2.view
                                                          (Data.ProtoLens.Field.field
                                                             @"vec'uninterpretedOption")
                                                          _x))
                                                    (Data.ProtoLens.Encoding.Wire.buildFieldSet
                                                       (Lens.Family2.view
                                                          Data.ProtoLens.unknownFields
                                                          _x)))))))))))))))
instance Control.DeepSeq.NFData FieldOptions where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_FieldOptions'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_FieldOptions'ctype x__)
                (Control.DeepSeq.deepseq
                   (_FieldOptions'packed x__)
                   (Control.DeepSeq.deepseq
                      (_FieldOptions'jstype x__)
                      (Control.DeepSeq.deepseq
                         (_FieldOptions'lazy x__)
                         (Control.DeepSeq.deepseq
                            (_FieldOptions'unverifiedLazy x__)
                            (Control.DeepSeq.deepseq
                               (_FieldOptions'deprecated x__)
                               (Control.DeepSeq.deepseq
                                  (_FieldOptions'weak x__)
                                  (Control.DeepSeq.deepseq
                                     (_FieldOptions'debugRedact x__)
                                     (Control.DeepSeq.deepseq
                                        (_FieldOptions'retention x__)
                                        (Control.DeepSeq.deepseq
                                           (_FieldOptions'targets x__)
                                           (Control.DeepSeq.deepseq
                                              (_FieldOptions'editionDefaults x__)
                                              (Control.DeepSeq.deepseq
                                                 (_FieldOptions'features x__)
                                                 (Control.DeepSeq.deepseq
                                                    (_FieldOptions'featureSupport x__)
                                                    (Control.DeepSeq.deepseq
                                                       (_FieldOptions'uninterpretedOption x__)
                                                       ()))))))))))))))
data FieldOptions'CType
  = FieldOptions'STRING |
    FieldOptions'CORD |
    FieldOptions'STRING_PIECE
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum FieldOptions'CType where
  maybeToEnum 0 = Prelude.Just FieldOptions'STRING
  maybeToEnum 1 = Prelude.Just FieldOptions'CORD
  maybeToEnum 2 = Prelude.Just FieldOptions'STRING_PIECE
  maybeToEnum _ = Prelude.Nothing
  showEnum FieldOptions'STRING = "STRING"
  showEnum FieldOptions'CORD = "CORD"
  showEnum FieldOptions'STRING_PIECE = "STRING_PIECE"
  readEnum k
    | (Prelude.==) k "STRING" = Prelude.Just FieldOptions'STRING
    | (Prelude.==) k "CORD" = Prelude.Just FieldOptions'CORD
    | (Prelude.==) k "STRING_PIECE"
    = Prelude.Just FieldOptions'STRING_PIECE
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded FieldOptions'CType where
  minBound = FieldOptions'STRING
  maxBound = FieldOptions'STRING_PIECE
instance Prelude.Enum FieldOptions'CType where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum CType: " (Prelude.show k__)))
        Prelude.id
        (Data.ProtoLens.maybeToEnum k__)
  fromEnum FieldOptions'STRING = 0
  fromEnum FieldOptions'CORD = 1
  fromEnum FieldOptions'STRING_PIECE = 2
  succ FieldOptions'STRING_PIECE
    = Prelude.error
        "FieldOptions'CType.succ: bad argument FieldOptions'STRING_PIECE. This value would be out of bounds."
  succ FieldOptions'STRING = FieldOptions'CORD
  succ FieldOptions'CORD = FieldOptions'STRING_PIECE
  pred FieldOptions'STRING
    = Prelude.error
        "FieldOptions'CType.pred: bad argument FieldOptions'STRING. This value would be out of bounds."
  pred FieldOptions'CORD = FieldOptions'STRING
  pred FieldOptions'STRING_PIECE = FieldOptions'CORD
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault FieldOptions'CType where
  fieldDefault = FieldOptions'STRING
instance Control.DeepSeq.NFData FieldOptions'CType where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.edition' @:: Lens' FieldOptions'EditionDefault Edition@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'edition' @:: Lens' FieldOptions'EditionDefault (Prelude.Maybe Edition)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.value' @:: Lens' FieldOptions'EditionDefault Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'value' @:: Lens' FieldOptions'EditionDefault (Prelude.Maybe Data.Text.Text)@ -}
data FieldOptions'EditionDefault
  = FieldOptions'EditionDefault'_constructor {_FieldOptions'EditionDefault'edition :: !(Prelude.Maybe Edition),
                                              _FieldOptions'EditionDefault'value :: !(Prelude.Maybe Data.Text.Text),
                                              _FieldOptions'EditionDefault'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show FieldOptions'EditionDefault where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField FieldOptions'EditionDefault "edition" Edition where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'EditionDefault'edition
           (\ x__ y__ -> x__ {_FieldOptions'EditionDefault'edition = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FieldOptions'EditionDefault "maybe'edition" (Prelude.Maybe Edition) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'EditionDefault'edition
           (\ x__ y__ -> x__ {_FieldOptions'EditionDefault'edition = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FieldOptions'EditionDefault "value" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'EditionDefault'value
           (\ x__ y__ -> x__ {_FieldOptions'EditionDefault'value = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FieldOptions'EditionDefault "maybe'value" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'EditionDefault'value
           (\ x__ y__ -> x__ {_FieldOptions'EditionDefault'value = y__}))
        Prelude.id
instance Data.ProtoLens.Message FieldOptions'EditionDefault where
  messageName _
    = Data.Text.pack "google.protobuf.FieldOptions.EditionDefault"
  packedMessageDescriptor _
    = "\n\
      \\SOEditionDefault\DC22\n\
      \\aedition\CAN\ETX \SOH(\SO2\CAN.google.protobuf.EditionR\aedition\DC2\DC4\n\
      \\ENQvalue\CAN\STX \SOH(\tR\ENQvalue"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        edition__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "edition"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Edition)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'edition")) ::
              Data.ProtoLens.FieldDescriptor FieldOptions'EditionDefault
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'value")) ::
              Data.ProtoLens.FieldDescriptor FieldOptions'EditionDefault
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 3, edition__field_descriptor),
           (Data.ProtoLens.Tag 2, value__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _FieldOptions'EditionDefault'_unknownFields
        (\ x__ y__
           -> x__ {_FieldOptions'EditionDefault'_unknownFields = y__})
  defMessage
    = FieldOptions'EditionDefault'_constructor
        {_FieldOptions'EditionDefault'edition = Prelude.Nothing,
         _FieldOptions'EditionDefault'value = Prelude.Nothing,
         _FieldOptions'EditionDefault'_unknownFields = []}
  parseMessage
    = let
        loop ::
          FieldOptions'EditionDefault
          -> Data.ProtoLens.Encoding.Bytes.Parser FieldOptions'EditionDefault
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "edition"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"edition") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "value"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"value") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "EditionDefault"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'edition") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                       ((Prelude..)
                          ((Prelude..)
                             Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                          Prelude.fromEnum
                          _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'value") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.Text.Encoding.encodeUtf8
                             _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData FieldOptions'EditionDefault where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_FieldOptions'EditionDefault'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_FieldOptions'EditionDefault'edition x__)
                (Control.DeepSeq.deepseq
                   (_FieldOptions'EditionDefault'value x__) ()))
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.editionIntroduced' @:: Lens' FieldOptions'FeatureSupport Edition@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'editionIntroduced' @:: Lens' FieldOptions'FeatureSupport (Prelude.Maybe Edition)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.editionDeprecated' @:: Lens' FieldOptions'FeatureSupport Edition@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'editionDeprecated' @:: Lens' FieldOptions'FeatureSupport (Prelude.Maybe Edition)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.deprecationWarning' @:: Lens' FieldOptions'FeatureSupport Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'deprecationWarning' @:: Lens' FieldOptions'FeatureSupport (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.editionRemoved' @:: Lens' FieldOptions'FeatureSupport Edition@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'editionRemoved' @:: Lens' FieldOptions'FeatureSupport (Prelude.Maybe Edition)@ -}
data FieldOptions'FeatureSupport
  = FieldOptions'FeatureSupport'_constructor {_FieldOptions'FeatureSupport'editionIntroduced :: !(Prelude.Maybe Edition),
                                              _FieldOptions'FeatureSupport'editionDeprecated :: !(Prelude.Maybe Edition),
                                              _FieldOptions'FeatureSupport'deprecationWarning :: !(Prelude.Maybe Data.Text.Text),
                                              _FieldOptions'FeatureSupport'editionRemoved :: !(Prelude.Maybe Edition),
                                              _FieldOptions'FeatureSupport'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show FieldOptions'FeatureSupport where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField FieldOptions'FeatureSupport "editionIntroduced" Edition where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'FeatureSupport'editionIntroduced
           (\ x__ y__
              -> x__ {_FieldOptions'FeatureSupport'editionIntroduced = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FieldOptions'FeatureSupport "maybe'editionIntroduced" (Prelude.Maybe Edition) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'FeatureSupport'editionIntroduced
           (\ x__ y__
              -> x__ {_FieldOptions'FeatureSupport'editionIntroduced = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FieldOptions'FeatureSupport "editionDeprecated" Edition where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'FeatureSupport'editionDeprecated
           (\ x__ y__
              -> x__ {_FieldOptions'FeatureSupport'editionDeprecated = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FieldOptions'FeatureSupport "maybe'editionDeprecated" (Prelude.Maybe Edition) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'FeatureSupport'editionDeprecated
           (\ x__ y__
              -> x__ {_FieldOptions'FeatureSupport'editionDeprecated = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FieldOptions'FeatureSupport "deprecationWarning" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'FeatureSupport'deprecationWarning
           (\ x__ y__
              -> x__ {_FieldOptions'FeatureSupport'deprecationWarning = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FieldOptions'FeatureSupport "maybe'deprecationWarning" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'FeatureSupport'deprecationWarning
           (\ x__ y__
              -> x__ {_FieldOptions'FeatureSupport'deprecationWarning = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FieldOptions'FeatureSupport "editionRemoved" Edition where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'FeatureSupport'editionRemoved
           (\ x__ y__
              -> x__ {_FieldOptions'FeatureSupport'editionRemoved = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FieldOptions'FeatureSupport "maybe'editionRemoved" (Prelude.Maybe Edition) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldOptions'FeatureSupport'editionRemoved
           (\ x__ y__
              -> x__ {_FieldOptions'FeatureSupport'editionRemoved = y__}))
        Prelude.id
instance Data.ProtoLens.Message FieldOptions'FeatureSupport where
  messageName _
    = Data.Text.pack "google.protobuf.FieldOptions.FeatureSupport"
  packedMessageDescriptor _
    = "\n\
      \\SOFeatureSupport\DC2G\n\
      \\DC2edition_introduced\CAN\SOH \SOH(\SO2\CAN.google.protobuf.EditionR\DC1editionIntroduced\DC2G\n\
      \\DC2edition_deprecated\CAN\STX \SOH(\SO2\CAN.google.protobuf.EditionR\DC1editionDeprecated\DC2/\n\
      \\DC3deprecation_warning\CAN\ETX \SOH(\tR\DC2deprecationWarning\DC2A\n\
      \\SIedition_removed\CAN\EOT \SOH(\SO2\CAN.google.protobuf.EditionR\SOeditionRemoved"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        editionIntroduced__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "edition_introduced"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Edition)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'editionIntroduced")) ::
              Data.ProtoLens.FieldDescriptor FieldOptions'FeatureSupport
        editionDeprecated__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "edition_deprecated"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Edition)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'editionDeprecated")) ::
              Data.ProtoLens.FieldDescriptor FieldOptions'FeatureSupport
        deprecationWarning__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "deprecation_warning"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'deprecationWarning")) ::
              Data.ProtoLens.FieldDescriptor FieldOptions'FeatureSupport
        editionRemoved__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "edition_removed"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Edition)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'editionRemoved")) ::
              Data.ProtoLens.FieldDescriptor FieldOptions'FeatureSupport
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, editionIntroduced__field_descriptor),
           (Data.ProtoLens.Tag 2, editionDeprecated__field_descriptor),
           (Data.ProtoLens.Tag 3, deprecationWarning__field_descriptor),
           (Data.ProtoLens.Tag 4, editionRemoved__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _FieldOptions'FeatureSupport'_unknownFields
        (\ x__ y__
           -> x__ {_FieldOptions'FeatureSupport'_unknownFields = y__})
  defMessage
    = FieldOptions'FeatureSupport'_constructor
        {_FieldOptions'FeatureSupport'editionIntroduced = Prelude.Nothing,
         _FieldOptions'FeatureSupport'editionDeprecated = Prelude.Nothing,
         _FieldOptions'FeatureSupport'deprecationWarning = Prelude.Nothing,
         _FieldOptions'FeatureSupport'editionRemoved = Prelude.Nothing,
         _FieldOptions'FeatureSupport'_unknownFields = []}
  parseMessage
    = let
        loop ::
          FieldOptions'FeatureSupport
          -> Data.ProtoLens.Encoding.Bytes.Parser FieldOptions'FeatureSupport
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "edition_introduced"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"editionIntroduced") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "edition_deprecated"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"editionDeprecated") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "deprecation_warning"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"deprecationWarning") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "edition_removed"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"editionRemoved") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "FeatureSupport"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view
                    (Data.ProtoLens.Field.field @"maybe'editionIntroduced") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                       ((Prelude..)
                          ((Prelude..)
                             Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                          Prelude.fromEnum
                          _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view
                       (Data.ProtoLens.Field.field @"maybe'editionDeprecated") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                          ((Prelude..)
                             ((Prelude..)
                                Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                             Prelude.fromEnum
                             _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view
                          (Data.ProtoLens.Field.field @"maybe'deprecationWarning") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.Text.Encoding.encodeUtf8
                                _v))
                   ((Data.Monoid.<>)
                      (case
                           Lens.Family2.view
                             (Data.ProtoLens.Field.field @"maybe'editionRemoved") _x
                       of
                         Prelude.Nothing -> Data.Monoid.mempty
                         (Prelude.Just _v)
                           -> (Data.Monoid.<>)
                                (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                                ((Prelude..)
                                   ((Prelude..)
                                      Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                                   Prelude.fromEnum
                                   _v))
                      (Data.ProtoLens.Encoding.Wire.buildFieldSet
                         (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))
instance Control.DeepSeq.NFData FieldOptions'FeatureSupport where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_FieldOptions'FeatureSupport'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_FieldOptions'FeatureSupport'editionIntroduced x__)
                (Control.DeepSeq.deepseq
                   (_FieldOptions'FeatureSupport'editionDeprecated x__)
                   (Control.DeepSeq.deepseq
                      (_FieldOptions'FeatureSupport'deprecationWarning x__)
                      (Control.DeepSeq.deepseq
                         (_FieldOptions'FeatureSupport'editionRemoved x__) ()))))
data FieldOptions'JSType
  = FieldOptions'JS_NORMAL |
    FieldOptions'JS_STRING |
    FieldOptions'JS_NUMBER
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum FieldOptions'JSType where
  maybeToEnum 0 = Prelude.Just FieldOptions'JS_NORMAL
  maybeToEnum 1 = Prelude.Just FieldOptions'JS_STRING
  maybeToEnum 2 = Prelude.Just FieldOptions'JS_NUMBER
  maybeToEnum _ = Prelude.Nothing
  showEnum FieldOptions'JS_NORMAL = "JS_NORMAL"
  showEnum FieldOptions'JS_STRING = "JS_STRING"
  showEnum FieldOptions'JS_NUMBER = "JS_NUMBER"
  readEnum k
    | (Prelude.==) k "JS_NORMAL" = Prelude.Just FieldOptions'JS_NORMAL
    | (Prelude.==) k "JS_STRING" = Prelude.Just FieldOptions'JS_STRING
    | (Prelude.==) k "JS_NUMBER" = Prelude.Just FieldOptions'JS_NUMBER
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded FieldOptions'JSType where
  minBound = FieldOptions'JS_NORMAL
  maxBound = FieldOptions'JS_NUMBER
instance Prelude.Enum FieldOptions'JSType where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum JSType: " (Prelude.show k__)))
        Prelude.id
        (Data.ProtoLens.maybeToEnum k__)
  fromEnum FieldOptions'JS_NORMAL = 0
  fromEnum FieldOptions'JS_STRING = 1
  fromEnum FieldOptions'JS_NUMBER = 2
  succ FieldOptions'JS_NUMBER
    = Prelude.error
        "FieldOptions'JSType.succ: bad argument FieldOptions'JS_NUMBER. This value would be out of bounds."
  succ FieldOptions'JS_NORMAL = FieldOptions'JS_STRING
  succ FieldOptions'JS_STRING = FieldOptions'JS_NUMBER
  pred FieldOptions'JS_NORMAL
    = Prelude.error
        "FieldOptions'JSType.pred: bad argument FieldOptions'JS_NORMAL. This value would be out of bounds."
  pred FieldOptions'JS_STRING = FieldOptions'JS_NORMAL
  pred FieldOptions'JS_NUMBER = FieldOptions'JS_STRING
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault FieldOptions'JSType where
  fieldDefault = FieldOptions'JS_NORMAL
instance Control.DeepSeq.NFData FieldOptions'JSType where
  rnf x__ = Prelude.seq x__ ()
data FieldOptions'OptionRetention
  = FieldOptions'RETENTION_UNKNOWN |
    FieldOptions'RETENTION_RUNTIME |
    FieldOptions'RETENTION_SOURCE
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum FieldOptions'OptionRetention where
  maybeToEnum 0 = Prelude.Just FieldOptions'RETENTION_UNKNOWN
  maybeToEnum 1 = Prelude.Just FieldOptions'RETENTION_RUNTIME
  maybeToEnum 2 = Prelude.Just FieldOptions'RETENTION_SOURCE
  maybeToEnum _ = Prelude.Nothing
  showEnum FieldOptions'RETENTION_UNKNOWN = "RETENTION_UNKNOWN"
  showEnum FieldOptions'RETENTION_RUNTIME = "RETENTION_RUNTIME"
  showEnum FieldOptions'RETENTION_SOURCE = "RETENTION_SOURCE"
  readEnum k
    | (Prelude.==) k "RETENTION_UNKNOWN"
    = Prelude.Just FieldOptions'RETENTION_UNKNOWN
    | (Prelude.==) k "RETENTION_RUNTIME"
    = Prelude.Just FieldOptions'RETENTION_RUNTIME
    | (Prelude.==) k "RETENTION_SOURCE"
    = Prelude.Just FieldOptions'RETENTION_SOURCE
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded FieldOptions'OptionRetention where
  minBound = FieldOptions'RETENTION_UNKNOWN
  maxBound = FieldOptions'RETENTION_SOURCE
instance Prelude.Enum FieldOptions'OptionRetention where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum OptionRetention: "
              (Prelude.show k__)))
        Prelude.id
        (Data.ProtoLens.maybeToEnum k__)
  fromEnum FieldOptions'RETENTION_UNKNOWN = 0
  fromEnum FieldOptions'RETENTION_RUNTIME = 1
  fromEnum FieldOptions'RETENTION_SOURCE = 2
  succ FieldOptions'RETENTION_SOURCE
    = Prelude.error
        "FieldOptions'OptionRetention.succ: bad argument FieldOptions'RETENTION_SOURCE. This value would be out of bounds."
  succ FieldOptions'RETENTION_UNKNOWN
    = FieldOptions'RETENTION_RUNTIME
  succ FieldOptions'RETENTION_RUNTIME = FieldOptions'RETENTION_SOURCE
  pred FieldOptions'RETENTION_UNKNOWN
    = Prelude.error
        "FieldOptions'OptionRetention.pred: bad argument FieldOptions'RETENTION_UNKNOWN. This value would be out of bounds."
  pred FieldOptions'RETENTION_RUNTIME
    = FieldOptions'RETENTION_UNKNOWN
  pred FieldOptions'RETENTION_SOURCE = FieldOptions'RETENTION_RUNTIME
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault FieldOptions'OptionRetention where
  fieldDefault = FieldOptions'RETENTION_UNKNOWN
instance Control.DeepSeq.NFData FieldOptions'OptionRetention where
  rnf x__ = Prelude.seq x__ ()
data FieldOptions'OptionTargetType
  = FieldOptions'TARGET_TYPE_UNKNOWN |
    FieldOptions'TARGET_TYPE_FILE |
    FieldOptions'TARGET_TYPE_EXTENSION_RANGE |
    FieldOptions'TARGET_TYPE_MESSAGE |
    FieldOptions'TARGET_TYPE_FIELD |
    FieldOptions'TARGET_TYPE_ONEOF |
    FieldOptions'TARGET_TYPE_ENUM |
    FieldOptions'TARGET_TYPE_ENUM_ENTRY |
    FieldOptions'TARGET_TYPE_SERVICE |
    FieldOptions'TARGET_TYPE_METHOD
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum FieldOptions'OptionTargetType where
  maybeToEnum 0 = Prelude.Just FieldOptions'TARGET_TYPE_UNKNOWN
  maybeToEnum 1 = Prelude.Just FieldOptions'TARGET_TYPE_FILE
  maybeToEnum 2
    = Prelude.Just FieldOptions'TARGET_TYPE_EXTENSION_RANGE
  maybeToEnum 3 = Prelude.Just FieldOptions'TARGET_TYPE_MESSAGE
  maybeToEnum 4 = Prelude.Just FieldOptions'TARGET_TYPE_FIELD
  maybeToEnum 5 = Prelude.Just FieldOptions'TARGET_TYPE_ONEOF
  maybeToEnum 6 = Prelude.Just FieldOptions'TARGET_TYPE_ENUM
  maybeToEnum 7 = Prelude.Just FieldOptions'TARGET_TYPE_ENUM_ENTRY
  maybeToEnum 8 = Prelude.Just FieldOptions'TARGET_TYPE_SERVICE
  maybeToEnum 9 = Prelude.Just FieldOptions'TARGET_TYPE_METHOD
  maybeToEnum _ = Prelude.Nothing
  showEnum FieldOptions'TARGET_TYPE_UNKNOWN = "TARGET_TYPE_UNKNOWN"
  showEnum FieldOptions'TARGET_TYPE_FILE = "TARGET_TYPE_FILE"
  showEnum FieldOptions'TARGET_TYPE_EXTENSION_RANGE
    = "TARGET_TYPE_EXTENSION_RANGE"
  showEnum FieldOptions'TARGET_TYPE_MESSAGE = "TARGET_TYPE_MESSAGE"
  showEnum FieldOptions'TARGET_TYPE_FIELD = "TARGET_TYPE_FIELD"
  showEnum FieldOptions'TARGET_TYPE_ONEOF = "TARGET_TYPE_ONEOF"
  showEnum FieldOptions'TARGET_TYPE_ENUM = "TARGET_TYPE_ENUM"
  showEnum FieldOptions'TARGET_TYPE_ENUM_ENTRY
    = "TARGET_TYPE_ENUM_ENTRY"
  showEnum FieldOptions'TARGET_TYPE_SERVICE = "TARGET_TYPE_SERVICE"
  showEnum FieldOptions'TARGET_TYPE_METHOD = "TARGET_TYPE_METHOD"
  readEnum k
    | (Prelude.==) k "TARGET_TYPE_UNKNOWN"
    = Prelude.Just FieldOptions'TARGET_TYPE_UNKNOWN
    | (Prelude.==) k "TARGET_TYPE_FILE"
    = Prelude.Just FieldOptions'TARGET_TYPE_FILE
    | (Prelude.==) k "TARGET_TYPE_EXTENSION_RANGE"
    = Prelude.Just FieldOptions'TARGET_TYPE_EXTENSION_RANGE
    | (Prelude.==) k "TARGET_TYPE_MESSAGE"
    = Prelude.Just FieldOptions'TARGET_TYPE_MESSAGE
    | (Prelude.==) k "TARGET_TYPE_FIELD"
    = Prelude.Just FieldOptions'TARGET_TYPE_FIELD
    | (Prelude.==) k "TARGET_TYPE_ONEOF"
    = Prelude.Just FieldOptions'TARGET_TYPE_ONEOF
    | (Prelude.==) k "TARGET_TYPE_ENUM"
    = Prelude.Just FieldOptions'TARGET_TYPE_ENUM
    | (Prelude.==) k "TARGET_TYPE_ENUM_ENTRY"
    = Prelude.Just FieldOptions'TARGET_TYPE_ENUM_ENTRY
    | (Prelude.==) k "TARGET_TYPE_SERVICE"
    = Prelude.Just FieldOptions'TARGET_TYPE_SERVICE
    | (Prelude.==) k "TARGET_TYPE_METHOD"
    = Prelude.Just FieldOptions'TARGET_TYPE_METHOD
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded FieldOptions'OptionTargetType where
  minBound = FieldOptions'TARGET_TYPE_UNKNOWN
  maxBound = FieldOptions'TARGET_TYPE_METHOD
instance Prelude.Enum FieldOptions'OptionTargetType where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum OptionTargetType: "
              (Prelude.show k__)))
        Prelude.id
        (Data.ProtoLens.maybeToEnum k__)
  fromEnum FieldOptions'TARGET_TYPE_UNKNOWN = 0
  fromEnum FieldOptions'TARGET_TYPE_FILE = 1
  fromEnum FieldOptions'TARGET_TYPE_EXTENSION_RANGE = 2
  fromEnum FieldOptions'TARGET_TYPE_MESSAGE = 3
  fromEnum FieldOptions'TARGET_TYPE_FIELD = 4
  fromEnum FieldOptions'TARGET_TYPE_ONEOF = 5
  fromEnum FieldOptions'TARGET_TYPE_ENUM = 6
  fromEnum FieldOptions'TARGET_TYPE_ENUM_ENTRY = 7
  fromEnum FieldOptions'TARGET_TYPE_SERVICE = 8
  fromEnum FieldOptions'TARGET_TYPE_METHOD = 9
  succ FieldOptions'TARGET_TYPE_METHOD
    = Prelude.error
        "FieldOptions'OptionTargetType.succ: bad argument FieldOptions'TARGET_TYPE_METHOD. This value would be out of bounds."
  succ FieldOptions'TARGET_TYPE_UNKNOWN
    = FieldOptions'TARGET_TYPE_FILE
  succ FieldOptions'TARGET_TYPE_FILE
    = FieldOptions'TARGET_TYPE_EXTENSION_RANGE
  succ FieldOptions'TARGET_TYPE_EXTENSION_RANGE
    = FieldOptions'TARGET_TYPE_MESSAGE
  succ FieldOptions'TARGET_TYPE_MESSAGE
    = FieldOptions'TARGET_TYPE_FIELD
  succ FieldOptions'TARGET_TYPE_FIELD
    = FieldOptions'TARGET_TYPE_ONEOF
  succ FieldOptions'TARGET_TYPE_ONEOF = FieldOptions'TARGET_TYPE_ENUM
  succ FieldOptions'TARGET_TYPE_ENUM
    = FieldOptions'TARGET_TYPE_ENUM_ENTRY
  succ FieldOptions'TARGET_TYPE_ENUM_ENTRY
    = FieldOptions'TARGET_TYPE_SERVICE
  succ FieldOptions'TARGET_TYPE_SERVICE
    = FieldOptions'TARGET_TYPE_METHOD
  pred FieldOptions'TARGET_TYPE_UNKNOWN
    = Prelude.error
        "FieldOptions'OptionTargetType.pred: bad argument FieldOptions'TARGET_TYPE_UNKNOWN. This value would be out of bounds."
  pred FieldOptions'TARGET_TYPE_FILE
    = FieldOptions'TARGET_TYPE_UNKNOWN
  pred FieldOptions'TARGET_TYPE_EXTENSION_RANGE
    = FieldOptions'TARGET_TYPE_FILE
  pred FieldOptions'TARGET_TYPE_MESSAGE
    = FieldOptions'TARGET_TYPE_EXTENSION_RANGE
  pred FieldOptions'TARGET_TYPE_FIELD
    = FieldOptions'TARGET_TYPE_MESSAGE
  pred FieldOptions'TARGET_TYPE_ONEOF
    = FieldOptions'TARGET_TYPE_FIELD
  pred FieldOptions'TARGET_TYPE_ENUM = FieldOptions'TARGET_TYPE_ONEOF
  pred FieldOptions'TARGET_TYPE_ENUM_ENTRY
    = FieldOptions'TARGET_TYPE_ENUM
  pred FieldOptions'TARGET_TYPE_SERVICE
    = FieldOptions'TARGET_TYPE_ENUM_ENTRY
  pred FieldOptions'TARGET_TYPE_METHOD
    = FieldOptions'TARGET_TYPE_SERVICE
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault FieldOptions'OptionTargetType where
  fieldDefault = FieldOptions'TARGET_TYPE_UNKNOWN
instance Control.DeepSeq.NFData FieldOptions'OptionTargetType where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.name' @:: Lens' FileDescriptorProto Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'name' @:: Lens' FileDescriptorProto (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.package' @:: Lens' FileDescriptorProto Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'package' @:: Lens' FileDescriptorProto (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.dependency' @:: Lens' FileDescriptorProto [Data.Text.Text]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'dependency' @:: Lens' FileDescriptorProto (Data.Vector.Vector Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.publicDependency' @:: Lens' FileDescriptorProto [Data.Int.Int32]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'publicDependency' @:: Lens' FileDescriptorProto (Data.Vector.Unboxed.Vector Data.Int.Int32)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.weakDependency' @:: Lens' FileDescriptorProto [Data.Int.Int32]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'weakDependency' @:: Lens' FileDescriptorProto (Data.Vector.Unboxed.Vector Data.Int.Int32)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.messageType' @:: Lens' FileDescriptorProto [DescriptorProto]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'messageType' @:: Lens' FileDescriptorProto (Data.Vector.Vector DescriptorProto)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.enumType' @:: Lens' FileDescriptorProto [EnumDescriptorProto]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'enumType' @:: Lens' FileDescriptorProto (Data.Vector.Vector EnumDescriptorProto)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.service' @:: Lens' FileDescriptorProto [ServiceDescriptorProto]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'service' @:: Lens' FileDescriptorProto (Data.Vector.Vector ServiceDescriptorProto)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.extension' @:: Lens' FileDescriptorProto [FieldDescriptorProto]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'extension' @:: Lens' FileDescriptorProto (Data.Vector.Vector FieldDescriptorProto)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.options' @:: Lens' FileDescriptorProto FileOptions@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'options' @:: Lens' FileDescriptorProto (Prelude.Maybe FileOptions)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.sourceCodeInfo' @:: Lens' FileDescriptorProto SourceCodeInfo@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'sourceCodeInfo' @:: Lens' FileDescriptorProto (Prelude.Maybe SourceCodeInfo)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.syntax' @:: Lens' FileDescriptorProto Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'syntax' @:: Lens' FileDescriptorProto (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.edition' @:: Lens' FileDescriptorProto Edition@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'edition' @:: Lens' FileDescriptorProto (Prelude.Maybe Edition)@ -}
data FileDescriptorProto
  = FileDescriptorProto'_constructor {_FileDescriptorProto'name :: !(Prelude.Maybe Data.Text.Text),
                                      _FileDescriptorProto'package :: !(Prelude.Maybe Data.Text.Text),
                                      _FileDescriptorProto'dependency :: !(Data.Vector.Vector Data.Text.Text),
                                      _FileDescriptorProto'publicDependency :: !(Data.Vector.Unboxed.Vector Data.Int.Int32),
                                      _FileDescriptorProto'weakDependency :: !(Data.Vector.Unboxed.Vector Data.Int.Int32),
                                      _FileDescriptorProto'messageType :: !(Data.Vector.Vector DescriptorProto),
                                      _FileDescriptorProto'enumType :: !(Data.Vector.Vector EnumDescriptorProto),
                                      _FileDescriptorProto'service :: !(Data.Vector.Vector ServiceDescriptorProto),
                                      _FileDescriptorProto'extension :: !(Data.Vector.Vector FieldDescriptorProto),
                                      _FileDescriptorProto'options :: !(Prelude.Maybe FileOptions),
                                      _FileDescriptorProto'sourceCodeInfo :: !(Prelude.Maybe SourceCodeInfo),
                                      _FileDescriptorProto'syntax :: !(Prelude.Maybe Data.Text.Text),
                                      _FileDescriptorProto'edition :: !(Prelude.Maybe Edition),
                                      _FileDescriptorProto'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show FileDescriptorProto where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField FileDescriptorProto "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileDescriptorProto'name
           (\ x__ y__ -> x__ {_FileDescriptorProto'name = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FileDescriptorProto "maybe'name" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileDescriptorProto'name
           (\ x__ y__ -> x__ {_FileDescriptorProto'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileDescriptorProto "package" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileDescriptorProto'package
           (\ x__ y__ -> x__ {_FileDescriptorProto'package = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FileDescriptorProto "maybe'package" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileDescriptorProto'package
           (\ x__ y__ -> x__ {_FileDescriptorProto'package = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileDescriptorProto "dependency" [Data.Text.Text] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileDescriptorProto'dependency
           (\ x__ y__ -> x__ {_FileDescriptorProto'dependency = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField FileDescriptorProto "vec'dependency" (Data.Vector.Vector Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileDescriptorProto'dependency
           (\ x__ y__ -> x__ {_FileDescriptorProto'dependency = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileDescriptorProto "publicDependency" [Data.Int.Int32] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileDescriptorProto'publicDependency
           (\ x__ y__ -> x__ {_FileDescriptorProto'publicDependency = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField FileDescriptorProto "vec'publicDependency" (Data.Vector.Unboxed.Vector Data.Int.Int32) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileDescriptorProto'publicDependency
           (\ x__ y__ -> x__ {_FileDescriptorProto'publicDependency = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileDescriptorProto "weakDependency" [Data.Int.Int32] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileDescriptorProto'weakDependency
           (\ x__ y__ -> x__ {_FileDescriptorProto'weakDependency = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField FileDescriptorProto "vec'weakDependency" (Data.Vector.Unboxed.Vector Data.Int.Int32) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileDescriptorProto'weakDependency
           (\ x__ y__ -> x__ {_FileDescriptorProto'weakDependency = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileDescriptorProto "messageType" [DescriptorProto] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileDescriptorProto'messageType
           (\ x__ y__ -> x__ {_FileDescriptorProto'messageType = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField FileDescriptorProto "vec'messageType" (Data.Vector.Vector DescriptorProto) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileDescriptorProto'messageType
           (\ x__ y__ -> x__ {_FileDescriptorProto'messageType = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileDescriptorProto "enumType" [EnumDescriptorProto] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileDescriptorProto'enumType
           (\ x__ y__ -> x__ {_FileDescriptorProto'enumType = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField FileDescriptorProto "vec'enumType" (Data.Vector.Vector EnumDescriptorProto) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileDescriptorProto'enumType
           (\ x__ y__ -> x__ {_FileDescriptorProto'enumType = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileDescriptorProto "service" [ServiceDescriptorProto] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileDescriptorProto'service
           (\ x__ y__ -> x__ {_FileDescriptorProto'service = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField FileDescriptorProto "vec'service" (Data.Vector.Vector ServiceDescriptorProto) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileDescriptorProto'service
           (\ x__ y__ -> x__ {_FileDescriptorProto'service = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileDescriptorProto "extension" [FieldDescriptorProto] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileDescriptorProto'extension
           (\ x__ y__ -> x__ {_FileDescriptorProto'extension = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField FileDescriptorProto "vec'extension" (Data.Vector.Vector FieldDescriptorProto) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileDescriptorProto'extension
           (\ x__ y__ -> x__ {_FileDescriptorProto'extension = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileDescriptorProto "options" FileOptions where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileDescriptorProto'options
           (\ x__ y__ -> x__ {_FileDescriptorProto'options = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField FileDescriptorProto "maybe'options" (Prelude.Maybe FileOptions) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileDescriptorProto'options
           (\ x__ y__ -> x__ {_FileDescriptorProto'options = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileDescriptorProto "sourceCodeInfo" SourceCodeInfo where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileDescriptorProto'sourceCodeInfo
           (\ x__ y__ -> x__ {_FileDescriptorProto'sourceCodeInfo = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField FileDescriptorProto "maybe'sourceCodeInfo" (Prelude.Maybe SourceCodeInfo) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileDescriptorProto'sourceCodeInfo
           (\ x__ y__ -> x__ {_FileDescriptorProto'sourceCodeInfo = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileDescriptorProto "syntax" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileDescriptorProto'syntax
           (\ x__ y__ -> x__ {_FileDescriptorProto'syntax = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FileDescriptorProto "maybe'syntax" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileDescriptorProto'syntax
           (\ x__ y__ -> x__ {_FileDescriptorProto'syntax = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileDescriptorProto "edition" Edition where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileDescriptorProto'edition
           (\ x__ y__ -> x__ {_FileDescriptorProto'edition = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FileDescriptorProto "maybe'edition" (Prelude.Maybe Edition) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileDescriptorProto'edition
           (\ x__ y__ -> x__ {_FileDescriptorProto'edition = y__}))
        Prelude.id
instance Data.ProtoLens.Message FileDescriptorProto where
  messageName _
    = Data.Text.pack "google.protobuf.FileDescriptorProto"
  packedMessageDescriptor _
    = "\n\
      \\DC3FileDescriptorProto\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2\CAN\n\
      \\apackage\CAN\STX \SOH(\tR\apackage\DC2\RS\n\
      \\n\
      \dependency\CAN\ETX \ETX(\tR\n\
      \dependency\DC2+\n\
      \\DC1public_dependency\CAN\n\
      \ \ETX(\ENQR\DLEpublicDependency\DC2'\n\
      \\SIweak_dependency\CAN\v \ETX(\ENQR\SOweakDependency\DC2C\n\
      \\fmessage_type\CAN\EOT \ETX(\v2 .google.protobuf.DescriptorProtoR\vmessageType\DC2A\n\
      \\tenum_type\CAN\ENQ \ETX(\v2$.google.protobuf.EnumDescriptorProtoR\benumType\DC2A\n\
      \\aservice\CAN\ACK \ETX(\v2'.google.protobuf.ServiceDescriptorProtoR\aservice\DC2C\n\
      \\textension\CAN\a \ETX(\v2%.google.protobuf.FieldDescriptorProtoR\textension\DC26\n\
      \\aoptions\CAN\b \SOH(\v2\FS.google.protobuf.FileOptionsR\aoptions\DC2I\n\
      \\DLEsource_code_info\CAN\t \SOH(\v2\US.google.protobuf.SourceCodeInfoR\SOsourceCodeInfo\DC2\SYN\n\
      \\ACKsyntax\CAN\f \SOH(\tR\ACKsyntax\DC22\n\
      \\aedition\CAN\SO \SOH(\SO2\CAN.google.protobuf.EditionR\aedition"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'name")) ::
              Data.ProtoLens.FieldDescriptor FileDescriptorProto
        package__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "package"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'package")) ::
              Data.ProtoLens.FieldDescriptor FileDescriptorProto
        dependency__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "dependency"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"dependency")) ::
              Data.ProtoLens.FieldDescriptor FileDescriptorProto
        publicDependency__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "public_dependency"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"publicDependency")) ::
              Data.ProtoLens.FieldDescriptor FileDescriptorProto
        weakDependency__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "weak_dependency"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"weakDependency")) ::
              Data.ProtoLens.FieldDescriptor FileDescriptorProto
        messageType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "message_type"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor DescriptorProto)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"messageType")) ::
              Data.ProtoLens.FieldDescriptor FileDescriptorProto
        enumType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "enum_type"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor EnumDescriptorProto)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"enumType")) ::
              Data.ProtoLens.FieldDescriptor FileDescriptorProto
        service__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "service"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ServiceDescriptorProto)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"service")) ::
              Data.ProtoLens.FieldDescriptor FileDescriptorProto
        extension__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "extension"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor FieldDescriptorProto)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"extension")) ::
              Data.ProtoLens.FieldDescriptor FileDescriptorProto
        options__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "options"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor FileOptions)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'options")) ::
              Data.ProtoLens.FieldDescriptor FileDescriptorProto
        sourceCodeInfo__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "source_code_info"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor SourceCodeInfo)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'sourceCodeInfo")) ::
              Data.ProtoLens.FieldDescriptor FileDescriptorProto
        syntax__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "syntax"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'syntax")) ::
              Data.ProtoLens.FieldDescriptor FileDescriptorProto
        edition__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "edition"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Edition)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'edition")) ::
              Data.ProtoLens.FieldDescriptor FileDescriptorProto
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, name__field_descriptor),
           (Data.ProtoLens.Tag 2, package__field_descriptor),
           (Data.ProtoLens.Tag 3, dependency__field_descriptor),
           (Data.ProtoLens.Tag 10, publicDependency__field_descriptor),
           (Data.ProtoLens.Tag 11, weakDependency__field_descriptor),
           (Data.ProtoLens.Tag 4, messageType__field_descriptor),
           (Data.ProtoLens.Tag 5, enumType__field_descriptor),
           (Data.ProtoLens.Tag 6, service__field_descriptor),
           (Data.ProtoLens.Tag 7, extension__field_descriptor),
           (Data.ProtoLens.Tag 8, options__field_descriptor),
           (Data.ProtoLens.Tag 9, sourceCodeInfo__field_descriptor),
           (Data.ProtoLens.Tag 12, syntax__field_descriptor),
           (Data.ProtoLens.Tag 14, edition__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _FileDescriptorProto'_unknownFields
        (\ x__ y__ -> x__ {_FileDescriptorProto'_unknownFields = y__})
  defMessage
    = FileDescriptorProto'_constructor
        {_FileDescriptorProto'name = Prelude.Nothing,
         _FileDescriptorProto'package = Prelude.Nothing,
         _FileDescriptorProto'dependency = Data.Vector.Generic.empty,
         _FileDescriptorProto'publicDependency = Data.Vector.Generic.empty,
         _FileDescriptorProto'weakDependency = Data.Vector.Generic.empty,
         _FileDescriptorProto'messageType = Data.Vector.Generic.empty,
         _FileDescriptorProto'enumType = Data.Vector.Generic.empty,
         _FileDescriptorProto'service = Data.Vector.Generic.empty,
         _FileDescriptorProto'extension = Data.Vector.Generic.empty,
         _FileDescriptorProto'options = Prelude.Nothing,
         _FileDescriptorProto'sourceCodeInfo = Prelude.Nothing,
         _FileDescriptorProto'syntax = Prelude.Nothing,
         _FileDescriptorProto'edition = Prelude.Nothing,
         _FileDescriptorProto'_unknownFields = []}
  parseMessage
    = let
        loop ::
          FileDescriptorProto
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Text.Text
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld EnumDescriptorProto
                -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld FieldDescriptorProto
                   -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld DescriptorProto
                      -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Unboxed.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Int.Int32
                         -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld ServiceDescriptorProto
                            -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Unboxed.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Int.Int32
                               -> Data.ProtoLens.Encoding.Bytes.Parser FileDescriptorProto
        loop
          x
          mutable'dependency
          mutable'enumType
          mutable'extension
          mutable'messageType
          mutable'publicDependency
          mutable'service
          mutable'weakDependency
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'dependency <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                             (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                mutable'dependency)
                      frozen'enumType <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                           (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                              mutable'enumType)
                      frozen'extension <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                            (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                               mutable'extension)
                      frozen'messageType <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                              (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                 mutable'messageType)
                      frozen'publicDependency <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                   (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                      mutable'publicDependency)
                      frozen'service <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                          (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                             mutable'service)
                      frozen'weakDependency <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                 (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                    mutable'weakDependency)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields
                           (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'dependency")
                              frozen'dependency
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'enumType")
                                 frozen'enumType
                                 (Lens.Family2.set
                                    (Data.ProtoLens.Field.field @"vec'extension")
                                    frozen'extension
                                    (Lens.Family2.set
                                       (Data.ProtoLens.Field.field @"vec'messageType")
                                       frozen'messageType
                                       (Lens.Family2.set
                                          (Data.ProtoLens.Field.field @"vec'publicDependency")
                                          frozen'publicDependency
                                          (Lens.Family2.set
                                             (Data.ProtoLens.Field.field @"vec'service")
                                             frozen'service
                                             (Lens.Family2.set
                                                (Data.ProtoLens.Field.field @"vec'weakDependency")
                                                frozen'weakDependency
                                                x))))))))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "name"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"name") y x)
                                  mutable'dependency
                                  mutable'enumType
                                  mutable'extension
                                  mutable'messageType
                                  mutable'publicDependency
                                  mutable'service
                                  mutable'weakDependency
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "package"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"package") y x)
                                  mutable'dependency
                                  mutable'enumType
                                  mutable'extension
                                  mutable'messageType
                                  mutable'publicDependency
                                  mutable'service
                                  mutable'weakDependency
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.getText
                                              (Prelude.fromIntegral len))
                                        "dependency"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'dependency y)
                                loop
                                  x
                                  v
                                  mutable'enumType
                                  mutable'extension
                                  mutable'messageType
                                  mutable'publicDependency
                                  mutable'service
                                  mutable'weakDependency
                        80
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (Prelude.fmap
                                           Prelude.fromIntegral
                                           Data.ProtoLens.Encoding.Bytes.getVarInt)
                                        "public_dependency"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'publicDependency y)
                                loop
                                  x
                                  mutable'dependency
                                  mutable'enumType
                                  mutable'extension
                                  mutable'messageType
                                  v
                                  mutable'service
                                  mutable'weakDependency
                        82
                          -> do y <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                        Data.ProtoLens.Encoding.Bytes.isolate
                                          (Prelude.fromIntegral len)
                                          ((let
                                              ploop qs
                                                = do packedEnd <- Data.ProtoLens.Encoding.Bytes.atEnd
                                                     if packedEnd then
                                                         Prelude.return qs
                                                     else
                                                         do !q <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                                                    (Prelude.fmap
                                                                       Prelude.fromIntegral
                                                                       Data.ProtoLens.Encoding.Bytes.getVarInt)
                                                                    "public_dependency"
                                                            qs' <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                                     (Data.ProtoLens.Encoding.Growing.append
                                                                        qs q)
                                                            ploop qs'
                                            in ploop)
                                             mutable'publicDependency)
                                loop
                                  x
                                  mutable'dependency
                                  mutable'enumType
                                  mutable'extension
                                  mutable'messageType
                                  y
                                  mutable'service
                                  mutable'weakDependency
                        88
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (Prelude.fmap
                                           Prelude.fromIntegral
                                           Data.ProtoLens.Encoding.Bytes.getVarInt)
                                        "weak_dependency"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'weakDependency y)
                                loop
                                  x
                                  mutable'dependency
                                  mutable'enumType
                                  mutable'extension
                                  mutable'messageType
                                  mutable'publicDependency
                                  mutable'service
                                  v
                        90
                          -> do y <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                        Data.ProtoLens.Encoding.Bytes.isolate
                                          (Prelude.fromIntegral len)
                                          ((let
                                              ploop qs
                                                = do packedEnd <- Data.ProtoLens.Encoding.Bytes.atEnd
                                                     if packedEnd then
                                                         Prelude.return qs
                                                     else
                                                         do !q <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                                                    (Prelude.fmap
                                                                       Prelude.fromIntegral
                                                                       Data.ProtoLens.Encoding.Bytes.getVarInt)
                                                                    "weak_dependency"
                                                            qs' <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                                     (Data.ProtoLens.Encoding.Growing.append
                                                                        qs q)
                                                            ploop qs'
                                            in ploop)
                                             mutable'weakDependency)
                                loop
                                  x
                                  mutable'dependency
                                  mutable'enumType
                                  mutable'extension
                                  mutable'messageType
                                  mutable'publicDependency
                                  mutable'service
                                  y
                        34
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "message_type"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'messageType y)
                                loop
                                  x
                                  mutable'dependency
                                  mutable'enumType
                                  mutable'extension
                                  v
                                  mutable'publicDependency
                                  mutable'service
                                  mutable'weakDependency
                        42
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "enum_type"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'enumType y)
                                loop
                                  x
                                  mutable'dependency
                                  v
                                  mutable'extension
                                  mutable'messageType
                                  mutable'publicDependency
                                  mutable'service
                                  mutable'weakDependency
                        50
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "service"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'service y)
                                loop
                                  x
                                  mutable'dependency
                                  mutable'enumType
                                  mutable'extension
                                  mutable'messageType
                                  mutable'publicDependency
                                  v
                                  mutable'weakDependency
                        58
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "extension"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'extension y)
                                loop
                                  x
                                  mutable'dependency
                                  mutable'enumType
                                  v
                                  mutable'messageType
                                  mutable'publicDependency
                                  mutable'service
                                  mutable'weakDependency
                        66
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "options"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"options") y x)
                                  mutable'dependency
                                  mutable'enumType
                                  mutable'extension
                                  mutable'messageType
                                  mutable'publicDependency
                                  mutable'service
                                  mutable'weakDependency
                        74
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "source_code_info"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"sourceCodeInfo") y x)
                                  mutable'dependency
                                  mutable'enumType
                                  mutable'extension
                                  mutable'messageType
                                  mutable'publicDependency
                                  mutable'service
                                  mutable'weakDependency
                        98
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "syntax"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"syntax") y x)
                                  mutable'dependency
                                  mutable'enumType
                                  mutable'extension
                                  mutable'messageType
                                  mutable'publicDependency
                                  mutable'service
                                  mutable'weakDependency
                        112
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "edition"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"edition") y x)
                                  mutable'dependency
                                  mutable'enumType
                                  mutable'extension
                                  mutable'messageType
                                  mutable'publicDependency
                                  mutable'service
                                  mutable'weakDependency
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'dependency
                                  mutable'enumType
                                  mutable'extension
                                  mutable'messageType
                                  mutable'publicDependency
                                  mutable'service
                                  mutable'weakDependency
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'dependency <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                      Data.ProtoLens.Encoding.Growing.new
              mutable'enumType <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                    Data.ProtoLens.Encoding.Growing.new
              mutable'extension <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                     Data.ProtoLens.Encoding.Growing.new
              mutable'messageType <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       Data.ProtoLens.Encoding.Growing.new
              mutable'publicDependency <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                            Data.ProtoLens.Encoding.Growing.new
              mutable'service <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                   Data.ProtoLens.Encoding.Growing.new
              mutable'weakDependency <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                          Data.ProtoLens.Encoding.Growing.new
              loop
                Data.ProtoLens.defMessage
                mutable'dependency
                mutable'enumType
                mutable'extension
                mutable'messageType
                mutable'publicDependency
                mutable'service
                mutable'weakDependency)
          "FileDescriptorProto"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'name") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.Text.Encoding.encodeUtf8
                          _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'package") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.Text.Encoding.encodeUtf8
                             _v))
                ((Data.Monoid.<>)
                   (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                      (\ _v
                         -> (Data.Monoid.<>)
                              (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                              ((Prelude..)
                                 (\ bs
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                            (Prelude.fromIntegral (Data.ByteString.length bs)))
                                         (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                 Data.Text.Encoding.encodeUtf8
                                 _v))
                      (Lens.Family2.view
                         (Data.ProtoLens.Field.field @"vec'dependency") _x))
                   ((Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                         (\ _v
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt 80)
                                 ((Prelude..)
                                    Data.ProtoLens.Encoding.Bytes.putVarInt
                                    Prelude.fromIntegral
                                    _v))
                         (Lens.Family2.view
                            (Data.ProtoLens.Field.field @"vec'publicDependency") _x))
                      ((Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                            (\ _v
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt 88)
                                    ((Prelude..)
                                       Data.ProtoLens.Encoding.Bytes.putVarInt
                                       Prelude.fromIntegral
                                       _v))
                            (Lens.Family2.view
                               (Data.ProtoLens.Field.field @"vec'weakDependency") _x))
                         ((Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                               (\ _v
                                  -> (Data.Monoid.<>)
                                       (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                                       ((Prelude..)
                                          (\ bs
                                             -> (Data.Monoid.<>)
                                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                     (Prelude.fromIntegral
                                                        (Data.ByteString.length bs)))
                                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                          Data.ProtoLens.encodeMessage
                                          _v))
                               (Lens.Family2.view
                                  (Data.ProtoLens.Field.field @"vec'messageType") _x))
                            ((Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                                  (\ _v
                                     -> (Data.Monoid.<>)
                                          (Data.ProtoLens.Encoding.Bytes.putVarInt 42)
                                          ((Prelude..)
                                             (\ bs
                                                -> (Data.Monoid.<>)
                                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                        (Prelude.fromIntegral
                                                           (Data.ByteString.length bs)))
                                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                             Data.ProtoLens.encodeMessage
                                             _v))
                                  (Lens.Family2.view
                                     (Data.ProtoLens.Field.field @"vec'enumType") _x))
                               ((Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                                     (\ _v
                                        -> (Data.Monoid.<>)
                                             (Data.ProtoLens.Encoding.Bytes.putVarInt 50)
                                             ((Prelude..)
                                                (\ bs
                                                   -> (Data.Monoid.<>)
                                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                           (Prelude.fromIntegral
                                                              (Data.ByteString.length bs)))
                                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                                Data.ProtoLens.encodeMessage
                                                _v))
                                     (Lens.Family2.view
                                        (Data.ProtoLens.Field.field @"vec'service") _x))
                                  ((Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                                        (\ _v
                                           -> (Data.Monoid.<>)
                                                (Data.ProtoLens.Encoding.Bytes.putVarInt 58)
                                                ((Prelude..)
                                                   (\ bs
                                                      -> (Data.Monoid.<>)
                                                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                              (Prelude.fromIntegral
                                                                 (Data.ByteString.length bs)))
                                                           (Data.ProtoLens.Encoding.Bytes.putBytes
                                                              bs))
                                                   Data.ProtoLens.encodeMessage
                                                   _v))
                                        (Lens.Family2.view
                                           (Data.ProtoLens.Field.field @"vec'extension") _x))
                                     ((Data.Monoid.<>)
                                        (case
                                             Lens.Family2.view
                                               (Data.ProtoLens.Field.field @"maybe'options") _x
                                         of
                                           Prelude.Nothing -> Data.Monoid.mempty
                                           (Prelude.Just _v)
                                             -> (Data.Monoid.<>)
                                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 66)
                                                  ((Prelude..)
                                                     (\ bs
                                                        -> (Data.Monoid.<>)
                                                             (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                (Prelude.fromIntegral
                                                                   (Data.ByteString.length bs)))
                                                             (Data.ProtoLens.Encoding.Bytes.putBytes
                                                                bs))
                                                     Data.ProtoLens.encodeMessage
                                                     _v))
                                        ((Data.Monoid.<>)
                                           (case
                                                Lens.Family2.view
                                                  (Data.ProtoLens.Field.field
                                                     @"maybe'sourceCodeInfo")
                                                  _x
                                            of
                                              Prelude.Nothing -> Data.Monoid.mempty
                                              (Prelude.Just _v)
                                                -> (Data.Monoid.<>)
                                                     (Data.ProtoLens.Encoding.Bytes.putVarInt 74)
                                                     ((Prelude..)
                                                        (\ bs
                                                           -> (Data.Monoid.<>)
                                                                (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                   (Prelude.fromIntegral
                                                                      (Data.ByteString.length bs)))
                                                                (Data.ProtoLens.Encoding.Bytes.putBytes
                                                                   bs))
                                                        Data.ProtoLens.encodeMessage
                                                        _v))
                                           ((Data.Monoid.<>)
                                              (case
                                                   Lens.Family2.view
                                                     (Data.ProtoLens.Field.field @"maybe'syntax") _x
                                               of
                                                 Prelude.Nothing -> Data.Monoid.mempty
                                                 (Prelude.Just _v)
                                                   -> (Data.Monoid.<>)
                                                        (Data.ProtoLens.Encoding.Bytes.putVarInt 98)
                                                        ((Prelude..)
                                                           (\ bs
                                                              -> (Data.Monoid.<>)
                                                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                      (Prelude.fromIntegral
                                                                         (Data.ByteString.length
                                                                            bs)))
                                                                   (Data.ProtoLens.Encoding.Bytes.putBytes
                                                                      bs))
                                                           Data.Text.Encoding.encodeUtf8
                                                           _v))
                                              ((Data.Monoid.<>)
                                                 (case
                                                      Lens.Family2.view
                                                        (Data.ProtoLens.Field.field
                                                           @"maybe'edition")
                                                        _x
                                                  of
                                                    Prelude.Nothing -> Data.Monoid.mempty
                                                    (Prelude.Just _v)
                                                      -> (Data.Monoid.<>)
                                                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                              112)
                                                           ((Prelude..)
                                                              ((Prelude..)
                                                                 Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                 Prelude.fromIntegral)
                                                              Prelude.fromEnum
                                                              _v))
                                                 (Data.ProtoLens.Encoding.Wire.buildFieldSet
                                                    (Lens.Family2.view
                                                       Data.ProtoLens.unknownFields _x))))))))))))))
instance Control.DeepSeq.NFData FileDescriptorProto where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_FileDescriptorProto'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_FileDescriptorProto'name x__)
                (Control.DeepSeq.deepseq
                   (_FileDescriptorProto'package x__)
                   (Control.DeepSeq.deepseq
                      (_FileDescriptorProto'dependency x__)
                      (Control.DeepSeq.deepseq
                         (_FileDescriptorProto'publicDependency x__)
                         (Control.DeepSeq.deepseq
                            (_FileDescriptorProto'weakDependency x__)
                            (Control.DeepSeq.deepseq
                               (_FileDescriptorProto'messageType x__)
                               (Control.DeepSeq.deepseq
                                  (_FileDescriptorProto'enumType x__)
                                  (Control.DeepSeq.deepseq
                                     (_FileDescriptorProto'service x__)
                                     (Control.DeepSeq.deepseq
                                        (_FileDescriptorProto'extension x__)
                                        (Control.DeepSeq.deepseq
                                           (_FileDescriptorProto'options x__)
                                           (Control.DeepSeq.deepseq
                                              (_FileDescriptorProto'sourceCodeInfo x__)
                                              (Control.DeepSeq.deepseq
                                                 (_FileDescriptorProto'syntax x__)
                                                 (Control.DeepSeq.deepseq
                                                    (_FileDescriptorProto'edition x__)
                                                    ())))))))))))))
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.file' @:: Lens' FileDescriptorSet [FileDescriptorProto]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'file' @:: Lens' FileDescriptorSet (Data.Vector.Vector FileDescriptorProto)@ -}
data FileDescriptorSet
  = FileDescriptorSet'_constructor {_FileDescriptorSet'file :: !(Data.Vector.Vector FileDescriptorProto),
                                    _FileDescriptorSet'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show FileDescriptorSet where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField FileDescriptorSet "file" [FileDescriptorProto] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileDescriptorSet'file
           (\ x__ y__ -> x__ {_FileDescriptorSet'file = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField FileDescriptorSet "vec'file" (Data.Vector.Vector FileDescriptorProto) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileDescriptorSet'file
           (\ x__ y__ -> x__ {_FileDescriptorSet'file = y__}))
        Prelude.id
instance Data.ProtoLens.Message FileDescriptorSet where
  messageName _ = Data.Text.pack "google.protobuf.FileDescriptorSet"
  packedMessageDescriptor _
    = "\n\
      \\DC1FileDescriptorSet\DC28\n\
      \\EOTfile\CAN\SOH \ETX(\v2$.google.protobuf.FileDescriptorProtoR\EOTfile"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        file__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "file"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor FileDescriptorProto)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"file")) ::
              Data.ProtoLens.FieldDescriptor FileDescriptorSet
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, file__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _FileDescriptorSet'_unknownFields
        (\ x__ y__ -> x__ {_FileDescriptorSet'_unknownFields = y__})
  defMessage
    = FileDescriptorSet'_constructor
        {_FileDescriptorSet'file = Data.Vector.Generic.empty,
         _FileDescriptorSet'_unknownFields = []}
  parseMessage
    = let
        loop ::
          FileDescriptorSet
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld FileDescriptorProto
             -> Data.ProtoLens.Encoding.Bytes.Parser FileDescriptorSet
        loop x mutable'file
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'file <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'file)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields
                           (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'file") frozen'file x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "file"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'file y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'file
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'file <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'file)
          "FileDescriptorSet"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                (\ _v
                   -> (Data.Monoid.<>)
                        (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                        ((Prelude..)
                           (\ bs
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (Prelude.fromIntegral (Data.ByteString.length bs)))
                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           Data.ProtoLens.encodeMessage
                           _v))
                (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'file") _x))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData FileDescriptorSet where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_FileDescriptorSet'_unknownFields x__)
             (Control.DeepSeq.deepseq (_FileDescriptorSet'file x__) ())
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.javaPackage' @:: Lens' FileOptions Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'javaPackage' @:: Lens' FileOptions (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.javaOuterClassname' @:: Lens' FileOptions Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'javaOuterClassname' @:: Lens' FileOptions (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.javaMultipleFiles' @:: Lens' FileOptions Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'javaMultipleFiles' @:: Lens' FileOptions (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.javaGenerateEqualsAndHash' @:: Lens' FileOptions Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'javaGenerateEqualsAndHash' @:: Lens' FileOptions (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.javaStringCheckUtf8' @:: Lens' FileOptions Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'javaStringCheckUtf8' @:: Lens' FileOptions (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.optimizeFor' @:: Lens' FileOptions FileOptions'OptimizeMode@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'optimizeFor' @:: Lens' FileOptions (Prelude.Maybe FileOptions'OptimizeMode)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.goPackage' @:: Lens' FileOptions Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'goPackage' @:: Lens' FileOptions (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.ccGenericServices' @:: Lens' FileOptions Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'ccGenericServices' @:: Lens' FileOptions (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.javaGenericServices' @:: Lens' FileOptions Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'javaGenericServices' @:: Lens' FileOptions (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.pyGenericServices' @:: Lens' FileOptions Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'pyGenericServices' @:: Lens' FileOptions (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.deprecated' @:: Lens' FileOptions Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'deprecated' @:: Lens' FileOptions (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.ccEnableArenas' @:: Lens' FileOptions Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'ccEnableArenas' @:: Lens' FileOptions (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.objcClassPrefix' @:: Lens' FileOptions Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'objcClassPrefix' @:: Lens' FileOptions (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.csharpNamespace' @:: Lens' FileOptions Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'csharpNamespace' @:: Lens' FileOptions (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.swiftPrefix' @:: Lens' FileOptions Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'swiftPrefix' @:: Lens' FileOptions (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.phpClassPrefix' @:: Lens' FileOptions Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'phpClassPrefix' @:: Lens' FileOptions (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.phpNamespace' @:: Lens' FileOptions Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'phpNamespace' @:: Lens' FileOptions (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.phpMetadataNamespace' @:: Lens' FileOptions Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'phpMetadataNamespace' @:: Lens' FileOptions (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.rubyPackage' @:: Lens' FileOptions Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'rubyPackage' @:: Lens' FileOptions (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.features' @:: Lens' FileOptions FeatureSet@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'features' @:: Lens' FileOptions (Prelude.Maybe FeatureSet)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.uninterpretedOption' @:: Lens' FileOptions [UninterpretedOption]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'uninterpretedOption' @:: Lens' FileOptions (Data.Vector.Vector UninterpretedOption)@ -}
data FileOptions
  = FileOptions'_constructor {_FileOptions'javaPackage :: !(Prelude.Maybe Data.Text.Text),
                              _FileOptions'javaOuterClassname :: !(Prelude.Maybe Data.Text.Text),
                              _FileOptions'javaMultipleFiles :: !(Prelude.Maybe Prelude.Bool),
                              _FileOptions'javaGenerateEqualsAndHash :: !(Prelude.Maybe Prelude.Bool),
                              _FileOptions'javaStringCheckUtf8 :: !(Prelude.Maybe Prelude.Bool),
                              _FileOptions'optimizeFor :: !(Prelude.Maybe FileOptions'OptimizeMode),
                              _FileOptions'goPackage :: !(Prelude.Maybe Data.Text.Text),
                              _FileOptions'ccGenericServices :: !(Prelude.Maybe Prelude.Bool),
                              _FileOptions'javaGenericServices :: !(Prelude.Maybe Prelude.Bool),
                              _FileOptions'pyGenericServices :: !(Prelude.Maybe Prelude.Bool),
                              _FileOptions'deprecated :: !(Prelude.Maybe Prelude.Bool),
                              _FileOptions'ccEnableArenas :: !(Prelude.Maybe Prelude.Bool),
                              _FileOptions'objcClassPrefix :: !(Prelude.Maybe Data.Text.Text),
                              _FileOptions'csharpNamespace :: !(Prelude.Maybe Data.Text.Text),
                              _FileOptions'swiftPrefix :: !(Prelude.Maybe Data.Text.Text),
                              _FileOptions'phpClassPrefix :: !(Prelude.Maybe Data.Text.Text),
                              _FileOptions'phpNamespace :: !(Prelude.Maybe Data.Text.Text),
                              _FileOptions'phpMetadataNamespace :: !(Prelude.Maybe Data.Text.Text),
                              _FileOptions'rubyPackage :: !(Prelude.Maybe Data.Text.Text),
                              _FileOptions'features :: !(Prelude.Maybe FeatureSet),
                              _FileOptions'uninterpretedOption :: !(Data.Vector.Vector UninterpretedOption),
                              _FileOptions'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show FileOptions where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField FileOptions "javaPackage" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'javaPackage
           (\ x__ y__ -> x__ {_FileOptions'javaPackage = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FileOptions "maybe'javaPackage" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'javaPackage
           (\ x__ y__ -> x__ {_FileOptions'javaPackage = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileOptions "javaOuterClassname" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'javaOuterClassname
           (\ x__ y__ -> x__ {_FileOptions'javaOuterClassname = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FileOptions "maybe'javaOuterClassname" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'javaOuterClassname
           (\ x__ y__ -> x__ {_FileOptions'javaOuterClassname = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileOptions "javaMultipleFiles" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'javaMultipleFiles
           (\ x__ y__ -> x__ {_FileOptions'javaMultipleFiles = y__}))
        (Data.ProtoLens.maybeLens Prelude.False)
instance Data.ProtoLens.Field.HasField FileOptions "maybe'javaMultipleFiles" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'javaMultipleFiles
           (\ x__ y__ -> x__ {_FileOptions'javaMultipleFiles = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileOptions "javaGenerateEqualsAndHash" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'javaGenerateEqualsAndHash
           (\ x__ y__ -> x__ {_FileOptions'javaGenerateEqualsAndHash = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FileOptions "maybe'javaGenerateEqualsAndHash" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'javaGenerateEqualsAndHash
           (\ x__ y__ -> x__ {_FileOptions'javaGenerateEqualsAndHash = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileOptions "javaStringCheckUtf8" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'javaStringCheckUtf8
           (\ x__ y__ -> x__ {_FileOptions'javaStringCheckUtf8 = y__}))
        (Data.ProtoLens.maybeLens Prelude.False)
instance Data.ProtoLens.Field.HasField FileOptions "maybe'javaStringCheckUtf8" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'javaStringCheckUtf8
           (\ x__ y__ -> x__ {_FileOptions'javaStringCheckUtf8 = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileOptions "optimizeFor" FileOptions'OptimizeMode where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'optimizeFor
           (\ x__ y__ -> x__ {_FileOptions'optimizeFor = y__}))
        (Data.ProtoLens.maybeLens FileOptions'SPEED)
instance Data.ProtoLens.Field.HasField FileOptions "maybe'optimizeFor" (Prelude.Maybe FileOptions'OptimizeMode) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'optimizeFor
           (\ x__ y__ -> x__ {_FileOptions'optimizeFor = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileOptions "goPackage" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'goPackage
           (\ x__ y__ -> x__ {_FileOptions'goPackage = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FileOptions "maybe'goPackage" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'goPackage
           (\ x__ y__ -> x__ {_FileOptions'goPackage = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileOptions "ccGenericServices" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'ccGenericServices
           (\ x__ y__ -> x__ {_FileOptions'ccGenericServices = y__}))
        (Data.ProtoLens.maybeLens Prelude.False)
instance Data.ProtoLens.Field.HasField FileOptions "maybe'ccGenericServices" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'ccGenericServices
           (\ x__ y__ -> x__ {_FileOptions'ccGenericServices = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileOptions "javaGenericServices" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'javaGenericServices
           (\ x__ y__ -> x__ {_FileOptions'javaGenericServices = y__}))
        (Data.ProtoLens.maybeLens Prelude.False)
instance Data.ProtoLens.Field.HasField FileOptions "maybe'javaGenericServices" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'javaGenericServices
           (\ x__ y__ -> x__ {_FileOptions'javaGenericServices = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileOptions "pyGenericServices" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'pyGenericServices
           (\ x__ y__ -> x__ {_FileOptions'pyGenericServices = y__}))
        (Data.ProtoLens.maybeLens Prelude.False)
instance Data.ProtoLens.Field.HasField FileOptions "maybe'pyGenericServices" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'pyGenericServices
           (\ x__ y__ -> x__ {_FileOptions'pyGenericServices = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileOptions "deprecated" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'deprecated
           (\ x__ y__ -> x__ {_FileOptions'deprecated = y__}))
        (Data.ProtoLens.maybeLens Prelude.False)
instance Data.ProtoLens.Field.HasField FileOptions "maybe'deprecated" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'deprecated
           (\ x__ y__ -> x__ {_FileOptions'deprecated = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileOptions "ccEnableArenas" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'ccEnableArenas
           (\ x__ y__ -> x__ {_FileOptions'ccEnableArenas = y__}))
        (Data.ProtoLens.maybeLens Prelude.True)
instance Data.ProtoLens.Field.HasField FileOptions "maybe'ccEnableArenas" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'ccEnableArenas
           (\ x__ y__ -> x__ {_FileOptions'ccEnableArenas = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileOptions "objcClassPrefix" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'objcClassPrefix
           (\ x__ y__ -> x__ {_FileOptions'objcClassPrefix = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FileOptions "maybe'objcClassPrefix" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'objcClassPrefix
           (\ x__ y__ -> x__ {_FileOptions'objcClassPrefix = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileOptions "csharpNamespace" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'csharpNamespace
           (\ x__ y__ -> x__ {_FileOptions'csharpNamespace = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FileOptions "maybe'csharpNamespace" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'csharpNamespace
           (\ x__ y__ -> x__ {_FileOptions'csharpNamespace = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileOptions "swiftPrefix" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'swiftPrefix
           (\ x__ y__ -> x__ {_FileOptions'swiftPrefix = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FileOptions "maybe'swiftPrefix" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'swiftPrefix
           (\ x__ y__ -> x__ {_FileOptions'swiftPrefix = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileOptions "phpClassPrefix" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'phpClassPrefix
           (\ x__ y__ -> x__ {_FileOptions'phpClassPrefix = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FileOptions "maybe'phpClassPrefix" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'phpClassPrefix
           (\ x__ y__ -> x__ {_FileOptions'phpClassPrefix = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileOptions "phpNamespace" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'phpNamespace
           (\ x__ y__ -> x__ {_FileOptions'phpNamespace = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FileOptions "maybe'phpNamespace" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'phpNamespace
           (\ x__ y__ -> x__ {_FileOptions'phpNamespace = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileOptions "phpMetadataNamespace" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'phpMetadataNamespace
           (\ x__ y__ -> x__ {_FileOptions'phpMetadataNamespace = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FileOptions "maybe'phpMetadataNamespace" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'phpMetadataNamespace
           (\ x__ y__ -> x__ {_FileOptions'phpMetadataNamespace = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileOptions "rubyPackage" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'rubyPackage
           (\ x__ y__ -> x__ {_FileOptions'rubyPackage = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField FileOptions "maybe'rubyPackage" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'rubyPackage
           (\ x__ y__ -> x__ {_FileOptions'rubyPackage = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileOptions "features" FeatureSet where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'features
           (\ x__ y__ -> x__ {_FileOptions'features = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField FileOptions "maybe'features" (Prelude.Maybe FeatureSet) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'features
           (\ x__ y__ -> x__ {_FileOptions'features = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField FileOptions "uninterpretedOption" [UninterpretedOption] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'uninterpretedOption
           (\ x__ y__ -> x__ {_FileOptions'uninterpretedOption = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField FileOptions "vec'uninterpretedOption" (Data.Vector.Vector UninterpretedOption) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FileOptions'uninterpretedOption
           (\ x__ y__ -> x__ {_FileOptions'uninterpretedOption = y__}))
        Prelude.id
instance Data.ProtoLens.Message FileOptions where
  messageName _ = Data.Text.pack "google.protobuf.FileOptions"
  packedMessageDescriptor _
    = "\n\
      \\vFileOptions\DC2!\n\
      \\fjava_package\CAN\SOH \SOH(\tR\vjavaPackage\DC20\n\
      \\DC4java_outer_classname\CAN\b \SOH(\tR\DC2javaOuterClassname\DC25\n\
      \\DC3java_multiple_files\CAN\n\
      \ \SOH(\b:\ENQfalseR\DC1javaMultipleFiles\DC2D\n\
      \\GSjava_generate_equals_and_hash\CAN\DC4 \SOH(\bR\EMjavaGenerateEqualsAndHashB\STX\CAN\SOH\DC2:\n\
      \\SYNjava_string_check_utf8\CAN\ESC \SOH(\b:\ENQfalseR\DC3javaStringCheckUtf8\DC2S\n\
      \\foptimize_for\CAN\t \SOH(\SO2).google.protobuf.FileOptions.OptimizeMode:\ENQSPEEDR\voptimizeFor\DC2\GS\n\
      \\n\
      \go_package\CAN\v \SOH(\tR\tgoPackage\DC25\n\
      \\DC3cc_generic_services\CAN\DLE \SOH(\b:\ENQfalseR\DC1ccGenericServices\DC29\n\
      \\NAKjava_generic_services\CAN\DC1 \SOH(\b:\ENQfalseR\DC3javaGenericServices\DC25\n\
      \\DC3py_generic_services\CAN\DC2 \SOH(\b:\ENQfalseR\DC1pyGenericServices\DC2%\n\
      \\n\
      \deprecated\CAN\ETB \SOH(\b:\ENQfalseR\n\
      \deprecated\DC2.\n\
      \\DLEcc_enable_arenas\CAN\US \SOH(\b:\EOTtrueR\SOccEnableArenas\DC2*\n\
      \\DC1objc_class_prefix\CAN$ \SOH(\tR\SIobjcClassPrefix\DC2)\n\
      \\DLEcsharp_namespace\CAN% \SOH(\tR\SIcsharpNamespace\DC2!\n\
      \\fswift_prefix\CAN' \SOH(\tR\vswiftPrefix\DC2(\n\
      \\DLEphp_class_prefix\CAN( \SOH(\tR\SOphpClassPrefix\DC2#\n\
      \\rphp_namespace\CAN) \SOH(\tR\fphpNamespace\DC24\n\
      \\SYNphp_metadata_namespace\CAN, \SOH(\tR\DC4phpMetadataNamespace\DC2!\n\
      \\fruby_package\CAN- \SOH(\tR\vrubyPackage\DC27\n\
      \\bfeatures\CAN2 \SOH(\v2\ESC.google.protobuf.FeatureSetR\bfeatures\DC2X\n\
      \\DC4uninterpreted_option\CAN\231\a \ETX(\v2$.google.protobuf.UninterpretedOptionR\DC3uninterpretedOption\":\n\
      \\fOptimizeMode\DC2\t\n\
      \\ENQSPEED\DLE\SOH\DC2\r\n\
      \\tCODE_SIZE\DLE\STX\DC2\DLE\n\
      \\fLITE_RUNTIME\DLE\ETX*\t\b\232\a\DLE\128\128\128\128\STXJ\EOT\b*\DLE+J\EOT\b&\DLE'R\DC4php_generic_services"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        javaPackage__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "java_package"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'javaPackage")) ::
              Data.ProtoLens.FieldDescriptor FileOptions
        javaOuterClassname__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "java_outer_classname"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'javaOuterClassname")) ::
              Data.ProtoLens.FieldDescriptor FileOptions
        javaMultipleFiles__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "java_multiple_files"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'javaMultipleFiles")) ::
              Data.ProtoLens.FieldDescriptor FileOptions
        javaGenerateEqualsAndHash__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "java_generate_equals_and_hash"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'javaGenerateEqualsAndHash")) ::
              Data.ProtoLens.FieldDescriptor FileOptions
        javaStringCheckUtf8__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "java_string_check_utf8"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'javaStringCheckUtf8")) ::
              Data.ProtoLens.FieldDescriptor FileOptions
        optimizeFor__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "optimize_for"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor FileOptions'OptimizeMode)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'optimizeFor")) ::
              Data.ProtoLens.FieldDescriptor FileOptions
        goPackage__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "go_package"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'goPackage")) ::
              Data.ProtoLens.FieldDescriptor FileOptions
        ccGenericServices__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "cc_generic_services"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'ccGenericServices")) ::
              Data.ProtoLens.FieldDescriptor FileOptions
        javaGenericServices__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "java_generic_services"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'javaGenericServices")) ::
              Data.ProtoLens.FieldDescriptor FileOptions
        pyGenericServices__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "py_generic_services"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'pyGenericServices")) ::
              Data.ProtoLens.FieldDescriptor FileOptions
        deprecated__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "deprecated"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'deprecated")) ::
              Data.ProtoLens.FieldDescriptor FileOptions
        ccEnableArenas__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "cc_enable_arenas"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'ccEnableArenas")) ::
              Data.ProtoLens.FieldDescriptor FileOptions
        objcClassPrefix__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "objc_class_prefix"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'objcClassPrefix")) ::
              Data.ProtoLens.FieldDescriptor FileOptions
        csharpNamespace__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "csharp_namespace"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'csharpNamespace")) ::
              Data.ProtoLens.FieldDescriptor FileOptions
        swiftPrefix__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "swift_prefix"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'swiftPrefix")) ::
              Data.ProtoLens.FieldDescriptor FileOptions
        phpClassPrefix__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "php_class_prefix"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'phpClassPrefix")) ::
              Data.ProtoLens.FieldDescriptor FileOptions
        phpNamespace__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "php_namespace"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'phpNamespace")) ::
              Data.ProtoLens.FieldDescriptor FileOptions
        phpMetadataNamespace__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "php_metadata_namespace"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'phpMetadataNamespace")) ::
              Data.ProtoLens.FieldDescriptor FileOptions
        rubyPackage__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "ruby_package"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'rubyPackage")) ::
              Data.ProtoLens.FieldDescriptor FileOptions
        features__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "features"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor FeatureSet)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'features")) ::
              Data.ProtoLens.FieldDescriptor FileOptions
        uninterpretedOption__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "uninterpreted_option"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor UninterpretedOption)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"uninterpretedOption")) ::
              Data.ProtoLens.FieldDescriptor FileOptions
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, javaPackage__field_descriptor),
           (Data.ProtoLens.Tag 8, javaOuterClassname__field_descriptor),
           (Data.ProtoLens.Tag 10, javaMultipleFiles__field_descriptor),
           (Data.ProtoLens.Tag 20, 
            javaGenerateEqualsAndHash__field_descriptor),
           (Data.ProtoLens.Tag 27, javaStringCheckUtf8__field_descriptor),
           (Data.ProtoLens.Tag 9, optimizeFor__field_descriptor),
           (Data.ProtoLens.Tag 11, goPackage__field_descriptor),
           (Data.ProtoLens.Tag 16, ccGenericServices__field_descriptor),
           (Data.ProtoLens.Tag 17, javaGenericServices__field_descriptor),
           (Data.ProtoLens.Tag 18, pyGenericServices__field_descriptor),
           (Data.ProtoLens.Tag 23, deprecated__field_descriptor),
           (Data.ProtoLens.Tag 31, ccEnableArenas__field_descriptor),
           (Data.ProtoLens.Tag 36, objcClassPrefix__field_descriptor),
           (Data.ProtoLens.Tag 37, csharpNamespace__field_descriptor),
           (Data.ProtoLens.Tag 39, swiftPrefix__field_descriptor),
           (Data.ProtoLens.Tag 40, phpClassPrefix__field_descriptor),
           (Data.ProtoLens.Tag 41, phpNamespace__field_descriptor),
           (Data.ProtoLens.Tag 44, phpMetadataNamespace__field_descriptor),
           (Data.ProtoLens.Tag 45, rubyPackage__field_descriptor),
           (Data.ProtoLens.Tag 50, features__field_descriptor),
           (Data.ProtoLens.Tag 999, uninterpretedOption__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _FileOptions'_unknownFields
        (\ x__ y__ -> x__ {_FileOptions'_unknownFields = y__})
  defMessage
    = FileOptions'_constructor
        {_FileOptions'javaPackage = Prelude.Nothing,
         _FileOptions'javaOuterClassname = Prelude.Nothing,
         _FileOptions'javaMultipleFiles = Prelude.Nothing,
         _FileOptions'javaGenerateEqualsAndHash = Prelude.Nothing,
         _FileOptions'javaStringCheckUtf8 = Prelude.Nothing,
         _FileOptions'optimizeFor = Prelude.Nothing,
         _FileOptions'goPackage = Prelude.Nothing,
         _FileOptions'ccGenericServices = Prelude.Nothing,
         _FileOptions'javaGenericServices = Prelude.Nothing,
         _FileOptions'pyGenericServices = Prelude.Nothing,
         _FileOptions'deprecated = Prelude.Nothing,
         _FileOptions'ccEnableArenas = Prelude.Nothing,
         _FileOptions'objcClassPrefix = Prelude.Nothing,
         _FileOptions'csharpNamespace = Prelude.Nothing,
         _FileOptions'swiftPrefix = Prelude.Nothing,
         _FileOptions'phpClassPrefix = Prelude.Nothing,
         _FileOptions'phpNamespace = Prelude.Nothing,
         _FileOptions'phpMetadataNamespace = Prelude.Nothing,
         _FileOptions'rubyPackage = Prelude.Nothing,
         _FileOptions'features = Prelude.Nothing,
         _FileOptions'uninterpretedOption = Data.Vector.Generic.empty,
         _FileOptions'_unknownFields = []}
  parseMessage
    = let
        loop ::
          FileOptions
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld UninterpretedOption
             -> Data.ProtoLens.Encoding.Bytes.Parser FileOptions
        loop x mutable'uninterpretedOption
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'uninterpretedOption <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                      (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                         mutable'uninterpretedOption)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields
                           (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'uninterpretedOption")
                              frozen'uninterpretedOption
                              x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "java_package"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"javaPackage") y x)
                                  mutable'uninterpretedOption
                        66
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "java_outer_classname"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"javaOuterClassname") y x)
                                  mutable'uninterpretedOption
                        80
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "java_multiple_files"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"javaMultipleFiles") y x)
                                  mutable'uninterpretedOption
                        160
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "java_generate_equals_and_hash"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"javaGenerateEqualsAndHash") y x)
                                  mutable'uninterpretedOption
                        216
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "java_string_check_utf8"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"javaStringCheckUtf8") y x)
                                  mutable'uninterpretedOption
                        72
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "optimize_for"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"optimizeFor") y x)
                                  mutable'uninterpretedOption
                        90
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "go_package"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"goPackage") y x)
                                  mutable'uninterpretedOption
                        128
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "cc_generic_services"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"ccGenericServices") y x)
                                  mutable'uninterpretedOption
                        136
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "java_generic_services"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"javaGenericServices") y x)
                                  mutable'uninterpretedOption
                        144
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "py_generic_services"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"pyGenericServices") y x)
                                  mutable'uninterpretedOption
                        184
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "deprecated"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"deprecated") y x)
                                  mutable'uninterpretedOption
                        248
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "cc_enable_arenas"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"ccEnableArenas") y x)
                                  mutable'uninterpretedOption
                        290
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "objc_class_prefix"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"objcClassPrefix") y x)
                                  mutable'uninterpretedOption
                        298
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "csharp_namespace"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"csharpNamespace") y x)
                                  mutable'uninterpretedOption
                        314
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "swift_prefix"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"swiftPrefix") y x)
                                  mutable'uninterpretedOption
                        322
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "php_class_prefix"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"phpClassPrefix") y x)
                                  mutable'uninterpretedOption
                        330
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "php_namespace"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"phpNamespace") y x)
                                  mutable'uninterpretedOption
                        354
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "php_metadata_namespace"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"phpMetadataNamespace") y x)
                                  mutable'uninterpretedOption
                        362
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "ruby_package"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"rubyPackage") y x)
                                  mutable'uninterpretedOption
                        402
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "features"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"features") y x)
                                  mutable'uninterpretedOption
                        7994
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "uninterpreted_option"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'uninterpretedOption y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'uninterpretedOption
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'uninterpretedOption <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                               Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'uninterpretedOption)
          "FileOptions"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view
                    (Data.ProtoLens.Field.field @"maybe'javaPackage") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.Text.Encoding.encodeUtf8
                          _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view
                       (Data.ProtoLens.Field.field @"maybe'javaOuterClassname") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 66)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.Text.Encoding.encodeUtf8
                             _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view
                          (Data.ProtoLens.Field.field @"maybe'javaMultipleFiles") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 80)
                             ((Prelude..)
                                Data.ProtoLens.Encoding.Bytes.putVarInt
                                (\ b -> if b then 1 else 0)
                                _v))
                   ((Data.Monoid.<>)
                      (case
                           Lens.Family2.view
                             (Data.ProtoLens.Field.field @"maybe'javaGenerateEqualsAndHash") _x
                       of
                         Prelude.Nothing -> Data.Monoid.mempty
                         (Prelude.Just _v)
                           -> (Data.Monoid.<>)
                                (Data.ProtoLens.Encoding.Bytes.putVarInt 160)
                                ((Prelude..)
                                   Data.ProtoLens.Encoding.Bytes.putVarInt
                                   (\ b -> if b then 1 else 0)
                                   _v))
                      ((Data.Monoid.<>)
                         (case
                              Lens.Family2.view
                                (Data.ProtoLens.Field.field @"maybe'javaStringCheckUtf8") _x
                          of
                            Prelude.Nothing -> Data.Monoid.mempty
                            (Prelude.Just _v)
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt 216)
                                   ((Prelude..)
                                      Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (\ b -> if b then 1 else 0)
                                      _v))
                         ((Data.Monoid.<>)
                            (case
                                 Lens.Family2.view
                                   (Data.ProtoLens.Field.field @"maybe'optimizeFor") _x
                             of
                               Prelude.Nothing -> Data.Monoid.mempty
                               (Prelude.Just _v)
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt 72)
                                      ((Prelude..)
                                         ((Prelude..)
                                            Data.ProtoLens.Encoding.Bytes.putVarInt
                                            Prelude.fromIntegral)
                                         Prelude.fromEnum
                                         _v))
                            ((Data.Monoid.<>)
                               (case
                                    Lens.Family2.view
                                      (Data.ProtoLens.Field.field @"maybe'goPackage") _x
                                of
                                  Prelude.Nothing -> Data.Monoid.mempty
                                  (Prelude.Just _v)
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt 90)
                                         ((Prelude..)
                                            (\ bs
                                               -> (Data.Monoid.<>)
                                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                       (Prelude.fromIntegral
                                                          (Data.ByteString.length bs)))
                                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                            Data.Text.Encoding.encodeUtf8
                                            _v))
                               ((Data.Monoid.<>)
                                  (case
                                       Lens.Family2.view
                                         (Data.ProtoLens.Field.field @"maybe'ccGenericServices") _x
                                   of
                                     Prelude.Nothing -> Data.Monoid.mempty
                                     (Prelude.Just _v)
                                       -> (Data.Monoid.<>)
                                            (Data.ProtoLens.Encoding.Bytes.putVarInt 128)
                                            ((Prelude..)
                                               Data.ProtoLens.Encoding.Bytes.putVarInt
                                               (\ b -> if b then 1 else 0)
                                               _v))
                                  ((Data.Monoid.<>)
                                     (case
                                          Lens.Family2.view
                                            (Data.ProtoLens.Field.field
                                               @"maybe'javaGenericServices")
                                            _x
                                      of
                                        Prelude.Nothing -> Data.Monoid.mempty
                                        (Prelude.Just _v)
                                          -> (Data.Monoid.<>)
                                               (Data.ProtoLens.Encoding.Bytes.putVarInt 136)
                                               ((Prelude..)
                                                  Data.ProtoLens.Encoding.Bytes.putVarInt
                                                  (\ b -> if b then 1 else 0)
                                                  _v))
                                     ((Data.Monoid.<>)
                                        (case
                                             Lens.Family2.view
                                               (Data.ProtoLens.Field.field
                                                  @"maybe'pyGenericServices")
                                               _x
                                         of
                                           Prelude.Nothing -> Data.Monoid.mempty
                                           (Prelude.Just _v)
                                             -> (Data.Monoid.<>)
                                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 144)
                                                  ((Prelude..)
                                                     Data.ProtoLens.Encoding.Bytes.putVarInt
                                                     (\ b -> if b then 1 else 0)
                                                     _v))
                                        ((Data.Monoid.<>)
                                           (case
                                                Lens.Family2.view
                                                  (Data.ProtoLens.Field.field @"maybe'deprecated")
                                                  _x
                                            of
                                              Prelude.Nothing -> Data.Monoid.mempty
                                              (Prelude.Just _v)
                                                -> (Data.Monoid.<>)
                                                     (Data.ProtoLens.Encoding.Bytes.putVarInt 184)
                                                     ((Prelude..)
                                                        Data.ProtoLens.Encoding.Bytes.putVarInt
                                                        (\ b -> if b then 1 else 0)
                                                        _v))
                                           ((Data.Monoid.<>)
                                              (case
                                                   Lens.Family2.view
                                                     (Data.ProtoLens.Field.field
                                                        @"maybe'ccEnableArenas")
                                                     _x
                                               of
                                                 Prelude.Nothing -> Data.Monoid.mempty
                                                 (Prelude.Just _v)
                                                   -> (Data.Monoid.<>)
                                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                           248)
                                                        ((Prelude..)
                                                           Data.ProtoLens.Encoding.Bytes.putVarInt
                                                           (\ b -> if b then 1 else 0)
                                                           _v))
                                              ((Data.Monoid.<>)
                                                 (case
                                                      Lens.Family2.view
                                                        (Data.ProtoLens.Field.field
                                                           @"maybe'objcClassPrefix")
                                                        _x
                                                  of
                                                    Prelude.Nothing -> Data.Monoid.mempty
                                                    (Prelude.Just _v)
                                                      -> (Data.Monoid.<>)
                                                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                              290)
                                                           ((Prelude..)
                                                              (\ bs
                                                                 -> (Data.Monoid.<>)
                                                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                         (Prelude.fromIntegral
                                                                            (Data.ByteString.length
                                                                               bs)))
                                                                      (Data.ProtoLens.Encoding.Bytes.putBytes
                                                                         bs))
                                                              Data.Text.Encoding.encodeUtf8
                                                              _v))
                                                 ((Data.Monoid.<>)
                                                    (case
                                                         Lens.Family2.view
                                                           (Data.ProtoLens.Field.field
                                                              @"maybe'csharpNamespace")
                                                           _x
                                                     of
                                                       Prelude.Nothing -> Data.Monoid.mempty
                                                       (Prelude.Just _v)
                                                         -> (Data.Monoid.<>)
                                                              (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                 298)
                                                              ((Prelude..)
                                                                 (\ bs
                                                                    -> (Data.Monoid.<>)
                                                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                            (Prelude.fromIntegral
                                                                               (Data.ByteString.length
                                                                                  bs)))
                                                                         (Data.ProtoLens.Encoding.Bytes.putBytes
                                                                            bs))
                                                                 Data.Text.Encoding.encodeUtf8
                                                                 _v))
                                                    ((Data.Monoid.<>)
                                                       (case
                                                            Lens.Family2.view
                                                              (Data.ProtoLens.Field.field
                                                                 @"maybe'swiftPrefix")
                                                              _x
                                                        of
                                                          Prelude.Nothing -> Data.Monoid.mempty
                                                          (Prelude.Just _v)
                                                            -> (Data.Monoid.<>)
                                                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                    314)
                                                                 ((Prelude..)
                                                                    (\ bs
                                                                       -> (Data.Monoid.<>)
                                                                            (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                               (Prelude.fromIntegral
                                                                                  (Data.ByteString.length
                                                                                     bs)))
                                                                            (Data.ProtoLens.Encoding.Bytes.putBytes
                                                                               bs))
                                                                    Data.Text.Encoding.encodeUtf8
                                                                    _v))
                                                       ((Data.Monoid.<>)
                                                          (case
                                                               Lens.Family2.view
                                                                 (Data.ProtoLens.Field.field
                                                                    @"maybe'phpClassPrefix")
                                                                 _x
                                                           of
                                                             Prelude.Nothing -> Data.Monoid.mempty
                                                             (Prelude.Just _v)
                                                               -> (Data.Monoid.<>)
                                                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                       322)
                                                                    ((Prelude..)
                                                                       (\ bs
                                                                          -> (Data.Monoid.<>)
                                                                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                                  (Prelude.fromIntegral
                                                                                     (Data.ByteString.length
                                                                                        bs)))
                                                                               (Data.ProtoLens.Encoding.Bytes.putBytes
                                                                                  bs))
                                                                       Data.Text.Encoding.encodeUtf8
                                                                       _v))
                                                          ((Data.Monoid.<>)
                                                             (case
                                                                  Lens.Family2.view
                                                                    (Data.ProtoLens.Field.field
                                                                       @"maybe'phpNamespace")
                                                                    _x
                                                              of
                                                                Prelude.Nothing
                                                                  -> Data.Monoid.mempty
                                                                (Prelude.Just _v)
                                                                  -> (Data.Monoid.<>)
                                                                       (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                          330)
                                                                       ((Prelude..)
                                                                          (\ bs
                                                                             -> (Data.Monoid.<>)
                                                                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                                     (Prelude.fromIntegral
                                                                                        (Data.ByteString.length
                                                                                           bs)))
                                                                                  (Data.ProtoLens.Encoding.Bytes.putBytes
                                                                                     bs))
                                                                          Data.Text.Encoding.encodeUtf8
                                                                          _v))
                                                             ((Data.Monoid.<>)
                                                                (case
                                                                     Lens.Family2.view
                                                                       (Data.ProtoLens.Field.field
                                                                          @"maybe'phpMetadataNamespace")
                                                                       _x
                                                                 of
                                                                   Prelude.Nothing
                                                                     -> Data.Monoid.mempty
                                                                   (Prelude.Just _v)
                                                                     -> (Data.Monoid.<>)
                                                                          (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                             354)
                                                                          ((Prelude..)
                                                                             (\ bs
                                                                                -> (Data.Monoid.<>)
                                                                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                                        (Prelude.fromIntegral
                                                                                           (Data.ByteString.length
                                                                                              bs)))
                                                                                     (Data.ProtoLens.Encoding.Bytes.putBytes
                                                                                        bs))
                                                                             Data.Text.Encoding.encodeUtf8
                                                                             _v))
                                                                ((Data.Monoid.<>)
                                                                   (case
                                                                        Lens.Family2.view
                                                                          (Data.ProtoLens.Field.field
                                                                             @"maybe'rubyPackage")
                                                                          _x
                                                                    of
                                                                      Prelude.Nothing
                                                                        -> Data.Monoid.mempty
                                                                      (Prelude.Just _v)
                                                                        -> (Data.Monoid.<>)
                                                                             (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                                362)
                                                                             ((Prelude..)
                                                                                (\ bs
                                                                                   -> (Data.Monoid.<>)
                                                                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                                           (Prelude.fromIntegral
                                                                                              (Data.ByteString.length
                                                                                                 bs)))
                                                                                        (Data.ProtoLens.Encoding.Bytes.putBytes
                                                                                           bs))
                                                                                Data.Text.Encoding.encodeUtf8
                                                                                _v))
                                                                   ((Data.Monoid.<>)
                                                                      (case
                                                                           Lens.Family2.view
                                                                             (Data.ProtoLens.Field.field
                                                                                @"maybe'features")
                                                                             _x
                                                                       of
                                                                         Prelude.Nothing
                                                                           -> Data.Monoid.mempty
                                                                         (Prelude.Just _v)
                                                                           -> (Data.Monoid.<>)
                                                                                (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                                   402)
                                                                                ((Prelude..)
                                                                                   (\ bs
                                                                                      -> (Data.Monoid.<>)
                                                                                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                                              (Prelude.fromIntegral
                                                                                                 (Data.ByteString.length
                                                                                                    bs)))
                                                                                           (Data.ProtoLens.Encoding.Bytes.putBytes
                                                                                              bs))
                                                                                   Data.ProtoLens.encodeMessage
                                                                                   _v))
                                                                      ((Data.Monoid.<>)
                                                                         (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                                                                            (\ _v
                                                                               -> (Data.Monoid.<>)
                                                                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                                       7994)
                                                                                    ((Prelude..)
                                                                                       (\ bs
                                                                                          -> (Data.Monoid.<>)
                                                                                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                                                                  (Prelude.fromIntegral
                                                                                                     (Data.ByteString.length
                                                                                                        bs)))
                                                                                               (Data.ProtoLens.Encoding.Bytes.putBytes
                                                                                                  bs))
                                                                                       Data.ProtoLens.encodeMessage
                                                                                       _v))
                                                                            (Lens.Family2.view
                                                                               (Data.ProtoLens.Field.field
                                                                                  @"vec'uninterpretedOption")
                                                                               _x))
                                                                         (Data.ProtoLens.Encoding.Wire.buildFieldSet
                                                                            (Lens.Family2.view
                                                                               Data.ProtoLens.unknownFields
                                                                               _x))))))))))))))))))))))
instance Control.DeepSeq.NFData FileOptions where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_FileOptions'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_FileOptions'javaPackage x__)
                (Control.DeepSeq.deepseq
                   (_FileOptions'javaOuterClassname x__)
                   (Control.DeepSeq.deepseq
                      (_FileOptions'javaMultipleFiles x__)
                      (Control.DeepSeq.deepseq
                         (_FileOptions'javaGenerateEqualsAndHash x__)
                         (Control.DeepSeq.deepseq
                            (_FileOptions'javaStringCheckUtf8 x__)
                            (Control.DeepSeq.deepseq
                               (_FileOptions'optimizeFor x__)
                               (Control.DeepSeq.deepseq
                                  (_FileOptions'goPackage x__)
                                  (Control.DeepSeq.deepseq
                                     (_FileOptions'ccGenericServices x__)
                                     (Control.DeepSeq.deepseq
                                        (_FileOptions'javaGenericServices x__)
                                        (Control.DeepSeq.deepseq
                                           (_FileOptions'pyGenericServices x__)
                                           (Control.DeepSeq.deepseq
                                              (_FileOptions'deprecated x__)
                                              (Control.DeepSeq.deepseq
                                                 (_FileOptions'ccEnableArenas x__)
                                                 (Control.DeepSeq.deepseq
                                                    (_FileOptions'objcClassPrefix x__)
                                                    (Control.DeepSeq.deepseq
                                                       (_FileOptions'csharpNamespace x__)
                                                       (Control.DeepSeq.deepseq
                                                          (_FileOptions'swiftPrefix x__)
                                                          (Control.DeepSeq.deepseq
                                                             (_FileOptions'phpClassPrefix x__)
                                                             (Control.DeepSeq.deepseq
                                                                (_FileOptions'phpNamespace x__)
                                                                (Control.DeepSeq.deepseq
                                                                   (_FileOptions'phpMetadataNamespace
                                                                      x__)
                                                                   (Control.DeepSeq.deepseq
                                                                      (_FileOptions'rubyPackage x__)
                                                                      (Control.DeepSeq.deepseq
                                                                         (_FileOptions'features x__)
                                                                         (Control.DeepSeq.deepseq
                                                                            (_FileOptions'uninterpretedOption
                                                                               x__)
                                                                            ())))))))))))))))))))))
data FileOptions'OptimizeMode
  = FileOptions'SPEED |
    FileOptions'CODE_SIZE |
    FileOptions'LITE_RUNTIME
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum FileOptions'OptimizeMode where
  maybeToEnum 1 = Prelude.Just FileOptions'SPEED
  maybeToEnum 2 = Prelude.Just FileOptions'CODE_SIZE
  maybeToEnum 3 = Prelude.Just FileOptions'LITE_RUNTIME
  maybeToEnum _ = Prelude.Nothing
  showEnum FileOptions'SPEED = "SPEED"
  showEnum FileOptions'CODE_SIZE = "CODE_SIZE"
  showEnum FileOptions'LITE_RUNTIME = "LITE_RUNTIME"
  readEnum k
    | (Prelude.==) k "SPEED" = Prelude.Just FileOptions'SPEED
    | (Prelude.==) k "CODE_SIZE" = Prelude.Just FileOptions'CODE_SIZE
    | (Prelude.==) k "LITE_RUNTIME"
    = Prelude.Just FileOptions'LITE_RUNTIME
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded FileOptions'OptimizeMode where
  minBound = FileOptions'SPEED
  maxBound = FileOptions'LITE_RUNTIME
instance Prelude.Enum FileOptions'OptimizeMode where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum OptimizeMode: "
              (Prelude.show k__)))
        Prelude.id
        (Data.ProtoLens.maybeToEnum k__)
  fromEnum FileOptions'SPEED = 1
  fromEnum FileOptions'CODE_SIZE = 2
  fromEnum FileOptions'LITE_RUNTIME = 3
  succ FileOptions'LITE_RUNTIME
    = Prelude.error
        "FileOptions'OptimizeMode.succ: bad argument FileOptions'LITE_RUNTIME. This value would be out of bounds."
  succ FileOptions'SPEED = FileOptions'CODE_SIZE
  succ FileOptions'CODE_SIZE = FileOptions'LITE_RUNTIME
  pred FileOptions'SPEED
    = Prelude.error
        "FileOptions'OptimizeMode.pred: bad argument FileOptions'SPEED. This value would be out of bounds."
  pred FileOptions'CODE_SIZE = FileOptions'SPEED
  pred FileOptions'LITE_RUNTIME = FileOptions'CODE_SIZE
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault FileOptions'OptimizeMode where
  fieldDefault = FileOptions'SPEED
instance Control.DeepSeq.NFData FileOptions'OptimizeMode where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.annotation' @:: Lens' GeneratedCodeInfo [GeneratedCodeInfo'Annotation]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'annotation' @:: Lens' GeneratedCodeInfo (Data.Vector.Vector GeneratedCodeInfo'Annotation)@ -}
data GeneratedCodeInfo
  = GeneratedCodeInfo'_constructor {_GeneratedCodeInfo'annotation :: !(Data.Vector.Vector GeneratedCodeInfo'Annotation),
                                    _GeneratedCodeInfo'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show GeneratedCodeInfo where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField GeneratedCodeInfo "annotation" [GeneratedCodeInfo'Annotation] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GeneratedCodeInfo'annotation
           (\ x__ y__ -> x__ {_GeneratedCodeInfo'annotation = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField GeneratedCodeInfo "vec'annotation" (Data.Vector.Vector GeneratedCodeInfo'Annotation) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GeneratedCodeInfo'annotation
           (\ x__ y__ -> x__ {_GeneratedCodeInfo'annotation = y__}))
        Prelude.id
instance Data.ProtoLens.Message GeneratedCodeInfo where
  messageName _ = Data.Text.pack "google.protobuf.GeneratedCodeInfo"
  packedMessageDescriptor _
    = "\n\
      \\DC1GeneratedCodeInfo\DC2M\n\
      \\n\
      \annotation\CAN\SOH \ETX(\v2-.google.protobuf.GeneratedCodeInfo.AnnotationR\n\
      \annotation\SUB\235\SOH\n\
      \\n\
      \Annotation\DC2\SYN\n\
      \\EOTpath\CAN\SOH \ETX(\ENQR\EOTpathB\STX\DLE\SOH\DC2\US\n\
      \\vsource_file\CAN\STX \SOH(\tR\n\
      \sourceFile\DC2\DC4\n\
      \\ENQbegin\CAN\ETX \SOH(\ENQR\ENQbegin\DC2\DLE\n\
      \\ETXend\CAN\EOT \SOH(\ENQR\ETXend\DC2R\n\
      \\bsemantic\CAN\ENQ \SOH(\SO26.google.protobuf.GeneratedCodeInfo.Annotation.SemanticR\bsemantic\"(\n\
      \\bSemantic\DC2\b\n\
      \\EOTNONE\DLE\NUL\DC2\a\n\
      \\ETXSET\DLE\SOH\DC2\t\n\
      \\ENQALIAS\DLE\STX"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        annotation__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "annotation"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor GeneratedCodeInfo'Annotation)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"annotation")) ::
              Data.ProtoLens.FieldDescriptor GeneratedCodeInfo
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, annotation__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _GeneratedCodeInfo'_unknownFields
        (\ x__ y__ -> x__ {_GeneratedCodeInfo'_unknownFields = y__})
  defMessage
    = GeneratedCodeInfo'_constructor
        {_GeneratedCodeInfo'annotation = Data.Vector.Generic.empty,
         _GeneratedCodeInfo'_unknownFields = []}
  parseMessage
    = let
        loop ::
          GeneratedCodeInfo
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld GeneratedCodeInfo'Annotation
             -> Data.ProtoLens.Encoding.Bytes.Parser GeneratedCodeInfo
        loop x mutable'annotation
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'annotation <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                             (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                mutable'annotation)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields
                           (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'annotation")
                              frozen'annotation
                              x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "annotation"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'annotation y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'annotation
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'annotation <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                      Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'annotation)
          "GeneratedCodeInfo"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                (\ _v
                   -> (Data.Monoid.<>)
                        (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                        ((Prelude..)
                           (\ bs
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (Prelude.fromIntegral (Data.ByteString.length bs)))
                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           Data.ProtoLens.encodeMessage
                           _v))
                (Lens.Family2.view
                   (Data.ProtoLens.Field.field @"vec'annotation") _x))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData GeneratedCodeInfo where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_GeneratedCodeInfo'_unknownFields x__)
             (Control.DeepSeq.deepseq (_GeneratedCodeInfo'annotation x__) ())
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.path' @:: Lens' GeneratedCodeInfo'Annotation [Data.Int.Int32]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'path' @:: Lens' GeneratedCodeInfo'Annotation (Data.Vector.Unboxed.Vector Data.Int.Int32)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.sourceFile' @:: Lens' GeneratedCodeInfo'Annotation Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'sourceFile' @:: Lens' GeneratedCodeInfo'Annotation (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.begin' @:: Lens' GeneratedCodeInfo'Annotation Data.Int.Int32@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'begin' @:: Lens' GeneratedCodeInfo'Annotation (Prelude.Maybe Data.Int.Int32)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.end' @:: Lens' GeneratedCodeInfo'Annotation Data.Int.Int32@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'end' @:: Lens' GeneratedCodeInfo'Annotation (Prelude.Maybe Data.Int.Int32)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.semantic' @:: Lens' GeneratedCodeInfo'Annotation GeneratedCodeInfo'Annotation'Semantic@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'semantic' @:: Lens' GeneratedCodeInfo'Annotation (Prelude.Maybe GeneratedCodeInfo'Annotation'Semantic)@ -}
data GeneratedCodeInfo'Annotation
  = GeneratedCodeInfo'Annotation'_constructor {_GeneratedCodeInfo'Annotation'path :: !(Data.Vector.Unboxed.Vector Data.Int.Int32),
                                               _GeneratedCodeInfo'Annotation'sourceFile :: !(Prelude.Maybe Data.Text.Text),
                                               _GeneratedCodeInfo'Annotation'begin :: !(Prelude.Maybe Data.Int.Int32),
                                               _GeneratedCodeInfo'Annotation'end :: !(Prelude.Maybe Data.Int.Int32),
                                               _GeneratedCodeInfo'Annotation'semantic :: !(Prelude.Maybe GeneratedCodeInfo'Annotation'Semantic),
                                               _GeneratedCodeInfo'Annotation'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show GeneratedCodeInfo'Annotation where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField GeneratedCodeInfo'Annotation "path" [Data.Int.Int32] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GeneratedCodeInfo'Annotation'path
           (\ x__ y__ -> x__ {_GeneratedCodeInfo'Annotation'path = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField GeneratedCodeInfo'Annotation "vec'path" (Data.Vector.Unboxed.Vector Data.Int.Int32) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GeneratedCodeInfo'Annotation'path
           (\ x__ y__ -> x__ {_GeneratedCodeInfo'Annotation'path = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField GeneratedCodeInfo'Annotation "sourceFile" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GeneratedCodeInfo'Annotation'sourceFile
           (\ x__ y__
              -> x__ {_GeneratedCodeInfo'Annotation'sourceFile = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField GeneratedCodeInfo'Annotation "maybe'sourceFile" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GeneratedCodeInfo'Annotation'sourceFile
           (\ x__ y__
              -> x__ {_GeneratedCodeInfo'Annotation'sourceFile = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField GeneratedCodeInfo'Annotation "begin" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GeneratedCodeInfo'Annotation'begin
           (\ x__ y__ -> x__ {_GeneratedCodeInfo'Annotation'begin = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField GeneratedCodeInfo'Annotation "maybe'begin" (Prelude.Maybe Data.Int.Int32) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GeneratedCodeInfo'Annotation'begin
           (\ x__ y__ -> x__ {_GeneratedCodeInfo'Annotation'begin = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField GeneratedCodeInfo'Annotation "end" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GeneratedCodeInfo'Annotation'end
           (\ x__ y__ -> x__ {_GeneratedCodeInfo'Annotation'end = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField GeneratedCodeInfo'Annotation "maybe'end" (Prelude.Maybe Data.Int.Int32) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GeneratedCodeInfo'Annotation'end
           (\ x__ y__ -> x__ {_GeneratedCodeInfo'Annotation'end = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField GeneratedCodeInfo'Annotation "semantic" GeneratedCodeInfo'Annotation'Semantic where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GeneratedCodeInfo'Annotation'semantic
           (\ x__ y__ -> x__ {_GeneratedCodeInfo'Annotation'semantic = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField GeneratedCodeInfo'Annotation "maybe'semantic" (Prelude.Maybe GeneratedCodeInfo'Annotation'Semantic) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GeneratedCodeInfo'Annotation'semantic
           (\ x__ y__ -> x__ {_GeneratedCodeInfo'Annotation'semantic = y__}))
        Prelude.id
instance Data.ProtoLens.Message GeneratedCodeInfo'Annotation where
  messageName _
    = Data.Text.pack "google.protobuf.GeneratedCodeInfo.Annotation"
  packedMessageDescriptor _
    = "\n\
      \\n\
      \Annotation\DC2\SYN\n\
      \\EOTpath\CAN\SOH \ETX(\ENQR\EOTpathB\STX\DLE\SOH\DC2\US\n\
      \\vsource_file\CAN\STX \SOH(\tR\n\
      \sourceFile\DC2\DC4\n\
      \\ENQbegin\CAN\ETX \SOH(\ENQR\ENQbegin\DC2\DLE\n\
      \\ETXend\CAN\EOT \SOH(\ENQR\ETXend\DC2R\n\
      \\bsemantic\CAN\ENQ \SOH(\SO26.google.protobuf.GeneratedCodeInfo.Annotation.SemanticR\bsemantic\"(\n\
      \\bSemantic\DC2\b\n\
      \\EOTNONE\DLE\NUL\DC2\a\n\
      \\ETXSET\DLE\SOH\DC2\t\n\
      \\ENQALIAS\DLE\STX"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        path__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "path"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Packed (Data.ProtoLens.Field.field @"path")) ::
              Data.ProtoLens.FieldDescriptor GeneratedCodeInfo'Annotation
        sourceFile__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "source_file"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'sourceFile")) ::
              Data.ProtoLens.FieldDescriptor GeneratedCodeInfo'Annotation
        begin__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "begin"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'begin")) ::
              Data.ProtoLens.FieldDescriptor GeneratedCodeInfo'Annotation
        end__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "end"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'end")) ::
              Data.ProtoLens.FieldDescriptor GeneratedCodeInfo'Annotation
        semantic__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "semantic"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor GeneratedCodeInfo'Annotation'Semantic)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'semantic")) ::
              Data.ProtoLens.FieldDescriptor GeneratedCodeInfo'Annotation
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, path__field_descriptor),
           (Data.ProtoLens.Tag 2, sourceFile__field_descriptor),
           (Data.ProtoLens.Tag 3, begin__field_descriptor),
           (Data.ProtoLens.Tag 4, end__field_descriptor),
           (Data.ProtoLens.Tag 5, semantic__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _GeneratedCodeInfo'Annotation'_unknownFields
        (\ x__ y__
           -> x__ {_GeneratedCodeInfo'Annotation'_unknownFields = y__})
  defMessage
    = GeneratedCodeInfo'Annotation'_constructor
        {_GeneratedCodeInfo'Annotation'path = Data.Vector.Generic.empty,
         _GeneratedCodeInfo'Annotation'sourceFile = Prelude.Nothing,
         _GeneratedCodeInfo'Annotation'begin = Prelude.Nothing,
         _GeneratedCodeInfo'Annotation'end = Prelude.Nothing,
         _GeneratedCodeInfo'Annotation'semantic = Prelude.Nothing,
         _GeneratedCodeInfo'Annotation'_unknownFields = []}
  parseMessage
    = let
        loop ::
          GeneratedCodeInfo'Annotation
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Unboxed.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Int.Int32
             -> Data.ProtoLens.Encoding.Bytes.Parser GeneratedCodeInfo'Annotation
        loop x mutable'path
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'path <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'path)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields
                           (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'path") frozen'path x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (Prelude.fmap
                                           Prelude.fromIntegral
                                           Data.ProtoLens.Encoding.Bytes.getVarInt)
                                        "path"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'path y)
                                loop x v
                        10
                          -> do y <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                        Data.ProtoLens.Encoding.Bytes.isolate
                                          (Prelude.fromIntegral len)
                                          ((let
                                              ploop qs
                                                = do packedEnd <- Data.ProtoLens.Encoding.Bytes.atEnd
                                                     if packedEnd then
                                                         Prelude.return qs
                                                     else
                                                         do !q <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                                                    (Prelude.fmap
                                                                       Prelude.fromIntegral
                                                                       Data.ProtoLens.Encoding.Bytes.getVarInt)
                                                                    "path"
                                                            qs' <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                                     (Data.ProtoLens.Encoding.Growing.append
                                                                        qs q)
                                                            ploop qs'
                                            in ploop)
                                             mutable'path)
                                loop x y
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "source_file"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"sourceFile") y x)
                                  mutable'path
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "begin"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"begin") y x)
                                  mutable'path
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "end"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"end") y x)
                                  mutable'path
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "semantic"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"semantic") y x)
                                  mutable'path
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'path
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'path <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'path)
          "Annotation"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                p = Lens.Family2.view (Data.ProtoLens.Field.field @"vec'path") _x
              in
                if Data.Vector.Generic.null p then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((\ bs
                          -> (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (Prelude.fromIntegral (Data.ByteString.length bs)))
                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         (Data.ProtoLens.Encoding.Bytes.runBuilder
                            (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                               ((Prelude..)
                                  Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                               p))))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view
                       (Data.ProtoLens.Field.field @"maybe'sourceFile") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.Text.Encoding.encodeUtf8
                             _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'begin") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                             ((Prelude..)
                                Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                   ((Data.Monoid.<>)
                      (case
                           Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'end") _x
                       of
                         Prelude.Nothing -> Data.Monoid.mempty
                         (Prelude.Just _v)
                           -> (Data.Monoid.<>)
                                (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                                ((Prelude..)
                                   Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                      ((Data.Monoid.<>)
                         (case
                              Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'semantic") _x
                          of
                            Prelude.Nothing -> Data.Monoid.mempty
                            (Prelude.Just _v)
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                   ((Prelude..)
                                      ((Prelude..)
                                         Data.ProtoLens.Encoding.Bytes.putVarInt
                                         Prelude.fromIntegral)
                                      Prelude.fromEnum
                                      _v))
                         (Data.ProtoLens.Encoding.Wire.buildFieldSet
                            (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))
instance Control.DeepSeq.NFData GeneratedCodeInfo'Annotation where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_GeneratedCodeInfo'Annotation'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_GeneratedCodeInfo'Annotation'path x__)
                (Control.DeepSeq.deepseq
                   (_GeneratedCodeInfo'Annotation'sourceFile x__)
                   (Control.DeepSeq.deepseq
                      (_GeneratedCodeInfo'Annotation'begin x__)
                      (Control.DeepSeq.deepseq
                         (_GeneratedCodeInfo'Annotation'end x__)
                         (Control.DeepSeq.deepseq
                            (_GeneratedCodeInfo'Annotation'semantic x__) ())))))
data GeneratedCodeInfo'Annotation'Semantic
  = GeneratedCodeInfo'Annotation'NONE |
    GeneratedCodeInfo'Annotation'SET |
    GeneratedCodeInfo'Annotation'ALIAS
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum GeneratedCodeInfo'Annotation'Semantic where
  maybeToEnum 0 = Prelude.Just GeneratedCodeInfo'Annotation'NONE
  maybeToEnum 1 = Prelude.Just GeneratedCodeInfo'Annotation'SET
  maybeToEnum 2 = Prelude.Just GeneratedCodeInfo'Annotation'ALIAS
  maybeToEnum _ = Prelude.Nothing
  showEnum GeneratedCodeInfo'Annotation'NONE = "NONE"
  showEnum GeneratedCodeInfo'Annotation'SET = "SET"
  showEnum GeneratedCodeInfo'Annotation'ALIAS = "ALIAS"
  readEnum k
    | (Prelude.==) k "NONE"
    = Prelude.Just GeneratedCodeInfo'Annotation'NONE
    | (Prelude.==) k "SET"
    = Prelude.Just GeneratedCodeInfo'Annotation'SET
    | (Prelude.==) k "ALIAS"
    = Prelude.Just GeneratedCodeInfo'Annotation'ALIAS
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded GeneratedCodeInfo'Annotation'Semantic where
  minBound = GeneratedCodeInfo'Annotation'NONE
  maxBound = GeneratedCodeInfo'Annotation'ALIAS
instance Prelude.Enum GeneratedCodeInfo'Annotation'Semantic where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum Semantic: " (Prelude.show k__)))
        Prelude.id
        (Data.ProtoLens.maybeToEnum k__)
  fromEnum GeneratedCodeInfo'Annotation'NONE = 0
  fromEnum GeneratedCodeInfo'Annotation'SET = 1
  fromEnum GeneratedCodeInfo'Annotation'ALIAS = 2
  succ GeneratedCodeInfo'Annotation'ALIAS
    = Prelude.error
        "GeneratedCodeInfo'Annotation'Semantic.succ: bad argument GeneratedCodeInfo'Annotation'ALIAS. This value would be out of bounds."
  succ GeneratedCodeInfo'Annotation'NONE
    = GeneratedCodeInfo'Annotation'SET
  succ GeneratedCodeInfo'Annotation'SET
    = GeneratedCodeInfo'Annotation'ALIAS
  pred GeneratedCodeInfo'Annotation'NONE
    = Prelude.error
        "GeneratedCodeInfo'Annotation'Semantic.pred: bad argument GeneratedCodeInfo'Annotation'NONE. This value would be out of bounds."
  pred GeneratedCodeInfo'Annotation'SET
    = GeneratedCodeInfo'Annotation'NONE
  pred GeneratedCodeInfo'Annotation'ALIAS
    = GeneratedCodeInfo'Annotation'SET
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault GeneratedCodeInfo'Annotation'Semantic where
  fieldDefault = GeneratedCodeInfo'Annotation'NONE
instance Control.DeepSeq.NFData GeneratedCodeInfo'Annotation'Semantic where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.messageSetWireFormat' @:: Lens' MessageOptions Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'messageSetWireFormat' @:: Lens' MessageOptions (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.noStandardDescriptorAccessor' @:: Lens' MessageOptions Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'noStandardDescriptorAccessor' @:: Lens' MessageOptions (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.deprecated' @:: Lens' MessageOptions Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'deprecated' @:: Lens' MessageOptions (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.mapEntry' @:: Lens' MessageOptions Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'mapEntry' @:: Lens' MessageOptions (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.deprecatedLegacyJsonFieldConflicts' @:: Lens' MessageOptions Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'deprecatedLegacyJsonFieldConflicts' @:: Lens' MessageOptions (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.features' @:: Lens' MessageOptions FeatureSet@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'features' @:: Lens' MessageOptions (Prelude.Maybe FeatureSet)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.uninterpretedOption' @:: Lens' MessageOptions [UninterpretedOption]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'uninterpretedOption' @:: Lens' MessageOptions (Data.Vector.Vector UninterpretedOption)@ -}
data MessageOptions
  = MessageOptions'_constructor {_MessageOptions'messageSetWireFormat :: !(Prelude.Maybe Prelude.Bool),
                                 _MessageOptions'noStandardDescriptorAccessor :: !(Prelude.Maybe Prelude.Bool),
                                 _MessageOptions'deprecated :: !(Prelude.Maybe Prelude.Bool),
                                 _MessageOptions'mapEntry :: !(Prelude.Maybe Prelude.Bool),
                                 _MessageOptions'deprecatedLegacyJsonFieldConflicts :: !(Prelude.Maybe Prelude.Bool),
                                 _MessageOptions'features :: !(Prelude.Maybe FeatureSet),
                                 _MessageOptions'uninterpretedOption :: !(Data.Vector.Vector UninterpretedOption),
                                 _MessageOptions'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show MessageOptions where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField MessageOptions "messageSetWireFormat" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MessageOptions'messageSetWireFormat
           (\ x__ y__ -> x__ {_MessageOptions'messageSetWireFormat = y__}))
        (Data.ProtoLens.maybeLens Prelude.False)
instance Data.ProtoLens.Field.HasField MessageOptions "maybe'messageSetWireFormat" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MessageOptions'messageSetWireFormat
           (\ x__ y__ -> x__ {_MessageOptions'messageSetWireFormat = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField MessageOptions "noStandardDescriptorAccessor" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MessageOptions'noStandardDescriptorAccessor
           (\ x__ y__
              -> x__ {_MessageOptions'noStandardDescriptorAccessor = y__}))
        (Data.ProtoLens.maybeLens Prelude.False)
instance Data.ProtoLens.Field.HasField MessageOptions "maybe'noStandardDescriptorAccessor" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MessageOptions'noStandardDescriptorAccessor
           (\ x__ y__
              -> x__ {_MessageOptions'noStandardDescriptorAccessor = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField MessageOptions "deprecated" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MessageOptions'deprecated
           (\ x__ y__ -> x__ {_MessageOptions'deprecated = y__}))
        (Data.ProtoLens.maybeLens Prelude.False)
instance Data.ProtoLens.Field.HasField MessageOptions "maybe'deprecated" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MessageOptions'deprecated
           (\ x__ y__ -> x__ {_MessageOptions'deprecated = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField MessageOptions "mapEntry" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MessageOptions'mapEntry
           (\ x__ y__ -> x__ {_MessageOptions'mapEntry = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField MessageOptions "maybe'mapEntry" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MessageOptions'mapEntry
           (\ x__ y__ -> x__ {_MessageOptions'mapEntry = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField MessageOptions "deprecatedLegacyJsonFieldConflicts" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MessageOptions'deprecatedLegacyJsonFieldConflicts
           (\ x__ y__
              -> x__ {_MessageOptions'deprecatedLegacyJsonFieldConflicts = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField MessageOptions "maybe'deprecatedLegacyJsonFieldConflicts" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MessageOptions'deprecatedLegacyJsonFieldConflicts
           (\ x__ y__
              -> x__ {_MessageOptions'deprecatedLegacyJsonFieldConflicts = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField MessageOptions "features" FeatureSet where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MessageOptions'features
           (\ x__ y__ -> x__ {_MessageOptions'features = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField MessageOptions "maybe'features" (Prelude.Maybe FeatureSet) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MessageOptions'features
           (\ x__ y__ -> x__ {_MessageOptions'features = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField MessageOptions "uninterpretedOption" [UninterpretedOption] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MessageOptions'uninterpretedOption
           (\ x__ y__ -> x__ {_MessageOptions'uninterpretedOption = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField MessageOptions "vec'uninterpretedOption" (Data.Vector.Vector UninterpretedOption) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MessageOptions'uninterpretedOption
           (\ x__ y__ -> x__ {_MessageOptions'uninterpretedOption = y__}))
        Prelude.id
instance Data.ProtoLens.Message MessageOptions where
  messageName _ = Data.Text.pack "google.protobuf.MessageOptions"
  packedMessageDescriptor _
    = "\n\
      \\SOMessageOptions\DC2<\n\
      \\ETBmessage_set_wire_format\CAN\SOH \SOH(\b:\ENQfalseR\DC4messageSetWireFormat\DC2L\n\
      \\USno_standard_descriptor_accessor\CAN\STX \SOH(\b:\ENQfalseR\FSnoStandardDescriptorAccessor\DC2%\n\
      \\n\
      \deprecated\CAN\ETX \SOH(\b:\ENQfalseR\n\
      \deprecated\DC2\ESC\n\
      \\tmap_entry\CAN\a \SOH(\bR\bmapEntry\DC2V\n\
      \&deprecated_legacy_json_field_conflicts\CAN\v \SOH(\bR\"deprecatedLegacyJsonFieldConflictsB\STX\CAN\SOH\DC27\n\
      \\bfeatures\CAN\f \SOH(\v2\ESC.google.protobuf.FeatureSetR\bfeatures\DC2X\n\
      \\DC4uninterpreted_option\CAN\231\a \ETX(\v2$.google.protobuf.UninterpretedOptionR\DC3uninterpretedOption*\t\b\232\a\DLE\128\128\128\128\STXJ\EOT\b\EOT\DLE\ENQJ\EOT\b\ENQ\DLE\ACKJ\EOT\b\ACK\DLE\aJ\EOT\b\b\DLE\tJ\EOT\b\t\DLE\n"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        messageSetWireFormat__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "message_set_wire_format"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'messageSetWireFormat")) ::
              Data.ProtoLens.FieldDescriptor MessageOptions
        noStandardDescriptorAccessor__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "no_standard_descriptor_accessor"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field
                    @"maybe'noStandardDescriptorAccessor")) ::
              Data.ProtoLens.FieldDescriptor MessageOptions
        deprecated__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "deprecated"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'deprecated")) ::
              Data.ProtoLens.FieldDescriptor MessageOptions
        mapEntry__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "map_entry"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'mapEntry")) ::
              Data.ProtoLens.FieldDescriptor MessageOptions
        deprecatedLegacyJsonFieldConflicts__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "deprecated_legacy_json_field_conflicts"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field
                    @"maybe'deprecatedLegacyJsonFieldConflicts")) ::
              Data.ProtoLens.FieldDescriptor MessageOptions
        features__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "features"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor FeatureSet)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'features")) ::
              Data.ProtoLens.FieldDescriptor MessageOptions
        uninterpretedOption__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "uninterpreted_option"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor UninterpretedOption)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"uninterpretedOption")) ::
              Data.ProtoLens.FieldDescriptor MessageOptions
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, messageSetWireFormat__field_descriptor),
           (Data.ProtoLens.Tag 2, 
            noStandardDescriptorAccessor__field_descriptor),
           (Data.ProtoLens.Tag 3, deprecated__field_descriptor),
           (Data.ProtoLens.Tag 7, mapEntry__field_descriptor),
           (Data.ProtoLens.Tag 11, 
            deprecatedLegacyJsonFieldConflicts__field_descriptor),
           (Data.ProtoLens.Tag 12, features__field_descriptor),
           (Data.ProtoLens.Tag 999, uninterpretedOption__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _MessageOptions'_unknownFields
        (\ x__ y__ -> x__ {_MessageOptions'_unknownFields = y__})
  defMessage
    = MessageOptions'_constructor
        {_MessageOptions'messageSetWireFormat = Prelude.Nothing,
         _MessageOptions'noStandardDescriptorAccessor = Prelude.Nothing,
         _MessageOptions'deprecated = Prelude.Nothing,
         _MessageOptions'mapEntry = Prelude.Nothing,
         _MessageOptions'deprecatedLegacyJsonFieldConflicts = Prelude.Nothing,
         _MessageOptions'features = Prelude.Nothing,
         _MessageOptions'uninterpretedOption = Data.Vector.Generic.empty,
         _MessageOptions'_unknownFields = []}
  parseMessage
    = let
        loop ::
          MessageOptions
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld UninterpretedOption
             -> Data.ProtoLens.Encoding.Bytes.Parser MessageOptions
        loop x mutable'uninterpretedOption
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'uninterpretedOption <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                      (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                         mutable'uninterpretedOption)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields
                           (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'uninterpretedOption")
                              frozen'uninterpretedOption
                              x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "message_set_wire_format"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"messageSetWireFormat") y x)
                                  mutable'uninterpretedOption
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "no_standard_descriptor_accessor"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"noStandardDescriptorAccessor")
                                     y
                                     x)
                                  mutable'uninterpretedOption
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "deprecated"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"deprecated") y x)
                                  mutable'uninterpretedOption
                        56
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "map_entry"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"mapEntry") y x)
                                  mutable'uninterpretedOption
                        88
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "deprecated_legacy_json_field_conflicts"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field
                                        @"deprecatedLegacyJsonFieldConflicts")
                                     y
                                     x)
                                  mutable'uninterpretedOption
                        98
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "features"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"features") y x)
                                  mutable'uninterpretedOption
                        7994
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "uninterpreted_option"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'uninterpretedOption y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'uninterpretedOption
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'uninterpretedOption <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                               Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'uninterpretedOption)
          "MessageOptions"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view
                    (Data.ProtoLens.Field.field @"maybe'messageSetWireFormat") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                       ((Prelude..)
                          Data.ProtoLens.Encoding.Bytes.putVarInt
                          (\ b -> if b then 1 else 0)
                          _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view
                       (Data.ProtoLens.Field.field @"maybe'noStandardDescriptorAccessor")
                       _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                          ((Prelude..)
                             Data.ProtoLens.Encoding.Bytes.putVarInt
                             (\ b -> if b then 1 else 0)
                             _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view
                          (Data.ProtoLens.Field.field @"maybe'deprecated") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                             ((Prelude..)
                                Data.ProtoLens.Encoding.Bytes.putVarInt
                                (\ b -> if b then 1 else 0)
                                _v))
                   ((Data.Monoid.<>)
                      (case
                           Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'mapEntry") _x
                       of
                         Prelude.Nothing -> Data.Monoid.mempty
                         (Prelude.Just _v)
                           -> (Data.Monoid.<>)
                                (Data.ProtoLens.Encoding.Bytes.putVarInt 56)
                                ((Prelude..)
                                   Data.ProtoLens.Encoding.Bytes.putVarInt
                                   (\ b -> if b then 1 else 0)
                                   _v))
                      ((Data.Monoid.<>)
                         (case
                              Lens.Family2.view
                                (Data.ProtoLens.Field.field
                                   @"maybe'deprecatedLegacyJsonFieldConflicts")
                                _x
                          of
                            Prelude.Nothing -> Data.Monoid.mempty
                            (Prelude.Just _v)
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt 88)
                                   ((Prelude..)
                                      Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (\ b -> if b then 1 else 0)
                                      _v))
                         ((Data.Monoid.<>)
                            (case
                                 Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'features") _x
                             of
                               Prelude.Nothing -> Data.Monoid.mempty
                               (Prelude.Just _v)
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt 98)
                                      ((Prelude..)
                                         (\ bs
                                            -> (Data.Monoid.<>)
                                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                    (Prelude.fromIntegral
                                                       (Data.ByteString.length bs)))
                                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                         Data.ProtoLens.encodeMessage
                                         _v))
                            ((Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                                  (\ _v
                                     -> (Data.Monoid.<>)
                                          (Data.ProtoLens.Encoding.Bytes.putVarInt 7994)
                                          ((Prelude..)
                                             (\ bs
                                                -> (Data.Monoid.<>)
                                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                        (Prelude.fromIntegral
                                                           (Data.ByteString.length bs)))
                                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                             Data.ProtoLens.encodeMessage
                                             _v))
                                  (Lens.Family2.view
                                     (Data.ProtoLens.Field.field @"vec'uninterpretedOption") _x))
                               (Data.ProtoLens.Encoding.Wire.buildFieldSet
                                  (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))))
instance Control.DeepSeq.NFData MessageOptions where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_MessageOptions'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_MessageOptions'messageSetWireFormat x__)
                (Control.DeepSeq.deepseq
                   (_MessageOptions'noStandardDescriptorAccessor x__)
                   (Control.DeepSeq.deepseq
                      (_MessageOptions'deprecated x__)
                      (Control.DeepSeq.deepseq
                         (_MessageOptions'mapEntry x__)
                         (Control.DeepSeq.deepseq
                            (_MessageOptions'deprecatedLegacyJsonFieldConflicts x__)
                            (Control.DeepSeq.deepseq
                               (_MessageOptions'features x__)
                               (Control.DeepSeq.deepseq
                                  (_MessageOptions'uninterpretedOption x__) ())))))))
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.name' @:: Lens' MethodDescriptorProto Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'name' @:: Lens' MethodDescriptorProto (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.inputType' @:: Lens' MethodDescriptorProto Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'inputType' @:: Lens' MethodDescriptorProto (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.outputType' @:: Lens' MethodDescriptorProto Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'outputType' @:: Lens' MethodDescriptorProto (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.options' @:: Lens' MethodDescriptorProto MethodOptions@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'options' @:: Lens' MethodDescriptorProto (Prelude.Maybe MethodOptions)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.clientStreaming' @:: Lens' MethodDescriptorProto Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'clientStreaming' @:: Lens' MethodDescriptorProto (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.serverStreaming' @:: Lens' MethodDescriptorProto Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'serverStreaming' @:: Lens' MethodDescriptorProto (Prelude.Maybe Prelude.Bool)@ -}
data MethodDescriptorProto
  = MethodDescriptorProto'_constructor {_MethodDescriptorProto'name :: !(Prelude.Maybe Data.Text.Text),
                                        _MethodDescriptorProto'inputType :: !(Prelude.Maybe Data.Text.Text),
                                        _MethodDescriptorProto'outputType :: !(Prelude.Maybe Data.Text.Text),
                                        _MethodDescriptorProto'options :: !(Prelude.Maybe MethodOptions),
                                        _MethodDescriptorProto'clientStreaming :: !(Prelude.Maybe Prelude.Bool),
                                        _MethodDescriptorProto'serverStreaming :: !(Prelude.Maybe Prelude.Bool),
                                        _MethodDescriptorProto'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show MethodDescriptorProto where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField MethodDescriptorProto "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MethodDescriptorProto'name
           (\ x__ y__ -> x__ {_MethodDescriptorProto'name = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField MethodDescriptorProto "maybe'name" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MethodDescriptorProto'name
           (\ x__ y__ -> x__ {_MethodDescriptorProto'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField MethodDescriptorProto "inputType" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MethodDescriptorProto'inputType
           (\ x__ y__ -> x__ {_MethodDescriptorProto'inputType = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField MethodDescriptorProto "maybe'inputType" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MethodDescriptorProto'inputType
           (\ x__ y__ -> x__ {_MethodDescriptorProto'inputType = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField MethodDescriptorProto "outputType" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MethodDescriptorProto'outputType
           (\ x__ y__ -> x__ {_MethodDescriptorProto'outputType = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField MethodDescriptorProto "maybe'outputType" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MethodDescriptorProto'outputType
           (\ x__ y__ -> x__ {_MethodDescriptorProto'outputType = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField MethodDescriptorProto "options" MethodOptions where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MethodDescriptorProto'options
           (\ x__ y__ -> x__ {_MethodDescriptorProto'options = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField MethodDescriptorProto "maybe'options" (Prelude.Maybe MethodOptions) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MethodDescriptorProto'options
           (\ x__ y__ -> x__ {_MethodDescriptorProto'options = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField MethodDescriptorProto "clientStreaming" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MethodDescriptorProto'clientStreaming
           (\ x__ y__ -> x__ {_MethodDescriptorProto'clientStreaming = y__}))
        (Data.ProtoLens.maybeLens Prelude.False)
instance Data.ProtoLens.Field.HasField MethodDescriptorProto "maybe'clientStreaming" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MethodDescriptorProto'clientStreaming
           (\ x__ y__ -> x__ {_MethodDescriptorProto'clientStreaming = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField MethodDescriptorProto "serverStreaming" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MethodDescriptorProto'serverStreaming
           (\ x__ y__ -> x__ {_MethodDescriptorProto'serverStreaming = y__}))
        (Data.ProtoLens.maybeLens Prelude.False)
instance Data.ProtoLens.Field.HasField MethodDescriptorProto "maybe'serverStreaming" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MethodDescriptorProto'serverStreaming
           (\ x__ y__ -> x__ {_MethodDescriptorProto'serverStreaming = y__}))
        Prelude.id
instance Data.ProtoLens.Message MethodDescriptorProto where
  messageName _
    = Data.Text.pack "google.protobuf.MethodDescriptorProto"
  packedMessageDescriptor _
    = "\n\
      \\NAKMethodDescriptorProto\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2\GS\n\
      \\n\
      \input_type\CAN\STX \SOH(\tR\tinputType\DC2\US\n\
      \\voutput_type\CAN\ETX \SOH(\tR\n\
      \outputType\DC28\n\
      \\aoptions\CAN\EOT \SOH(\v2\RS.google.protobuf.MethodOptionsR\aoptions\DC20\n\
      \\DLEclient_streaming\CAN\ENQ \SOH(\b:\ENQfalseR\SIclientStreaming\DC20\n\
      \\DLEserver_streaming\CAN\ACK \SOH(\b:\ENQfalseR\SIserverStreaming"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'name")) ::
              Data.ProtoLens.FieldDescriptor MethodDescriptorProto
        inputType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "input_type"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'inputType")) ::
              Data.ProtoLens.FieldDescriptor MethodDescriptorProto
        outputType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "output_type"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'outputType")) ::
              Data.ProtoLens.FieldDescriptor MethodDescriptorProto
        options__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "options"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor MethodOptions)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'options")) ::
              Data.ProtoLens.FieldDescriptor MethodDescriptorProto
        clientStreaming__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "client_streaming"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'clientStreaming")) ::
              Data.ProtoLens.FieldDescriptor MethodDescriptorProto
        serverStreaming__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "server_streaming"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'serverStreaming")) ::
              Data.ProtoLens.FieldDescriptor MethodDescriptorProto
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, name__field_descriptor),
           (Data.ProtoLens.Tag 2, inputType__field_descriptor),
           (Data.ProtoLens.Tag 3, outputType__field_descriptor),
           (Data.ProtoLens.Tag 4, options__field_descriptor),
           (Data.ProtoLens.Tag 5, clientStreaming__field_descriptor),
           (Data.ProtoLens.Tag 6, serverStreaming__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _MethodDescriptorProto'_unknownFields
        (\ x__ y__ -> x__ {_MethodDescriptorProto'_unknownFields = y__})
  defMessage
    = MethodDescriptorProto'_constructor
        {_MethodDescriptorProto'name = Prelude.Nothing,
         _MethodDescriptorProto'inputType = Prelude.Nothing,
         _MethodDescriptorProto'outputType = Prelude.Nothing,
         _MethodDescriptorProto'options = Prelude.Nothing,
         _MethodDescriptorProto'clientStreaming = Prelude.Nothing,
         _MethodDescriptorProto'serverStreaming = Prelude.Nothing,
         _MethodDescriptorProto'_unknownFields = []}
  parseMessage
    = let
        loop ::
          MethodDescriptorProto
          -> Data.ProtoLens.Encoding.Bytes.Parser MethodDescriptorProto
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "name"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"name") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "input_type"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"inputType") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "output_type"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"outputType") y x)
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "options"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"options") y x)
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "client_streaming"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"clientStreaming") y x)
                        48
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "server_streaming"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"serverStreaming") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "MethodDescriptorProto"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'name") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.Text.Encoding.encodeUtf8
                          _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view
                       (Data.ProtoLens.Field.field @"maybe'inputType") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.Text.Encoding.encodeUtf8
                             _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view
                          (Data.ProtoLens.Field.field @"maybe'outputType") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.Text.Encoding.encodeUtf8
                                _v))
                   ((Data.Monoid.<>)
                      (case
                           Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'options") _x
                       of
                         Prelude.Nothing -> Data.Monoid.mempty
                         (Prelude.Just _v)
                           -> (Data.Monoid.<>)
                                (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                                ((Prelude..)
                                   (\ bs
                                      -> (Data.Monoid.<>)
                                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                                              (Prelude.fromIntegral (Data.ByteString.length bs)))
                                           (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                   Data.ProtoLens.encodeMessage
                                   _v))
                      ((Data.Monoid.<>)
                         (case
                              Lens.Family2.view
                                (Data.ProtoLens.Field.field @"maybe'clientStreaming") _x
                          of
                            Prelude.Nothing -> Data.Monoid.mempty
                            (Prelude.Just _v)
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                   ((Prelude..)
                                      Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (\ b -> if b then 1 else 0)
                                      _v))
                         ((Data.Monoid.<>)
                            (case
                                 Lens.Family2.view
                                   (Data.ProtoLens.Field.field @"maybe'serverStreaming") _x
                             of
                               Prelude.Nothing -> Data.Monoid.mempty
                               (Prelude.Just _v)
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt 48)
                                      ((Prelude..)
                                         Data.ProtoLens.Encoding.Bytes.putVarInt
                                         (\ b -> if b then 1 else 0)
                                         _v))
                            (Data.ProtoLens.Encoding.Wire.buildFieldSet
                               (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))))
instance Control.DeepSeq.NFData MethodDescriptorProto where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_MethodDescriptorProto'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_MethodDescriptorProto'name x__)
                (Control.DeepSeq.deepseq
                   (_MethodDescriptorProto'inputType x__)
                   (Control.DeepSeq.deepseq
                      (_MethodDescriptorProto'outputType x__)
                      (Control.DeepSeq.deepseq
                         (_MethodDescriptorProto'options x__)
                         (Control.DeepSeq.deepseq
                            (_MethodDescriptorProto'clientStreaming x__)
                            (Control.DeepSeq.deepseq
                               (_MethodDescriptorProto'serverStreaming x__) ()))))))
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.deprecated' @:: Lens' MethodOptions Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'deprecated' @:: Lens' MethodOptions (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.idempotencyLevel' @:: Lens' MethodOptions MethodOptions'IdempotencyLevel@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'idempotencyLevel' @:: Lens' MethodOptions (Prelude.Maybe MethodOptions'IdempotencyLevel)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.features' @:: Lens' MethodOptions FeatureSet@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'features' @:: Lens' MethodOptions (Prelude.Maybe FeatureSet)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.uninterpretedOption' @:: Lens' MethodOptions [UninterpretedOption]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'uninterpretedOption' @:: Lens' MethodOptions (Data.Vector.Vector UninterpretedOption)@ -}
data MethodOptions
  = MethodOptions'_constructor {_MethodOptions'deprecated :: !(Prelude.Maybe Prelude.Bool),
                                _MethodOptions'idempotencyLevel :: !(Prelude.Maybe MethodOptions'IdempotencyLevel),
                                _MethodOptions'features :: !(Prelude.Maybe FeatureSet),
                                _MethodOptions'uninterpretedOption :: !(Data.Vector.Vector UninterpretedOption),
                                _MethodOptions'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show MethodOptions where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField MethodOptions "deprecated" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MethodOptions'deprecated
           (\ x__ y__ -> x__ {_MethodOptions'deprecated = y__}))
        (Data.ProtoLens.maybeLens Prelude.False)
instance Data.ProtoLens.Field.HasField MethodOptions "maybe'deprecated" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MethodOptions'deprecated
           (\ x__ y__ -> x__ {_MethodOptions'deprecated = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField MethodOptions "idempotencyLevel" MethodOptions'IdempotencyLevel where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MethodOptions'idempotencyLevel
           (\ x__ y__ -> x__ {_MethodOptions'idempotencyLevel = y__}))
        (Data.ProtoLens.maybeLens MethodOptions'IDEMPOTENCY_UNKNOWN)
instance Data.ProtoLens.Field.HasField MethodOptions "maybe'idempotencyLevel" (Prelude.Maybe MethodOptions'IdempotencyLevel) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MethodOptions'idempotencyLevel
           (\ x__ y__ -> x__ {_MethodOptions'idempotencyLevel = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField MethodOptions "features" FeatureSet where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MethodOptions'features
           (\ x__ y__ -> x__ {_MethodOptions'features = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField MethodOptions "maybe'features" (Prelude.Maybe FeatureSet) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MethodOptions'features
           (\ x__ y__ -> x__ {_MethodOptions'features = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField MethodOptions "uninterpretedOption" [UninterpretedOption] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MethodOptions'uninterpretedOption
           (\ x__ y__ -> x__ {_MethodOptions'uninterpretedOption = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField MethodOptions "vec'uninterpretedOption" (Data.Vector.Vector UninterpretedOption) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MethodOptions'uninterpretedOption
           (\ x__ y__ -> x__ {_MethodOptions'uninterpretedOption = y__}))
        Prelude.id
instance Data.ProtoLens.Message MethodOptions where
  messageName _ = Data.Text.pack "google.protobuf.MethodOptions"
  packedMessageDescriptor _
    = "\n\
      \\rMethodOptions\DC2%\n\
      \\n\
      \deprecated\CAN! \SOH(\b:\ENQfalseR\n\
      \deprecated\DC2q\n\
      \\DC1idempotency_level\CAN\" \SOH(\SO2/.google.protobuf.MethodOptions.IdempotencyLevel:\DC3IDEMPOTENCY_UNKNOWNR\DLEidempotencyLevel\DC27\n\
      \\bfeatures\CAN# \SOH(\v2\ESC.google.protobuf.FeatureSetR\bfeatures\DC2X\n\
      \\DC4uninterpreted_option\CAN\231\a \ETX(\v2$.google.protobuf.UninterpretedOptionR\DC3uninterpretedOption\"P\n\
      \\DLEIdempotencyLevel\DC2\ETB\n\
      \\DC3IDEMPOTENCY_UNKNOWN\DLE\NUL\DC2\DC3\n\
      \\SINO_SIDE_EFFECTS\DLE\SOH\DC2\SO\n\
      \\n\
      \IDEMPOTENT\DLE\STX*\t\b\232\a\DLE\128\128\128\128\STX"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        deprecated__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "deprecated"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'deprecated")) ::
              Data.ProtoLens.FieldDescriptor MethodOptions
        idempotencyLevel__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "idempotency_level"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor MethodOptions'IdempotencyLevel)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'idempotencyLevel")) ::
              Data.ProtoLens.FieldDescriptor MethodOptions
        features__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "features"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor FeatureSet)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'features")) ::
              Data.ProtoLens.FieldDescriptor MethodOptions
        uninterpretedOption__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "uninterpreted_option"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor UninterpretedOption)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"uninterpretedOption")) ::
              Data.ProtoLens.FieldDescriptor MethodOptions
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 33, deprecated__field_descriptor),
           (Data.ProtoLens.Tag 34, idempotencyLevel__field_descriptor),
           (Data.ProtoLens.Tag 35, features__field_descriptor),
           (Data.ProtoLens.Tag 999, uninterpretedOption__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _MethodOptions'_unknownFields
        (\ x__ y__ -> x__ {_MethodOptions'_unknownFields = y__})
  defMessage
    = MethodOptions'_constructor
        {_MethodOptions'deprecated = Prelude.Nothing,
         _MethodOptions'idempotencyLevel = Prelude.Nothing,
         _MethodOptions'features = Prelude.Nothing,
         _MethodOptions'uninterpretedOption = Data.Vector.Generic.empty,
         _MethodOptions'_unknownFields = []}
  parseMessage
    = let
        loop ::
          MethodOptions
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld UninterpretedOption
             -> Data.ProtoLens.Encoding.Bytes.Parser MethodOptions
        loop x mutable'uninterpretedOption
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'uninterpretedOption <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                      (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                         mutable'uninterpretedOption)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields
                           (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'uninterpretedOption")
                              frozen'uninterpretedOption
                              x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        264
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "deprecated"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"deprecated") y x)
                                  mutable'uninterpretedOption
                        272
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "idempotency_level"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"idempotencyLevel") y x)
                                  mutable'uninterpretedOption
                        282
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "features"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"features") y x)
                                  mutable'uninterpretedOption
                        7994
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "uninterpreted_option"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'uninterpretedOption y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'uninterpretedOption
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'uninterpretedOption <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                               Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'uninterpretedOption)
          "MethodOptions"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view
                    (Data.ProtoLens.Field.field @"maybe'deprecated") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 264)
                       ((Prelude..)
                          Data.ProtoLens.Encoding.Bytes.putVarInt
                          (\ b -> if b then 1 else 0)
                          _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view
                       (Data.ProtoLens.Field.field @"maybe'idempotencyLevel") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 272)
                          ((Prelude..)
                             ((Prelude..)
                                Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                             Prelude.fromEnum
                             _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'features") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 282)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage
                                _v))
                   ((Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                         (\ _v
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt 7994)
                                 ((Prelude..)
                                    (\ bs
                                       -> (Data.Monoid.<>)
                                            (Data.ProtoLens.Encoding.Bytes.putVarInt
                                               (Prelude.fromIntegral (Data.ByteString.length bs)))
                                            (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                    Data.ProtoLens.encodeMessage
                                    _v))
                         (Lens.Family2.view
                            (Data.ProtoLens.Field.field @"vec'uninterpretedOption") _x))
                      (Data.ProtoLens.Encoding.Wire.buildFieldSet
                         (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))
instance Control.DeepSeq.NFData MethodOptions where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_MethodOptions'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_MethodOptions'deprecated x__)
                (Control.DeepSeq.deepseq
                   (_MethodOptions'idempotencyLevel x__)
                   (Control.DeepSeq.deepseq
                      (_MethodOptions'features x__)
                      (Control.DeepSeq.deepseq
                         (_MethodOptions'uninterpretedOption x__) ()))))
data MethodOptions'IdempotencyLevel
  = MethodOptions'IDEMPOTENCY_UNKNOWN |
    MethodOptions'NO_SIDE_EFFECTS |
    MethodOptions'IDEMPOTENT
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum MethodOptions'IdempotencyLevel where
  maybeToEnum 0 = Prelude.Just MethodOptions'IDEMPOTENCY_UNKNOWN
  maybeToEnum 1 = Prelude.Just MethodOptions'NO_SIDE_EFFECTS
  maybeToEnum 2 = Prelude.Just MethodOptions'IDEMPOTENT
  maybeToEnum _ = Prelude.Nothing
  showEnum MethodOptions'IDEMPOTENCY_UNKNOWN = "IDEMPOTENCY_UNKNOWN"
  showEnum MethodOptions'NO_SIDE_EFFECTS = "NO_SIDE_EFFECTS"
  showEnum MethodOptions'IDEMPOTENT = "IDEMPOTENT"
  readEnum k
    | (Prelude.==) k "IDEMPOTENCY_UNKNOWN"
    = Prelude.Just MethodOptions'IDEMPOTENCY_UNKNOWN
    | (Prelude.==) k "NO_SIDE_EFFECTS"
    = Prelude.Just MethodOptions'NO_SIDE_EFFECTS
    | (Prelude.==) k "IDEMPOTENT"
    = Prelude.Just MethodOptions'IDEMPOTENT
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded MethodOptions'IdempotencyLevel where
  minBound = MethodOptions'IDEMPOTENCY_UNKNOWN
  maxBound = MethodOptions'IDEMPOTENT
instance Prelude.Enum MethodOptions'IdempotencyLevel where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum IdempotencyLevel: "
              (Prelude.show k__)))
        Prelude.id
        (Data.ProtoLens.maybeToEnum k__)
  fromEnum MethodOptions'IDEMPOTENCY_UNKNOWN = 0
  fromEnum MethodOptions'NO_SIDE_EFFECTS = 1
  fromEnum MethodOptions'IDEMPOTENT = 2
  succ MethodOptions'IDEMPOTENT
    = Prelude.error
        "MethodOptions'IdempotencyLevel.succ: bad argument MethodOptions'IDEMPOTENT. This value would be out of bounds."
  succ MethodOptions'IDEMPOTENCY_UNKNOWN
    = MethodOptions'NO_SIDE_EFFECTS
  succ MethodOptions'NO_SIDE_EFFECTS = MethodOptions'IDEMPOTENT
  pred MethodOptions'IDEMPOTENCY_UNKNOWN
    = Prelude.error
        "MethodOptions'IdempotencyLevel.pred: bad argument MethodOptions'IDEMPOTENCY_UNKNOWN. This value would be out of bounds."
  pred MethodOptions'NO_SIDE_EFFECTS
    = MethodOptions'IDEMPOTENCY_UNKNOWN
  pred MethodOptions'IDEMPOTENT = MethodOptions'NO_SIDE_EFFECTS
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault MethodOptions'IdempotencyLevel where
  fieldDefault = MethodOptions'IDEMPOTENCY_UNKNOWN
instance Control.DeepSeq.NFData MethodOptions'IdempotencyLevel where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.name' @:: Lens' OneofDescriptorProto Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'name' @:: Lens' OneofDescriptorProto (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.options' @:: Lens' OneofDescriptorProto OneofOptions@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'options' @:: Lens' OneofDescriptorProto (Prelude.Maybe OneofOptions)@ -}
data OneofDescriptorProto
  = OneofDescriptorProto'_constructor {_OneofDescriptorProto'name :: !(Prelude.Maybe Data.Text.Text),
                                       _OneofDescriptorProto'options :: !(Prelude.Maybe OneofOptions),
                                       _OneofDescriptorProto'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show OneofDescriptorProto where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField OneofDescriptorProto "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _OneofDescriptorProto'name
           (\ x__ y__ -> x__ {_OneofDescriptorProto'name = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField OneofDescriptorProto "maybe'name" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _OneofDescriptorProto'name
           (\ x__ y__ -> x__ {_OneofDescriptorProto'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField OneofDescriptorProto "options" OneofOptions where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _OneofDescriptorProto'options
           (\ x__ y__ -> x__ {_OneofDescriptorProto'options = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField OneofDescriptorProto "maybe'options" (Prelude.Maybe OneofOptions) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _OneofDescriptorProto'options
           (\ x__ y__ -> x__ {_OneofDescriptorProto'options = y__}))
        Prelude.id
instance Data.ProtoLens.Message OneofDescriptorProto where
  messageName _
    = Data.Text.pack "google.protobuf.OneofDescriptorProto"
  packedMessageDescriptor _
    = "\n\
      \\DC4OneofDescriptorProto\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC27\n\
      \\aoptions\CAN\STX \SOH(\v2\GS.google.protobuf.OneofOptionsR\aoptions"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'name")) ::
              Data.ProtoLens.FieldDescriptor OneofDescriptorProto
        options__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "options"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor OneofOptions)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'options")) ::
              Data.ProtoLens.FieldDescriptor OneofDescriptorProto
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, name__field_descriptor),
           (Data.ProtoLens.Tag 2, options__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _OneofDescriptorProto'_unknownFields
        (\ x__ y__ -> x__ {_OneofDescriptorProto'_unknownFields = y__})
  defMessage
    = OneofDescriptorProto'_constructor
        {_OneofDescriptorProto'name = Prelude.Nothing,
         _OneofDescriptorProto'options = Prelude.Nothing,
         _OneofDescriptorProto'_unknownFields = []}
  parseMessage
    = let
        loop ::
          OneofDescriptorProto
          -> Data.ProtoLens.Encoding.Bytes.Parser OneofDescriptorProto
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "name"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"name") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "options"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"options") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "OneofDescriptorProto"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'name") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.Text.Encoding.encodeUtf8
                          _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'options") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage
                             _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData OneofDescriptorProto where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_OneofDescriptorProto'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_OneofDescriptorProto'name x__)
                (Control.DeepSeq.deepseq (_OneofDescriptorProto'options x__) ()))
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.features' @:: Lens' OneofOptions FeatureSet@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'features' @:: Lens' OneofOptions (Prelude.Maybe FeatureSet)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.uninterpretedOption' @:: Lens' OneofOptions [UninterpretedOption]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'uninterpretedOption' @:: Lens' OneofOptions (Data.Vector.Vector UninterpretedOption)@ -}
data OneofOptions
  = OneofOptions'_constructor {_OneofOptions'features :: !(Prelude.Maybe FeatureSet),
                               _OneofOptions'uninterpretedOption :: !(Data.Vector.Vector UninterpretedOption),
                               _OneofOptions'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show OneofOptions where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField OneofOptions "features" FeatureSet where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _OneofOptions'features
           (\ x__ y__ -> x__ {_OneofOptions'features = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField OneofOptions "maybe'features" (Prelude.Maybe FeatureSet) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _OneofOptions'features
           (\ x__ y__ -> x__ {_OneofOptions'features = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField OneofOptions "uninterpretedOption" [UninterpretedOption] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _OneofOptions'uninterpretedOption
           (\ x__ y__ -> x__ {_OneofOptions'uninterpretedOption = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField OneofOptions "vec'uninterpretedOption" (Data.Vector.Vector UninterpretedOption) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _OneofOptions'uninterpretedOption
           (\ x__ y__ -> x__ {_OneofOptions'uninterpretedOption = y__}))
        Prelude.id
instance Data.ProtoLens.Message OneofOptions where
  messageName _ = Data.Text.pack "google.protobuf.OneofOptions"
  packedMessageDescriptor _
    = "\n\
      \\fOneofOptions\DC27\n\
      \\bfeatures\CAN\SOH \SOH(\v2\ESC.google.protobuf.FeatureSetR\bfeatures\DC2X\n\
      \\DC4uninterpreted_option\CAN\231\a \ETX(\v2$.google.protobuf.UninterpretedOptionR\DC3uninterpretedOption*\t\b\232\a\DLE\128\128\128\128\STX"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        features__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "features"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor FeatureSet)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'features")) ::
              Data.ProtoLens.FieldDescriptor OneofOptions
        uninterpretedOption__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "uninterpreted_option"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor UninterpretedOption)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"uninterpretedOption")) ::
              Data.ProtoLens.FieldDescriptor OneofOptions
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, features__field_descriptor),
           (Data.ProtoLens.Tag 999, uninterpretedOption__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _OneofOptions'_unknownFields
        (\ x__ y__ -> x__ {_OneofOptions'_unknownFields = y__})
  defMessage
    = OneofOptions'_constructor
        {_OneofOptions'features = Prelude.Nothing,
         _OneofOptions'uninterpretedOption = Data.Vector.Generic.empty,
         _OneofOptions'_unknownFields = []}
  parseMessage
    = let
        loop ::
          OneofOptions
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld UninterpretedOption
             -> Data.ProtoLens.Encoding.Bytes.Parser OneofOptions
        loop x mutable'uninterpretedOption
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'uninterpretedOption <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                      (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                         mutable'uninterpretedOption)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields
                           (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'uninterpretedOption")
                              frozen'uninterpretedOption
                              x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "features"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"features") y x)
                                  mutable'uninterpretedOption
                        7994
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "uninterpreted_option"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'uninterpretedOption y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'uninterpretedOption
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'uninterpretedOption <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                               Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'uninterpretedOption)
          "OneofOptions"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'features") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage
                          _v))
             ((Data.Monoid.<>)
                (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                   (\ _v
                      -> (Data.Monoid.<>)
                           (Data.ProtoLens.Encoding.Bytes.putVarInt 7994)
                           ((Prelude..)
                              (\ bs
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                         (Prelude.fromIntegral (Data.ByteString.length bs)))
                                      (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                              Data.ProtoLens.encodeMessage
                              _v))
                   (Lens.Family2.view
                      (Data.ProtoLens.Field.field @"vec'uninterpretedOption") _x))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData OneofOptions where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_OneofOptions'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_OneofOptions'features x__)
                (Control.DeepSeq.deepseq
                   (_OneofOptions'uninterpretedOption x__) ()))
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.name' @:: Lens' ServiceDescriptorProto Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'name' @:: Lens' ServiceDescriptorProto (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.method' @:: Lens' ServiceDescriptorProto [MethodDescriptorProto]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'method' @:: Lens' ServiceDescriptorProto (Data.Vector.Vector MethodDescriptorProto)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.options' @:: Lens' ServiceDescriptorProto ServiceOptions@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'options' @:: Lens' ServiceDescriptorProto (Prelude.Maybe ServiceOptions)@ -}
data ServiceDescriptorProto
  = ServiceDescriptorProto'_constructor {_ServiceDescriptorProto'name :: !(Prelude.Maybe Data.Text.Text),
                                         _ServiceDescriptorProto'method :: !(Data.Vector.Vector MethodDescriptorProto),
                                         _ServiceDescriptorProto'options :: !(Prelude.Maybe ServiceOptions),
                                         _ServiceDescriptorProto'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ServiceDescriptorProto where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ServiceDescriptorProto "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ServiceDescriptorProto'name
           (\ x__ y__ -> x__ {_ServiceDescriptorProto'name = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField ServiceDescriptorProto "maybe'name" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ServiceDescriptorProto'name
           (\ x__ y__ -> x__ {_ServiceDescriptorProto'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ServiceDescriptorProto "method" [MethodDescriptorProto] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ServiceDescriptorProto'method
           (\ x__ y__ -> x__ {_ServiceDescriptorProto'method = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField ServiceDescriptorProto "vec'method" (Data.Vector.Vector MethodDescriptorProto) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ServiceDescriptorProto'method
           (\ x__ y__ -> x__ {_ServiceDescriptorProto'method = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ServiceDescriptorProto "options" ServiceOptions where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ServiceDescriptorProto'options
           (\ x__ y__ -> x__ {_ServiceDescriptorProto'options = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField ServiceDescriptorProto "maybe'options" (Prelude.Maybe ServiceOptions) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ServiceDescriptorProto'options
           (\ x__ y__ -> x__ {_ServiceDescriptorProto'options = y__}))
        Prelude.id
instance Data.ProtoLens.Message ServiceDescriptorProto where
  messageName _
    = Data.Text.pack "google.protobuf.ServiceDescriptorProto"
  packedMessageDescriptor _
    = "\n\
      \\SYNServiceDescriptorProto\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2>\n\
      \\ACKmethod\CAN\STX \ETX(\v2&.google.protobuf.MethodDescriptorProtoR\ACKmethod\DC29\n\
      \\aoptions\CAN\ETX \SOH(\v2\US.google.protobuf.ServiceOptionsR\aoptions"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'name")) ::
              Data.ProtoLens.FieldDescriptor ServiceDescriptorProto
        method__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "method"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor MethodDescriptorProto)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"method")) ::
              Data.ProtoLens.FieldDescriptor ServiceDescriptorProto
        options__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "options"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ServiceOptions)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'options")) ::
              Data.ProtoLens.FieldDescriptor ServiceDescriptorProto
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, name__field_descriptor),
           (Data.ProtoLens.Tag 2, method__field_descriptor),
           (Data.ProtoLens.Tag 3, options__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ServiceDescriptorProto'_unknownFields
        (\ x__ y__ -> x__ {_ServiceDescriptorProto'_unknownFields = y__})
  defMessage
    = ServiceDescriptorProto'_constructor
        {_ServiceDescriptorProto'name = Prelude.Nothing,
         _ServiceDescriptorProto'method = Data.Vector.Generic.empty,
         _ServiceDescriptorProto'options = Prelude.Nothing,
         _ServiceDescriptorProto'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ServiceDescriptorProto
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld MethodDescriptorProto
             -> Data.ProtoLens.Encoding.Bytes.Parser ServiceDescriptorProto
        loop x mutable'method
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'method <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                         (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                            mutable'method)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields
                           (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'method") frozen'method x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "name"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"name") y x)
                                  mutable'method
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "method"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'method y)
                                loop x v
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "options"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"options") y x)
                                  mutable'method
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'method
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'method <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                  Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'method)
          "ServiceDescriptorProto"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'name") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.Text.Encoding.encodeUtf8
                          _v))
             ((Data.Monoid.<>)
                (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                   (\ _v
                      -> (Data.Monoid.<>)
                           (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                           ((Prelude..)
                              (\ bs
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                         (Prelude.fromIntegral (Data.ByteString.length bs)))
                                      (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                              Data.ProtoLens.encodeMessage
                              _v))
                   (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'method") _x))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'options") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage
                                _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData ServiceDescriptorProto where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ServiceDescriptorProto'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_ServiceDescriptorProto'name x__)
                (Control.DeepSeq.deepseq
                   (_ServiceDescriptorProto'method x__)
                   (Control.DeepSeq.deepseq
                      (_ServiceDescriptorProto'options x__) ())))
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.features' @:: Lens' ServiceOptions FeatureSet@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'features' @:: Lens' ServiceOptions (Prelude.Maybe FeatureSet)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.deprecated' @:: Lens' ServiceOptions Prelude.Bool@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'deprecated' @:: Lens' ServiceOptions (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.uninterpretedOption' @:: Lens' ServiceOptions [UninterpretedOption]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'uninterpretedOption' @:: Lens' ServiceOptions (Data.Vector.Vector UninterpretedOption)@ -}
data ServiceOptions
  = ServiceOptions'_constructor {_ServiceOptions'features :: !(Prelude.Maybe FeatureSet),
                                 _ServiceOptions'deprecated :: !(Prelude.Maybe Prelude.Bool),
                                 _ServiceOptions'uninterpretedOption :: !(Data.Vector.Vector UninterpretedOption),
                                 _ServiceOptions'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ServiceOptions where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ServiceOptions "features" FeatureSet where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ServiceOptions'features
           (\ x__ y__ -> x__ {_ServiceOptions'features = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField ServiceOptions "maybe'features" (Prelude.Maybe FeatureSet) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ServiceOptions'features
           (\ x__ y__ -> x__ {_ServiceOptions'features = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ServiceOptions "deprecated" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ServiceOptions'deprecated
           (\ x__ y__ -> x__ {_ServiceOptions'deprecated = y__}))
        (Data.ProtoLens.maybeLens Prelude.False)
instance Data.ProtoLens.Field.HasField ServiceOptions "maybe'deprecated" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ServiceOptions'deprecated
           (\ x__ y__ -> x__ {_ServiceOptions'deprecated = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ServiceOptions "uninterpretedOption" [UninterpretedOption] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ServiceOptions'uninterpretedOption
           (\ x__ y__ -> x__ {_ServiceOptions'uninterpretedOption = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField ServiceOptions "vec'uninterpretedOption" (Data.Vector.Vector UninterpretedOption) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ServiceOptions'uninterpretedOption
           (\ x__ y__ -> x__ {_ServiceOptions'uninterpretedOption = y__}))
        Prelude.id
instance Data.ProtoLens.Message ServiceOptions where
  messageName _ = Data.Text.pack "google.protobuf.ServiceOptions"
  packedMessageDescriptor _
    = "\n\
      \\SOServiceOptions\DC27\n\
      \\bfeatures\CAN\" \SOH(\v2\ESC.google.protobuf.FeatureSetR\bfeatures\DC2%\n\
      \\n\
      \deprecated\CAN! \SOH(\b:\ENQfalseR\n\
      \deprecated\DC2X\n\
      \\DC4uninterpreted_option\CAN\231\a \ETX(\v2$.google.protobuf.UninterpretedOptionR\DC3uninterpretedOption*\t\b\232\a\DLE\128\128\128\128\STX"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        features__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "features"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor FeatureSet)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'features")) ::
              Data.ProtoLens.FieldDescriptor ServiceOptions
        deprecated__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "deprecated"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'deprecated")) ::
              Data.ProtoLens.FieldDescriptor ServiceOptions
        uninterpretedOption__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "uninterpreted_option"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor UninterpretedOption)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"uninterpretedOption")) ::
              Data.ProtoLens.FieldDescriptor ServiceOptions
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 34, features__field_descriptor),
           (Data.ProtoLens.Tag 33, deprecated__field_descriptor),
           (Data.ProtoLens.Tag 999, uninterpretedOption__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ServiceOptions'_unknownFields
        (\ x__ y__ -> x__ {_ServiceOptions'_unknownFields = y__})
  defMessage
    = ServiceOptions'_constructor
        {_ServiceOptions'features = Prelude.Nothing,
         _ServiceOptions'deprecated = Prelude.Nothing,
         _ServiceOptions'uninterpretedOption = Data.Vector.Generic.empty,
         _ServiceOptions'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ServiceOptions
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld UninterpretedOption
             -> Data.ProtoLens.Encoding.Bytes.Parser ServiceOptions
        loop x mutable'uninterpretedOption
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'uninterpretedOption <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                      (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                         mutable'uninterpretedOption)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields
                           (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'uninterpretedOption")
                              frozen'uninterpretedOption
                              x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        274
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "features"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"features") y x)
                                  mutable'uninterpretedOption
                        264
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "deprecated"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"deprecated") y x)
                                  mutable'uninterpretedOption
                        7994
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "uninterpreted_option"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'uninterpretedOption y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'uninterpretedOption
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'uninterpretedOption <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                               Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'uninterpretedOption)
          "ServiceOptions"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'features") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 274)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage
                          _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view
                       (Data.ProtoLens.Field.field @"maybe'deprecated") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 264)
                          ((Prelude..)
                             Data.ProtoLens.Encoding.Bytes.putVarInt
                             (\ b -> if b then 1 else 0)
                             _v))
                ((Data.Monoid.<>)
                   (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                      (\ _v
                         -> (Data.Monoid.<>)
                              (Data.ProtoLens.Encoding.Bytes.putVarInt 7994)
                              ((Prelude..)
                                 (\ bs
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                            (Prelude.fromIntegral (Data.ByteString.length bs)))
                                         (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                 Data.ProtoLens.encodeMessage
                                 _v))
                      (Lens.Family2.view
                         (Data.ProtoLens.Field.field @"vec'uninterpretedOption") _x))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData ServiceOptions where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ServiceOptions'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_ServiceOptions'features x__)
                (Control.DeepSeq.deepseq
                   (_ServiceOptions'deprecated x__)
                   (Control.DeepSeq.deepseq
                      (_ServiceOptions'uninterpretedOption x__) ())))
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.location' @:: Lens' SourceCodeInfo [SourceCodeInfo'Location]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'location' @:: Lens' SourceCodeInfo (Data.Vector.Vector SourceCodeInfo'Location)@ -}
data SourceCodeInfo
  = SourceCodeInfo'_constructor {_SourceCodeInfo'location :: !(Data.Vector.Vector SourceCodeInfo'Location),
                                 _SourceCodeInfo'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show SourceCodeInfo where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField SourceCodeInfo "location" [SourceCodeInfo'Location] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SourceCodeInfo'location
           (\ x__ y__ -> x__ {_SourceCodeInfo'location = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField SourceCodeInfo "vec'location" (Data.Vector.Vector SourceCodeInfo'Location) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SourceCodeInfo'location
           (\ x__ y__ -> x__ {_SourceCodeInfo'location = y__}))
        Prelude.id
instance Data.ProtoLens.Message SourceCodeInfo where
  messageName _ = Data.Text.pack "google.protobuf.SourceCodeInfo"
  packedMessageDescriptor _
    = "\n\
      \\SOSourceCodeInfo\DC2D\n\
      \\blocation\CAN\SOH \ETX(\v2(.google.protobuf.SourceCodeInfo.LocationR\blocation\SUB\206\SOH\n\
      \\bLocation\DC2\SYN\n\
      \\EOTpath\CAN\SOH \ETX(\ENQR\EOTpathB\STX\DLE\SOH\DC2\SYN\n\
      \\EOTspan\CAN\STX \ETX(\ENQR\EOTspanB\STX\DLE\SOH\DC2)\n\
      \\DLEleading_comments\CAN\ETX \SOH(\tR\SIleadingComments\DC2+\n\
      \\DC1trailing_comments\CAN\EOT \SOH(\tR\DLEtrailingComments\DC2:\n\
      \\EMleading_detached_comments\CAN\ACK \ETX(\tR\ETBleadingDetachedComments"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        location__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "location"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor SourceCodeInfo'Location)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"location")) ::
              Data.ProtoLens.FieldDescriptor SourceCodeInfo
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, location__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SourceCodeInfo'_unknownFields
        (\ x__ y__ -> x__ {_SourceCodeInfo'_unknownFields = y__})
  defMessage
    = SourceCodeInfo'_constructor
        {_SourceCodeInfo'location = Data.Vector.Generic.empty,
         _SourceCodeInfo'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SourceCodeInfo
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld SourceCodeInfo'Location
             -> Data.ProtoLens.Encoding.Bytes.Parser SourceCodeInfo
        loop x mutable'location
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'location <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                           (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                              mutable'location)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields
                           (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'location") frozen'location x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "location"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'location y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'location
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'location <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                    Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'location)
          "SourceCodeInfo"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                (\ _v
                   -> (Data.Monoid.<>)
                        (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                        ((Prelude..)
                           (\ bs
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (Prelude.fromIntegral (Data.ByteString.length bs)))
                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           Data.ProtoLens.encodeMessage
                           _v))
                (Lens.Family2.view
                   (Data.ProtoLens.Field.field @"vec'location") _x))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData SourceCodeInfo where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SourceCodeInfo'_unknownFields x__)
             (Control.DeepSeq.deepseq (_SourceCodeInfo'location x__) ())
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.path' @:: Lens' SourceCodeInfo'Location [Data.Int.Int32]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'path' @:: Lens' SourceCodeInfo'Location (Data.Vector.Unboxed.Vector Data.Int.Int32)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.span' @:: Lens' SourceCodeInfo'Location [Data.Int.Int32]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'span' @:: Lens' SourceCodeInfo'Location (Data.Vector.Unboxed.Vector Data.Int.Int32)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.leadingComments' @:: Lens' SourceCodeInfo'Location Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'leadingComments' @:: Lens' SourceCodeInfo'Location (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.trailingComments' @:: Lens' SourceCodeInfo'Location Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'trailingComments' @:: Lens' SourceCodeInfo'Location (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.leadingDetachedComments' @:: Lens' SourceCodeInfo'Location [Data.Text.Text]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'leadingDetachedComments' @:: Lens' SourceCodeInfo'Location (Data.Vector.Vector Data.Text.Text)@ -}
data SourceCodeInfo'Location
  = SourceCodeInfo'Location'_constructor {_SourceCodeInfo'Location'path :: !(Data.Vector.Unboxed.Vector Data.Int.Int32),
                                          _SourceCodeInfo'Location'span :: !(Data.Vector.Unboxed.Vector Data.Int.Int32),
                                          _SourceCodeInfo'Location'leadingComments :: !(Prelude.Maybe Data.Text.Text),
                                          _SourceCodeInfo'Location'trailingComments :: !(Prelude.Maybe Data.Text.Text),
                                          _SourceCodeInfo'Location'leadingDetachedComments :: !(Data.Vector.Vector Data.Text.Text),
                                          _SourceCodeInfo'Location'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show SourceCodeInfo'Location where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField SourceCodeInfo'Location "path" [Data.Int.Int32] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SourceCodeInfo'Location'path
           (\ x__ y__ -> x__ {_SourceCodeInfo'Location'path = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField SourceCodeInfo'Location "vec'path" (Data.Vector.Unboxed.Vector Data.Int.Int32) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SourceCodeInfo'Location'path
           (\ x__ y__ -> x__ {_SourceCodeInfo'Location'path = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SourceCodeInfo'Location "span" [Data.Int.Int32] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SourceCodeInfo'Location'span
           (\ x__ y__ -> x__ {_SourceCodeInfo'Location'span = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField SourceCodeInfo'Location "vec'span" (Data.Vector.Unboxed.Vector Data.Int.Int32) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SourceCodeInfo'Location'span
           (\ x__ y__ -> x__ {_SourceCodeInfo'Location'span = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SourceCodeInfo'Location "leadingComments" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SourceCodeInfo'Location'leadingComments
           (\ x__ y__
              -> x__ {_SourceCodeInfo'Location'leadingComments = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField SourceCodeInfo'Location "maybe'leadingComments" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SourceCodeInfo'Location'leadingComments
           (\ x__ y__
              -> x__ {_SourceCodeInfo'Location'leadingComments = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SourceCodeInfo'Location "trailingComments" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SourceCodeInfo'Location'trailingComments
           (\ x__ y__
              -> x__ {_SourceCodeInfo'Location'trailingComments = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField SourceCodeInfo'Location "maybe'trailingComments" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SourceCodeInfo'Location'trailingComments
           (\ x__ y__
              -> x__ {_SourceCodeInfo'Location'trailingComments = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SourceCodeInfo'Location "leadingDetachedComments" [Data.Text.Text] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SourceCodeInfo'Location'leadingDetachedComments
           (\ x__ y__
              -> x__ {_SourceCodeInfo'Location'leadingDetachedComments = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField SourceCodeInfo'Location "vec'leadingDetachedComments" (Data.Vector.Vector Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SourceCodeInfo'Location'leadingDetachedComments
           (\ x__ y__
              -> x__ {_SourceCodeInfo'Location'leadingDetachedComments = y__}))
        Prelude.id
instance Data.ProtoLens.Message SourceCodeInfo'Location where
  messageName _
    = Data.Text.pack "google.protobuf.SourceCodeInfo.Location"
  packedMessageDescriptor _
    = "\n\
      \\bLocation\DC2\SYN\n\
      \\EOTpath\CAN\SOH \ETX(\ENQR\EOTpathB\STX\DLE\SOH\DC2\SYN\n\
      \\EOTspan\CAN\STX \ETX(\ENQR\EOTspanB\STX\DLE\SOH\DC2)\n\
      \\DLEleading_comments\CAN\ETX \SOH(\tR\SIleadingComments\DC2+\n\
      \\DC1trailing_comments\CAN\EOT \SOH(\tR\DLEtrailingComments\DC2:\n\
      \\EMleading_detached_comments\CAN\ACK \ETX(\tR\ETBleadingDetachedComments"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        path__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "path"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Packed (Data.ProtoLens.Field.field @"path")) ::
              Data.ProtoLens.FieldDescriptor SourceCodeInfo'Location
        span__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "span"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Packed (Data.ProtoLens.Field.field @"span")) ::
              Data.ProtoLens.FieldDescriptor SourceCodeInfo'Location
        leadingComments__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "leading_comments"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'leadingComments")) ::
              Data.ProtoLens.FieldDescriptor SourceCodeInfo'Location
        trailingComments__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "trailing_comments"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'trailingComments")) ::
              Data.ProtoLens.FieldDescriptor SourceCodeInfo'Location
        leadingDetachedComments__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "leading_detached_comments"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"leadingDetachedComments")) ::
              Data.ProtoLens.FieldDescriptor SourceCodeInfo'Location
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, path__field_descriptor),
           (Data.ProtoLens.Tag 2, span__field_descriptor),
           (Data.ProtoLens.Tag 3, leadingComments__field_descriptor),
           (Data.ProtoLens.Tag 4, trailingComments__field_descriptor),
           (Data.ProtoLens.Tag 6, leadingDetachedComments__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SourceCodeInfo'Location'_unknownFields
        (\ x__ y__ -> x__ {_SourceCodeInfo'Location'_unknownFields = y__})
  defMessage
    = SourceCodeInfo'Location'_constructor
        {_SourceCodeInfo'Location'path = Data.Vector.Generic.empty,
         _SourceCodeInfo'Location'span = Data.Vector.Generic.empty,
         _SourceCodeInfo'Location'leadingComments = Prelude.Nothing,
         _SourceCodeInfo'Location'trailingComments = Prelude.Nothing,
         _SourceCodeInfo'Location'leadingDetachedComments = Data.Vector.Generic.empty,
         _SourceCodeInfo'Location'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SourceCodeInfo'Location
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Text.Text
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Unboxed.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Int.Int32
                -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Unboxed.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Int.Int32
                   -> Data.ProtoLens.Encoding.Bytes.Parser SourceCodeInfo'Location
        loop x mutable'leadingDetachedComments mutable'path mutable'span
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'leadingDetachedComments <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                          (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                             mutable'leadingDetachedComments)
                      frozen'path <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'path)
                      frozen'span <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'span)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields
                           (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'leadingDetachedComments")
                              frozen'leadingDetachedComments
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'path")
                                 frozen'path
                                 (Lens.Family2.set
                                    (Data.ProtoLens.Field.field @"vec'span") frozen'span x))))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (Prelude.fmap
                                           Prelude.fromIntegral
                                           Data.ProtoLens.Encoding.Bytes.getVarInt)
                                        "path"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'path y)
                                loop x mutable'leadingDetachedComments v mutable'span
                        10
                          -> do y <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                        Data.ProtoLens.Encoding.Bytes.isolate
                                          (Prelude.fromIntegral len)
                                          ((let
                                              ploop qs
                                                = do packedEnd <- Data.ProtoLens.Encoding.Bytes.atEnd
                                                     if packedEnd then
                                                         Prelude.return qs
                                                     else
                                                         do !q <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                                                    (Prelude.fmap
                                                                       Prelude.fromIntegral
                                                                       Data.ProtoLens.Encoding.Bytes.getVarInt)
                                                                    "path"
                                                            qs' <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                                     (Data.ProtoLens.Encoding.Growing.append
                                                                        qs q)
                                                            ploop qs'
                                            in ploop)
                                             mutable'path)
                                loop x mutable'leadingDetachedComments y mutable'span
                        16
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (Prelude.fmap
                                           Prelude.fromIntegral
                                           Data.ProtoLens.Encoding.Bytes.getVarInt)
                                        "span"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'span y)
                                loop x mutable'leadingDetachedComments mutable'path v
                        18
                          -> do y <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                        Data.ProtoLens.Encoding.Bytes.isolate
                                          (Prelude.fromIntegral len)
                                          ((let
                                              ploop qs
                                                = do packedEnd <- Data.ProtoLens.Encoding.Bytes.atEnd
                                                     if packedEnd then
                                                         Prelude.return qs
                                                     else
                                                         do !q <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                                                    (Prelude.fmap
                                                                       Prelude.fromIntegral
                                                                       Data.ProtoLens.Encoding.Bytes.getVarInt)
                                                                    "span"
                                                            qs' <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                                     (Data.ProtoLens.Encoding.Growing.append
                                                                        qs q)
                                                            ploop qs'
                                            in ploop)
                                             mutable'span)
                                loop x mutable'leadingDetachedComments mutable'path y
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "leading_comments"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"leadingComments") y x)
                                  mutable'leadingDetachedComments
                                  mutable'path
                                  mutable'span
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "trailing_comments"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"trailingComments") y x)
                                  mutable'leadingDetachedComments
                                  mutable'path
                                  mutable'span
                        50
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.getText
                                              (Prelude.fromIntegral len))
                                        "leading_detached_comments"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'leadingDetachedComments y)
                                loop x v mutable'path mutable'span
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'leadingDetachedComments
                                  mutable'path
                                  mutable'span
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'leadingDetachedComments <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                   Data.ProtoLens.Encoding.Growing.new
              mutable'path <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                Data.ProtoLens.Encoding.Growing.new
              mutable'span <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                Data.ProtoLens.Encoding.Growing.new
              loop
                Data.ProtoLens.defMessage
                mutable'leadingDetachedComments
                mutable'path
                mutable'span)
          "Location"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                p = Lens.Family2.view (Data.ProtoLens.Field.field @"vec'path") _x
              in
                if Data.Vector.Generic.null p then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((\ bs
                          -> (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (Prelude.fromIntegral (Data.ByteString.length bs)))
                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         (Data.ProtoLens.Encoding.Bytes.runBuilder
                            (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                               ((Prelude..)
                                  Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                               p))))
             ((Data.Monoid.<>)
                (let
                   p = Lens.Family2.view (Data.ProtoLens.Field.field @"vec'span") _x
                 in
                   if Data.Vector.Generic.null p then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            (Data.ProtoLens.Encoding.Bytes.runBuilder
                               (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                                  ((Prelude..)
                                     Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                                  p))))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view
                          (Data.ProtoLens.Field.field @"maybe'leadingComments") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.Text.Encoding.encodeUtf8
                                _v))
                   ((Data.Monoid.<>)
                      (case
                           Lens.Family2.view
                             (Data.ProtoLens.Field.field @"maybe'trailingComments") _x
                       of
                         Prelude.Nothing -> Data.Monoid.mempty
                         (Prelude.Just _v)
                           -> (Data.Monoid.<>)
                                (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                                ((Prelude..)
                                   (\ bs
                                      -> (Data.Monoid.<>)
                                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                                              (Prelude.fromIntegral (Data.ByteString.length bs)))
                                           (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                   Data.Text.Encoding.encodeUtf8
                                   _v))
                      ((Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                            (\ _v
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt 50)
                                    ((Prelude..)
                                       (\ bs
                                          -> (Data.Monoid.<>)
                                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                  (Prelude.fromIntegral
                                                     (Data.ByteString.length bs)))
                                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                       Data.Text.Encoding.encodeUtf8
                                       _v))
                            (Lens.Family2.view
                               (Data.ProtoLens.Field.field @"vec'leadingDetachedComments") _x))
                         (Data.ProtoLens.Encoding.Wire.buildFieldSet
                            (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))
instance Control.DeepSeq.NFData SourceCodeInfo'Location where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SourceCodeInfo'Location'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_SourceCodeInfo'Location'path x__)
                (Control.DeepSeq.deepseq
                   (_SourceCodeInfo'Location'span x__)
                   (Control.DeepSeq.deepseq
                      (_SourceCodeInfo'Location'leadingComments x__)
                      (Control.DeepSeq.deepseq
                         (_SourceCodeInfo'Location'trailingComments x__)
                         (Control.DeepSeq.deepseq
                            (_SourceCodeInfo'Location'leadingDetachedComments x__) ())))))
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.name' @:: Lens' UninterpretedOption [UninterpretedOption'NamePart]@
         * 'Proto.Google.Protobuf.Descriptor_Fields.vec'name' @:: Lens' UninterpretedOption (Data.Vector.Vector UninterpretedOption'NamePart)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.identifierValue' @:: Lens' UninterpretedOption Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'identifierValue' @:: Lens' UninterpretedOption (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.positiveIntValue' @:: Lens' UninterpretedOption Data.Word.Word64@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'positiveIntValue' @:: Lens' UninterpretedOption (Prelude.Maybe Data.Word.Word64)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.negativeIntValue' @:: Lens' UninterpretedOption Data.Int.Int64@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'negativeIntValue' @:: Lens' UninterpretedOption (Prelude.Maybe Data.Int.Int64)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.doubleValue' @:: Lens' UninterpretedOption Prelude.Double@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'doubleValue' @:: Lens' UninterpretedOption (Prelude.Maybe Prelude.Double)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.stringValue' @:: Lens' UninterpretedOption Data.ByteString.ByteString@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'stringValue' @:: Lens' UninterpretedOption (Prelude.Maybe Data.ByteString.ByteString)@
         * 'Proto.Google.Protobuf.Descriptor_Fields.aggregateValue' @:: Lens' UninterpretedOption Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.maybe'aggregateValue' @:: Lens' UninterpretedOption (Prelude.Maybe Data.Text.Text)@ -}
data UninterpretedOption
  = UninterpretedOption'_constructor {_UninterpretedOption'name :: !(Data.Vector.Vector UninterpretedOption'NamePart),
                                      _UninterpretedOption'identifierValue :: !(Prelude.Maybe Data.Text.Text),
                                      _UninterpretedOption'positiveIntValue :: !(Prelude.Maybe Data.Word.Word64),
                                      _UninterpretedOption'negativeIntValue :: !(Prelude.Maybe Data.Int.Int64),
                                      _UninterpretedOption'doubleValue :: !(Prelude.Maybe Prelude.Double),
                                      _UninterpretedOption'stringValue :: !(Prelude.Maybe Data.ByteString.ByteString),
                                      _UninterpretedOption'aggregateValue :: !(Prelude.Maybe Data.Text.Text),
                                      _UninterpretedOption'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show UninterpretedOption where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField UninterpretedOption "name" [UninterpretedOption'NamePart] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UninterpretedOption'name
           (\ x__ y__ -> x__ {_UninterpretedOption'name = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField UninterpretedOption "vec'name" (Data.Vector.Vector UninterpretedOption'NamePart) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UninterpretedOption'name
           (\ x__ y__ -> x__ {_UninterpretedOption'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField UninterpretedOption "identifierValue" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UninterpretedOption'identifierValue
           (\ x__ y__ -> x__ {_UninterpretedOption'identifierValue = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField UninterpretedOption "maybe'identifierValue" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UninterpretedOption'identifierValue
           (\ x__ y__ -> x__ {_UninterpretedOption'identifierValue = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField UninterpretedOption "positiveIntValue" Data.Word.Word64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UninterpretedOption'positiveIntValue
           (\ x__ y__ -> x__ {_UninterpretedOption'positiveIntValue = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField UninterpretedOption "maybe'positiveIntValue" (Prelude.Maybe Data.Word.Word64) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UninterpretedOption'positiveIntValue
           (\ x__ y__ -> x__ {_UninterpretedOption'positiveIntValue = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField UninterpretedOption "negativeIntValue" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UninterpretedOption'negativeIntValue
           (\ x__ y__ -> x__ {_UninterpretedOption'negativeIntValue = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField UninterpretedOption "maybe'negativeIntValue" (Prelude.Maybe Data.Int.Int64) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UninterpretedOption'negativeIntValue
           (\ x__ y__ -> x__ {_UninterpretedOption'negativeIntValue = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField UninterpretedOption "doubleValue" Prelude.Double where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UninterpretedOption'doubleValue
           (\ x__ y__ -> x__ {_UninterpretedOption'doubleValue = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField UninterpretedOption "maybe'doubleValue" (Prelude.Maybe Prelude.Double) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UninterpretedOption'doubleValue
           (\ x__ y__ -> x__ {_UninterpretedOption'doubleValue = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField UninterpretedOption "stringValue" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UninterpretedOption'stringValue
           (\ x__ y__ -> x__ {_UninterpretedOption'stringValue = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField UninterpretedOption "maybe'stringValue" (Prelude.Maybe Data.ByteString.ByteString) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UninterpretedOption'stringValue
           (\ x__ y__ -> x__ {_UninterpretedOption'stringValue = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField UninterpretedOption "aggregateValue" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UninterpretedOption'aggregateValue
           (\ x__ y__ -> x__ {_UninterpretedOption'aggregateValue = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField UninterpretedOption "maybe'aggregateValue" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UninterpretedOption'aggregateValue
           (\ x__ y__ -> x__ {_UninterpretedOption'aggregateValue = y__}))
        Prelude.id
instance Data.ProtoLens.Message UninterpretedOption where
  messageName _
    = Data.Text.pack "google.protobuf.UninterpretedOption"
  packedMessageDescriptor _
    = "\n\
      \\DC3UninterpretedOption\DC2A\n\
      \\EOTname\CAN\STX \ETX(\v2-.google.protobuf.UninterpretedOption.NamePartR\EOTname\DC2)\n\
      \\DLEidentifier_value\CAN\ETX \SOH(\tR\SIidentifierValue\DC2,\n\
      \\DC2positive_int_value\CAN\EOT \SOH(\EOTR\DLEpositiveIntValue\DC2,\n\
      \\DC2negative_int_value\CAN\ENQ \SOH(\ETXR\DLEnegativeIntValue\DC2!\n\
      \\fdouble_value\CAN\ACK \SOH(\SOHR\vdoubleValue\DC2!\n\
      \\fstring_value\CAN\a \SOH(\fR\vstringValue\DC2'\n\
      \\SIaggregate_value\CAN\b \SOH(\tR\SOaggregateValue\SUBJ\n\
      \\bNamePart\DC2\ESC\n\
      \\tname_part\CAN\SOH \STX(\tR\bnamePart\DC2!\n\
      \\fis_extension\CAN\STX \STX(\bR\visExtension"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor UninterpretedOption'NamePart)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"name")) ::
              Data.ProtoLens.FieldDescriptor UninterpretedOption
        identifierValue__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "identifier_value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'identifierValue")) ::
              Data.ProtoLens.FieldDescriptor UninterpretedOption
        positiveIntValue__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "positive_int_value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'positiveIntValue")) ::
              Data.ProtoLens.FieldDescriptor UninterpretedOption
        negativeIntValue__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "negative_int_value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'negativeIntValue")) ::
              Data.ProtoLens.FieldDescriptor UninterpretedOption
        doubleValue__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "double_value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.DoubleField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Double)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'doubleValue")) ::
              Data.ProtoLens.FieldDescriptor UninterpretedOption
        stringValue__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "string_value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'stringValue")) ::
              Data.ProtoLens.FieldDescriptor UninterpretedOption
        aggregateValue__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "aggregate_value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'aggregateValue")) ::
              Data.ProtoLens.FieldDescriptor UninterpretedOption
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 2, name__field_descriptor),
           (Data.ProtoLens.Tag 3, identifierValue__field_descriptor),
           (Data.ProtoLens.Tag 4, positiveIntValue__field_descriptor),
           (Data.ProtoLens.Tag 5, negativeIntValue__field_descriptor),
           (Data.ProtoLens.Tag 6, doubleValue__field_descriptor),
           (Data.ProtoLens.Tag 7, stringValue__field_descriptor),
           (Data.ProtoLens.Tag 8, aggregateValue__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _UninterpretedOption'_unknownFields
        (\ x__ y__ -> x__ {_UninterpretedOption'_unknownFields = y__})
  defMessage
    = UninterpretedOption'_constructor
        {_UninterpretedOption'name = Data.Vector.Generic.empty,
         _UninterpretedOption'identifierValue = Prelude.Nothing,
         _UninterpretedOption'positiveIntValue = Prelude.Nothing,
         _UninterpretedOption'negativeIntValue = Prelude.Nothing,
         _UninterpretedOption'doubleValue = Prelude.Nothing,
         _UninterpretedOption'stringValue = Prelude.Nothing,
         _UninterpretedOption'aggregateValue = Prelude.Nothing,
         _UninterpretedOption'_unknownFields = []}
  parseMessage
    = let
        loop ::
          UninterpretedOption
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld UninterpretedOption'NamePart
             -> Data.ProtoLens.Encoding.Bytes.Parser UninterpretedOption
        loop x mutable'name
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'name <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'name)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields
                           (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'name") frozen'name x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "name"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'name y)
                                loop x v
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "identifier_value"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"identifierValue") y x)
                                  mutable'name
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       Data.ProtoLens.Encoding.Bytes.getVarInt "positive_int_value"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"positiveIntValue") y x)
                                  mutable'name
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "negative_int_value"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"negativeIntValue") y x)
                                  mutable'name
                        49
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Data.ProtoLens.Encoding.Bytes.wordToDouble
                                          Data.ProtoLens.Encoding.Bytes.getFixed64)
                                       "double_value"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"doubleValue") y x)
                                  mutable'name
                        58
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "string_value"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"stringValue") y x)
                                  mutable'name
                        66
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "aggregate_value"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"aggregateValue") y x)
                                  mutable'name
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'name
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'name <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'name)
          "UninterpretedOption"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                (\ _v
                   -> (Data.Monoid.<>)
                        (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                        ((Prelude..)
                           (\ bs
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (Prelude.fromIntegral (Data.ByteString.length bs)))
                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           Data.ProtoLens.encodeMessage
                           _v))
                (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'name") _x))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view
                       (Data.ProtoLens.Field.field @"maybe'identifierValue") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.Text.Encoding.encodeUtf8
                             _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view
                          (Data.ProtoLens.Field.field @"maybe'positiveIntValue") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt _v))
                   ((Data.Monoid.<>)
                      (case
                           Lens.Family2.view
                             (Data.ProtoLens.Field.field @"maybe'negativeIntValue") _x
                       of
                         Prelude.Nothing -> Data.Monoid.mempty
                         (Prelude.Just _v)
                           -> (Data.Monoid.<>)
                                (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                ((Prelude..)
                                   Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                      ((Data.Monoid.<>)
                         (case
                              Lens.Family2.view
                                (Data.ProtoLens.Field.field @"maybe'doubleValue") _x
                          of
                            Prelude.Nothing -> Data.Monoid.mempty
                            (Prelude.Just _v)
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt 49)
                                   ((Prelude..)
                                      Data.ProtoLens.Encoding.Bytes.putFixed64
                                      Data.ProtoLens.Encoding.Bytes.doubleToWord
                                      _v))
                         ((Data.Monoid.<>)
                            (case
                                 Lens.Family2.view
                                   (Data.ProtoLens.Field.field @"maybe'stringValue") _x
                             of
                               Prelude.Nothing -> Data.Monoid.mempty
                               (Prelude.Just _v)
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt 58)
                                      ((\ bs
                                          -> (Data.Monoid.<>)
                                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                  (Prelude.fromIntegral
                                                     (Data.ByteString.length bs)))
                                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                         _v))
                            ((Data.Monoid.<>)
                               (case
                                    Lens.Family2.view
                                      (Data.ProtoLens.Field.field @"maybe'aggregateValue") _x
                                of
                                  Prelude.Nothing -> Data.Monoid.mempty
                                  (Prelude.Just _v)
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt 66)
                                         ((Prelude..)
                                            (\ bs
                                               -> (Data.Monoid.<>)
                                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                       (Prelude.fromIntegral
                                                          (Data.ByteString.length bs)))
                                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                            Data.Text.Encoding.encodeUtf8
                                            _v))
                               (Data.ProtoLens.Encoding.Wire.buildFieldSet
                                  (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))))
instance Control.DeepSeq.NFData UninterpretedOption where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_UninterpretedOption'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_UninterpretedOption'name x__)
                (Control.DeepSeq.deepseq
                   (_UninterpretedOption'identifierValue x__)
                   (Control.DeepSeq.deepseq
                      (_UninterpretedOption'positiveIntValue x__)
                      (Control.DeepSeq.deepseq
                         (_UninterpretedOption'negativeIntValue x__)
                         (Control.DeepSeq.deepseq
                            (_UninterpretedOption'doubleValue x__)
                            (Control.DeepSeq.deepseq
                               (_UninterpretedOption'stringValue x__)
                               (Control.DeepSeq.deepseq
                                  (_UninterpretedOption'aggregateValue x__) ())))))))
{- | Fields :
     
         * 'Proto.Google.Protobuf.Descriptor_Fields.namePart' @:: Lens' UninterpretedOption'NamePart Data.Text.Text@
         * 'Proto.Google.Protobuf.Descriptor_Fields.isExtension' @:: Lens' UninterpretedOption'NamePart Prelude.Bool@ -}
data UninterpretedOption'NamePart
  = UninterpretedOption'NamePart'_constructor {_UninterpretedOption'NamePart'namePart :: !Data.Text.Text,
                                               _UninterpretedOption'NamePart'isExtension :: !Prelude.Bool,
                                               _UninterpretedOption'NamePart'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show UninterpretedOption'NamePart where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField UninterpretedOption'NamePart "namePart" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UninterpretedOption'NamePart'namePart
           (\ x__ y__ -> x__ {_UninterpretedOption'NamePart'namePart = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField UninterpretedOption'NamePart "isExtension" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UninterpretedOption'NamePart'isExtension
           (\ x__ y__
              -> x__ {_UninterpretedOption'NamePart'isExtension = y__}))
        Prelude.id
instance Data.ProtoLens.Message UninterpretedOption'NamePart where
  messageName _
    = Data.Text.pack "google.protobuf.UninterpretedOption.NamePart"
  packedMessageDescriptor _
    = "\n\
      \\bNamePart\DC2\ESC\n\
      \\tname_part\CAN\SOH \STX(\tR\bnamePart\DC2!\n\
      \\fis_extension\CAN\STX \STX(\bR\visExtension"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        namePart__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name_part"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Required
                 (Data.ProtoLens.Field.field @"namePart")) ::
              Data.ProtoLens.FieldDescriptor UninterpretedOption'NamePart
        isExtension__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "is_extension"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Required
                 (Data.ProtoLens.Field.field @"isExtension")) ::
              Data.ProtoLens.FieldDescriptor UninterpretedOption'NamePart
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, namePart__field_descriptor),
           (Data.ProtoLens.Tag 2, isExtension__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _UninterpretedOption'NamePart'_unknownFields
        (\ x__ y__
           -> x__ {_UninterpretedOption'NamePart'_unknownFields = y__})
  defMessage
    = UninterpretedOption'NamePart'_constructor
        {_UninterpretedOption'NamePart'namePart = Data.ProtoLens.fieldDefault,
         _UninterpretedOption'NamePart'isExtension = Data.ProtoLens.fieldDefault,
         _UninterpretedOption'NamePart'_unknownFields = []}
  parseMessage
    = let
        loop ::
          UninterpretedOption'NamePart
          -> Prelude.Bool
             -> Prelude.Bool
                -> Data.ProtoLens.Encoding.Bytes.Parser UninterpretedOption'NamePart
        loop x required'isExtension required'namePart
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let
                         missing
                           = (if required'isExtension then (:) "is_extension" else Prelude.id)
                               ((if required'namePart then (:) "name_part" else Prelude.id) [])
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "name_part"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"namePart") y x)
                                  required'isExtension
                                  Prelude.False
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "is_extension"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"isExtension") y x)
                                  Prelude.False
                                  required'namePart
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  required'isExtension
                                  required'namePart
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage Prelude.True Prelude.True)
          "NamePart"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             ((Data.Monoid.<>)
                (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                ((Prelude..)
                   (\ bs
                      -> (Data.Monoid.<>)
                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                              (Prelude.fromIntegral (Data.ByteString.length bs)))
                           (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                   Data.Text.Encoding.encodeUtf8
                   (Lens.Family2.view (Data.ProtoLens.Field.field @"namePart") _x)))
             ((Data.Monoid.<>)
                ((Data.Monoid.<>)
                   (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                   ((Prelude..)
                      Data.ProtoLens.Encoding.Bytes.putVarInt
                      (\ b -> if b then 1 else 0)
                      (Lens.Family2.view
                         (Data.ProtoLens.Field.field @"isExtension") _x)))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData UninterpretedOption'NamePart where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_UninterpretedOption'NamePart'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_UninterpretedOption'NamePart'namePart x__)
                (Control.DeepSeq.deepseq
                   (_UninterpretedOption'NamePart'isExtension x__) ()))
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \ google/protobuf/descriptor.proto\DC2\SIgoogle.protobuf\"M\n\
    \\DC1FileDescriptorSet\DC28\n\
    \\EOTfile\CAN\SOH \ETX(\v2$.google.protobuf.FileDescriptorProtoR\EOTfile\"\152\ENQ\n\
    \\DC3FileDescriptorProto\DC2\DC2\n\
    \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2\CAN\n\
    \\apackage\CAN\STX \SOH(\tR\apackage\DC2\RS\n\
    \\n\
    \dependency\CAN\ETX \ETX(\tR\n\
    \dependency\DC2+\n\
    \\DC1public_dependency\CAN\n\
    \ \ETX(\ENQR\DLEpublicDependency\DC2'\n\
    \\SIweak_dependency\CAN\v \ETX(\ENQR\SOweakDependency\DC2C\n\
    \\fmessage_type\CAN\EOT \ETX(\v2 .google.protobuf.DescriptorProtoR\vmessageType\DC2A\n\
    \\tenum_type\CAN\ENQ \ETX(\v2$.google.protobuf.EnumDescriptorProtoR\benumType\DC2A\n\
    \\aservice\CAN\ACK \ETX(\v2'.google.protobuf.ServiceDescriptorProtoR\aservice\DC2C\n\
    \\textension\CAN\a \ETX(\v2%.google.protobuf.FieldDescriptorProtoR\textension\DC26\n\
    \\aoptions\CAN\b \SOH(\v2\FS.google.protobuf.FileOptionsR\aoptions\DC2I\n\
    \\DLEsource_code_info\CAN\t \SOH(\v2\US.google.protobuf.SourceCodeInfoR\SOsourceCodeInfo\DC2\SYN\n\
    \\ACKsyntax\CAN\f \SOH(\tR\ACKsyntax\DC22\n\
    \\aedition\CAN\SO \SOH(\SO2\CAN.google.protobuf.EditionR\aedition\"\185\ACK\n\
    \\SIDescriptorProto\DC2\DC2\n\
    \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2;\n\
    \\ENQfield\CAN\STX \ETX(\v2%.google.protobuf.FieldDescriptorProtoR\ENQfield\DC2C\n\
    \\textension\CAN\ACK \ETX(\v2%.google.protobuf.FieldDescriptorProtoR\textension\DC2A\n\
    \\vnested_type\CAN\ETX \ETX(\v2 .google.protobuf.DescriptorProtoR\n\
    \nestedType\DC2A\n\
    \\tenum_type\CAN\EOT \ETX(\v2$.google.protobuf.EnumDescriptorProtoR\benumType\DC2X\n\
    \\SIextension_range\CAN\ENQ \ETX(\v2/.google.protobuf.DescriptorProto.ExtensionRangeR\SOextensionRange\DC2D\n\
    \\n\
    \oneof_decl\CAN\b \ETX(\v2%.google.protobuf.OneofDescriptorProtoR\toneofDecl\DC29\n\
    \\aoptions\CAN\a \SOH(\v2\US.google.protobuf.MessageOptionsR\aoptions\DC2U\n\
    \\SOreserved_range\CAN\t \ETX(\v2..google.protobuf.DescriptorProto.ReservedRangeR\rreservedRange\DC2#\n\
    \\rreserved_name\CAN\n\
    \ \ETX(\tR\freservedName\SUBz\n\
    \\SOExtensionRange\DC2\DC4\n\
    \\ENQstart\CAN\SOH \SOH(\ENQR\ENQstart\DC2\DLE\n\
    \\ETXend\CAN\STX \SOH(\ENQR\ETXend\DC2@\n\
    \\aoptions\CAN\ETX \SOH(\v2&.google.protobuf.ExtensionRangeOptionsR\aoptions\SUB7\n\
    \\rReservedRange\DC2\DC4\n\
    \\ENQstart\CAN\SOH \SOH(\ENQR\ENQstart\DC2\DLE\n\
    \\ETXend\CAN\STX \SOH(\ENQR\ETXend\"\204\EOT\n\
    \\NAKExtensionRangeOptions\DC2X\n\
    \\DC4uninterpreted_option\CAN\231\a \ETX(\v2$.google.protobuf.UninterpretedOptionR\DC3uninterpretedOption\DC2Y\n\
    \\vdeclaration\CAN\STX \ETX(\v22.google.protobuf.ExtensionRangeOptions.DeclarationR\vdeclarationB\ETX\136\SOH\STX\DC27\n\
    \\bfeatures\CAN2 \SOH(\v2\ESC.google.protobuf.FeatureSetR\bfeatures\DC2m\n\
    \\fverification\CAN\ETX \SOH(\SO28.google.protobuf.ExtensionRangeOptions.VerificationState:\n\
    \UNVERIFIEDR\fverificationB\ETX\136\SOH\STX\SUB\148\SOH\n\
    \\vDeclaration\DC2\SYN\n\
    \\ACKnumber\CAN\SOH \SOH(\ENQR\ACKnumber\DC2\ESC\n\
    \\tfull_name\CAN\STX \SOH(\tR\bfullName\DC2\DC2\n\
    \\EOTtype\CAN\ETX \SOH(\tR\EOTtype\DC2\SUB\n\
    \\breserved\CAN\ENQ \SOH(\bR\breserved\DC2\SUB\n\
    \\brepeated\CAN\ACK \SOH(\bR\brepeatedJ\EOT\b\EOT\DLE\ENQ\"4\n\
    \\DC1VerificationState\DC2\SI\n\
    \\vDECLARATION\DLE\NUL\DC2\SO\n\
    \\n\
    \UNVERIFIED\DLE\SOH*\t\b\232\a\DLE\128\128\128\128\STX\"\193\ACK\n\
    \\DC4FieldDescriptorProto\DC2\DC2\n\
    \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2\SYN\n\
    \\ACKnumber\CAN\ETX \SOH(\ENQR\ACKnumber\DC2A\n\
    \\ENQlabel\CAN\EOT \SOH(\SO2+.google.protobuf.FieldDescriptorProto.LabelR\ENQlabel\DC2>\n\
    \\EOTtype\CAN\ENQ \SOH(\SO2*.google.protobuf.FieldDescriptorProto.TypeR\EOTtype\DC2\ESC\n\
    \\ttype_name\CAN\ACK \SOH(\tR\btypeName\DC2\SUB\n\
    \\bextendee\CAN\STX \SOH(\tR\bextendee\DC2#\n\
    \\rdefault_value\CAN\a \SOH(\tR\fdefaultValue\DC2\US\n\
    \\voneof_index\CAN\t \SOH(\ENQR\n\
    \oneofIndex\DC2\ESC\n\
    \\tjson_name\CAN\n\
    \ \SOH(\tR\bjsonName\DC27\n\
    \\aoptions\CAN\b \SOH(\v2\GS.google.protobuf.FieldOptionsR\aoptions\DC2'\n\
    \\SIproto3_optional\CAN\DC1 \SOH(\bR\SOproto3Optional\"\182\STX\n\
    \\EOTType\DC2\SI\n\
    \\vTYPE_DOUBLE\DLE\SOH\DC2\SO\n\
    \\n\
    \TYPE_FLOAT\DLE\STX\DC2\SO\n\
    \\n\
    \TYPE_INT64\DLE\ETX\DC2\SI\n\
    \\vTYPE_UINT64\DLE\EOT\DC2\SO\n\
    \\n\
    \TYPE_INT32\DLE\ENQ\DC2\DLE\n\
    \\fTYPE_FIXED64\DLE\ACK\DC2\DLE\n\
    \\fTYPE_FIXED32\DLE\a\DC2\r\n\
    \\tTYPE_BOOL\DLE\b\DC2\SI\n\
    \\vTYPE_STRING\DLE\t\DC2\SO\n\
    \\n\
    \TYPE_GROUP\DLE\n\
    \\DC2\DLE\n\
    \\fTYPE_MESSAGE\DLE\v\DC2\SO\n\
    \\n\
    \TYPE_BYTES\DLE\f\DC2\SI\n\
    \\vTYPE_UINT32\DLE\r\DC2\r\n\
    \\tTYPE_ENUM\DLE\SO\DC2\DC1\n\
    \\rTYPE_SFIXED32\DLE\SI\DC2\DC1\n\
    \\rTYPE_SFIXED64\DLE\DLE\DC2\SI\n\
    \\vTYPE_SINT32\DLE\DC1\DC2\SI\n\
    \\vTYPE_SINT64\DLE\DC2\"C\n\
    \\ENQLabel\DC2\DC2\n\
    \\SOLABEL_OPTIONAL\DLE\SOH\DC2\DC2\n\
    \\SOLABEL_REPEATED\DLE\ETX\DC2\DC2\n\
    \\SOLABEL_REQUIRED\DLE\STX\"c\n\
    \\DC4OneofDescriptorProto\DC2\DC2\n\
    \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC27\n\
    \\aoptions\CAN\STX \SOH(\v2\GS.google.protobuf.OneofOptionsR\aoptions\"\227\STX\n\
    \\DC3EnumDescriptorProto\DC2\DC2\n\
    \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2?\n\
    \\ENQvalue\CAN\STX \ETX(\v2).google.protobuf.EnumValueDescriptorProtoR\ENQvalue\DC26\n\
    \\aoptions\CAN\ETX \SOH(\v2\FS.google.protobuf.EnumOptionsR\aoptions\DC2]\n\
    \\SOreserved_range\CAN\EOT \ETX(\v26.google.protobuf.EnumDescriptorProto.EnumReservedRangeR\rreservedRange\DC2#\n\
    \\rreserved_name\CAN\ENQ \ETX(\tR\freservedName\SUB;\n\
    \\DC1EnumReservedRange\DC2\DC4\n\
    \\ENQstart\CAN\SOH \SOH(\ENQR\ENQstart\DC2\DLE\n\
    \\ETXend\CAN\STX \SOH(\ENQR\ETXend\"\131\SOH\n\
    \\CANEnumValueDescriptorProto\DC2\DC2\n\
    \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2\SYN\n\
    \\ACKnumber\CAN\STX \SOH(\ENQR\ACKnumber\DC2;\n\
    \\aoptions\CAN\ETX \SOH(\v2!.google.protobuf.EnumValueOptionsR\aoptions\"\167\SOH\n\
    \\SYNServiceDescriptorProto\DC2\DC2\n\
    \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2>\n\
    \\ACKmethod\CAN\STX \ETX(\v2&.google.protobuf.MethodDescriptorProtoR\ACKmethod\DC29\n\
    \\aoptions\CAN\ETX \SOH(\v2\US.google.protobuf.ServiceOptionsR\aoptions\"\137\STX\n\
    \\NAKMethodDescriptorProto\DC2\DC2\n\
    \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2\GS\n\
    \\n\
    \input_type\CAN\STX \SOH(\tR\tinputType\DC2\US\n\
    \\voutput_type\CAN\ETX \SOH(\tR\n\
    \outputType\DC28\n\
    \\aoptions\CAN\EOT \SOH(\v2\RS.google.protobuf.MethodOptionsR\aoptions\DC20\n\
    \\DLEclient_streaming\CAN\ENQ \SOH(\b:\ENQfalseR\SIclientStreaming\DC20\n\
    \\DLEserver_streaming\CAN\ACK \SOH(\b:\ENQfalseR\SIserverStreaming\"\173\t\n\
    \\vFileOptions\DC2!\n\
    \\fjava_package\CAN\SOH \SOH(\tR\vjavaPackage\DC20\n\
    \\DC4java_outer_classname\CAN\b \SOH(\tR\DC2javaOuterClassname\DC25\n\
    \\DC3java_multiple_files\CAN\n\
    \ \SOH(\b:\ENQfalseR\DC1javaMultipleFiles\DC2D\n\
    \\GSjava_generate_equals_and_hash\CAN\DC4 \SOH(\bR\EMjavaGenerateEqualsAndHashB\STX\CAN\SOH\DC2:\n\
    \\SYNjava_string_check_utf8\CAN\ESC \SOH(\b:\ENQfalseR\DC3javaStringCheckUtf8\DC2S\n\
    \\foptimize_for\CAN\t \SOH(\SO2).google.protobuf.FileOptions.OptimizeMode:\ENQSPEEDR\voptimizeFor\DC2\GS\n\
    \\n\
    \go_package\CAN\v \SOH(\tR\tgoPackage\DC25\n\
    \\DC3cc_generic_services\CAN\DLE \SOH(\b:\ENQfalseR\DC1ccGenericServices\DC29\n\
    \\NAKjava_generic_services\CAN\DC1 \SOH(\b:\ENQfalseR\DC3javaGenericServices\DC25\n\
    \\DC3py_generic_services\CAN\DC2 \SOH(\b:\ENQfalseR\DC1pyGenericServices\DC2%\n\
    \\n\
    \deprecated\CAN\ETB \SOH(\b:\ENQfalseR\n\
    \deprecated\DC2.\n\
    \\DLEcc_enable_arenas\CAN\US \SOH(\b:\EOTtrueR\SOccEnableArenas\DC2*\n\
    \\DC1objc_class_prefix\CAN$ \SOH(\tR\SIobjcClassPrefix\DC2)\n\
    \\DLEcsharp_namespace\CAN% \SOH(\tR\SIcsharpNamespace\DC2!\n\
    \\fswift_prefix\CAN' \SOH(\tR\vswiftPrefix\DC2(\n\
    \\DLEphp_class_prefix\CAN( \SOH(\tR\SOphpClassPrefix\DC2#\n\
    \\rphp_namespace\CAN) \SOH(\tR\fphpNamespace\DC24\n\
    \\SYNphp_metadata_namespace\CAN, \SOH(\tR\DC4phpMetadataNamespace\DC2!\n\
    \\fruby_package\CAN- \SOH(\tR\vrubyPackage\DC27\n\
    \\bfeatures\CAN2 \SOH(\v2\ESC.google.protobuf.FeatureSetR\bfeatures\DC2X\n\
    \\DC4uninterpreted_option\CAN\231\a \ETX(\v2$.google.protobuf.UninterpretedOptionR\DC3uninterpretedOption\":\n\
    \\fOptimizeMode\DC2\t\n\
    \\ENQSPEED\DLE\SOH\DC2\r\n\
    \\tCODE_SIZE\DLE\STX\DC2\DLE\n\
    \\fLITE_RUNTIME\DLE\ETX*\t\b\232\a\DLE\128\128\128\128\STXJ\EOT\b*\DLE+J\EOT\b&\DLE'R\DC4php_generic_services\"\244\ETX\n\
    \\SOMessageOptions\DC2<\n\
    \\ETBmessage_set_wire_format\CAN\SOH \SOH(\b:\ENQfalseR\DC4messageSetWireFormat\DC2L\n\
    \\USno_standard_descriptor_accessor\CAN\STX \SOH(\b:\ENQfalseR\FSnoStandardDescriptorAccessor\DC2%\n\
    \\n\
    \deprecated\CAN\ETX \SOH(\b:\ENQfalseR\n\
    \deprecated\DC2\ESC\n\
    \\tmap_entry\CAN\a \SOH(\bR\bmapEntry\DC2V\n\
    \&deprecated_legacy_json_field_conflicts\CAN\v \SOH(\bR\"deprecatedLegacyJsonFieldConflictsB\STX\CAN\SOH\DC27\n\
    \\bfeatures\CAN\f \SOH(\v2\ESC.google.protobuf.FeatureSetR\bfeatures\DC2X\n\
    \\DC4uninterpreted_option\CAN\231\a \ETX(\v2$.google.protobuf.UninterpretedOptionR\DC3uninterpretedOption*\t\b\232\a\DLE\128\128\128\128\STXJ\EOT\b\EOT\DLE\ENQJ\EOT\b\ENQ\DLE\ACKJ\EOT\b\ACK\DLE\aJ\EOT\b\b\DLE\tJ\EOT\b\t\DLE\n\
    \\"\157\r\n\
    \\fFieldOptions\DC2A\n\
    \\ENQctype\CAN\SOH \SOH(\SO2#.google.protobuf.FieldOptions.CType:\ACKSTRINGR\ENQctype\DC2\SYN\n\
    \\ACKpacked\CAN\STX \SOH(\bR\ACKpacked\DC2G\n\
    \\ACKjstype\CAN\ACK \SOH(\SO2$.google.protobuf.FieldOptions.JSType:\tJS_NORMALR\ACKjstype\DC2\EM\n\
    \\EOTlazy\CAN\ENQ \SOH(\b:\ENQfalseR\EOTlazy\DC2.\n\
    \\SIunverified_lazy\CAN\SI \SOH(\b:\ENQfalseR\SOunverifiedLazy\DC2%\n\
    \\n\
    \deprecated\CAN\ETX \SOH(\b:\ENQfalseR\n\
    \deprecated\DC2\EM\n\
    \\EOTweak\CAN\n\
    \ \SOH(\b:\ENQfalseR\EOTweak\DC2(\n\
    \\fdebug_redact\CAN\DLE \SOH(\b:\ENQfalseR\vdebugRedact\DC2K\n\
    \\tretention\CAN\DC1 \SOH(\SO2-.google.protobuf.FieldOptions.OptionRetentionR\tretention\DC2H\n\
    \\atargets\CAN\DC3 \ETX(\SO2..google.protobuf.FieldOptions.OptionTargetTypeR\atargets\DC2W\n\
    \\DLEedition_defaults\CAN\DC4 \ETX(\v2,.google.protobuf.FieldOptions.EditionDefaultR\SIeditionDefaults\DC27\n\
    \\bfeatures\CAN\NAK \SOH(\v2\ESC.google.protobuf.FeatureSetR\bfeatures\DC2U\n\
    \\SIfeature_support\CAN\SYN \SOH(\v2,.google.protobuf.FieldOptions.FeatureSupportR\SOfeatureSupport\DC2X\n\
    \\DC4uninterpreted_option\CAN\231\a \ETX(\v2$.google.protobuf.UninterpretedOptionR\DC3uninterpretedOption\SUBZ\n\
    \\SOEditionDefault\DC22\n\
    \\aedition\CAN\ETX \SOH(\SO2\CAN.google.protobuf.EditionR\aedition\DC2\DC4\n\
    \\ENQvalue\CAN\STX \SOH(\tR\ENQvalue\SUB\150\STX\n\
    \\SOFeatureSupport\DC2G\n\
    \\DC2edition_introduced\CAN\SOH \SOH(\SO2\CAN.google.protobuf.EditionR\DC1editionIntroduced\DC2G\n\
    \\DC2edition_deprecated\CAN\STX \SOH(\SO2\CAN.google.protobuf.EditionR\DC1editionDeprecated\DC2/\n\
    \\DC3deprecation_warning\CAN\ETX \SOH(\tR\DC2deprecationWarning\DC2A\n\
    \\SIedition_removed\CAN\EOT \SOH(\SO2\CAN.google.protobuf.EditionR\SOeditionRemoved\"/\n\
    \\ENQCType\DC2\n\
    \\n\
    \\ACKSTRING\DLE\NUL\DC2\b\n\
    \\EOTCORD\DLE\SOH\DC2\DLE\n\
    \\fSTRING_PIECE\DLE\STX\"5\n\
    \\ACKJSType\DC2\r\n\
    \\tJS_NORMAL\DLE\NUL\DC2\r\n\
    \\tJS_STRING\DLE\SOH\DC2\r\n\
    \\tJS_NUMBER\DLE\STX\"U\n\
    \\SIOptionRetention\DC2\NAK\n\
    \\DC1RETENTION_UNKNOWN\DLE\NUL\DC2\NAK\n\
    \\DC1RETENTION_RUNTIME\DLE\SOH\DC2\DC4\n\
    \\DLERETENTION_SOURCE\DLE\STX\"\140\STX\n\
    \\DLEOptionTargetType\DC2\ETB\n\
    \\DC3TARGET_TYPE_UNKNOWN\DLE\NUL\DC2\DC4\n\
    \\DLETARGET_TYPE_FILE\DLE\SOH\DC2\US\n\
    \\ESCTARGET_TYPE_EXTENSION_RANGE\DLE\STX\DC2\ETB\n\
    \\DC3TARGET_TYPE_MESSAGE\DLE\ETX\DC2\NAK\n\
    \\DC1TARGET_TYPE_FIELD\DLE\EOT\DC2\NAK\n\
    \\DC1TARGET_TYPE_ONEOF\DLE\ENQ\DC2\DC4\n\
    \\DLETARGET_TYPE_ENUM\DLE\ACK\DC2\SUB\n\
    \\SYNTARGET_TYPE_ENUM_ENTRY\DLE\a\DC2\ETB\n\
    \\DC3TARGET_TYPE_SERVICE\DLE\b\DC2\SYN\n\
    \\DC2TARGET_TYPE_METHOD\DLE\t*\t\b\232\a\DLE\128\128\128\128\STXJ\EOT\b\EOT\DLE\ENQJ\EOT\b\DC2\DLE\DC3\"\172\SOH\n\
    \\fOneofOptions\DC27\n\
    \\bfeatures\CAN\SOH \SOH(\v2\ESC.google.protobuf.FeatureSetR\bfeatures\DC2X\n\
    \\DC4uninterpreted_option\CAN\231\a \ETX(\v2$.google.protobuf.UninterpretedOptionR\DC3uninterpretedOption*\t\b\232\a\DLE\128\128\128\128\STX\"\209\STX\n\
    \\vEnumOptions\DC2\US\n\
    \\vallow_alias\CAN\STX \SOH(\bR\n\
    \allowAlias\DC2%\n\
    \\n\
    \deprecated\CAN\ETX \SOH(\b:\ENQfalseR\n\
    \deprecated\DC2V\n\
    \&deprecated_legacy_json_field_conflicts\CAN\ACK \SOH(\bR\"deprecatedLegacyJsonFieldConflictsB\STX\CAN\SOH\DC27\n\
    \\bfeatures\CAN\a \SOH(\v2\ESC.google.protobuf.FeatureSetR\bfeatures\DC2X\n\
    \\DC4uninterpreted_option\CAN\231\a \ETX(\v2$.google.protobuf.UninterpretedOptionR\DC3uninterpretedOption*\t\b\232\a\DLE\128\128\128\128\STXJ\EOT\b\ENQ\DLE\ACK\"\216\STX\n\
    \\DLEEnumValueOptions\DC2%\n\
    \\n\
    \deprecated\CAN\SOH \SOH(\b:\ENQfalseR\n\
    \deprecated\DC27\n\
    \\bfeatures\CAN\STX \SOH(\v2\ESC.google.protobuf.FeatureSetR\bfeatures\DC2(\n\
    \\fdebug_redact\CAN\ETX \SOH(\b:\ENQfalseR\vdebugRedact\DC2U\n\
    \\SIfeature_support\CAN\EOT \SOH(\v2,.google.protobuf.FieldOptions.FeatureSupportR\SOfeatureSupport\DC2X\n\
    \\DC4uninterpreted_option\CAN\231\a \ETX(\v2$.google.protobuf.UninterpretedOptionR\DC3uninterpretedOption*\t\b\232\a\DLE\128\128\128\128\STX\"\213\SOH\n\
    \\SOServiceOptions\DC27\n\
    \\bfeatures\CAN\" \SOH(\v2\ESC.google.protobuf.FeatureSetR\bfeatures\DC2%\n\
    \\n\
    \deprecated\CAN! \SOH(\b:\ENQfalseR\n\
    \deprecated\DC2X\n\
    \\DC4uninterpreted_option\CAN\231\a \ETX(\v2$.google.protobuf.UninterpretedOptionR\DC3uninterpretedOption*\t\b\232\a\DLE\128\128\128\128\STX\"\153\ETX\n\
    \\rMethodOptions\DC2%\n\
    \\n\
    \deprecated\CAN! \SOH(\b:\ENQfalseR\n\
    \deprecated\DC2q\n\
    \\DC1idempotency_level\CAN\" \SOH(\SO2/.google.protobuf.MethodOptions.IdempotencyLevel:\DC3IDEMPOTENCY_UNKNOWNR\DLEidempotencyLevel\DC27\n\
    \\bfeatures\CAN# \SOH(\v2\ESC.google.protobuf.FeatureSetR\bfeatures\DC2X\n\
    \\DC4uninterpreted_option\CAN\231\a \ETX(\v2$.google.protobuf.UninterpretedOptionR\DC3uninterpretedOption\"P\n\
    \\DLEIdempotencyLevel\DC2\ETB\n\
    \\DC3IDEMPOTENCY_UNKNOWN\DLE\NUL\DC2\DC3\n\
    \\SINO_SIDE_EFFECTS\DLE\SOH\DC2\SO\n\
    \\n\
    \IDEMPOTENT\DLE\STX*\t\b\232\a\DLE\128\128\128\128\STX\"\154\ETX\n\
    \\DC3UninterpretedOption\DC2A\n\
    \\EOTname\CAN\STX \ETX(\v2-.google.protobuf.UninterpretedOption.NamePartR\EOTname\DC2)\n\
    \\DLEidentifier_value\CAN\ETX \SOH(\tR\SIidentifierValue\DC2,\n\
    \\DC2positive_int_value\CAN\EOT \SOH(\EOTR\DLEpositiveIntValue\DC2,\n\
    \\DC2negative_int_value\CAN\ENQ \SOH(\ETXR\DLEnegativeIntValue\DC2!\n\
    \\fdouble_value\CAN\ACK \SOH(\SOHR\vdoubleValue\DC2!\n\
    \\fstring_value\CAN\a \SOH(\fR\vstringValue\DC2'\n\
    \\SIaggregate_value\CAN\b \SOH(\tR\SOaggregateValue\SUBJ\n\
    \\bNamePart\DC2\ESC\n\
    \\tname_part\CAN\SOH \STX(\tR\bnamePart\DC2!\n\
    \\fis_extension\CAN\STX \STX(\bR\visExtension\"\167\n\
    \\n\
    \\n\
    \FeatureSet\DC2\145\SOH\n\
    \\SOfield_presence\CAN\SOH \SOH(\SO2).google.protobuf.FeatureSet.FieldPresenceR\rfieldPresenceB?\136\SOH\SOH\152\SOH\EOT\152\SOH\SOH\162\SOH\r\DC2\bEXPLICIT\CAN\132\a\162\SOH\r\DC2\bIMPLICIT\CAN\231\a\162\SOH\r\DC2\bEXPLICIT\CAN\232\a\178\SOH\ETX\b\232\a\DC2l\n\
    \\tenum_type\CAN\STX \SOH(\SO2$.google.protobuf.FeatureSet.EnumTypeR\benumTypeB)\136\SOH\SOH\152\SOH\ACK\152\SOH\SOH\162\SOH\v\DC2\ACKCLOSED\CAN\132\a\162\SOH\t\DC2\EOTOPEN\CAN\231\a\178\SOH\ETX\b\232\a\DC2\152\SOH\n\
    \\ETBrepeated_field_encoding\CAN\ETX \SOH(\SO21.google.protobuf.FeatureSet.RepeatedFieldEncodingR\NAKrepeatedFieldEncodingB-\136\SOH\SOH\152\SOH\EOT\152\SOH\SOH\162\SOH\r\DC2\bEXPANDED\CAN\132\a\162\SOH\v\DC2\ACKPACKED\CAN\231\a\178\SOH\ETX\b\232\a\DC2~\n\
    \\SIutf8_validation\CAN\EOT \SOH(\SO2*.google.protobuf.FeatureSet.Utf8ValidationR\SOutf8ValidationB)\136\SOH\SOH\152\SOH\EOT\152\SOH\SOH\162\SOH\t\DC2\EOTNONE\CAN\132\a\162\SOH\v\DC2\ACKVERIFY\CAN\231\a\178\SOH\ETX\b\232\a\DC2~\n\
    \\DLEmessage_encoding\CAN\ENQ \SOH(\SO2+.google.protobuf.FeatureSet.MessageEncodingR\SImessageEncodingB&\136\SOH\SOH\152\SOH\EOT\152\SOH\SOH\162\SOH\DC4\DC2\SILENGTH_PREFIXED\CAN\132\a\178\SOH\ETX\b\232\a\DC2\130\SOH\n\
    \\vjson_format\CAN\ACK \SOH(\SO2&.google.protobuf.FeatureSet.JsonFormatR\n\
    \jsonFormatB9\136\SOH\SOH\152\SOH\ETX\152\SOH\ACK\152\SOH\SOH\162\SOH\ETB\DC2\DC2LEGACY_BEST_EFFORT\CAN\132\a\162\SOH\n\
    \\DC2\ENQALLOW\CAN\231\a\178\SOH\ETX\b\232\a\"\\\n\
    \\rFieldPresence\DC2\SUB\n\
    \\SYNFIELD_PRESENCE_UNKNOWN\DLE\NUL\DC2\f\n\
    \\bEXPLICIT\DLE\SOH\DC2\f\n\
    \\bIMPLICIT\DLE\STX\DC2\DC3\n\
    \\SILEGACY_REQUIRED\DLE\ETX\"7\n\
    \\bEnumType\DC2\NAK\n\
    \\DC1ENUM_TYPE_UNKNOWN\DLE\NUL\DC2\b\n\
    \\EOTOPEN\DLE\SOH\DC2\n\
    \\n\
    \\ACKCLOSED\DLE\STX\"V\n\
    \\NAKRepeatedFieldEncoding\DC2#\n\
    \\USREPEATED_FIELD_ENCODING_UNKNOWN\DLE\NUL\DC2\n\
    \\n\
    \\ACKPACKED\DLE\SOH\DC2\f\n\
    \\bEXPANDED\DLE\STX\"I\n\
    \\SOUtf8Validation\DC2\ESC\n\
    \\ETBUTF8_VALIDATION_UNKNOWN\DLE\NUL\DC2\n\
    \\n\
    \\ACKVERIFY\DLE\STX\DC2\b\n\
    \\EOTNONE\DLE\ETX\"\EOT\b\SOH\DLE\SOH\"S\n\
    \\SIMessageEncoding\DC2\FS\n\
    \\CANMESSAGE_ENCODING_UNKNOWN\DLE\NUL\DC2\DC3\n\
    \\SILENGTH_PREFIXED\DLE\SOH\DC2\r\n\
    \\tDELIMITED\DLE\STX\"H\n\
    \\n\
    \JsonFormat\DC2\ETB\n\
    \\DC3JSON_FORMAT_UNKNOWN\DLE\NUL\DC2\t\n\
    \\ENQALLOW\DLE\SOH\DC2\SYN\n\
    \\DC2LEGACY_BEST_EFFORT\DLE\STX*\ACK\b\232\a\DLE\139N*\ACK\b\139N\DLE\144N*\ACK\b\144N\DLE\145NJ\ACK\b\231\a\DLE\232\a\"\239\ETX\n\
    \\DC2FeatureSetDefaults\DC2X\n\
    \\bdefaults\CAN\SOH \ETX(\v2<.google.protobuf.FeatureSetDefaults.FeatureSetEditionDefaultR\bdefaults\DC2A\n\
    \\SIminimum_edition\CAN\EOT \SOH(\SO2\CAN.google.protobuf.EditionR\SOminimumEdition\DC2A\n\
    \\SImaximum_edition\CAN\ENQ \SOH(\SO2\CAN.google.protobuf.EditionR\SOmaximumEdition\SUB\248\SOH\n\
    \\CANFeatureSetEditionDefault\DC22\n\
    \\aedition\CAN\ETX \SOH(\SO2\CAN.google.protobuf.EditionR\aedition\DC2N\n\
    \\DC4overridable_features\CAN\EOT \SOH(\v2\ESC.google.protobuf.FeatureSetR\DC3overridableFeatures\DC2B\n\
    \\SOfixed_features\CAN\ENQ \SOH(\v2\ESC.google.protobuf.FeatureSetR\rfixedFeaturesJ\EOT\b\SOH\DLE\STXJ\EOT\b\STX\DLE\ETXR\bfeatures\"\167\STX\n\
    \\SOSourceCodeInfo\DC2D\n\
    \\blocation\CAN\SOH \ETX(\v2(.google.protobuf.SourceCodeInfo.LocationR\blocation\SUB\206\SOH\n\
    \\bLocation\DC2\SYN\n\
    \\EOTpath\CAN\SOH \ETX(\ENQR\EOTpathB\STX\DLE\SOH\DC2\SYN\n\
    \\EOTspan\CAN\STX \ETX(\ENQR\EOTspanB\STX\DLE\SOH\DC2)\n\
    \\DLEleading_comments\CAN\ETX \SOH(\tR\SIleadingComments\DC2+\n\
    \\DC1trailing_comments\CAN\EOT \SOH(\tR\DLEtrailingComments\DC2:\n\
    \\EMleading_detached_comments\CAN\ACK \ETX(\tR\ETBleadingDetachedComments\"\208\STX\n\
    \\DC1GeneratedCodeInfo\DC2M\n\
    \\n\
    \annotation\CAN\SOH \ETX(\v2-.google.protobuf.GeneratedCodeInfo.AnnotationR\n\
    \annotation\SUB\235\SOH\n\
    \\n\
    \Annotation\DC2\SYN\n\
    \\EOTpath\CAN\SOH \ETX(\ENQR\EOTpathB\STX\DLE\SOH\DC2\US\n\
    \\vsource_file\CAN\STX \SOH(\tR\n\
    \sourceFile\DC2\DC4\n\
    \\ENQbegin\CAN\ETX \SOH(\ENQR\ENQbegin\DC2\DLE\n\
    \\ETXend\CAN\EOT \SOH(\ENQR\ETXend\DC2R\n\
    \\bsemantic\CAN\ENQ \SOH(\SO26.google.protobuf.GeneratedCodeInfo.Annotation.SemanticR\bsemantic\"(\n\
    \\bSemantic\DC2\b\n\
    \\EOTNONE\DLE\NUL\DC2\a\n\
    \\ETXSET\DLE\SOH\DC2\t\n\
    \\ENQALIAS\DLE\STX*\167\STX\n\
    \\aEdition\DC2\DC3\n\
    \\SIEDITION_UNKNOWN\DLE\NUL\DC2\DC3\n\
    \\SOEDITION_LEGACY\DLE\132\a\DC2\DC3\n\
    \\SOEDITION_PROTO2\DLE\230\a\DC2\DC3\n\
    \\SOEDITION_PROTO3\DLE\231\a\DC2\DC1\n\
    \\fEDITION_2023\DLE\232\a\DC2\DC1\n\
    \\fEDITION_2024\DLE\233\a\DC2\ETB\n\
    \\DC3EDITION_1_TEST_ONLY\DLE\SOH\DC2\ETB\n\
    \\DC3EDITION_2_TEST_ONLY\DLE\STX\DC2\GS\n\
    \\ETBEDITION_99997_TEST_ONLY\DLE\157\141\ACK\DC2\GS\n\
    \\ETBEDITION_99998_TEST_ONLY\DLE\158\141\ACK\DC2\GS\n\
    \\ETBEDITION_99999_TEST_ONLY\DLE\159\141\ACK\DC2\DC3\n\
    \\vEDITION_MAX\DLE\255\255\255\255\aB~\n\
    \\DC3com.google.protobufB\DLEDescriptorProtosH\SOHZ-google.golang.org/protobuf/types/descriptorpb\248\SOH\SOH\162\STX\ETXGPB\170\STX\SUBGoogle.Protobuf.ReflectionJ\139\195\ETX\n\
    \\a\DC2\ENQ&\NUL\143\n\
    \\SOH\n\
    \\170\SI\n\
    \\SOH\f\DC2\ETX&\NUL\DC22\193\f Protocol Buffers - Google's data interchange format\n\
    \ Copyright 2008 Google Inc.  All rights reserved.\n\
    \ https://developers.google.com/protocol-buffers/\n\
    \\n\
    \ Redistribution and use in source and binary forms, with or without\n\
    \ modification, are permitted provided that the following conditions are\n\
    \ met:\n\
    \\n\
    \     * Redistributions of source code must retain the above copyright\n\
    \ notice, this list of conditions and the following disclaimer.\n\
    \     * Redistributions in binary form must reproduce the above\n\
    \ copyright notice, this list of conditions and the following disclaimer\n\
    \ in the documentation and/or other materials provided with the\n\
    \ distribution.\n\
    \     * Neither the name of Google Inc. nor the names of its\n\
    \ contributors may be used to endorse or promote products derived from\n\
    \ this software without specific prior written permission.\n\
    \\n\
    \ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS\n\
    \ \"AS IS\" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT\n\
    \ LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR\n\
    \ A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT\n\
    \ OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,\n\
    \ SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT\n\
    \ LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,\n\
    \ DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY\n\
    \ THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT\n\
    \ (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE\n\
    \ OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.\n\
    \2\219\STX Author: kenton@google.com (Kenton Varda)\n\
    \  Based on original Protocol Buffers design by\n\
    \  Sanjay Ghemawat, Jeff Dean, and others.\n\
    \\n\
    \ The messages in this file describe the definitions found in .proto files.\n\
    \ A valid .proto file can be translated directly to a FileDescriptorProto\n\
    \ without any other information (e.g. without reading its imports).\n\
    \\n\
    \\b\n\
    \\SOH\STX\DC2\ETX(\NUL\CAN\n\
    \\b\n\
    \\SOH\b\DC2\ETX*\NULD\n\
    \\t\n\
    \\STX\b\v\DC2\ETX*\NULD\n\
    \\b\n\
    \\SOH\b\DC2\ETX+\NUL,\n\
    \\t\n\
    \\STX\b\SOH\DC2\ETX+\NUL,\n\
    \\b\n\
    \\SOH\b\DC2\ETX,\NUL1\n\
    \\t\n\
    \\STX\b\b\DC2\ETX,\NUL1\n\
    \\b\n\
    \\SOH\b\DC2\ETX-\NUL7\n\
    \\t\n\
    \\STX\b%\DC2\ETX-\NUL7\n\
    \\b\n\
    \\SOH\b\DC2\ETX.\NUL!\n\
    \\t\n\
    \\STX\b$\DC2\ETX.\NUL!\n\
    \\b\n\
    \\SOH\b\DC2\ETX/\NUL\US\n\
    \\t\n\
    \\STX\b\US\DC2\ETX/\NUL\US\n\
    \\b\n\
    \\SOH\b\DC2\ETX3\NUL\FS\n\
    \\DEL\n\
    \\STX\b\t\DC2\ETX3\NUL\FS\SUBt descriptor.proto must be optimized for speed because reflection-based\n\
    \ algorithms don't work during bootstrapping.\n\
    \\n\
    \j\n\
    \\STX\EOT\NUL\DC2\EOT7\NUL9\SOH\SUB^ The protocol compiler can output a FileDescriptorSet containing the .proto\n\
    \ files it parses.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX7\b\EM\n\
    \\v\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX8\STX(\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\EOT\DC2\ETX8\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ACK\DC2\ETX8\v\RS\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX8\US#\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX8&'\n\
    \-\n\
    \\STX\ENQ\NUL\DC2\EOT<\NUL]\SOH\SUB! The full set of known editions.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\ENQ\NUL\SOH\DC2\ETX<\ENQ\f\n\
    \:\n\
    \\EOT\ENQ\NUL\STX\NUL\DC2\ETX>\STX\SYN\SUB- A placeholder for an unknown edition value.\n\
    \\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\NUL\SOH\DC2\ETX>\STX\DC1\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\NUL\STX\DC2\ETX>\DC4\NAK\n\
    \\153\SOH\n\
    \\EOT\ENQ\NUL\STX\SOH\DC2\ETXB\STX\ETB\SUB\139\SOH A placeholder edition for specifying default behaviors *before* a feature\n\
    \ was first introduced.  This is effectively an \"infinite past\".\n\
    \\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\SOH\SOH\DC2\ETXB\STX\DLE\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\SOH\STX\DC2\ETXB\DC3\SYN\n\
    \\130\STX\n\
    \\EOT\ENQ\NUL\STX\STX\DC2\ETXH\STX\ETB\SUB\244\SOH Legacy syntax \"editions\".  These pre-date editions, but behave much like\n\
    \ distinct editions.  These can't be used to specify the edition of proto\n\
    \ files, but feature definitions must supply proto2/proto3 defaults for\n\
    \ backwards compatibility.\n\
    \\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\STX\SOH\DC2\ETXH\STX\DLE\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\STX\STX\DC2\ETXH\DC3\SYN\n\
    \\v\n\
    \\EOT\ENQ\NUL\STX\ETX\DC2\ETXI\STX\ETB\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\ETX\SOH\DC2\ETXI\STX\DLE\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\ETX\STX\DC2\ETXI\DC3\SYN\n\
    \\175\SOH\n\
    \\EOT\ENQ\NUL\STX\EOT\DC2\ETXN\STX\SYN\SUB\161\SOH Editions that have been released.  The specific values are arbitrary and\n\
    \ should not be depended on, but they will always be time-ordered for easy\n\
    \ comparison.\n\
    \\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\EOT\SOH\DC2\ETXN\STX\SO\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\EOT\STX\DC2\ETXN\DC1\NAK\n\
    \\v\n\
    \\EOT\ENQ\NUL\STX\ENQ\DC2\ETXO\STX\SYN\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\ENQ\SOH\DC2\ETXO\STX\SO\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\ENQ\STX\DC2\ETXO\DC1\NAK\n\
    \}\n\
    \\EOT\ENQ\NUL\STX\ACK\DC2\ETXS\STX\SUB\SUBp Placeholder editions for testing feature resolution.  These should not be\n\
    \ used or relyed on outside of tests.\n\
    \\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\ACK\SOH\DC2\ETXS\STX\NAK\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\ACK\STX\DC2\ETXS\CAN\EM\n\
    \\v\n\
    \\EOT\ENQ\NUL\STX\a\DC2\ETXT\STX\SUB\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\a\SOH\DC2\ETXT\STX\NAK\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\a\STX\DC2\ETXT\CAN\EM\n\
    \\v\n\
    \\EOT\ENQ\NUL\STX\b\DC2\ETXU\STX\"\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\b\SOH\DC2\ETXU\STX\EM\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\b\STX\DC2\ETXU\FS!\n\
    \\v\n\
    \\EOT\ENQ\NUL\STX\t\DC2\ETXV\STX\"\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\t\SOH\DC2\ETXV\STX\EM\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\t\STX\DC2\ETXV\FS!\n\
    \\v\n\
    \\EOT\ENQ\NUL\STX\n\
    \\DC2\ETXW\STX\"\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\n\
    \\SOH\DC2\ETXW\STX\EM\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\n\
    \\STX\DC2\ETXW\FS!\n\
    \\184\SOH\n\
    \\EOT\ENQ\NUL\STX\v\DC2\ETX\\\STX\ESC\SUB\170\SOH Placeholder for specifying unbounded edition support.  This should only\n\
    \ ever be used by plugins that can expect to never require any changes to\n\
    \ support a new edition.\n\
    \\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\v\SOH\DC2\ETX\\\STX\r\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\v\STX\DC2\ETX\\\DLE\SUB\n\
    \0\n\
    \\STX\EOT\SOH\DC2\ENQ`\NUL\130\SOH\SOH\SUB# Describes a complete .proto file.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETX`\b\ESC\n\
    \9\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\ETXa\STX\ESC\", file name, relative to root of source tree\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\EOT\DC2\ETXa\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ENQ\DC2\ETXa\v\DC1\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\ETXa\DC2\SYN\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\ETXa\EM\SUB\n\
    \*\n\
    \\EOT\EOT\SOH\STX\SOH\DC2\ETXb\STX\RS\"\GS e.g. \"foo\", \"foo.bar\", etc.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\EOT\DC2\ETXb\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ENQ\DC2\ETXb\v\DC1\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\SOH\DC2\ETXb\DC2\EM\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ETX\DC2\ETXb\FS\GS\n\
    \4\n\
    \\EOT\EOT\SOH\STX\STX\DC2\ETXe\STX!\SUB' Names of files imported by this file.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\EOT\DC2\ETXe\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ENQ\DC2\ETXe\v\DC1\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\SOH\DC2\ETXe\DC2\FS\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ETX\DC2\ETXe\US \n\
    \Q\n\
    \\EOT\EOT\SOH\STX\ETX\DC2\ETXg\STX(\SUBD Indexes of the public imported files in the dependency list above.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\EOT\DC2\ETXg\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\ENQ\DC2\ETXg\v\DLE\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\SOH\DC2\ETXg\DC1\"\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\ETX\DC2\ETXg%'\n\
    \z\n\
    \\EOT\EOT\SOH\STX\EOT\DC2\ETXj\STX&\SUBm Indexes of the weak imported files in the dependency list.\n\
    \ For Google-internal migration only. Do not use.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\EOT\EOT\DC2\ETXj\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\EOT\ENQ\DC2\ETXj\v\DLE\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\EOT\SOH\DC2\ETXj\DC1 \n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\EOT\ETX\DC2\ETXj#%\n\
    \6\n\
    \\EOT\EOT\SOH\STX\ENQ\DC2\ETXm\STX,\SUB) All top-level definitions in this file.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ENQ\EOT\DC2\ETXm\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ENQ\ACK\DC2\ETXm\v\SUB\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ENQ\SOH\DC2\ETXm\ESC'\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ENQ\ETX\DC2\ETXm*+\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\ACK\DC2\ETXn\STX-\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ACK\EOT\DC2\ETXn\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ACK\ACK\DC2\ETXn\v\RS\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ACK\SOH\DC2\ETXn\US(\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ACK\ETX\DC2\ETXn+,\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\a\DC2\ETXo\STX.\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\a\EOT\DC2\ETXo\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\a\ACK\DC2\ETXo\v!\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\a\SOH\DC2\ETXo\")\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\a\ETX\DC2\ETXo,-\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\b\DC2\ETXp\STX.\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\b\EOT\DC2\ETXp\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\b\ACK\DC2\ETXp\v\US\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\b\SOH\DC2\ETXp )\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\b\ETX\DC2\ETXp,-\n\
    \\v\n\
    \\EOT\EOT\SOH\STX\t\DC2\ETXr\STX#\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\t\EOT\DC2\ETXr\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\t\ACK\DC2\ETXr\v\SYN\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\t\SOH\DC2\ETXr\ETB\RS\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\t\ETX\DC2\ETXr!\"\n\
    \\244\SOH\n\
    \\EOT\EOT\SOH\STX\n\
    \\DC2\ETXx\STX/\SUB\230\SOH This field contains optional information about the original source code.\n\
    \ You may safely remove this entire field without harming runtime\n\
    \ functionality of the descriptors -- the information is needed only by\n\
    \ development tools.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\n\
    \\EOT\DC2\ETXx\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\n\
    \\ACK\DC2\ETXx\v\EM\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\n\
    \\SOH\DC2\ETXx\SUB*\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\n\
    \\ETX\DC2\ETXx-.\n\
    \\165\SOH\n\
    \\EOT\EOT\SOH\STX\v\DC2\ETX~\STX\RS\SUB\151\SOH The syntax of the proto file.\n\
    \ The supported values are \"proto2\", \"proto3\", and \"editions\".\n\
    \\n\
    \ If `edition` is present, this value must be \"editions\".\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\v\EOT\DC2\ETX~\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\v\ENQ\DC2\ETX~\v\DC1\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\v\SOH\DC2\ETX~\DC2\CAN\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\v\ETX\DC2\ETX~\ESC\GS\n\
    \.\n\
    \\EOT\EOT\SOH\STX\f\DC2\EOT\129\SOH\STX \SUB  The edition of the proto file.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\f\EOT\DC2\EOT\129\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\f\ACK\DC2\EOT\129\SOH\v\DC2\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\f\SOH\DC2\EOT\129\SOH\DC3\SUB\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\f\ETX\DC2\EOT\129\SOH\GS\US\n\
    \)\n\
    \\STX\EOT\STX\DC2\ACK\133\SOH\NUL\165\SOH\SOH\SUB\ESC Describes a message type.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\STX\SOH\DC2\EOT\133\SOH\b\ETB\n\
    \\f\n\
    \\EOT\EOT\STX\STX\NUL\DC2\EOT\134\SOH\STX\ESC\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\NUL\EOT\DC2\EOT\134\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\NUL\ENQ\DC2\EOT\134\SOH\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\NUL\SOH\DC2\EOT\134\SOH\DC2\SYN\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\NUL\ETX\DC2\EOT\134\SOH\EM\SUB\n\
    \\f\n\
    \\EOT\EOT\STX\STX\SOH\DC2\EOT\136\SOH\STX*\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\SOH\EOT\DC2\EOT\136\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\SOH\ACK\DC2\EOT\136\SOH\v\US\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\SOH\SOH\DC2\EOT\136\SOH %\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\SOH\ETX\DC2\EOT\136\SOH()\n\
    \\f\n\
    \\EOT\EOT\STX\STX\STX\DC2\EOT\137\SOH\STX.\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\STX\EOT\DC2\EOT\137\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\STX\ACK\DC2\EOT\137\SOH\v\US\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\STX\SOH\DC2\EOT\137\SOH )\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\STX\ETX\DC2\EOT\137\SOH,-\n\
    \\f\n\
    \\EOT\EOT\STX\STX\ETX\DC2\EOT\139\SOH\STX+\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\ETX\EOT\DC2\EOT\139\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\ETX\ACK\DC2\EOT\139\SOH\v\SUB\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\ETX\SOH\DC2\EOT\139\SOH\ESC&\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\ETX\ETX\DC2\EOT\139\SOH)*\n\
    \\f\n\
    \\EOT\EOT\STX\STX\EOT\DC2\EOT\140\SOH\STX-\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\EOT\EOT\DC2\EOT\140\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\EOT\ACK\DC2\EOT\140\SOH\v\RS\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\EOT\SOH\DC2\EOT\140\SOH\US(\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\EOT\ETX\DC2\EOT\140\SOH+,\n\
    \\SO\n\
    \\EOT\EOT\STX\ETX\NUL\DC2\ACK\142\SOH\STX\147\SOH\ETX\n\
    \\r\n\
    \\ENQ\EOT\STX\ETX\NUL\SOH\DC2\EOT\142\SOH\n\
    \\CAN\n\
    \\FS\n\
    \\ACK\EOT\STX\ETX\NUL\STX\NUL\DC2\EOT\143\SOH\EOT\GS\"\f Inclusive.\n\
    \\n\
    \\SI\n\
    \\a\EOT\STX\ETX\NUL\STX\NUL\EOT\DC2\EOT\143\SOH\EOT\f\n\
    \\SI\n\
    \\a\EOT\STX\ETX\NUL\STX\NUL\ENQ\DC2\EOT\143\SOH\r\DC2\n\
    \\SI\n\
    \\a\EOT\STX\ETX\NUL\STX\NUL\SOH\DC2\EOT\143\SOH\DC3\CAN\n\
    \\SI\n\
    \\a\EOT\STX\ETX\NUL\STX\NUL\ETX\DC2\EOT\143\SOH\ESC\FS\n\
    \\FS\n\
    \\ACK\EOT\STX\ETX\NUL\STX\SOH\DC2\EOT\144\SOH\EOT\ESC\"\f Exclusive.\n\
    \\n\
    \\SI\n\
    \\a\EOT\STX\ETX\NUL\STX\SOH\EOT\DC2\EOT\144\SOH\EOT\f\n\
    \\SI\n\
    \\a\EOT\STX\ETX\NUL\STX\SOH\ENQ\DC2\EOT\144\SOH\r\DC2\n\
    \\SI\n\
    \\a\EOT\STX\ETX\NUL\STX\SOH\SOH\DC2\EOT\144\SOH\DC3\SYN\n\
    \\SI\n\
    \\a\EOT\STX\ETX\NUL\STX\SOH\ETX\DC2\EOT\144\SOH\EM\SUB\n\
    \\SO\n\
    \\ACK\EOT\STX\ETX\NUL\STX\STX\DC2\EOT\146\SOH\EOT/\n\
    \\SI\n\
    \\a\EOT\STX\ETX\NUL\STX\STX\EOT\DC2\EOT\146\SOH\EOT\f\n\
    \\SI\n\
    \\a\EOT\STX\ETX\NUL\STX\STX\ACK\DC2\EOT\146\SOH\r\"\n\
    \\SI\n\
    \\a\EOT\STX\ETX\NUL\STX\STX\SOH\DC2\EOT\146\SOH#*\n\
    \\SI\n\
    \\a\EOT\STX\ETX\NUL\STX\STX\ETX\DC2\EOT\146\SOH-.\n\
    \\f\n\
    \\EOT\EOT\STX\STX\ENQ\DC2\EOT\148\SOH\STX.\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\ENQ\EOT\DC2\EOT\148\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\ENQ\ACK\DC2\EOT\148\SOH\v\EM\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\ENQ\SOH\DC2\EOT\148\SOH\SUB)\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\ENQ\ETX\DC2\EOT\148\SOH,-\n\
    \\f\n\
    \\EOT\EOT\STX\STX\ACK\DC2\EOT\150\SOH\STX/\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\ACK\EOT\DC2\EOT\150\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\ACK\ACK\DC2\EOT\150\SOH\v\US\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\ACK\SOH\DC2\EOT\150\SOH *\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\ACK\ETX\DC2\EOT\150\SOH-.\n\
    \\f\n\
    \\EOT\EOT\STX\STX\a\DC2\EOT\152\SOH\STX&\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\a\EOT\DC2\EOT\152\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\a\ACK\DC2\EOT\152\SOH\v\EM\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\a\SOH\DC2\EOT\152\SOH\SUB!\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\a\ETX\DC2\EOT\152\SOH$%\n\
    \\172\SOH\n\
    \\EOT\EOT\STX\ETX\SOH\DC2\ACK\157\SOH\STX\160\SOH\ETX\SUB\155\SOH Range of reserved tag numbers. Reserved tag numbers may not be used by\n\
    \ fields or extension ranges in the same message. Reserved ranges may\n\
    \ not overlap.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\ETX\SOH\SOH\DC2\EOT\157\SOH\n\
    \\ETB\n\
    \\FS\n\
    \\ACK\EOT\STX\ETX\SOH\STX\NUL\DC2\EOT\158\SOH\EOT\GS\"\f Inclusive.\n\
    \\n\
    \\SI\n\
    \\a\EOT\STX\ETX\SOH\STX\NUL\EOT\DC2\EOT\158\SOH\EOT\f\n\
    \\SI\n\
    \\a\EOT\STX\ETX\SOH\STX\NUL\ENQ\DC2\EOT\158\SOH\r\DC2\n\
    \\SI\n\
    \\a\EOT\STX\ETX\SOH\STX\NUL\SOH\DC2\EOT\158\SOH\DC3\CAN\n\
    \\SI\n\
    \\a\EOT\STX\ETX\SOH\STX\NUL\ETX\DC2\EOT\158\SOH\ESC\FS\n\
    \\FS\n\
    \\ACK\EOT\STX\ETX\SOH\STX\SOH\DC2\EOT\159\SOH\EOT\ESC\"\f Exclusive.\n\
    \\n\
    \\SI\n\
    \\a\EOT\STX\ETX\SOH\STX\SOH\EOT\DC2\EOT\159\SOH\EOT\f\n\
    \\SI\n\
    \\a\EOT\STX\ETX\SOH\STX\SOH\ENQ\DC2\EOT\159\SOH\r\DC2\n\
    \\SI\n\
    \\a\EOT\STX\ETX\SOH\STX\SOH\SOH\DC2\EOT\159\SOH\DC3\SYN\n\
    \\SI\n\
    \\a\EOT\STX\ETX\SOH\STX\SOH\ETX\DC2\EOT\159\SOH\EM\SUB\n\
    \\f\n\
    \\EOT\EOT\STX\STX\b\DC2\EOT\161\SOH\STX,\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\b\EOT\DC2\EOT\161\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\b\ACK\DC2\EOT\161\SOH\v\CAN\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\b\SOH\DC2\EOT\161\SOH\EM'\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\b\ETX\DC2\EOT\161\SOH*+\n\
    \\131\SOH\n\
    \\EOT\EOT\STX\STX\t\DC2\EOT\164\SOH\STX%\SUBu Reserved field names, which may not be used by fields in the same message.\n\
    \ A given name may only be reserved once.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\t\EOT\DC2\EOT\164\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\t\ENQ\DC2\EOT\164\SOH\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\t\SOH\DC2\EOT\164\SOH\DC2\US\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\t\ETX\DC2\EOT\164\SOH\"$\n\
    \\f\n\
    \\STX\EOT\ETX\DC2\ACK\167\SOH\NUL\219\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\ETX\SOH\DC2\EOT\167\SOH\b\GS\n\
    \O\n\
    \\EOT\EOT\ETX\STX\NUL\DC2\EOT\169\SOH\STX:\SUBA The parser stores options it doesn't recognize here. See above.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\NUL\EOT\DC2\EOT\169\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\NUL\ACK\DC2\EOT\169\SOH\v\RS\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\NUL\SOH\DC2\EOT\169\SOH\US3\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\NUL\ETX\DC2\EOT\169\SOH69\n\
    \\SO\n\
    \\EOT\EOT\ETX\ETX\NUL\DC2\ACK\171\SOH\STX\194\SOH\ETX\n\
    \\r\n\
    \\ENQ\EOT\ETX\ETX\NUL\SOH\DC2\EOT\171\SOH\n\
    \\NAK\n\
    \K\n\
    \\ACK\EOT\ETX\ETX\NUL\STX\NUL\DC2\EOT\173\SOH\EOT\RS\SUB; The extension number declared within the extension range.\n\
    \\n\
    \\SI\n\
    \\a\EOT\ETX\ETX\NUL\STX\NUL\EOT\DC2\EOT\173\SOH\EOT\f\n\
    \\SI\n\
    \\a\EOT\ETX\ETX\NUL\STX\NUL\ENQ\DC2\EOT\173\SOH\r\DC2\n\
    \\SI\n\
    \\a\EOT\ETX\ETX\NUL\STX\NUL\SOH\DC2\EOT\173\SOH\DC3\EM\n\
    \\SI\n\
    \\a\EOT\ETX\ETX\NUL\STX\NUL\ETX\DC2\EOT\173\SOH\FS\GS\n\
    \z\n\
    \\ACK\EOT\ETX\ETX\NUL\STX\SOH\DC2\EOT\177\SOH\EOT\"\SUBj The fully-qualified name of the extension field. There must be a leading\n\
    \ dot in front of the full name.\n\
    \\n\
    \\SI\n\
    \\a\EOT\ETX\ETX\NUL\STX\SOH\EOT\DC2\EOT\177\SOH\EOT\f\n\
    \\SI\n\
    \\a\EOT\ETX\ETX\NUL\STX\SOH\ENQ\DC2\EOT\177\SOH\r\DC3\n\
    \\SI\n\
    \\a\EOT\ETX\ETX\NUL\STX\SOH\SOH\DC2\EOT\177\SOH\DC4\GS\n\
    \\SI\n\
    \\a\EOT\ETX\ETX\NUL\STX\SOH\ETX\DC2\EOT\177\SOH !\n\
    \\161\SOH\n\
    \\ACK\EOT\ETX\ETX\NUL\STX\STX\DC2\EOT\182\SOH\EOT\GS\SUB\144\SOH The fully-qualified type name of the extension field. Unlike\n\
    \ Metadata.type, Declaration.type must have a leading dot for messages\n\
    \ and enums.\n\
    \\n\
    \\SI\n\
    \\a\EOT\ETX\ETX\NUL\STX\STX\EOT\DC2\EOT\182\SOH\EOT\f\n\
    \\SI\n\
    \\a\EOT\ETX\ETX\NUL\STX\STX\ENQ\DC2\EOT\182\SOH\r\DC3\n\
    \\SI\n\
    \\a\EOT\ETX\ETX\NUL\STX\STX\SOH\DC2\EOT\182\SOH\DC4\CAN\n\
    \\SI\n\
    \\a\EOT\ETX\ETX\NUL\STX\STX\ETX\DC2\EOT\182\SOH\ESC\FS\n\
    \\206\SOH\n\
    \\ACK\EOT\ETX\ETX\NUL\STX\ETX\DC2\EOT\187\SOH\EOT\US\SUB\189\SOH If true, indicates that the number is reserved in the extension range,\n\
    \ and any extension field with the number will fail to compile. Set this\n\
    \ when a declared extension field is deleted.\n\
    \\n\
    \\SI\n\
    \\a\EOT\ETX\ETX\NUL\STX\ETX\EOT\DC2\EOT\187\SOH\EOT\f\n\
    \\SI\n\
    \\a\EOT\ETX\ETX\NUL\STX\ETX\ENQ\DC2\EOT\187\SOH\r\DC1\n\
    \\SI\n\
    \\a\EOT\ETX\ETX\NUL\STX\ETX\SOH\DC2\EOT\187\SOH\DC2\SUB\n\
    \\SI\n\
    \\a\EOT\ETX\ETX\NUL\STX\ETX\ETX\DC2\EOT\187\SOH\GS\RS\n\
    \\138\SOH\n\
    \\ACK\EOT\ETX\ETX\NUL\STX\EOT\DC2\EOT\191\SOH\EOT\US\SUBz If true, indicates that the extension must be defined as repeated.\n\
    \ Otherwise the extension must be defined as optional.\n\
    \\n\
    \\SI\n\
    \\a\EOT\ETX\ETX\NUL\STX\EOT\EOT\DC2\EOT\191\SOH\EOT\f\n\
    \\SI\n\
    \\a\EOT\ETX\ETX\NUL\STX\EOT\ENQ\DC2\EOT\191\SOH\r\DC1\n\
    \\SI\n\
    \\a\EOT\ETX\ETX\NUL\STX\EOT\SOH\DC2\EOT\191\SOH\DC2\SUB\n\
    \\SI\n\
    \\a\EOT\ETX\ETX\NUL\STX\EOT\ETX\DC2\EOT\191\SOH\GS\RS\n\
    \$\n\
    \\ENQ\EOT\ETX\ETX\NUL\t\DC2\EOT\193\SOH\EOT\SI\"\NAK removed is_repeated\n\
    \\n\
    \\SO\n\
    \\ACK\EOT\ETX\ETX\NUL\t\NUL\DC2\EOT\193\SOH\r\SO\n\
    \\SI\n\
    \\a\EOT\ETX\ETX\NUL\t\NUL\SOH\DC2\EOT\193\SOH\r\SO\n\
    \\SI\n\
    \\a\EOT\ETX\ETX\NUL\t\NUL\STX\DC2\EOT\193\SOH\r\SO\n\
    \\177\SOH\n\
    \\EOT\EOT\ETX\STX\SOH\DC2\EOT\199\SOH\STXF\SUB\162\SOH For external users: DO NOT USE. We are in the process of open sourcing\n\
    \ extension declaration and executing internal cleanups before it can be\n\
    \ used externally.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\SOH\EOT\DC2\EOT\199\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\SOH\ACK\DC2\EOT\199\SOH\v\SYN\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\SOH\SOH\DC2\EOT\199\SOH\ETB\"\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\SOH\ETX\DC2\EOT\199\SOH%&\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\SOH\b\DC2\EOT\199\SOH'E\n\
    \\SO\n\
    \\ACK\EOT\ETX\STX\SOH\b\DC1\DC2\EOT\199\SOH(D\n\
    \=\n\
    \\EOT\EOT\ETX\STX\STX\DC2\EOT\202\SOH\STX$\SUB/ Any features defined in the specific edition.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\STX\EOT\DC2\EOT\202\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\STX\ACK\DC2\EOT\202\SOH\v\NAK\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\STX\SOH\DC2\EOT\202\SOH\SYN\RS\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\STX\ETX\DC2\EOT\202\SOH!#\n\
    \@\n\
    \\EOT\EOT\ETX\EOT\NUL\DC2\ACK\205\SOH\STX\209\SOH\ETX\SUB0 The verification state of the extension range.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETX\EOT\NUL\SOH\DC2\EOT\205\SOH\a\CAN\n\
    \C\n\
    \\ACK\EOT\ETX\EOT\NUL\STX\NUL\DC2\EOT\207\SOH\EOT\DC4\SUB3 All the extensions of the range must be declared.\n\
    \\n\
    \\SI\n\
    \\a\EOT\ETX\EOT\NUL\STX\NUL\SOH\DC2\EOT\207\SOH\EOT\SI\n\
    \\SI\n\
    \\a\EOT\ETX\EOT\NUL\STX\NUL\STX\DC2\EOT\207\SOH\DC2\DC3\n\
    \\SO\n\
    \\ACK\EOT\ETX\EOT\NUL\STX\SOH\DC2\EOT\208\SOH\EOT\DC3\n\
    \\SI\n\
    \\a\EOT\ETX\EOT\NUL\STX\SOH\SOH\DC2\EOT\208\SOH\EOT\SO\n\
    \\SI\n\
    \\a\EOT\ETX\EOT\NUL\STX\SOH\STX\DC2\EOT\208\SOH\DC1\DC2\n\
    \\142\SOH\n\
    \\EOT\EOT\ETX\STX\ETX\DC2\ACK\214\SOH\STX\215\SOH;\SUB~ The verification state of the range.\n\
    \ TODO: flip the default to DECLARATION once all empty ranges\n\
    \ are marked as UNVERIFIED.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\ETX\EOT\DC2\EOT\214\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\ETX\ACK\DC2\EOT\214\SOH\v\FS\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\ETX\SOH\DC2\EOT\214\SOH\GS)\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\ETX\ETX\DC2\EOT\214\SOH,-\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\ETX\b\DC2\EOT\215\SOH\ACK:\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\ETX\a\DC2\EOT\215\SOH\DC1\ESC\n\
    \\SO\n\
    \\ACK\EOT\ETX\STX\ETX\b\DC1\DC2\EOT\215\SOH\GS9\n\
    \Z\n\
    \\ETX\EOT\ETX\ENQ\DC2\EOT\218\SOH\STX\EM\SUBM Clients can define custom options in extensions of this message. See above.\n\
    \\n\
    \\f\n\
    \\EOT\EOT\ETX\ENQ\NUL\DC2\EOT\218\SOH\r\CAN\n\
    \\r\n\
    \\ENQ\EOT\ETX\ENQ\NUL\SOH\DC2\EOT\218\SOH\r\DC1\n\
    \\r\n\
    \\ENQ\EOT\ETX\ENQ\NUL\STX\DC2\EOT\218\SOH\NAK\CAN\n\
    \3\n\
    \\STX\EOT\EOT\DC2\ACK\222\SOH\NUL\198\STX\SOH\SUB% Describes a field within a message.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\EOT\SOH\DC2\EOT\222\SOH\b\FS\n\
    \\SO\n\
    \\EOT\EOT\EOT\EOT\NUL\DC2\ACK\223\SOH\STX\255\SOH\ETX\n\
    \\r\n\
    \\ENQ\EOT\EOT\EOT\NUL\SOH\DC2\EOT\223\SOH\a\v\n\
    \S\n\
    \\ACK\EOT\EOT\EOT\NUL\STX\NUL\DC2\EOT\226\SOH\EOT\DC4\SUBC 0 is reserved for errors.\n\
    \ Order is weird for historical reasons.\n\
    \\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\NUL\SOH\DC2\EOT\226\SOH\EOT\SI\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\NUL\STX\DC2\EOT\226\SOH\DC2\DC3\n\
    \\SO\n\
    \\ACK\EOT\EOT\EOT\NUL\STX\SOH\DC2\EOT\227\SOH\EOT\DC3\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\SOH\SOH\DC2\EOT\227\SOH\EOT\SO\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\SOH\STX\DC2\EOT\227\SOH\DC1\DC2\n\
    \w\n\
    \\ACK\EOT\EOT\EOT\NUL\STX\STX\DC2\EOT\230\SOH\EOT\DC3\SUBg Not ZigZag encoded.  Negative numbers take 10 bytes.  Use TYPE_SINT64 if\n\
    \ negative values are likely.\n\
    \\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\STX\SOH\DC2\EOT\230\SOH\EOT\SO\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\STX\STX\DC2\EOT\230\SOH\DC1\DC2\n\
    \\SO\n\
    \\ACK\EOT\EOT\EOT\NUL\STX\ETX\DC2\EOT\231\SOH\EOT\DC4\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\ETX\SOH\DC2\EOT\231\SOH\EOT\SI\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\ETX\STX\DC2\EOT\231\SOH\DC2\DC3\n\
    \w\n\
    \\ACK\EOT\EOT\EOT\NUL\STX\EOT\DC2\EOT\234\SOH\EOT\DC3\SUBg Not ZigZag encoded.  Negative numbers take 10 bytes.  Use TYPE_SINT32 if\n\
    \ negative values are likely.\n\
    \\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\EOT\SOH\DC2\EOT\234\SOH\EOT\SO\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\EOT\STX\DC2\EOT\234\SOH\DC1\DC2\n\
    \\SO\n\
    \\ACK\EOT\EOT\EOT\NUL\STX\ENQ\DC2\EOT\235\SOH\EOT\NAK\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\ENQ\SOH\DC2\EOT\235\SOH\EOT\DLE\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\ENQ\STX\DC2\EOT\235\SOH\DC3\DC4\n\
    \\SO\n\
    \\ACK\EOT\EOT\EOT\NUL\STX\ACK\DC2\EOT\236\SOH\EOT\NAK\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\ACK\SOH\DC2\EOT\236\SOH\EOT\DLE\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\ACK\STX\DC2\EOT\236\SOH\DC3\DC4\n\
    \\SO\n\
    \\ACK\EOT\EOT\EOT\NUL\STX\a\DC2\EOT\237\SOH\EOT\DC2\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\a\SOH\DC2\EOT\237\SOH\EOT\r\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\a\STX\DC2\EOT\237\SOH\DLE\DC1\n\
    \\SO\n\
    \\ACK\EOT\EOT\EOT\NUL\STX\b\DC2\EOT\238\SOH\EOT\DC4\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\b\SOH\DC2\EOT\238\SOH\EOT\SI\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\b\STX\DC2\EOT\238\SOH\DC2\DC3\n\
    \\198\STX\n\
    \\ACK\EOT\EOT\EOT\NUL\STX\t\DC2\EOT\244\SOH\EOT\DC4\SUB\181\STX Tag-delimited aggregate.\n\
    \ Group type is deprecated and not supported after google.protobuf. However, Proto3\n\
    \ implementations should still be able to parse the group wire format and\n\
    \ treat group fields as unknown fields.  In Editions, the group wire format\n\
    \ can be enabled via the `message_encoding` feature.\n\
    \\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\t\SOH\DC2\EOT\244\SOH\EOT\SO\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\t\STX\DC2\EOT\244\SOH\DC1\DC3\n\
    \-\n\
    \\ACK\EOT\EOT\EOT\NUL\STX\n\
    \\DC2\EOT\245\SOH\EOT\SYN\"\GS Length-delimited aggregate.\n\
    \\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\n\
    \\SOH\DC2\EOT\245\SOH\EOT\DLE\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\n\
    \\STX\DC2\EOT\245\SOH\DC3\NAK\n\
    \#\n\
    \\ACK\EOT\EOT\EOT\NUL\STX\v\DC2\EOT\248\SOH\EOT\DC4\SUB\DC3 New in version 2.\n\
    \\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\v\SOH\DC2\EOT\248\SOH\EOT\SO\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\v\STX\DC2\EOT\248\SOH\DC1\DC3\n\
    \\SO\n\
    \\ACK\EOT\EOT\EOT\NUL\STX\f\DC2\EOT\249\SOH\EOT\NAK\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\f\SOH\DC2\EOT\249\SOH\EOT\SI\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\f\STX\DC2\EOT\249\SOH\DC2\DC4\n\
    \\SO\n\
    \\ACK\EOT\EOT\EOT\NUL\STX\r\DC2\EOT\250\SOH\EOT\DC3\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\r\SOH\DC2\EOT\250\SOH\EOT\r\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\r\STX\DC2\EOT\250\SOH\DLE\DC2\n\
    \\SO\n\
    \\ACK\EOT\EOT\EOT\NUL\STX\SO\DC2\EOT\251\SOH\EOT\ETB\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\SO\SOH\DC2\EOT\251\SOH\EOT\DC1\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\SO\STX\DC2\EOT\251\SOH\DC4\SYN\n\
    \\SO\n\
    \\ACK\EOT\EOT\EOT\NUL\STX\SI\DC2\EOT\252\SOH\EOT\ETB\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\SI\SOH\DC2\EOT\252\SOH\EOT\DC1\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\SI\STX\DC2\EOT\252\SOH\DC4\SYN\n\
    \'\n\
    \\ACK\EOT\EOT\EOT\NUL\STX\DLE\DC2\EOT\253\SOH\EOT\NAK\"\ETB Uses ZigZag encoding.\n\
    \\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\DLE\SOH\DC2\EOT\253\SOH\EOT\SI\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\DLE\STX\DC2\EOT\253\SOH\DC2\DC4\n\
    \'\n\
    \\ACK\EOT\EOT\EOT\NUL\STX\DC1\DC2\EOT\254\SOH\EOT\NAK\"\ETB Uses ZigZag encoding.\n\
    \\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\DC1\SOH\DC2\EOT\254\SOH\EOT\SI\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\NUL\STX\DC1\STX\DC2\EOT\254\SOH\DC2\DC4\n\
    \\SO\n\
    \\EOT\EOT\EOT\EOT\SOH\DC2\ACK\129\STX\STX\137\STX\ETX\n\
    \\r\n\
    \\ENQ\EOT\EOT\EOT\SOH\SOH\DC2\EOT\129\STX\a\f\n\
    \*\n\
    \\ACK\EOT\EOT\EOT\SOH\STX\NUL\DC2\EOT\131\STX\EOT\ETB\SUB\SUB 0 is reserved for errors\n\
    \\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\SOH\STX\NUL\SOH\DC2\EOT\131\STX\EOT\DC2\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\SOH\STX\NUL\STX\DC2\EOT\131\STX\NAK\SYN\n\
    \\SO\n\
    \\ACK\EOT\EOT\EOT\SOH\STX\SOH\DC2\EOT\132\STX\EOT\ETB\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\SOH\STX\SOH\SOH\DC2\EOT\132\STX\EOT\DC2\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\SOH\STX\SOH\STX\DC2\EOT\132\STX\NAK\SYN\n\
    \\204\SOH\n\
    \\ACK\EOT\EOT\EOT\SOH\STX\STX\DC2\EOT\136\STX\EOT\ETB\SUB\187\SOH The required label is only allowed in google.protobuf.  In proto3 and Editions\n\
    \ it's explicitly prohibited.  In Editions, the `field_presence` feature\n\
    \ can be used to get this behavior.\n\
    \\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\SOH\STX\STX\SOH\DC2\EOT\136\STX\EOT\DC2\n\
    \\SI\n\
    \\a\EOT\EOT\EOT\SOH\STX\STX\STX\DC2\EOT\136\STX\NAK\SYN\n\
    \\f\n\
    \\EOT\EOT\EOT\STX\NUL\DC2\EOT\139\STX\STX\ESC\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\NUL\EOT\DC2\EOT\139\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\NUL\ENQ\DC2\EOT\139\STX\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\NUL\SOH\DC2\EOT\139\STX\DC2\SYN\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\NUL\ETX\DC2\EOT\139\STX\EM\SUB\n\
    \\f\n\
    \\EOT\EOT\EOT\STX\SOH\DC2\EOT\140\STX\STX\FS\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\SOH\EOT\DC2\EOT\140\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\SOH\ENQ\DC2\EOT\140\STX\v\DLE\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\SOH\SOH\DC2\EOT\140\STX\DC1\ETB\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\SOH\ETX\DC2\EOT\140\STX\SUB\ESC\n\
    \\f\n\
    \\EOT\EOT\EOT\STX\STX\DC2\EOT\141\STX\STX\ESC\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\STX\EOT\DC2\EOT\141\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\STX\ACK\DC2\EOT\141\STX\v\DLE\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\STX\SOH\DC2\EOT\141\STX\DC1\SYN\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\STX\ETX\DC2\EOT\141\STX\EM\SUB\n\
    \\156\SOH\n\
    \\EOT\EOT\EOT\STX\ETX\DC2\EOT\145\STX\STX\EM\SUB\141\SOH If type_name is set, this need not be set.  If both this and type_name\n\
    \ are set, this must be one of TYPE_ENUM, TYPE_MESSAGE or TYPE_GROUP.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\ETX\EOT\DC2\EOT\145\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\ETX\ACK\DC2\EOT\145\STX\v\SI\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\ETX\SOH\DC2\EOT\145\STX\DLE\DC4\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\ETX\ETX\DC2\EOT\145\STX\ETB\CAN\n\
    \\183\STX\n\
    \\EOT\EOT\EOT\STX\EOT\DC2\EOT\152\STX\STX \SUB\168\STX For message and enum types, this is the name of the type.  If the name\n\
    \ starts with a '.', it is fully-qualified.  Otherwise, C++-like scoping\n\
    \ rules are used to find the type (i.e. first the nested types within this\n\
    \ message are searched, then within the parent, on up to the root\n\
    \ namespace).\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\EOT\EOT\DC2\EOT\152\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\EOT\ENQ\DC2\EOT\152\STX\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\EOT\SOH\DC2\EOT\152\STX\DC2\ESC\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\EOT\ETX\DC2\EOT\152\STX\RS\US\n\
    \~\n\
    \\EOT\EOT\EOT\STX\ENQ\DC2\EOT\156\STX\STX\US\SUBp For extensions, this is the name of the type being extended.  It is\n\
    \ resolved in the same manner as type_name.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\ENQ\EOT\DC2\EOT\156\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\ENQ\ENQ\DC2\EOT\156\STX\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\ENQ\SOH\DC2\EOT\156\STX\DC2\SUB\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\ENQ\ETX\DC2\EOT\156\STX\GS\RS\n\
    \\145\STX\n\
    \\EOT\EOT\EOT\STX\ACK\DC2\EOT\162\STX\STX$\SUB\130\STX For numeric types, contains the original text representation of the value.\n\
    \ For booleans, \"true\" or \"false\".\n\
    \ For strings, contains the default text contents (not escaped in any way).\n\
    \ For bytes, contains the C escaped value.  All bytes >= 128 are escaped.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\ACK\EOT\DC2\EOT\162\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\ACK\ENQ\DC2\EOT\162\STX\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\ACK\SOH\DC2\EOT\162\STX\DC2\US\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\ACK\ETX\DC2\EOT\162\STX\"#\n\
    \\132\SOH\n\
    \\EOT\EOT\EOT\STX\a\DC2\EOT\166\STX\STX!\SUBv If set, gives the index of a oneof in the containing type's oneof_decl\n\
    \ list.  This field is a member of that oneof.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\a\EOT\DC2\EOT\166\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\a\ENQ\DC2\EOT\166\STX\v\DLE\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\a\SOH\DC2\EOT\166\STX\DC1\FS\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\a\ETX\DC2\EOT\166\STX\US \n\
    \\250\SOH\n\
    \\EOT\EOT\EOT\STX\b\DC2\EOT\172\STX\STX!\SUB\235\SOH JSON name of this field. The value is set by protocol compiler. If the\n\
    \ user has set a \"json_name\" option on this field, that option's value\n\
    \ will be used. Otherwise, it's deduced from the field's name by converting\n\
    \ it to camelCase.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\b\EOT\DC2\EOT\172\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\b\ENQ\DC2\EOT\172\STX\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\b\SOH\DC2\EOT\172\STX\DC2\ESC\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\b\ETX\DC2\EOT\172\STX\RS \n\
    \\f\n\
    \\EOT\EOT\EOT\STX\t\DC2\EOT\174\STX\STX$\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\t\EOT\DC2\EOT\174\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\t\ACK\DC2\EOT\174\STX\v\ETB\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\t\SOH\DC2\EOT\174\STX\CAN\US\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\t\ETX\DC2\EOT\174\STX\"#\n\
    \\176\t\n\
    \\EOT\EOT\EOT\STX\n\
    \\DC2\EOT\197\STX\STX%\SUB\161\t If true, this is a proto3 \"optional\". When a proto3 field is optional, it\n\
    \ tracks presence regardless of field type.\n\
    \\n\
    \ When proto3_optional is true, this field must belong to a oneof to signal\n\
    \ to old proto3 clients that presence is tracked for this field. This oneof\n\
    \ is known as a \"synthetic\" oneof, and this field must be its sole member\n\
    \ (each proto3 optional field gets its own synthetic oneof). Synthetic oneofs\n\
    \ exist in the descriptor only, and do not generate any API. Synthetic oneofs\n\
    \ must be ordered after all \"real\" oneofs.\n\
    \\n\
    \ For message fields, proto3_optional doesn't create any semantic change,\n\
    \ since non-repeated message fields always track presence. However it still\n\
    \ indicates the semantic detail of whether the user wrote \"optional\" or not.\n\
    \ This can be useful for round-tripping the .proto file. For consistency we\n\
    \ give message fields a synthetic oneof also, even though it is not required\n\
    \ to track presence. This is especially important because the parser can't\n\
    \ tell if a field is a message or an enum, so it must always create a\n\
    \ synthetic oneof.\n\
    \\n\
    \ Proto2 optional fields do not set this flag, because they already indicate\n\
    \ optional with `LABEL_OPTIONAL`.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\n\
    \\EOT\DC2\EOT\197\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\n\
    \\ENQ\DC2\EOT\197\STX\v\SI\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\n\
    \\SOH\DC2\EOT\197\STX\DLE\US\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\n\
    \\ETX\DC2\EOT\197\STX\"$\n\
    \\"\n\
    \\STX\EOT\ENQ\DC2\ACK\201\STX\NUL\204\STX\SOH\SUB\DC4 Describes a oneof.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\ENQ\SOH\DC2\EOT\201\STX\b\FS\n\
    \\f\n\
    \\EOT\EOT\ENQ\STX\NUL\DC2\EOT\202\STX\STX\ESC\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\NUL\EOT\DC2\EOT\202\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\NUL\ENQ\DC2\EOT\202\STX\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\NUL\SOH\DC2\EOT\202\STX\DC2\SYN\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\NUL\ETX\DC2\EOT\202\STX\EM\SUB\n\
    \\f\n\
    \\EOT\EOT\ENQ\STX\SOH\DC2\EOT\203\STX\STX$\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\SOH\EOT\DC2\EOT\203\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\SOH\ACK\DC2\EOT\203\STX\v\ETB\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\SOH\SOH\DC2\EOT\203\STX\CAN\US\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\SOH\ETX\DC2\EOT\203\STX\"#\n\
    \'\n\
    \\STX\EOT\ACK\DC2\ACK\207\STX\NUL\233\STX\SOH\SUB\EM Describes an enum type.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\ACK\SOH\DC2\EOT\207\STX\b\ESC\n\
    \\f\n\
    \\EOT\EOT\ACK\STX\NUL\DC2\EOT\208\STX\STX\ESC\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\NUL\EOT\DC2\EOT\208\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\NUL\ENQ\DC2\EOT\208\STX\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\NUL\SOH\DC2\EOT\208\STX\DC2\SYN\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\NUL\ETX\DC2\EOT\208\STX\EM\SUB\n\
    \\f\n\
    \\EOT\EOT\ACK\STX\SOH\DC2\EOT\210\STX\STX.\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\SOH\EOT\DC2\EOT\210\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\SOH\ACK\DC2\EOT\210\STX\v#\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\SOH\SOH\DC2\EOT\210\STX$)\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\SOH\ETX\DC2\EOT\210\STX,-\n\
    \\f\n\
    \\EOT\EOT\ACK\STX\STX\DC2\EOT\212\STX\STX#\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\STX\EOT\DC2\EOT\212\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\STX\ACK\DC2\EOT\212\STX\v\SYN\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\STX\SOH\DC2\EOT\212\STX\ETB\RS\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\STX\ETX\DC2\EOT\212\STX!\"\n\
    \\175\STX\n\
    \\EOT\EOT\ACK\ETX\NUL\DC2\ACK\220\STX\STX\223\STX\ETX\SUB\158\STX Range of reserved numeric values. Reserved values may not be used by\n\
    \ entries in the same enum. Reserved ranges may not overlap.\n\
    \\n\
    \ Note that this is distinct from DescriptorProto.ReservedRange in that it\n\
    \ is inclusive such that it can appropriately represent the entire int32\n\
    \ domain.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ACK\ETX\NUL\SOH\DC2\EOT\220\STX\n\
    \\ESC\n\
    \\FS\n\
    \\ACK\EOT\ACK\ETX\NUL\STX\NUL\DC2\EOT\221\STX\EOT\GS\"\f Inclusive.\n\
    \\n\
    \\SI\n\
    \\a\EOT\ACK\ETX\NUL\STX\NUL\EOT\DC2\EOT\221\STX\EOT\f\n\
    \\SI\n\
    \\a\EOT\ACK\ETX\NUL\STX\NUL\ENQ\DC2\EOT\221\STX\r\DC2\n\
    \\SI\n\
    \\a\EOT\ACK\ETX\NUL\STX\NUL\SOH\DC2\EOT\221\STX\DC3\CAN\n\
    \\SI\n\
    \\a\EOT\ACK\ETX\NUL\STX\NUL\ETX\DC2\EOT\221\STX\ESC\FS\n\
    \\FS\n\
    \\ACK\EOT\ACK\ETX\NUL\STX\SOH\DC2\EOT\222\STX\EOT\ESC\"\f Inclusive.\n\
    \\n\
    \\SI\n\
    \\a\EOT\ACK\ETX\NUL\STX\SOH\EOT\DC2\EOT\222\STX\EOT\f\n\
    \\SI\n\
    \\a\EOT\ACK\ETX\NUL\STX\SOH\ENQ\DC2\EOT\222\STX\r\DC2\n\
    \\SI\n\
    \\a\EOT\ACK\ETX\NUL\STX\SOH\SOH\DC2\EOT\222\STX\DC3\SYN\n\
    \\SI\n\
    \\a\EOT\ACK\ETX\NUL\STX\SOH\ETX\DC2\EOT\222\STX\EM\SUB\n\
    \\170\SOH\n\
    \\EOT\EOT\ACK\STX\ETX\DC2\EOT\228\STX\STX0\SUB\155\SOH Range of reserved numeric values. Reserved numeric values may not be used\n\
    \ by enum values in the same enum declaration. Reserved ranges may not\n\
    \ overlap.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\ETX\EOT\DC2\EOT\228\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\ETX\ACK\DC2\EOT\228\STX\v\FS\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\ETX\SOH\DC2\EOT\228\STX\GS+\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\ETX\ETX\DC2\EOT\228\STX./\n\
    \l\n\
    \\EOT\EOT\ACK\STX\EOT\DC2\EOT\232\STX\STX$\SUB^ Reserved enum value names, which may not be reused. A given name may only\n\
    \ be reserved once.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\EOT\EOT\DC2\EOT\232\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\EOT\ENQ\DC2\EOT\232\STX\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\EOT\SOH\DC2\EOT\232\STX\DC2\US\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\EOT\ETX\DC2\EOT\232\STX\"#\n\
    \1\n\
    \\STX\EOT\a\DC2\ACK\236\STX\NUL\241\STX\SOH\SUB# Describes a value within an enum.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\a\SOH\DC2\EOT\236\STX\b \n\
    \\f\n\
    \\EOT\EOT\a\STX\NUL\DC2\EOT\237\STX\STX\ESC\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\EOT\DC2\EOT\237\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\ENQ\DC2\EOT\237\STX\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\SOH\DC2\EOT\237\STX\DC2\SYN\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\ETX\DC2\EOT\237\STX\EM\SUB\n\
    \\f\n\
    \\EOT\EOT\a\STX\SOH\DC2\EOT\238\STX\STX\FS\n\
    \\r\n\
    \\ENQ\EOT\a\STX\SOH\EOT\DC2\EOT\238\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\STX\SOH\ENQ\DC2\EOT\238\STX\v\DLE\n\
    \\r\n\
    \\ENQ\EOT\a\STX\SOH\SOH\DC2\EOT\238\STX\DC1\ETB\n\
    \\r\n\
    \\ENQ\EOT\a\STX\SOH\ETX\DC2\EOT\238\STX\SUB\ESC\n\
    \\f\n\
    \\EOT\EOT\a\STX\STX\DC2\EOT\240\STX\STX(\n\
    \\r\n\
    \\ENQ\EOT\a\STX\STX\EOT\DC2\EOT\240\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\STX\STX\ACK\DC2\EOT\240\STX\v\ESC\n\
    \\r\n\
    \\ENQ\EOT\a\STX\STX\SOH\DC2\EOT\240\STX\FS#\n\
    \\r\n\
    \\ENQ\EOT\a\STX\STX\ETX\DC2\EOT\240\STX&'\n\
    \$\n\
    \\STX\EOT\b\DC2\ACK\244\STX\NUL\249\STX\SOH\SUB\SYN Describes a service.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\b\SOH\DC2\EOT\244\STX\b\RS\n\
    \\f\n\
    \\EOT\EOT\b\STX\NUL\DC2\EOT\245\STX\STX\ESC\n\
    \\r\n\
    \\ENQ\EOT\b\STX\NUL\EOT\DC2\EOT\245\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\b\STX\NUL\ENQ\DC2\EOT\245\STX\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\b\STX\NUL\SOH\DC2\EOT\245\STX\DC2\SYN\n\
    \\r\n\
    \\ENQ\EOT\b\STX\NUL\ETX\DC2\EOT\245\STX\EM\SUB\n\
    \\f\n\
    \\EOT\EOT\b\STX\SOH\DC2\EOT\246\STX\STX,\n\
    \\r\n\
    \\ENQ\EOT\b\STX\SOH\EOT\DC2\EOT\246\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\b\STX\SOH\ACK\DC2\EOT\246\STX\v \n\
    \\r\n\
    \\ENQ\EOT\b\STX\SOH\SOH\DC2\EOT\246\STX!'\n\
    \\r\n\
    \\ENQ\EOT\b\STX\SOH\ETX\DC2\EOT\246\STX*+\n\
    \\f\n\
    \\EOT\EOT\b\STX\STX\DC2\EOT\248\STX\STX&\n\
    \\r\n\
    \\ENQ\EOT\b\STX\STX\EOT\DC2\EOT\248\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\b\STX\STX\ACK\DC2\EOT\248\STX\v\EM\n\
    \\r\n\
    \\ENQ\EOT\b\STX\STX\SOH\DC2\EOT\248\STX\SUB!\n\
    \\r\n\
    \\ENQ\EOT\b\STX\STX\ETX\DC2\EOT\248\STX$%\n\
    \0\n\
    \\STX\EOT\t\DC2\ACK\252\STX\NUL\138\ETX\SOH\SUB\" Describes a method of a service.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\t\SOH\DC2\EOT\252\STX\b\GS\n\
    \\f\n\
    \\EOT\EOT\t\STX\NUL\DC2\EOT\253\STX\STX\ESC\n\
    \\r\n\
    \\ENQ\EOT\t\STX\NUL\EOT\DC2\EOT\253\STX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\NUL\ENQ\DC2\EOT\253\STX\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\t\STX\NUL\SOH\DC2\EOT\253\STX\DC2\SYN\n\
    \\r\n\
    \\ENQ\EOT\t\STX\NUL\ETX\DC2\EOT\253\STX\EM\SUB\n\
    \\151\SOH\n\
    \\EOT\EOT\t\STX\SOH\DC2\EOT\129\ETX\STX!\SUB\136\SOH Input and output type names.  These are resolved in the same way as\n\
    \ FieldDescriptorProto.type_name, but must refer to a message type.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\SOH\EOT\DC2\EOT\129\ETX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\SOH\ENQ\DC2\EOT\129\ETX\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\t\STX\SOH\SOH\DC2\EOT\129\ETX\DC2\FS\n\
    \\r\n\
    \\ENQ\EOT\t\STX\SOH\ETX\DC2\EOT\129\ETX\US \n\
    \\f\n\
    \\EOT\EOT\t\STX\STX\DC2\EOT\130\ETX\STX\"\n\
    \\r\n\
    \\ENQ\EOT\t\STX\STX\EOT\DC2\EOT\130\ETX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\STX\ENQ\DC2\EOT\130\ETX\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\t\STX\STX\SOH\DC2\EOT\130\ETX\DC2\GS\n\
    \\r\n\
    \\ENQ\EOT\t\STX\STX\ETX\DC2\EOT\130\ETX !\n\
    \\f\n\
    \\EOT\EOT\t\STX\ETX\DC2\EOT\132\ETX\STX%\n\
    \\r\n\
    \\ENQ\EOT\t\STX\ETX\EOT\DC2\EOT\132\ETX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\ETX\ACK\DC2\EOT\132\ETX\v\CAN\n\
    \\r\n\
    \\ENQ\EOT\t\STX\ETX\SOH\DC2\EOT\132\ETX\EM \n\
    \\r\n\
    \\ENQ\EOT\t\STX\ETX\ETX\DC2\EOT\132\ETX#$\n\
    \E\n\
    \\EOT\EOT\t\STX\EOT\DC2\EOT\135\ETX\STX7\SUB7 Identifies if client streams multiple client messages\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\EOT\EOT\DC2\EOT\135\ETX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\EOT\ENQ\DC2\EOT\135\ETX\v\SI\n\
    \\r\n\
    \\ENQ\EOT\t\STX\EOT\SOH\DC2\EOT\135\ETX\DLE \n\
    \\r\n\
    \\ENQ\EOT\t\STX\EOT\ETX\DC2\EOT\135\ETX#$\n\
    \\r\n\
    \\ENQ\EOT\t\STX\EOT\b\DC2\EOT\135\ETX%6\n\
    \\r\n\
    \\ENQ\EOT\t\STX\EOT\a\DC2\EOT\135\ETX05\n\
    \E\n\
    \\EOT\EOT\t\STX\ENQ\DC2\EOT\137\ETX\STX7\SUB7 Identifies if server streams multiple server messages\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\ENQ\EOT\DC2\EOT\137\ETX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\ENQ\ENQ\DC2\EOT\137\ETX\v\SI\n\
    \\r\n\
    \\ENQ\EOT\t\STX\ENQ\SOH\DC2\EOT\137\ETX\DLE \n\
    \\r\n\
    \\ENQ\EOT\t\STX\ENQ\ETX\DC2\EOT\137\ETX#$\n\
    \\r\n\
    \\ENQ\EOT\t\STX\ENQ\b\DC2\EOT\137\ETX%6\n\
    \\r\n\
    \\ENQ\EOT\t\STX\ENQ\a\DC2\EOT\137\ETX05\n\
    \\175\SO\n\
    \\STX\EOT\n\
    \\DC2\ACK\172\ETX\NUL\168\EOT\SOH2N ===================================================================\n\
    \ Options\n\
    \2\208\r Each of the definitions above may have \"options\" attached.  These are\n\
    \ just annotations which may cause code to be generated slightly differently\n\
    \ or may contain hints for code that manipulates protocol messages.\n\
    \\n\
    \ Clients may define custom options as extensions of the *Options messages.\n\
    \ These extensions may not yet be known at parsing time, so the parser cannot\n\
    \ store the values in them.  Instead it stores them in a field in the *Options\n\
    \ message called uninterpreted_option. This field must have the same name\n\
    \ across all *Options messages. We then use this field to populate the\n\
    \ extensions when we build a descriptor, at which point all protos have been\n\
    \ parsed and so all extensions are known.\n\
    \\n\
    \ Extension numbers for custom options may be chosen as follows:\n\
    \ * For options which will only be used within a single application or\n\
    \   organization, or for experimental options, use field numbers 50000\n\
    \   through 99999.  It is up to you to ensure that you do not use the\n\
    \   same number for multiple options.\n\
    \ * For options which will be published and used publicly by multiple\n\
    \   independent entities, e-mail protobuf-global-extension-registry@google.com\n\
    \   to reserve extension numbers. Simply provide your project name (e.g.\n\
    \   Objective-C plugin) and your project website (if available) -- there's no\n\
    \   need to explain how you intend to use them. Usually you only need one\n\
    \   extension number. You can declare multiple options with only one extension\n\
    \   number by putting them in a sub-message. See the Custom Options section of\n\
    \   the docs for examples:\n\
    \   https://developers.google.com/protocol-buffers/docs/proto#options\n\
    \   If this turns out to be popular, a web service will be set up\n\
    \   to automatically assign option numbers.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\n\
    \\SOH\DC2\EOT\172\ETX\b\DC3\n\
    \\244\SOH\n\
    \\EOT\EOT\n\
    \\STX\NUL\DC2\EOT\178\ETX\STX#\SUB\229\SOH Sets the Java package where classes generated from this .proto will be\n\
    \ placed.  By default, the proto package is used, but this is often\n\
    \ inappropriate because proto packages do not normally start with backwards\n\
    \ domain names.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\NUL\EOT\DC2\EOT\178\ETX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\NUL\ENQ\DC2\EOT\178\ETX\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\NUL\SOH\DC2\EOT\178\ETX\DC2\RS\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\NUL\ETX\DC2\EOT\178\ETX!\"\n\
    \\241\STX\n\
    \\EOT\EOT\n\
    \\STX\SOH\DC2\EOT\185\ETX\STX+\SUB\226\STX Controls the name of the wrapper Java class generated for the .proto file.\n\
    \ That class will always contain the .proto file's getDescriptor() method as\n\
    \ well as any top-level extensions defined in the .proto file.\n\
    \ If java_multiple_files is disabled, then all the other classes from the\n\
    \ .proto file will be nested inside the single wrapper outer class.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\SOH\EOT\DC2\EOT\185\ETX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\SOH\ENQ\DC2\EOT\185\ETX\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\SOH\SOH\DC2\EOT\185\ETX\DC2&\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\SOH\ETX\DC2\EOT\185\ETX)*\n\
    \\166\ETX\n\
    \\EOT\EOT\n\
    \\STX\STX\DC2\EOT\193\ETX\STX;\SUB\151\ETX If enabled, then the Java code generator will generate a separate .java\n\
    \ file for each top-level message, enum, and service defined in the .proto\n\
    \ file.  Thus, these types will *not* be nested inside the wrapper class\n\
    \ named by java_outer_classname.  However, the wrapper class will still be\n\
    \ generated to contain the file's getDescriptor() method as well as any\n\
    \ top-level extensions defined in the file.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\STX\EOT\DC2\EOT\193\ETX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\STX\ENQ\DC2\EOT\193\ETX\v\SI\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\STX\SOH\DC2\EOT\193\ETX\DLE#\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\STX\ETX\DC2\EOT\193\ETX&(\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\STX\b\DC2\EOT\193\ETX):\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\STX\a\DC2\EOT\193\ETX49\n\
    \)\n\
    \\EOT\EOT\n\
    \\STX\ETX\DC2\EOT\196\ETX\STXE\SUB\ESC This option does nothing.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\ETX\EOT\DC2\EOT\196\ETX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\ETX\ENQ\DC2\EOT\196\ETX\v\SI\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\ETX\SOH\DC2\EOT\196\ETX\DLE-\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\ETX\ETX\DC2\EOT\196\ETX02\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\ETX\b\DC2\EOT\196\ETX3D\n\
    \\SO\n\
    \\ACK\EOT\n\
    \\STX\ETX\b\ETX\DC2\EOT\196\ETX4C\n\
    \\207\ETX\n\
    \\EOT\EOT\n\
    \\STX\EOT\DC2\EOT\208\ETX\STX>\SUB\192\ETX A proto2 file can set this to true to opt in to UTF-8 checking for Java,\n\
    \ which will throw an exception if invalid UTF-8 is parsed from the wire or\n\
    \ assigned to a string field.\n\
    \\n\
    \ TODO: clarify exactly what kinds of field types this option\n\
    \ applies to, and update these docs accordingly.\n\
    \\n\
    \ Proto3 files already perform these checks. Setting the option explicitly to\n\
    \ false has no effect: it cannot be used to opt proto3 files out of UTF-8\n\
    \ checks.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\EOT\EOT\DC2\EOT\208\ETX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\EOT\ENQ\DC2\EOT\208\ETX\v\SI\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\EOT\SOH\DC2\EOT\208\ETX\DLE&\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\EOT\ETX\DC2\EOT\208\ETX)+\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\EOT\b\DC2\EOT\208\ETX,=\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\EOT\a\DC2\EOT\208\ETX7<\n\
    \L\n\
    \\EOT\EOT\n\
    \\EOT\NUL\DC2\ACK\211\ETX\STX\216\ETX\ETX\SUB< Generated classes can be optimized for speed or code size.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\EOT\NUL\SOH\DC2\EOT\211\ETX\a\DC3\n\
    \D\n\
    \\ACK\EOT\n\
    \\EOT\NUL\STX\NUL\DC2\EOT\212\ETX\EOT\SO\"4 Generate complete code for parsing, serialization,\n\
    \\n\
    \\SI\n\
    \\a\EOT\n\
    \\EOT\NUL\STX\NUL\SOH\DC2\EOT\212\ETX\EOT\t\n\
    \\SI\n\
    \\a\EOT\n\
    \\EOT\NUL\STX\NUL\STX\DC2\EOT\212\ETX\f\r\n\
    \G\n\
    \\ACK\EOT\n\
    \\EOT\NUL\STX\SOH\DC2\EOT\214\ETX\EOT\DC2\SUB\ACK etc.\n\
    \\"/ Use ReflectionOps to implement these methods.\n\
    \\n\
    \\SI\n\
    \\a\EOT\n\
    \\EOT\NUL\STX\SOH\SOH\DC2\EOT\214\ETX\EOT\r\n\
    \\SI\n\
    \\a\EOT\n\
    \\EOT\NUL\STX\SOH\STX\DC2\EOT\214\ETX\DLE\DC1\n\
    \G\n\
    \\ACK\EOT\n\
    \\EOT\NUL\STX\STX\DC2\EOT\215\ETX\EOT\NAK\"7 Generate code using MessageLite and the lite runtime.\n\
    \\n\
    \\SI\n\
    \\a\EOT\n\
    \\EOT\NUL\STX\STX\SOH\DC2\EOT\215\ETX\EOT\DLE\n\
    \\SI\n\
    \\a\EOT\n\
    \\EOT\NUL\STX\STX\STX\DC2\EOT\215\ETX\DC3\DC4\n\
    \\f\n\
    \\EOT\EOT\n\
    \\STX\ENQ\DC2\EOT\217\ETX\STX;\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\ENQ\EOT\DC2\EOT\217\ETX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\ENQ\ACK\DC2\EOT\217\ETX\v\ETB\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\ENQ\SOH\DC2\EOT\217\ETX\CAN$\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\ENQ\ETX\DC2\EOT\217\ETX'(\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\ENQ\b\DC2\EOT\217\ETX):\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\ENQ\a\DC2\EOT\217\ETX49\n\
    \\226\STX\n\
    \\EOT\EOT\n\
    \\STX\ACK\DC2\EOT\224\ETX\STX\"\SUB\211\STX Sets the Go package where structs generated from this .proto will be\n\
    \ placed. If omitted, the Go package will be derived from the following:\n\
    \   - The basename of the package import path, if provided.\n\
    \   - Otherwise, the package statement in the .proto file, if present.\n\
    \   - Otherwise, the basename of the .proto file, without extension.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\ACK\EOT\DC2\EOT\224\ETX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\ACK\ENQ\DC2\EOT\224\ETX\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\ACK\SOH\DC2\EOT\224\ETX\DC2\FS\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\ACK\ETX\DC2\EOT\224\ETX\US!\n\
    \\212\EOT\n\
    \\EOT\EOT\n\
    \\STX\a\DC2\EOT\236\ETX\STX;\SUB\197\EOT Should generic services be generated in each language?  \"Generic\" services\n\
    \ are not specific to any particular RPC system.  They are generated by the\n\
    \ main code generators in each language (without additional plugins).\n\
    \ Generic services were the only kind of service generation supported by\n\
    \ early versions of google.protobuf.\n\
    \\n\
    \ Generic services are now considered deprecated in favor of using plugins\n\
    \ that generate code specific to your particular RPC system.  Therefore,\n\
    \ these default to false.  Old code which depends on generic services should\n\
    \ explicitly set them to true.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\a\EOT\DC2\EOT\236\ETX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\a\ENQ\DC2\EOT\236\ETX\v\SI\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\a\SOH\DC2\EOT\236\ETX\DLE#\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\a\ETX\DC2\EOT\236\ETX&(\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\a\b\DC2\EOT\236\ETX):\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\a\a\DC2\EOT\236\ETX49\n\
    \\f\n\
    \\EOT\EOT\n\
    \\STX\b\DC2\EOT\237\ETX\STX=\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\b\EOT\DC2\EOT\237\ETX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\b\ENQ\DC2\EOT\237\ETX\v\SI\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\b\SOH\DC2\EOT\237\ETX\DLE%\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\b\ETX\DC2\EOT\237\ETX(*\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\b\b\DC2\EOT\237\ETX+<\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\b\a\DC2\EOT\237\ETX6;\n\
    \\f\n\
    \\EOT\EOT\n\
    \\STX\t\DC2\EOT\238\ETX\STX;\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\t\EOT\DC2\EOT\238\ETX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\t\ENQ\DC2\EOT\238\ETX\v\SI\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\t\SOH\DC2\EOT\238\ETX\DLE#\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\t\ETX\DC2\EOT\238\ETX&(\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\t\b\DC2\EOT\238\ETX):\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\t\a\DC2\EOT\238\ETX49\n\
    \+\n\
    \\ETX\EOT\n\
    \\t\DC2\EOT\239\ETX\STX\SO\"\RS removed php_generic_services\n\
    \\n\
    \\f\n\
    \\EOT\EOT\n\
    \\t\NUL\DC2\EOT\239\ETX\v\r\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\t\NUL\SOH\DC2\EOT\239\ETX\v\r\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\t\NUL\STX\DC2\EOT\239\ETX\v\r\n\
    \\v\n\
    \\ETX\EOT\n\
    \\n\
    \\DC2\EOT\240\ETX\STX\"\n\
    \\f\n\
    \\EOT\EOT\n\
    \\n\
    \\NUL\DC2\EOT\240\ETX\v!\n\
    \\243\SOH\n\
    \\EOT\EOT\n\
    \\STX\n\
    \\DC2\EOT\246\ETX\STX2\SUB\228\SOH Is this file deprecated?\n\
    \ Depending on the target platform, this can emit Deprecated annotations\n\
    \ for everything in the file, or it will be completely ignored; in the very\n\
    \ least, this is a formalization for deprecating files.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\n\
    \\EOT\DC2\EOT\246\ETX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\n\
    \\ENQ\DC2\EOT\246\ETX\v\SI\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\n\
    \\SOH\DC2\EOT\246\ETX\DLE\SUB\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\n\
    \\ETX\DC2\EOT\246\ETX\GS\US\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\n\
    \\b\DC2\EOT\246\ETX 1\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\n\
    \\a\DC2\EOT\246\ETX+0\n\
    \\DEL\n\
    \\EOT\EOT\n\
    \\STX\v\DC2\EOT\250\ETX\STX7\SUBq Enables the use of arenas for the proto messages in this file. This applies\n\
    \ only to generated classes for C++.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\v\EOT\DC2\EOT\250\ETX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\v\ENQ\DC2\EOT\250\ETX\v\SI\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\v\SOH\DC2\EOT\250\ETX\DLE \n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\v\ETX\DC2\EOT\250\ETX#%\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\v\b\DC2\EOT\250\ETX&6\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\v\a\DC2\EOT\250\ETX15\n\
    \\146\SOH\n\
    \\EOT\EOT\n\
    \\STX\f\DC2\EOT\254\ETX\STX)\SUB\131\SOH Sets the objective c class prefix which is prepended to all objective c\n\
    \ generated classes from this .proto. There is no default.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\f\EOT\DC2\EOT\254\ETX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\f\ENQ\DC2\EOT\254\ETX\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\f\SOH\DC2\EOT\254\ETX\DC2#\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\f\ETX\DC2\EOT\254\ETX&(\n\
    \I\n\
    \\EOT\EOT\n\
    \\STX\r\DC2\EOT\129\EOT\STX(\SUB; Namespace for generated classes; defaults to the package.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\r\EOT\DC2\EOT\129\EOT\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\r\ENQ\DC2\EOT\129\EOT\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\r\SOH\DC2\EOT\129\EOT\DC2\"\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\r\ETX\DC2\EOT\129\EOT%'\n\
    \\145\STX\n\
    \\EOT\EOT\n\
    \\STX\SO\DC2\EOT\135\EOT\STX$\SUB\130\STX By default Swift generators will take the proto package and CamelCase it\n\
    \ replacing '.' with underscore and use that to prefix the types/symbols\n\
    \ defined. When this options is provided, they will use this value instead\n\
    \ to prefix the types/symbols defined.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\SO\EOT\DC2\EOT\135\EOT\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\SO\ENQ\DC2\EOT\135\EOT\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\SO\SOH\DC2\EOT\135\EOT\DC2\RS\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\SO\ETX\DC2\EOT\135\EOT!#\n\
    \~\n\
    \\EOT\EOT\n\
    \\STX\SI\DC2\EOT\139\EOT\STX(\SUBp Sets the php class prefix which is prepended to all php generated classes\n\
    \ from this .proto. Default is empty.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\SI\EOT\DC2\EOT\139\EOT\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\SI\ENQ\DC2\EOT\139\EOT\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\SI\SOH\DC2\EOT\139\EOT\DC2\"\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\SI\ETX\DC2\EOT\139\EOT%'\n\
    \\190\SOH\n\
    \\EOT\EOT\n\
    \\STX\DLE\DC2\EOT\144\EOT\STX%\SUB\175\SOH Use this option to change the namespace of php generated classes. Default\n\
    \ is empty. When this option is empty, the package name will be used for\n\
    \ determining the namespace.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\DLE\EOT\DC2\EOT\144\EOT\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\DLE\ENQ\DC2\EOT\144\EOT\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\DLE\SOH\DC2\EOT\144\EOT\DC2\US\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\DLE\ETX\DC2\EOT\144\EOT\"$\n\
    \\202\SOH\n\
    \\EOT\EOT\n\
    \\STX\DC1\DC2\EOT\149\EOT\STX.\SUB\187\SOH Use this option to change the namespace of php generated metadata classes.\n\
    \ Default is empty. When this option is empty, the proto file name will be\n\
    \ used for determining the namespace.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\DC1\EOT\DC2\EOT\149\EOT\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\DC1\ENQ\DC2\EOT\149\EOT\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\DC1\SOH\DC2\EOT\149\EOT\DC2(\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\DC1\ETX\DC2\EOT\149\EOT+-\n\
    \\194\SOH\n\
    \\EOT\EOT\n\
    \\STX\DC2\DC2\EOT\154\EOT\STX$\SUB\179\SOH Use this option to change the package of ruby generated classes. Default\n\
    \ is empty. When this option is not set, the package name will be used for\n\
    \ determining the ruby package.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\DC2\EOT\DC2\EOT\154\EOT\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\DC2\ENQ\DC2\EOT\154\EOT\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\DC2\SOH\DC2\EOT\154\EOT\DC2\RS\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\DC2\ETX\DC2\EOT\154\EOT!#\n\
    \=\n\
    \\EOT\EOT\n\
    \\STX\DC3\DC2\EOT\157\EOT\STX$\SUB/ Any features defined in the specific edition.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\DC3\EOT\DC2\EOT\157\EOT\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\DC3\ACK\DC2\EOT\157\EOT\v\NAK\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\DC3\SOH\DC2\EOT\157\EOT\SYN\RS\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\DC3\ETX\DC2\EOT\157\EOT!#\n\
    \|\n\
    \\EOT\EOT\n\
    \\STX\DC4\DC2\EOT\161\EOT\STX:\SUBn The parser stores options it doesn't recognize here.\n\
    \ See the documentation for the \"Options\" section above.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\DC4\EOT\DC2\EOT\161\EOT\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\DC4\ACK\DC2\EOT\161\EOT\v\RS\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\DC4\SOH\DC2\EOT\161\EOT\US3\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\DC4\ETX\DC2\EOT\161\EOT69\n\
    \\135\SOH\n\
    \\ETX\EOT\n\
    \\ENQ\DC2\EOT\165\EOT\STX\EM\SUBz Clients can define custom options in extensions of this message.\n\
    \ See the documentation for the \"Options\" section above.\n\
    \\n\
    \\f\n\
    \\EOT\EOT\n\
    \\ENQ\NUL\DC2\EOT\165\EOT\r\CAN\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\ENQ\NUL\SOH\DC2\EOT\165\EOT\r\DC1\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\ENQ\NUL\STX\DC2\EOT\165\EOT\NAK\CAN\n\
    \\v\n\
    \\ETX\EOT\n\
    \\t\DC2\EOT\167\EOT\STX\SO\n\
    \\f\n\
    \\EOT\EOT\n\
    \\t\SOH\DC2\EOT\167\EOT\v\r\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\t\SOH\SOH\DC2\EOT\167\EOT\v\r\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\t\SOH\STX\DC2\EOT\167\EOT\v\r\n\
    \\f\n\
    \\STX\EOT\v\DC2\ACK\170\EOT\NUL\250\EOT\SOH\n\
    \\v\n\
    \\ETX\EOT\v\SOH\DC2\EOT\170\EOT\b\SYN\n\
    \\216\ENQ\n\
    \\EOT\EOT\v\STX\NUL\DC2\EOT\189\EOT\STX>\SUB\201\ENQ Set true to use the old proto1 MessageSet wire format for extensions.\n\
    \ This is provided for backwards-compatibility with the MessageSet wire\n\
    \ format.  You should not use this for any other reason:  It's less\n\
    \ efficient, has fewer features, and is more complicated.\n\
    \\n\
    \ The message must be defined exactly as follows:\n\
    \   message Foo {\n\
    \     option message_set_wire_format = true;\n\
    \     extensions 4 to max;\n\
    \   }\n\
    \ Note that the message cannot have any defined fields; MessageSets only\n\
    \ have extensions.\n\
    \\n\
    \ All extensions of your type must be singular messages; e.g. they cannot\n\
    \ be int32s, enums, or repeated messages.\n\
    \\n\
    \ Because this is an option, the above two restrictions are not enforced by\n\
    \ the protocol compiler.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\v\STX\NUL\EOT\DC2\EOT\189\EOT\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\v\STX\NUL\ENQ\DC2\EOT\189\EOT\v\SI\n\
    \\r\n\
    \\ENQ\EOT\v\STX\NUL\SOH\DC2\EOT\189\EOT\DLE'\n\
    \\r\n\
    \\ENQ\EOT\v\STX\NUL\ETX\DC2\EOT\189\EOT*+\n\
    \\r\n\
    \\ENQ\EOT\v\STX\NUL\b\DC2\EOT\189\EOT,=\n\
    \\r\n\
    \\ENQ\EOT\v\STX\NUL\a\DC2\EOT\189\EOT7<\n\
    \\235\SOH\n\
    \\EOT\EOT\v\STX\SOH\DC2\EOT\194\EOT\STXF\SUB\220\SOH Disables the generation of the standard \"descriptor()\" accessor, which can\n\
    \ conflict with a field of the same name.  This is meant to make migration\n\
    \ from proto1 easier; new code should avoid fields named \"descriptor\".\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\v\STX\SOH\EOT\DC2\EOT\194\EOT\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\v\STX\SOH\ENQ\DC2\EOT\194\EOT\v\SI\n\
    \\r\n\
    \\ENQ\EOT\v\STX\SOH\SOH\DC2\EOT\194\EOT\DLE/\n\
    \\r\n\
    \\ENQ\EOT\v\STX\SOH\ETX\DC2\EOT\194\EOT23\n\
    \\r\n\
    \\ENQ\EOT\v\STX\SOH\b\DC2\EOT\194\EOT4E\n\
    \\r\n\
    \\ENQ\EOT\v\STX\SOH\a\DC2\EOT\194\EOT?D\n\
    \\238\SOH\n\
    \\EOT\EOT\v\STX\STX\DC2\EOT\200\EOT\STX1\SUB\223\SOH Is this message deprecated?\n\
    \ Depending on the target platform, this can emit Deprecated annotations\n\
    \ for the message, or it will be completely ignored; in the very least,\n\
    \ this is a formalization for deprecating messages.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\v\STX\STX\EOT\DC2\EOT\200\EOT\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\v\STX\STX\ENQ\DC2\EOT\200\EOT\v\SI\n\
    \\r\n\
    \\ENQ\EOT\v\STX\STX\SOH\DC2\EOT\200\EOT\DLE\SUB\n\
    \\r\n\
    \\ENQ\EOT\v\STX\STX\ETX\DC2\EOT\200\EOT\GS\RS\n\
    \\r\n\
    \\ENQ\EOT\v\STX\STX\b\DC2\EOT\200\EOT\US0\n\
    \\r\n\
    \\ENQ\EOT\v\STX\STX\a\DC2\EOT\200\EOT*/\n\
    \\v\n\
    \\ETX\EOT\v\t\DC2\EOT\202\EOT\STX\DC3\n\
    \\f\n\
    \\EOT\EOT\v\t\NUL\DC2\EOT\202\EOT\v\f\n\
    \\r\n\
    \\ENQ\EOT\v\t\NUL\SOH\DC2\EOT\202\EOT\v\f\n\
    \\r\n\
    \\ENQ\EOT\v\t\NUL\STX\DC2\EOT\202\EOT\v\f\n\
    \\f\n\
    \\EOT\EOT\v\t\SOH\DC2\EOT\202\EOT\SO\SI\n\
    \\r\n\
    \\ENQ\EOT\v\t\SOH\SOH\DC2\EOT\202\EOT\SO\SI\n\
    \\r\n\
    \\ENQ\EOT\v\t\SOH\STX\DC2\EOT\202\EOT\SO\SI\n\
    \\f\n\
    \\EOT\EOT\v\t\STX\DC2\EOT\202\EOT\DC1\DC2\n\
    \\r\n\
    \\ENQ\EOT\v\t\STX\SOH\DC2\EOT\202\EOT\DC1\DC2\n\
    \\r\n\
    \\ENQ\EOT\v\t\STX\STX\DC2\EOT\202\EOT\DC1\DC2\n\
    \\160\ACK\n\
    \\EOT\EOT\v\STX\ETX\DC2\EOT\225\EOT\STX\RS\SUB\145\ACK Whether the message is an automatically generated map entry type for the\n\
    \ maps field.\n\
    \\n\
    \ For maps fields:\n\
    \     map<KeyType, ValueType> map_field = 1;\n\
    \ The parsed descriptor looks like:\n\
    \     message MapFieldEntry {\n\
    \         option map_entry = true;\n\
    \         optional KeyType key = 1;\n\
    \         optional ValueType value = 2;\n\
    \     }\n\
    \     repeated MapFieldEntry map_field = 1;\n\
    \\n\
    \ Implementations may choose not to generate the map_entry=true message, but\n\
    \ use a native map in the target language to hold the keys and values.\n\
    \ The reflection APIs in such implementations still need to work as\n\
    \ if the field is a repeated message field.\n\
    \\n\
    \ NOTE: Do not set the option in .proto files. Always use the maps syntax\n\
    \ instead. The option should only be implicitly set by the proto compiler\n\
    \ parser.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\v\STX\ETX\EOT\DC2\EOT\225\EOT\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\v\STX\ETX\ENQ\DC2\EOT\225\EOT\v\SI\n\
    \\r\n\
    \\ENQ\EOT\v\STX\ETX\SOH\DC2\EOT\225\EOT\DLE\EM\n\
    \\r\n\
    \\ENQ\EOT\v\STX\ETX\ETX\DC2\EOT\225\EOT\FS\GS\n\
    \$\n\
    \\ETX\EOT\v\t\DC2\EOT\227\EOT\STX\r\"\ETB javalite_serializable\n\
    \\n\
    \\f\n\
    \\EOT\EOT\v\t\ETX\DC2\EOT\227\EOT\v\f\n\
    \\r\n\
    \\ENQ\EOT\v\t\ETX\SOH\DC2\EOT\227\EOT\v\f\n\
    \\r\n\
    \\ENQ\EOT\v\t\ETX\STX\DC2\EOT\227\EOT\v\f\n\
    \\US\n\
    \\ETX\EOT\v\t\DC2\EOT\228\EOT\STX\r\"\DC2 javanano_as_lite\n\
    \\n\
    \\f\n\
    \\EOT\EOT\v\t\EOT\DC2\EOT\228\EOT\v\f\n\
    \\r\n\
    \\ENQ\EOT\v\t\EOT\SOH\DC2\EOT\228\EOT\v\f\n\
    \\r\n\
    \\ENQ\EOT\v\t\EOT\STX\DC2\EOT\228\EOT\v\f\n\
    \\221\ETX\n\
    \\EOT\EOT\v\STX\EOT\DC2\EOT\240\EOT\STXP\SUB\206\ETX Enable the legacy handling of JSON field name conflicts.  This lowercases\n\
    \ and strips underscored from the fields before comparison in proto3 only.\n\
    \ The new behavior takes `json_name` into account and applies to proto2 as\n\
    \ well.\n\
    \\n\
    \ This should only be used as a temporary measure against broken builds due\n\
    \ to the change in behavior for JSON field name conflicts.\n\
    \\n\
    \ TODO This is legacy behavior we plan to remove once downstream\n\
    \ teams have had time to migrate.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\v\STX\EOT\EOT\DC2\EOT\240\EOT\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\v\STX\EOT\ENQ\DC2\EOT\240\EOT\v\SI\n\
    \\r\n\
    \\ENQ\EOT\v\STX\EOT\SOH\DC2\EOT\240\EOT\DLE6\n\
    \\r\n\
    \\ENQ\EOT\v\STX\EOT\ETX\DC2\EOT\240\EOT9;\n\
    \\r\n\
    \\ENQ\EOT\v\STX\EOT\b\DC2\EOT\240\EOT<O\n\
    \\SO\n\
    \\ACK\EOT\v\STX\EOT\b\ETX\DC2\EOT\240\EOT=N\n\
    \=\n\
    \\EOT\EOT\v\STX\ENQ\DC2\EOT\243\EOT\STX$\SUB/ Any features defined in the specific edition.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\v\STX\ENQ\EOT\DC2\EOT\243\EOT\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\v\STX\ENQ\ACK\DC2\EOT\243\EOT\v\NAK\n\
    \\r\n\
    \\ENQ\EOT\v\STX\ENQ\SOH\DC2\EOT\243\EOT\SYN\RS\n\
    \\r\n\
    \\ENQ\EOT\v\STX\ENQ\ETX\DC2\EOT\243\EOT!#\n\
    \O\n\
    \\EOT\EOT\v\STX\ACK\DC2\EOT\246\EOT\STX:\SUBA The parser stores options it doesn't recognize here. See above.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\v\STX\ACK\EOT\DC2\EOT\246\EOT\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\v\STX\ACK\ACK\DC2\EOT\246\EOT\v\RS\n\
    \\r\n\
    \\ENQ\EOT\v\STX\ACK\SOH\DC2\EOT\246\EOT\US3\n\
    \\r\n\
    \\ENQ\EOT\v\STX\ACK\ETX\DC2\EOT\246\EOT69\n\
    \Z\n\
    \\ETX\EOT\v\ENQ\DC2\EOT\249\EOT\STX\EM\SUBM Clients can define custom options in extensions of this message. See above.\n\
    \\n\
    \\f\n\
    \\EOT\EOT\v\ENQ\NUL\DC2\EOT\249\EOT\r\CAN\n\
    \\r\n\
    \\ENQ\EOT\v\ENQ\NUL\SOH\DC2\EOT\249\EOT\r\DC1\n\
    \\r\n\
    \\ENQ\EOT\v\ENQ\NUL\STX\DC2\EOT\249\EOT\NAK\CAN\n\
    \\f\n\
    \\STX\EOT\f\DC2\ACK\252\EOT\NUL\162\ACK\SOH\n\
    \\v\n\
    \\ETX\EOT\f\SOH\DC2\EOT\252\EOT\b\DC4\n\
    \\194\ETX\n\
    \\EOT\EOT\f\STX\NUL\DC2\EOT\132\ENQ\STXE\SUB\179\ETX NOTE: ctype is deprecated. Use `features.(pb.cpp).string_type` instead.\n\
    \ The ctype option instructs the C++ code generator to use a different\n\
    \ representation of the field than it normally would.  See the specific\n\
    \ options below.  This option is only implemented to support use of\n\
    \ [ctype=CORD] and [ctype=STRING] (the default) on non-repeated fields of\n\
    \ type \"bytes\" in the open source release.\n\
    \ TODO: make ctype actually deprecated.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\NUL\EOT\DC2\EOT\132\ENQ\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\NUL\ACK\DC2\EOT\132\ENQ\v\DLE\n\
    \\r\n\
    \\ENQ\EOT\f\STX\NUL\SOH\DC2\EOT\132\ENQ\DC1\SYN\n\
    \\r\n\
    \\ENQ\EOT\f\STX\NUL\ETX\DC2\EOT\132\ENQ\EM\SUB\n\
    \\r\n\
    \\ENQ\EOT\f\STX\NUL\b\DC2\EOT\132\ENQ\ESCD\n\
    \\r\n\
    \\ENQ\EOT\f\STX\NUL\a\DC2\EOT\132\ENQ=C\n\
    \\SO\n\
    \\EOT\EOT\f\EOT\NUL\DC2\ACK\133\ENQ\STX\146\ENQ\ETX\n\
    \\r\n\
    \\ENQ\EOT\f\EOT\NUL\SOH\DC2\EOT\133\ENQ\a\f\n\
    \\US\n\
    \\ACK\EOT\f\EOT\NUL\STX\NUL\DC2\EOT\135\ENQ\EOT\SI\SUB\SI Default mode.\n\
    \\n\
    \\SI\n\
    \\a\EOT\f\EOT\NUL\STX\NUL\SOH\DC2\EOT\135\ENQ\EOT\n\
    \\n\
    \\SI\n\
    \\a\EOT\f\EOT\NUL\STX\NUL\STX\DC2\EOT\135\ENQ\r\SO\n\
    \\150\ETX\n\
    \\ACK\EOT\f\EOT\NUL\STX\SOH\DC2\EOT\143\ENQ\EOT\r\SUB\133\ETX The option [ctype=CORD] may be applied to a non-repeated field of type\n\
    \ \"bytes\". It indicates that in C++, the data should be stored in a Cord\n\
    \ instead of a string.  For very large strings, this may reduce memory\n\
    \ fragmentation. It may also allow better performance when parsing from a\n\
    \ Cord, or when parsing with aliasing enabled, as the parsed Cord may then\n\
    \ alias the original buffer.\n\
    \\n\
    \\SI\n\
    \\a\EOT\f\EOT\NUL\STX\SOH\SOH\DC2\EOT\143\ENQ\EOT\b\n\
    \\SI\n\
    \\a\EOT\f\EOT\NUL\STX\SOH\STX\DC2\EOT\143\ENQ\v\f\n\
    \\SO\n\
    \\ACK\EOT\f\EOT\NUL\STX\STX\DC2\EOT\145\ENQ\EOT\NAK\n\
    \\SI\n\
    \\a\EOT\f\EOT\NUL\STX\STX\SOH\DC2\EOT\145\ENQ\EOT\DLE\n\
    \\SI\n\
    \\a\EOT\f\EOT\NUL\STX\STX\STX\DC2\EOT\145\ENQ\DC3\DC4\n\
    \\211\ETX\n\
    \\EOT\EOT\f\STX\SOH\DC2\EOT\154\ENQ\STX\ESC\SUB\196\ETX The packed option can be enabled for repeated primitive fields to enable\n\
    \ a more efficient representation on the wire. Rather than repeatedly\n\
    \ writing the tag and type for each element, the entire array is encoded as\n\
    \ a single length-delimited blob. In proto3, only explicit setting it to\n\
    \ false will avoid using packed encoding.  This option is prohibited in\n\
    \ Editions, but the `repeated_field_encoding` feature can be used to control\n\
    \ the behavior.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\SOH\EOT\DC2\EOT\154\ENQ\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\SOH\ENQ\DC2\EOT\154\ENQ\v\SI\n\
    \\r\n\
    \\ENQ\EOT\f\STX\SOH\SOH\DC2\EOT\154\ENQ\DLE\SYN\n\
    \\r\n\
    \\ENQ\EOT\f\STX\SOH\ETX\DC2\EOT\154\ENQ\EM\SUB\n\
    \\154\ENQ\n\
    \\EOT\EOT\f\STX\STX\DC2\EOT\167\ENQ\STX3\SUB\139\ENQ The jstype option determines the JavaScript type used for values of the\n\
    \ field.  The option is permitted only for 64 bit integral and fixed types\n\
    \ (int64, uint64, sint64, fixed64, sfixed64).  A field with jstype JS_STRING\n\
    \ is represented as JavaScript string, which avoids loss of precision that\n\
    \ can happen when a large value is converted to a floating point JavaScript.\n\
    \ Specifying JS_NUMBER for the jstype causes the generated JavaScript code to\n\
    \ use the JavaScript \"number\" type.  The behavior of the default option\n\
    \ JS_NORMAL is implementation dependent.\n\
    \\n\
    \ This option is an enum to permit additional types to be added, e.g.\n\
    \ goog.math.Integer.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\STX\EOT\DC2\EOT\167\ENQ\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\STX\ACK\DC2\EOT\167\ENQ\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\f\STX\STX\SOH\DC2\EOT\167\ENQ\DC2\CAN\n\
    \\r\n\
    \\ENQ\EOT\f\STX\STX\ETX\DC2\EOT\167\ENQ\ESC\FS\n\
    \\r\n\
    \\ENQ\EOT\f\STX\STX\b\DC2\EOT\167\ENQ\GS2\n\
    \\r\n\
    \\ENQ\EOT\f\STX\STX\a\DC2\EOT\167\ENQ(1\n\
    \\SO\n\
    \\EOT\EOT\f\EOT\SOH\DC2\ACK\168\ENQ\STX\177\ENQ\ETX\n\
    \\r\n\
    \\ENQ\EOT\f\EOT\SOH\SOH\DC2\EOT\168\ENQ\a\r\n\
    \'\n\
    \\ACK\EOT\f\EOT\SOH\STX\NUL\DC2\EOT\170\ENQ\EOT\DC2\SUB\ETB Use the default type.\n\
    \\n\
    \\SI\n\
    \\a\EOT\f\EOT\SOH\STX\NUL\SOH\DC2\EOT\170\ENQ\EOT\r\n\
    \\SI\n\
    \\a\EOT\f\EOT\SOH\STX\NUL\STX\DC2\EOT\170\ENQ\DLE\DC1\n\
    \)\n\
    \\ACK\EOT\f\EOT\SOH\STX\SOH\DC2\EOT\173\ENQ\EOT\DC2\SUB\EM Use JavaScript strings.\n\
    \\n\
    \\SI\n\
    \\a\EOT\f\EOT\SOH\STX\SOH\SOH\DC2\EOT\173\ENQ\EOT\r\n\
    \\SI\n\
    \\a\EOT\f\EOT\SOH\STX\SOH\STX\DC2\EOT\173\ENQ\DLE\DC1\n\
    \)\n\
    \\ACK\EOT\f\EOT\SOH\STX\STX\DC2\EOT\176\ENQ\EOT\DC2\SUB\EM Use JavaScript numbers.\n\
    \\n\
    \\SI\n\
    \\a\EOT\f\EOT\SOH\STX\STX\SOH\DC2\EOT\176\ENQ\EOT\r\n\
    \\SI\n\
    \\a\EOT\f\EOT\SOH\STX\STX\STX\DC2\EOT\176\ENQ\DLE\DC1\n\
    \\153\n\
    \\n\
    \\EOT\EOT\f\STX\ETX\DC2\EOT\201\ENQ\STX+\SUB\138\n\
    \ Should this field be parsed lazily?  Lazy applies only to message-type\n\
    \ fields.  It means that when the outer message is initially parsed, the\n\
    \ inner message's contents will not be parsed but instead stored in encoded\n\
    \ form.  The inner message will actually be parsed when it is first accessed.\n\
    \\n\
    \ This is only a hint.  Implementations are free to choose whether to use\n\
    \ eager or lazy parsing regardless of the value of this option.  However,\n\
    \ setting this option true suggests that the protocol author believes that\n\
    \ using lazy parsing on this field is worth the additional bookkeeping\n\
    \ overhead typically needed to implement it.\n\
    \\n\
    \ This option does not affect the public interface of any generated code;\n\
    \ all method signatures remain the same.  Furthermore, thread-safety of the\n\
    \ interface is not affected by this option; const methods remain safe to\n\
    \ call from multiple threads concurrently, while non-const methods continue\n\
    \ to require exclusive access.\n\
    \\n\
    \ Note that lazy message fields are still eagerly verified to check\n\
    \ ill-formed wireformat or missing required fields. Calling IsInitialized()\n\
    \ on the outer message would fail if the inner message has missing required\n\
    \ fields. Failed verification would result in parsing failure (except when\n\
    \ uninitialized messages are acceptable).\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\ETX\EOT\DC2\EOT\201\ENQ\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\ETX\ENQ\DC2\EOT\201\ENQ\v\SI\n\
    \\r\n\
    \\ENQ\EOT\f\STX\ETX\SOH\DC2\EOT\201\ENQ\DLE\DC4\n\
    \\r\n\
    \\ENQ\EOT\f\STX\ETX\ETX\DC2\EOT\201\ENQ\ETB\CAN\n\
    \\r\n\
    \\ENQ\EOT\f\STX\ETX\b\DC2\EOT\201\ENQ\EM*\n\
    \\r\n\
    \\ENQ\EOT\f\STX\ETX\a\DC2\EOT\201\ENQ$)\n\
    \\175\SOH\n\
    \\EOT\EOT\f\STX\EOT\DC2\EOT\206\ENQ\STX7\SUB\160\SOH unverified_lazy does no correctness checks on the byte stream. This should\n\
    \ only be used where lazy with verification is prohibitive for performance\n\
    \ reasons.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\EOT\EOT\DC2\EOT\206\ENQ\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\EOT\ENQ\DC2\EOT\206\ENQ\v\SI\n\
    \\r\n\
    \\ENQ\EOT\f\STX\EOT\SOH\DC2\EOT\206\ENQ\DLE\US\n\
    \\r\n\
    \\ENQ\EOT\f\STX\EOT\ETX\DC2\EOT\206\ENQ\"$\n\
    \\r\n\
    \\ENQ\EOT\f\STX\EOT\b\DC2\EOT\206\ENQ%6\n\
    \\r\n\
    \\ENQ\EOT\f\STX\EOT\a\DC2\EOT\206\ENQ05\n\
    \\232\SOH\n\
    \\EOT\EOT\f\STX\ENQ\DC2\EOT\212\ENQ\STX1\SUB\217\SOH Is this field deprecated?\n\
    \ Depending on the target platform, this can emit Deprecated annotations\n\
    \ for accessors, or it will be completely ignored; in the very least, this\n\
    \ is a formalization for deprecating fields.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\ENQ\EOT\DC2\EOT\212\ENQ\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\ENQ\ENQ\DC2\EOT\212\ENQ\v\SI\n\
    \\r\n\
    \\ENQ\EOT\f\STX\ENQ\SOH\DC2\EOT\212\ENQ\DLE\SUB\n\
    \\r\n\
    \\ENQ\EOT\f\STX\ENQ\ETX\DC2\EOT\212\ENQ\GS\RS\n\
    \\r\n\
    \\ENQ\EOT\f\STX\ENQ\b\DC2\EOT\212\ENQ\US0\n\
    \\r\n\
    \\ENQ\EOT\f\STX\ENQ\a\DC2\EOT\212\ENQ*/\n\
    \?\n\
    \\EOT\EOT\f\STX\ACK\DC2\EOT\215\ENQ\STX,\SUB1 For Google-internal migration only. Do not use.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\ACK\EOT\DC2\EOT\215\ENQ\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\ACK\ENQ\DC2\EOT\215\ENQ\v\SI\n\
    \\r\n\
    \\ENQ\EOT\f\STX\ACK\SOH\DC2\EOT\215\ENQ\DLE\DC4\n\
    \\r\n\
    \\ENQ\EOT\f\STX\ACK\ETX\DC2\EOT\215\ENQ\ETB\EM\n\
    \\r\n\
    \\ENQ\EOT\f\STX\ACK\b\DC2\EOT\215\ENQ\SUB+\n\
    \\r\n\
    \\ENQ\EOT\f\STX\ACK\a\DC2\EOT\215\ENQ%*\n\
    \\151\SOH\n\
    \\EOT\EOT\f\STX\a\DC2\EOT\219\ENQ\STX4\SUB\136\SOH Indicate that the field value should not be printed out when using debug\n\
    \ formats, e.g. when the field contains sensitive credentials.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\a\EOT\DC2\EOT\219\ENQ\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\a\ENQ\DC2\EOT\219\ENQ\v\SI\n\
    \\r\n\
    \\ENQ\EOT\f\STX\a\SOH\DC2\EOT\219\ENQ\DLE\FS\n\
    \\r\n\
    \\ENQ\EOT\f\STX\a\ETX\DC2\EOT\219\ENQ\US!\n\
    \\r\n\
    \\ENQ\EOT\f\STX\a\b\DC2\EOT\219\ENQ\"3\n\
    \\r\n\
    \\ENQ\EOT\f\STX\a\a\DC2\EOT\219\ENQ-2\n\
    \\197\SOH\n\
    \\EOT\EOT\f\EOT\STX\DC2\ACK\224\ENQ\STX\228\ENQ\ETX\SUB\180\SOH If set to RETENTION_SOURCE, the option will be omitted from the binary.\n\
    \ Note: as of January 2023, support for this is in progress and does not yet\n\
    \ have an effect (b/264593489).\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\EOT\STX\SOH\DC2\EOT\224\ENQ\a\SYN\n\
    \\SO\n\
    \\ACK\EOT\f\EOT\STX\STX\NUL\DC2\EOT\225\ENQ\EOT\SUB\n\
    \\SI\n\
    \\a\EOT\f\EOT\STX\STX\NUL\SOH\DC2\EOT\225\ENQ\EOT\NAK\n\
    \\SI\n\
    \\a\EOT\f\EOT\STX\STX\NUL\STX\DC2\EOT\225\ENQ\CAN\EM\n\
    \\SO\n\
    \\ACK\EOT\f\EOT\STX\STX\SOH\DC2\EOT\226\ENQ\EOT\SUB\n\
    \\SI\n\
    \\a\EOT\f\EOT\STX\STX\SOH\SOH\DC2\EOT\226\ENQ\EOT\NAK\n\
    \\SI\n\
    \\a\EOT\f\EOT\STX\STX\SOH\STX\DC2\EOT\226\ENQ\CAN\EM\n\
    \\SO\n\
    \\ACK\EOT\f\EOT\STX\STX\STX\DC2\EOT\227\ENQ\EOT\EM\n\
    \\SI\n\
    \\a\EOT\f\EOT\STX\STX\STX\SOH\DC2\EOT\227\ENQ\EOT\DC4\n\
    \\SI\n\
    \\a\EOT\f\EOT\STX\STX\STX\STX\DC2\EOT\227\ENQ\ETB\CAN\n\
    \\f\n\
    \\EOT\EOT\f\STX\b\DC2\EOT\230\ENQ\STX*\n\
    \\r\n\
    \\ENQ\EOT\f\STX\b\EOT\DC2\EOT\230\ENQ\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\b\ACK\DC2\EOT\230\ENQ\v\SUB\n\
    \\r\n\
    \\ENQ\EOT\f\STX\b\SOH\DC2\EOT\230\ENQ\ESC$\n\
    \\r\n\
    \\ENQ\EOT\f\STX\b\ETX\DC2\EOT\230\ENQ')\n\
    \\173\STX\n\
    \\EOT\EOT\f\EOT\ETX\DC2\ACK\236\ENQ\STX\247\ENQ\ETX\SUB\156\STX This indicates the types of entities that the field may apply to when used\n\
    \ as an option. If it is unset, then the field may be freely used as an\n\
    \ option on any kind of entity. Note: as of January 2023, support for this is\n\
    \ in progress and does not yet have an effect (b/264593489).\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\EOT\ETX\SOH\DC2\EOT\236\ENQ\a\ETB\n\
    \\SO\n\
    \\ACK\EOT\f\EOT\ETX\STX\NUL\DC2\EOT\237\ENQ\EOT\FS\n\
    \\SI\n\
    \\a\EOT\f\EOT\ETX\STX\NUL\SOH\DC2\EOT\237\ENQ\EOT\ETB\n\
    \\SI\n\
    \\a\EOT\f\EOT\ETX\STX\NUL\STX\DC2\EOT\237\ENQ\SUB\ESC\n\
    \\SO\n\
    \\ACK\EOT\f\EOT\ETX\STX\SOH\DC2\EOT\238\ENQ\EOT\EM\n\
    \\SI\n\
    \\a\EOT\f\EOT\ETX\STX\SOH\SOH\DC2\EOT\238\ENQ\EOT\DC4\n\
    \\SI\n\
    \\a\EOT\f\EOT\ETX\STX\SOH\STX\DC2\EOT\238\ENQ\ETB\CAN\n\
    \\SO\n\
    \\ACK\EOT\f\EOT\ETX\STX\STX\DC2\EOT\239\ENQ\EOT$\n\
    \\SI\n\
    \\a\EOT\f\EOT\ETX\STX\STX\SOH\DC2\EOT\239\ENQ\EOT\US\n\
    \\SI\n\
    \\a\EOT\f\EOT\ETX\STX\STX\STX\DC2\EOT\239\ENQ\"#\n\
    \\SO\n\
    \\ACK\EOT\f\EOT\ETX\STX\ETX\DC2\EOT\240\ENQ\EOT\FS\n\
    \\SI\n\
    \\a\EOT\f\EOT\ETX\STX\ETX\SOH\DC2\EOT\240\ENQ\EOT\ETB\n\
    \\SI\n\
    \\a\EOT\f\EOT\ETX\STX\ETX\STX\DC2\EOT\240\ENQ\SUB\ESC\n\
    \\SO\n\
    \\ACK\EOT\f\EOT\ETX\STX\EOT\DC2\EOT\241\ENQ\EOT\SUB\n\
    \\SI\n\
    \\a\EOT\f\EOT\ETX\STX\EOT\SOH\DC2\EOT\241\ENQ\EOT\NAK\n\
    \\SI\n\
    \\a\EOT\f\EOT\ETX\STX\EOT\STX\DC2\EOT\241\ENQ\CAN\EM\n\
    \\SO\n\
    \\ACK\EOT\f\EOT\ETX\STX\ENQ\DC2\EOT\242\ENQ\EOT\SUB\n\
    \\SI\n\
    \\a\EOT\f\EOT\ETX\STX\ENQ\SOH\DC2\EOT\242\ENQ\EOT\NAK\n\
    \\SI\n\
    \\a\EOT\f\EOT\ETX\STX\ENQ\STX\DC2\EOT\242\ENQ\CAN\EM\n\
    \\SO\n\
    \\ACK\EOT\f\EOT\ETX\STX\ACK\DC2\EOT\243\ENQ\EOT\EM\n\
    \\SI\n\
    \\a\EOT\f\EOT\ETX\STX\ACK\SOH\DC2\EOT\243\ENQ\EOT\DC4\n\
    \\SI\n\
    \\a\EOT\f\EOT\ETX\STX\ACK\STX\DC2\EOT\243\ENQ\ETB\CAN\n\
    \\SO\n\
    \\ACK\EOT\f\EOT\ETX\STX\a\DC2\EOT\244\ENQ\EOT\US\n\
    \\SI\n\
    \\a\EOT\f\EOT\ETX\STX\a\SOH\DC2\EOT\244\ENQ\EOT\SUB\n\
    \\SI\n\
    \\a\EOT\f\EOT\ETX\STX\a\STX\DC2\EOT\244\ENQ\GS\RS\n\
    \\SO\n\
    \\ACK\EOT\f\EOT\ETX\STX\b\DC2\EOT\245\ENQ\EOT\FS\n\
    \\SI\n\
    \\a\EOT\f\EOT\ETX\STX\b\SOH\DC2\EOT\245\ENQ\EOT\ETB\n\
    \\SI\n\
    \\a\EOT\f\EOT\ETX\STX\b\STX\DC2\EOT\245\ENQ\SUB\ESC\n\
    \\SO\n\
    \\ACK\EOT\f\EOT\ETX\STX\t\DC2\EOT\246\ENQ\EOT\ESC\n\
    \\SI\n\
    \\a\EOT\f\EOT\ETX\STX\t\SOH\DC2\EOT\246\ENQ\EOT\SYN\n\
    \\SI\n\
    \\a\EOT\f\EOT\ETX\STX\t\STX\DC2\EOT\246\ENQ\EM\SUB\n\
    \\f\n\
    \\EOT\EOT\f\STX\t\DC2\EOT\249\ENQ\STX)\n\
    \\r\n\
    \\ENQ\EOT\f\STX\t\EOT\DC2\EOT\249\ENQ\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\t\ACK\DC2\EOT\249\ENQ\v\ESC\n\
    \\r\n\
    \\ENQ\EOT\f\STX\t\SOH\DC2\EOT\249\ENQ\FS#\n\
    \\r\n\
    \\ENQ\EOT\f\STX\t\ETX\DC2\EOT\249\ENQ&(\n\
    \\SO\n\
    \\EOT\EOT\f\ETX\NUL\DC2\ACK\251\ENQ\STX\254\ENQ\ETX\n\
    \\r\n\
    \\ENQ\EOT\f\ETX\NUL\SOH\DC2\EOT\251\ENQ\n\
    \\CAN\n\
    \\SO\n\
    \\ACK\EOT\f\ETX\NUL\STX\NUL\DC2\EOT\252\ENQ\EOT!\n\
    \\SI\n\
    \\a\EOT\f\ETX\NUL\STX\NUL\EOT\DC2\EOT\252\ENQ\EOT\f\n\
    \\SI\n\
    \\a\EOT\f\ETX\NUL\STX\NUL\ACK\DC2\EOT\252\ENQ\r\DC4\n\
    \\SI\n\
    \\a\EOT\f\ETX\NUL\STX\NUL\SOH\DC2\EOT\252\ENQ\NAK\FS\n\
    \\SI\n\
    \\a\EOT\f\ETX\NUL\STX\NUL\ETX\DC2\EOT\252\ENQ\US \n\
    \\"\n\
    \\ACK\EOT\f\ETX\NUL\STX\SOH\DC2\EOT\253\ENQ\EOT\RS\"\DC2 Textproto value.\n\
    \\n\
    \\SI\n\
    \\a\EOT\f\ETX\NUL\STX\SOH\EOT\DC2\EOT\253\ENQ\EOT\f\n\
    \\SI\n\
    \\a\EOT\f\ETX\NUL\STX\SOH\ENQ\DC2\EOT\253\ENQ\r\DC3\n\
    \\SI\n\
    \\a\EOT\f\ETX\NUL\STX\SOH\SOH\DC2\EOT\253\ENQ\DC4\EM\n\
    \\SI\n\
    \\a\EOT\f\ETX\NUL\STX\SOH\ETX\DC2\EOT\253\ENQ\FS\GS\n\
    \\f\n\
    \\EOT\EOT\f\STX\n\
    \\DC2\EOT\255\ENQ\STX0\n\
    \\r\n\
    \\ENQ\EOT\f\STX\n\
    \\EOT\DC2\EOT\255\ENQ\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\n\
    \\ACK\DC2\EOT\255\ENQ\v\EM\n\
    \\r\n\
    \\ENQ\EOT\f\STX\n\
    \\SOH\DC2\EOT\255\ENQ\SUB*\n\
    \\r\n\
    \\ENQ\EOT\f\STX\n\
    \\ETX\DC2\EOT\255\ENQ-/\n\
    \=\n\
    \\EOT\EOT\f\STX\v\DC2\EOT\130\ACK\STX$\SUB/ Any features defined in the specific edition.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\v\EOT\DC2\EOT\130\ACK\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\v\ACK\DC2\EOT\130\ACK\v\NAK\n\
    \\r\n\
    \\ENQ\EOT\f\STX\v\SOH\DC2\EOT\130\ACK\SYN\RS\n\
    \\r\n\
    \\ENQ\EOT\f\STX\v\ETX\DC2\EOT\130\ACK!#\n\
    \D\n\
    \\EOT\EOT\f\ETX\SOH\DC2\ACK\133\ACK\STX\151\ACK\ETX\SUB4 Information about the support window of a feature.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\ETX\SOH\SOH\DC2\EOT\133\ACK\n\
    \\CAN\n\
    \\212\SOH\n\
    \\ACK\EOT\f\ETX\SOH\STX\NUL\DC2\EOT\137\ACK\EOT,\SUB\195\SOH The edition that this feature was first available in.  In editions\n\
    \ earlier than this one, the default assigned to EDITION_LEGACY will be\n\
    \ used, and proto files will not be able to override it.\n\
    \\n\
    \\SI\n\
    \\a\EOT\f\ETX\SOH\STX\NUL\EOT\DC2\EOT\137\ACK\EOT\f\n\
    \\SI\n\
    \\a\EOT\f\ETX\SOH\STX\NUL\ACK\DC2\EOT\137\ACK\r\DC4\n\
    \\SI\n\
    \\a\EOT\f\ETX\SOH\STX\NUL\SOH\DC2\EOT\137\ACK\NAK'\n\
    \\SI\n\
    \\a\EOT\f\ETX\SOH\STX\NUL\ETX\DC2\EOT\137\ACK*+\n\
    \w\n\
    \\ACK\EOT\f\ETX\SOH\STX\SOH\DC2\EOT\141\ACK\EOT,\SUBg The edition this feature becomes deprecated in.  Using this after this\n\
    \ edition may trigger warnings.\n\
    \\n\
    \\SI\n\
    \\a\EOT\f\ETX\SOH\STX\SOH\EOT\DC2\EOT\141\ACK\EOT\f\n\
    \\SI\n\
    \\a\EOT\f\ETX\SOH\STX\SOH\ACK\DC2\EOT\141\ACK\r\DC4\n\
    \\SI\n\
    \\a\EOT\f\ETX\SOH\STX\SOH\SOH\DC2\EOT\141\ACK\NAK'\n\
    \\SI\n\
    \\a\EOT\f\ETX\SOH\STX\SOH\ETX\DC2\EOT\141\ACK*+\n\
    \v\n\
    \\ACK\EOT\f\ETX\SOH\STX\STX\DC2\EOT\145\ACK\EOT,\SUBf The deprecation warning text if this feature is used after the edition it\n\
    \ was marked deprecated in.\n\
    \\n\
    \\SI\n\
    \\a\EOT\f\ETX\SOH\STX\STX\EOT\DC2\EOT\145\ACK\EOT\f\n\
    \\SI\n\
    \\a\EOT\f\ETX\SOH\STX\STX\ENQ\DC2\EOT\145\ACK\r\DC3\n\
    \\SI\n\
    \\a\EOT\f\ETX\SOH\STX\STX\SOH\DC2\EOT\145\ACK\DC4'\n\
    \\SI\n\
    \\a\EOT\f\ETX\SOH\STX\STX\ETX\DC2\EOT\145\ACK*+\n\
    \\190\SOH\n\
    \\ACK\EOT\f\ETX\SOH\STX\ETX\DC2\EOT\150\ACK\EOT)\SUB\173\SOH The edition this feature is no longer available in.  In editions after\n\
    \ this one, the last default assigned will be used, and proto files will\n\
    \ not be able to override it.\n\
    \\n\
    \\SI\n\
    \\a\EOT\f\ETX\SOH\STX\ETX\EOT\DC2\EOT\150\ACK\EOT\f\n\
    \\SI\n\
    \\a\EOT\f\ETX\SOH\STX\ETX\ACK\DC2\EOT\150\ACK\r\DC4\n\
    \\SI\n\
    \\a\EOT\f\ETX\SOH\STX\ETX\SOH\DC2\EOT\150\ACK\NAK$\n\
    \\SI\n\
    \\a\EOT\f\ETX\SOH\STX\ETX\ETX\DC2\EOT\150\ACK'(\n\
    \\f\n\
    \\EOT\EOT\f\STX\f\DC2\EOT\152\ACK\STX/\n\
    \\r\n\
    \\ENQ\EOT\f\STX\f\EOT\DC2\EOT\152\ACK\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\f\ACK\DC2\EOT\152\ACK\v\EM\n\
    \\r\n\
    \\ENQ\EOT\f\STX\f\SOH\DC2\EOT\152\ACK\SUB)\n\
    \\r\n\
    \\ENQ\EOT\f\STX\f\ETX\DC2\EOT\152\ACK,.\n\
    \O\n\
    \\EOT\EOT\f\STX\r\DC2\EOT\155\ACK\STX:\SUBA The parser stores options it doesn't recognize here. See above.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\r\EOT\DC2\EOT\155\ACK\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\r\ACK\DC2\EOT\155\ACK\v\RS\n\
    \\r\n\
    \\ENQ\EOT\f\STX\r\SOH\DC2\EOT\155\ACK\US3\n\
    \\r\n\
    \\ENQ\EOT\f\STX\r\ETX\DC2\EOT\155\ACK69\n\
    \Z\n\
    \\ETX\EOT\f\ENQ\DC2\EOT\158\ACK\STX\EM\SUBM Clients can define custom options in extensions of this message. See above.\n\
    \\n\
    \\f\n\
    \\EOT\EOT\f\ENQ\NUL\DC2\EOT\158\ACK\r\CAN\n\
    \\r\n\
    \\ENQ\EOT\f\ENQ\NUL\SOH\DC2\EOT\158\ACK\r\DC1\n\
    \\r\n\
    \\ENQ\EOT\f\ENQ\NUL\STX\DC2\EOT\158\ACK\NAK\CAN\n\
    \\FS\n\
    \\ETX\EOT\f\t\DC2\EOT\160\ACK\STX\r\"\SI removed jtype\n\
    \\n\
    \\f\n\
    \\EOT\EOT\f\t\NUL\DC2\EOT\160\ACK\v\f\n\
    \\r\n\
    \\ENQ\EOT\f\t\NUL\SOH\DC2\EOT\160\ACK\v\f\n\
    \\r\n\
    \\ENQ\EOT\f\t\NUL\STX\DC2\EOT\160\ACK\v\f\n\
    \9\n\
    \\ETX\EOT\f\t\DC2\EOT\161\ACK\STX\SO\", reserve target, target_obsolete_do_not_use\n\
    \\n\
    \\f\n\
    \\EOT\EOT\f\t\SOH\DC2\EOT\161\ACK\v\r\n\
    \\r\n\
    \\ENQ\EOT\f\t\SOH\SOH\DC2\EOT\161\ACK\v\r\n\
    \\r\n\
    \\ENQ\EOT\f\t\SOH\STX\DC2\EOT\161\ACK\v\r\n\
    \\f\n\
    \\STX\EOT\r\DC2\ACK\164\ACK\NUL\173\ACK\SOH\n\
    \\v\n\
    \\ETX\EOT\r\SOH\DC2\EOT\164\ACK\b\DC4\n\
    \=\n\
    \\EOT\EOT\r\STX\NUL\DC2\EOT\166\ACK\STX#\SUB/ Any features defined in the specific edition.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\r\STX\NUL\EOT\DC2\EOT\166\ACK\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\r\STX\NUL\ACK\DC2\EOT\166\ACK\v\NAK\n\
    \\r\n\
    \\ENQ\EOT\r\STX\NUL\SOH\DC2\EOT\166\ACK\SYN\RS\n\
    \\r\n\
    \\ENQ\EOT\r\STX\NUL\ETX\DC2\EOT\166\ACK!\"\n\
    \O\n\
    \\EOT\EOT\r\STX\SOH\DC2\EOT\169\ACK\STX:\SUBA The parser stores options it doesn't recognize here. See above.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\r\STX\SOH\EOT\DC2\EOT\169\ACK\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\r\STX\SOH\ACK\DC2\EOT\169\ACK\v\RS\n\
    \\r\n\
    \\ENQ\EOT\r\STX\SOH\SOH\DC2\EOT\169\ACK\US3\n\
    \\r\n\
    \\ENQ\EOT\r\STX\SOH\ETX\DC2\EOT\169\ACK69\n\
    \Z\n\
    \\ETX\EOT\r\ENQ\DC2\EOT\172\ACK\STX\EM\SUBM Clients can define custom options in extensions of this message. See above.\n\
    \\n\
    \\f\n\
    \\EOT\EOT\r\ENQ\NUL\DC2\EOT\172\ACK\r\CAN\n\
    \\r\n\
    \\ENQ\EOT\r\ENQ\NUL\SOH\DC2\EOT\172\ACK\r\DC1\n\
    \\r\n\
    \\ENQ\EOT\r\ENQ\NUL\STX\DC2\EOT\172\ACK\NAK\CAN\n\
    \\f\n\
    \\STX\EOT\SO\DC2\ACK\175\ACK\NUL\205\ACK\SOH\n\
    \\v\n\
    \\ETX\EOT\SO\SOH\DC2\EOT\175\ACK\b\DC3\n\
    \`\n\
    \\EOT\EOT\SO\STX\NUL\DC2\EOT\179\ACK\STX \SUBR Set this option to true to allow mapping different tag names to the same\n\
    \ value.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\NUL\EOT\DC2\EOT\179\ACK\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\NUL\ENQ\DC2\EOT\179\ACK\v\SI\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\NUL\SOH\DC2\EOT\179\ACK\DLE\ESC\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\NUL\ETX\DC2\EOT\179\ACK\RS\US\n\
    \\229\SOH\n\
    \\EOT\EOT\SO\STX\SOH\DC2\EOT\185\ACK\STX1\SUB\214\SOH Is this enum deprecated?\n\
    \ Depending on the target platform, this can emit Deprecated annotations\n\
    \ for the enum, or it will be completely ignored; in the very least, this\n\
    \ is a formalization for deprecating enums.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\SOH\EOT\DC2\EOT\185\ACK\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\SOH\ENQ\DC2\EOT\185\ACK\v\SI\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\SOH\SOH\DC2\EOT\185\ACK\DLE\SUB\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\SOH\ETX\DC2\EOT\185\ACK\GS\RS\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\SOH\b\DC2\EOT\185\ACK\US0\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\SOH\a\DC2\EOT\185\ACK*/\n\
    \\US\n\
    \\ETX\EOT\SO\t\DC2\EOT\187\ACK\STX\r\"\DC2 javanano_as_lite\n\
    \\n\
    \\f\n\
    \\EOT\EOT\SO\t\NUL\DC2\EOT\187\ACK\v\f\n\
    \\r\n\
    \\ENQ\EOT\SO\t\NUL\SOH\DC2\EOT\187\ACK\v\f\n\
    \\r\n\
    \\ENQ\EOT\SO\t\NUL\STX\DC2\EOT\187\ACK\v\f\n\
    \\200\STX\n\
    \\EOT\EOT\SO\STX\STX\DC2\EOT\195\ACK\STXO\SUB\185\STX Enable the legacy handling of JSON field name conflicts.  This lowercases\n\
    \ and strips underscored from the fields before comparison in proto3 only.\n\
    \ The new behavior takes `json_name` into account and applies to proto2 as\n\
    \ well.\n\
    \ TODO Remove this legacy behavior once downstream teams have\n\
    \ had time to migrate.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\STX\EOT\DC2\EOT\195\ACK\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\STX\ENQ\DC2\EOT\195\ACK\v\SI\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\STX\SOH\DC2\EOT\195\ACK\DLE6\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\STX\ETX\DC2\EOT\195\ACK9:\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\STX\b\DC2\EOT\195\ACK;N\n\
    \\SO\n\
    \\ACK\EOT\SO\STX\STX\b\ETX\DC2\EOT\195\ACK<M\n\
    \=\n\
    \\EOT\EOT\SO\STX\ETX\DC2\EOT\198\ACK\STX#\SUB/ Any features defined in the specific edition.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\ETX\EOT\DC2\EOT\198\ACK\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\ETX\ACK\DC2\EOT\198\ACK\v\NAK\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\ETX\SOH\DC2\EOT\198\ACK\SYN\RS\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\ETX\ETX\DC2\EOT\198\ACK!\"\n\
    \O\n\
    \\EOT\EOT\SO\STX\EOT\DC2\EOT\201\ACK\STX:\SUBA The parser stores options it doesn't recognize here. See above.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\EOT\EOT\DC2\EOT\201\ACK\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\EOT\ACK\DC2\EOT\201\ACK\v\RS\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\EOT\SOH\DC2\EOT\201\ACK\US3\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\EOT\ETX\DC2\EOT\201\ACK69\n\
    \Z\n\
    \\ETX\EOT\SO\ENQ\DC2\EOT\204\ACK\STX\EM\SUBM Clients can define custom options in extensions of this message. See above.\n\
    \\n\
    \\f\n\
    \\EOT\EOT\SO\ENQ\NUL\DC2\EOT\204\ACK\r\CAN\n\
    \\r\n\
    \\ENQ\EOT\SO\ENQ\NUL\SOH\DC2\EOT\204\ACK\r\DC1\n\
    \\r\n\
    \\ENQ\EOT\SO\ENQ\NUL\STX\DC2\EOT\204\ACK\NAK\CAN\n\
    \\f\n\
    \\STX\EOT\SI\DC2\ACK\207\ACK\NUL\230\ACK\SOH\n\
    \\v\n\
    \\ETX\EOT\SI\SOH\DC2\EOT\207\ACK\b\CAN\n\
    \\247\SOH\n\
    \\EOT\EOT\SI\STX\NUL\DC2\EOT\212\ACK\STX1\SUB\232\SOH Is this enum value deprecated?\n\
    \ Depending on the target platform, this can emit Deprecated annotations\n\
    \ for the enum value, or it will be completely ignored; in the very least,\n\
    \ this is a formalization for deprecating enum values.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\NUL\EOT\DC2\EOT\212\ACK\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\NUL\ENQ\DC2\EOT\212\ACK\v\SI\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\NUL\SOH\DC2\EOT\212\ACK\DLE\SUB\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\NUL\ETX\DC2\EOT\212\ACK\GS\RS\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\NUL\b\DC2\EOT\212\ACK\US0\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\NUL\a\DC2\EOT\212\ACK*/\n\
    \=\n\
    \\EOT\EOT\SI\STX\SOH\DC2\EOT\215\ACK\STX#\SUB/ Any features defined in the specific edition.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\SOH\EOT\DC2\EOT\215\ACK\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\SOH\ACK\DC2\EOT\215\ACK\v\NAK\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\SOH\SOH\DC2\EOT\215\ACK\SYN\RS\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\SOH\ETX\DC2\EOT\215\ACK!\"\n\
    \\174\SOH\n\
    \\EOT\EOT\SI\STX\STX\DC2\EOT\220\ACK\STX3\SUB\159\SOH Indicate that fields annotated with this enum value should not be printed\n\
    \ out when using debug formats, e.g. when the field contains sensitive\n\
    \ credentials.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\STX\EOT\DC2\EOT\220\ACK\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\STX\ENQ\DC2\EOT\220\ACK\v\SI\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\STX\SOH\DC2\EOT\220\ACK\DLE\FS\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\STX\ETX\DC2\EOT\220\ACK\US \n\
    \\r\n\
    \\ENQ\EOT\SI\STX\STX\b\DC2\EOT\220\ACK!2\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\STX\a\DC2\EOT\220\ACK,1\n\
    \H\n\
    \\EOT\EOT\SI\STX\ETX\DC2\EOT\223\ACK\STX;\SUB: Information about the support window of a feature value.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\ETX\EOT\DC2\EOT\223\ACK\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\ETX\ACK\DC2\EOT\223\ACK\v&\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\ETX\SOH\DC2\EOT\223\ACK'6\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\ETX\ETX\DC2\EOT\223\ACK9:\n\
    \O\n\
    \\EOT\EOT\SI\STX\EOT\DC2\EOT\226\ACK\STX:\SUBA The parser stores options it doesn't recognize here. See above.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\EOT\EOT\DC2\EOT\226\ACK\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\EOT\ACK\DC2\EOT\226\ACK\v\RS\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\EOT\SOH\DC2\EOT\226\ACK\US3\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\EOT\ETX\DC2\EOT\226\ACK69\n\
    \Z\n\
    \\ETX\EOT\SI\ENQ\DC2\EOT\229\ACK\STX\EM\SUBM Clients can define custom options in extensions of this message. See above.\n\
    \\n\
    \\f\n\
    \\EOT\EOT\SI\ENQ\NUL\DC2\EOT\229\ACK\r\CAN\n\
    \\r\n\
    \\ENQ\EOT\SI\ENQ\NUL\SOH\DC2\EOT\229\ACK\r\DC1\n\
    \\r\n\
    \\ENQ\EOT\SI\ENQ\NUL\STX\DC2\EOT\229\ACK\NAK\CAN\n\
    \\f\n\
    \\STX\EOT\DLE\DC2\ACK\232\ACK\NUL\253\ACK\SOH\n\
    \\v\n\
    \\ETX\EOT\DLE\SOH\DC2\EOT\232\ACK\b\SYN\n\
    \=\n\
    \\EOT\EOT\DLE\STX\NUL\DC2\EOT\235\ACK\STX$\SUB/ Any features defined in the specific edition.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\NUL\EOT\DC2\EOT\235\ACK\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\NUL\ACK\DC2\EOT\235\ACK\v\NAK\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\NUL\SOH\DC2\EOT\235\ACK\SYN\RS\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\NUL\ETX\DC2\EOT\235\ACK!#\n\
    \\217\ETX\n\
    \\EOT\EOT\DLE\STX\SOH\DC2\EOT\246\ACK\STX2\SUB\223\SOH Is this service deprecated?\n\
    \ Depending on the target platform, this can emit Deprecated annotations\n\
    \ for the service, or it will be completely ignored; in the very least,\n\
    \ this is a formalization for deprecating services.\n\
    \2\232\SOH Note:  Field numbers 1 through 32 are reserved for Google's internal RPC\n\
    \   framework.  We apologize for hoarding these numbers to ourselves, but\n\
    \   we were already using them long before we decided to release Protocol\n\
    \   Buffers.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\SOH\EOT\DC2\EOT\246\ACK\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\SOH\ENQ\DC2\EOT\246\ACK\v\SI\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\SOH\SOH\DC2\EOT\246\ACK\DLE\SUB\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\SOH\ETX\DC2\EOT\246\ACK\GS\US\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\SOH\b\DC2\EOT\246\ACK 1\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\SOH\a\DC2\EOT\246\ACK+0\n\
    \O\n\
    \\EOT\EOT\DLE\STX\STX\DC2\EOT\249\ACK\STX:\SUBA The parser stores options it doesn't recognize here. See above.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\STX\EOT\DC2\EOT\249\ACK\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\STX\ACK\DC2\EOT\249\ACK\v\RS\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\STX\SOH\DC2\EOT\249\ACK\US3\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\STX\ETX\DC2\EOT\249\ACK69\n\
    \Z\n\
    \\ETX\EOT\DLE\ENQ\DC2\EOT\252\ACK\STX\EM\SUBM Clients can define custom options in extensions of this message. See above.\n\
    \\n\
    \\f\n\
    \\EOT\EOT\DLE\ENQ\NUL\DC2\EOT\252\ACK\r\CAN\n\
    \\r\n\
    \\ENQ\EOT\DLE\ENQ\NUL\SOH\DC2\EOT\252\ACK\r\DC1\n\
    \\r\n\
    \\ENQ\EOT\DLE\ENQ\NUL\STX\DC2\EOT\252\ACK\NAK\CAN\n\
    \\f\n\
    \\STX\EOT\DC1\DC2\ACK\255\ACK\NUL\159\a\SOH\n\
    \\v\n\
    \\ETX\EOT\DC1\SOH\DC2\EOT\255\ACK\b\NAK\n\
    \\214\ETX\n\
    \\EOT\EOT\DC1\STX\NUL\DC2\EOT\138\a\STX2\SUB\220\SOH Is this method deprecated?\n\
    \ Depending on the target platform, this can emit Deprecated annotations\n\
    \ for the method, or it will be completely ignored; in the very least,\n\
    \ this is a formalization for deprecating methods.\n\
    \2\232\SOH Note:  Field numbers 1 through 32 are reserved for Google's internal RPC\n\
    \   framework.  We apologize for hoarding these numbers to ourselves, but\n\
    \   we were already using them long before we decided to release Protocol\n\
    \   Buffers.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\NUL\EOT\DC2\EOT\138\a\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\NUL\ENQ\DC2\EOT\138\a\v\SI\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\NUL\SOH\DC2\EOT\138\a\DLE\SUB\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\NUL\ETX\DC2\EOT\138\a\GS\US\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\NUL\b\DC2\EOT\138\a 1\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\NUL\a\DC2\EOT\138\a+0\n\
    \\240\SOH\n\
    \\EOT\EOT\DC1\EOT\NUL\DC2\ACK\143\a\STX\147\a\ETX\SUB\223\SOH Is this method side-effect-free (or safe in HTTP parlance), or idempotent,\n\
    \ or neither? HTTP based RPC implementation may choose GET verb for safe\n\
    \ methods, and PUT verb for idempotent methods instead of the default POST.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC1\EOT\NUL\SOH\DC2\EOT\143\a\a\ETB\n\
    \\SO\n\
    \\ACK\EOT\DC1\EOT\NUL\STX\NUL\DC2\EOT\144\a\EOT\FS\n\
    \\SI\n\
    \\a\EOT\DC1\EOT\NUL\STX\NUL\SOH\DC2\EOT\144\a\EOT\ETB\n\
    \\SI\n\
    \\a\EOT\DC1\EOT\NUL\STX\NUL\STX\DC2\EOT\144\a\SUB\ESC\n\
    \$\n\
    \\ACK\EOT\DC1\EOT\NUL\STX\SOH\DC2\EOT\145\a\EOT\CAN\"\DC4 implies idempotent\n\
    \\n\
    \\SI\n\
    \\a\EOT\DC1\EOT\NUL\STX\SOH\SOH\DC2\EOT\145\a\EOT\DC3\n\
    \\SI\n\
    \\a\EOT\DC1\EOT\NUL\STX\SOH\STX\DC2\EOT\145\a\SYN\ETB\n\
    \7\n\
    \\ACK\EOT\DC1\EOT\NUL\STX\STX\DC2\EOT\146\a\EOT\DC3\"' idempotent, but may have side effects\n\
    \\n\
    \\SI\n\
    \\a\EOT\DC1\EOT\NUL\STX\STX\SOH\DC2\EOT\146\a\EOT\SO\n\
    \\SI\n\
    \\a\EOT\DC1\EOT\NUL\STX\STX\STX\DC2\EOT\146\a\DC1\DC2\n\
    \\SO\n\
    \\EOT\EOT\DC1\STX\SOH\DC2\ACK\148\a\STX\149\a&\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\SOH\EOT\DC2\EOT\148\a\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\SOH\ACK\DC2\EOT\148\a\v\ESC\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\SOH\SOH\DC2\EOT\148\a\FS-\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\SOH\ETX\DC2\EOT\148\a02\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\SOH\b\DC2\EOT\149\a\ACK%\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\SOH\a\DC2\EOT\149\a\DC1$\n\
    \=\n\
    \\EOT\EOT\DC1\STX\STX\DC2\EOT\152\a\STX$\SUB/ Any features defined in the specific edition.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\STX\EOT\DC2\EOT\152\a\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\STX\ACK\DC2\EOT\152\a\v\NAK\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\STX\SOH\DC2\EOT\152\a\SYN\RS\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\STX\ETX\DC2\EOT\152\a!#\n\
    \O\n\
    \\EOT\EOT\DC1\STX\ETX\DC2\EOT\155\a\STX:\SUBA The parser stores options it doesn't recognize here. See above.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\ETX\EOT\DC2\EOT\155\a\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\ETX\ACK\DC2\EOT\155\a\v\RS\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\ETX\SOH\DC2\EOT\155\a\US3\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\ETX\ETX\DC2\EOT\155\a69\n\
    \Z\n\
    \\ETX\EOT\DC1\ENQ\DC2\EOT\158\a\STX\EM\SUBM Clients can define custom options in extensions of this message. See above.\n\
    \\n\
    \\f\n\
    \\EOT\EOT\DC1\ENQ\NUL\DC2\EOT\158\a\r\CAN\n\
    \\r\n\
    \\ENQ\EOT\DC1\ENQ\NUL\SOH\DC2\EOT\158\a\r\DC1\n\
    \\r\n\
    \\ENQ\EOT\DC1\ENQ\NUL\STX\DC2\EOT\158\a\NAK\CAN\n\
    \\139\ETX\n\
    \\STX\EOT\DC2\DC2\ACK\167\a\NUL\187\a\SOH\SUB\252\STX A message representing a option the parser does not recognize. This only\n\
    \ appears in options protos created by the compiler::Parser class.\n\
    \ DescriptorPool resolves these when building Descriptor objects. Therefore,\n\
    \ options protos in descriptor objects (e.g. returned by Descriptor::options(),\n\
    \ or produced by Descriptor::CopyTo()) will never have UninterpretedOptions\n\
    \ in them.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\DC2\SOH\DC2\EOT\167\a\b\ESC\n\
    \\203\STX\n\
    \\EOT\EOT\DC2\ETX\NUL\DC2\ACK\173\a\STX\176\a\ETX\SUB\186\STX The name of the uninterpreted option.  Each string represents a segment in\n\
    \ a dot-separated name.  is_extension is true iff a segment represents an\n\
    \ extension (denoted with parentheses in options specs in .proto files).\n\
    \ E.g.,{ [\"foo\", false], [\"bar.baz\", true], [\"moo\", false] } represents\n\
    \ \"foo.(bar.baz).moo\".\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC2\ETX\NUL\SOH\DC2\EOT\173\a\n\
    \\DC2\n\
    \\SO\n\
    \\ACK\EOT\DC2\ETX\NUL\STX\NUL\DC2\EOT\174\a\EOT\"\n\
    \\SI\n\
    \\a\EOT\DC2\ETX\NUL\STX\NUL\EOT\DC2\EOT\174\a\EOT\f\n\
    \\SI\n\
    \\a\EOT\DC2\ETX\NUL\STX\NUL\ENQ\DC2\EOT\174\a\r\DC3\n\
    \\SI\n\
    \\a\EOT\DC2\ETX\NUL\STX\NUL\SOH\DC2\EOT\174\a\DC4\GS\n\
    \\SI\n\
    \\a\EOT\DC2\ETX\NUL\STX\NUL\ETX\DC2\EOT\174\a !\n\
    \\SO\n\
    \\ACK\EOT\DC2\ETX\NUL\STX\SOH\DC2\EOT\175\a\EOT#\n\
    \\SI\n\
    \\a\EOT\DC2\ETX\NUL\STX\SOH\EOT\DC2\EOT\175\a\EOT\f\n\
    \\SI\n\
    \\a\EOT\DC2\ETX\NUL\STX\SOH\ENQ\DC2\EOT\175\a\r\DC1\n\
    \\SI\n\
    \\a\EOT\DC2\ETX\NUL\STX\SOH\SOH\DC2\EOT\175\a\DC2\RS\n\
    \\SI\n\
    \\a\EOT\DC2\ETX\NUL\STX\SOH\ETX\DC2\EOT\175\a!\"\n\
    \\f\n\
    \\EOT\EOT\DC2\STX\NUL\DC2\EOT\177\a\STX\GS\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\NUL\EOT\DC2\EOT\177\a\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\NUL\ACK\DC2\EOT\177\a\v\DC3\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\NUL\SOH\DC2\EOT\177\a\DC4\CAN\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\NUL\ETX\DC2\EOT\177\a\ESC\FS\n\
    \\156\SOH\n\
    \\EOT\EOT\DC2\STX\SOH\DC2\EOT\181\a\STX'\SUB\141\SOH The value of the uninterpreted option, in whatever type the tokenizer\n\
    \ identified it as during parsing. Exactly one of these should be set.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\SOH\EOT\DC2\EOT\181\a\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\SOH\ENQ\DC2\EOT\181\a\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\SOH\SOH\DC2\EOT\181\a\DC2\"\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\SOH\ETX\DC2\EOT\181\a%&\n\
    \\f\n\
    \\EOT\EOT\DC2\STX\STX\DC2\EOT\182\a\STX)\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\STX\EOT\DC2\EOT\182\a\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\STX\ENQ\DC2\EOT\182\a\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\STX\SOH\DC2\EOT\182\a\DC2$\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\STX\ETX\DC2\EOT\182\a'(\n\
    \\f\n\
    \\EOT\EOT\DC2\STX\ETX\DC2\EOT\183\a\STX(\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\ETX\EOT\DC2\EOT\183\a\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\ETX\ENQ\DC2\EOT\183\a\v\DLE\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\ETX\SOH\DC2\EOT\183\a\DC1#\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\ETX\ETX\DC2\EOT\183\a&'\n\
    \\f\n\
    \\EOT\EOT\DC2\STX\EOT\DC2\EOT\184\a\STX#\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\EOT\EOT\DC2\EOT\184\a\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\EOT\ENQ\DC2\EOT\184\a\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\EOT\SOH\DC2\EOT\184\a\DC2\RS\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\EOT\ETX\DC2\EOT\184\a!\"\n\
    \\f\n\
    \\EOT\EOT\DC2\STX\ENQ\DC2\EOT\185\a\STX\"\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\ENQ\EOT\DC2\EOT\185\a\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\ENQ\ENQ\DC2\EOT\185\a\v\DLE\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\ENQ\SOH\DC2\EOT\185\a\DC1\GS\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\ENQ\ETX\DC2\EOT\185\a !\n\
    \\f\n\
    \\EOT\EOT\DC2\STX\ACK\DC2\EOT\186\a\STX&\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\ACK\EOT\DC2\EOT\186\a\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\ACK\ENQ\DC2\EOT\186\a\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\ACK\SOH\DC2\EOT\186\a\DC2!\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\ACK\ETX\DC2\EOT\186\a$%\n\
    \\219\ETX\n\
    \\STX\EOT\DC3\DC2\ACK\198\a\NUL\193\b\SOH\SUB\251\STX TODO Enums in C++ gencode (and potentially other languages) are\n\
    \ not well scoped.  This means that each of the feature enums below can clash\n\
    \ with each other.  The short names we've chosen maximize call-site\n\
    \ readability, but leave us very open to this scenario.  A future feature will\n\
    \ be designed and implemented to handle this, hopefully before we ever hit a\n\
    \ conflict here.\n\
    \2O ===================================================================\n\
    \ Features\n\
    \\n\
    \\v\n\
    \\ETX\EOT\DC3\SOH\DC2\EOT\198\a\b\DC2\n\
    \\SO\n\
    \\EOT\EOT\DC3\EOT\NUL\DC2\ACK\199\a\STX\204\a\ETX\n\
    \\r\n\
    \\ENQ\EOT\DC3\EOT\NUL\SOH\DC2\EOT\199\a\a\DC4\n\
    \\SO\n\
    \\ACK\EOT\DC3\EOT\NUL\STX\NUL\DC2\EOT\200\a\EOT\US\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\NUL\STX\NUL\SOH\DC2\EOT\200\a\EOT\SUB\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\NUL\STX\NUL\STX\DC2\EOT\200\a\GS\RS\n\
    \\SO\n\
    \\ACK\EOT\DC3\EOT\NUL\STX\SOH\DC2\EOT\201\a\EOT\DC1\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\NUL\STX\SOH\SOH\DC2\EOT\201\a\EOT\f\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\NUL\STX\SOH\STX\DC2\EOT\201\a\SI\DLE\n\
    \\SO\n\
    \\ACK\EOT\DC3\EOT\NUL\STX\STX\DC2\EOT\202\a\EOT\DC1\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\NUL\STX\STX\SOH\DC2\EOT\202\a\EOT\f\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\NUL\STX\STX\STX\DC2\EOT\202\a\SI\DLE\n\
    \\SO\n\
    \\ACK\EOT\DC3\EOT\NUL\STX\ETX\DC2\EOT\203\a\EOT\CAN\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\NUL\STX\ETX\SOH\DC2\EOT\203\a\EOT\DC3\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\NUL\STX\ETX\STX\DC2\EOT\203\a\SYN\ETB\n\
    \\SO\n\
    \\EOT\EOT\DC3\STX\NUL\DC2\ACK\205\a\STX\215\a\EOT\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\NUL\EOT\DC2\EOT\205\a\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\NUL\ACK\DC2\EOT\205\a\v\CAN\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\NUL\SOH\DC2\EOT\205\a\EM'\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\NUL\ETX\DC2\EOT\205\a*+\n\
    \\SI\n\
    \\ENQ\EOT\DC3\STX\NUL\b\DC2\ACK\205\a,\215\a\ETX\n\
    \\SO\n\
    \\ACK\EOT\DC3\STX\NUL\b\DC1\DC2\EOT\206\a\EOT!\n\
    \\SI\n\
    \\a\EOT\DC3\STX\NUL\b\DC3\NUL\DC2\EOT\207\a\EOT\US\n\
    \\SI\n\
    \\a\EOT\DC3\STX\NUL\b\DC3\SOH\DC2\EOT\208\a\EOT\RS\n\
    \\DLE\n\
    \\ACK\EOT\DC3\STX\NUL\b\SYN\DC2\ACK\209\a\EOT\211\a\ENQ\n\
    \\SI\n\
    \\a\EOT\DC3\STX\NUL\b\DC4\NUL\DC2\EOT\212\a\EOTE\n\
    \\SI\n\
    \\a\EOT\DC3\STX\NUL\b\DC4\SOH\DC2\EOT\213\a\EOTE\n\
    \\SI\n\
    \\a\EOT\DC3\STX\NUL\b\DC4\STX\DC2\EOT\214\a\EOTC\n\
    \\SO\n\
    \\EOT\EOT\DC3\EOT\SOH\DC2\ACK\217\a\STX\221\a\ETX\n\
    \\r\n\
    \\ENQ\EOT\DC3\EOT\SOH\SOH\DC2\EOT\217\a\a\SI\n\
    \\SO\n\
    \\ACK\EOT\DC3\EOT\SOH\STX\NUL\DC2\EOT\218\a\EOT\SUB\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\SOH\STX\NUL\SOH\DC2\EOT\218\a\EOT\NAK\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\SOH\STX\NUL\STX\DC2\EOT\218\a\CAN\EM\n\
    \\SO\n\
    \\ACK\EOT\DC3\EOT\SOH\STX\SOH\DC2\EOT\219\a\EOT\r\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\SOH\STX\SOH\SOH\DC2\EOT\219\a\EOT\b\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\SOH\STX\SOH\STX\DC2\EOT\219\a\v\f\n\
    \\SO\n\
    \\ACK\EOT\DC3\EOT\SOH\STX\STX\DC2\EOT\220\a\EOT\SI\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\SOH\STX\STX\SOH\DC2\EOT\220\a\EOT\n\
    \\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\SOH\STX\STX\STX\DC2\EOT\220\a\r\SO\n\
    \\SO\n\
    \\EOT\EOT\DC3\STX\SOH\DC2\ACK\222\a\STX\231\a\EOT\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\SOH\EOT\DC2\EOT\222\a\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\SOH\ACK\DC2\EOT\222\a\v\DC3\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\SOH\SOH\DC2\EOT\222\a\DC4\GS\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\SOH\ETX\DC2\EOT\222\a !\n\
    \\SI\n\
    \\ENQ\EOT\DC3\STX\SOH\b\DC2\ACK\222\a\"\231\a\ETX\n\
    \\SO\n\
    \\ACK\EOT\DC3\STX\SOH\b\DC1\DC2\EOT\223\a\EOT!\n\
    \\SI\n\
    \\a\EOT\DC3\STX\SOH\b\DC3\NUL\DC2\EOT\224\a\EOT\RS\n\
    \\SI\n\
    \\a\EOT\DC3\STX\SOH\b\DC3\SOH\DC2\EOT\225\a\EOT\RS\n\
    \\DLE\n\
    \\ACK\EOT\DC3\STX\SOH\b\SYN\DC2\ACK\226\a\EOT\228\a\ENQ\n\
    \\SI\n\
    \\a\EOT\DC3\STX\SOH\b\DC4\NUL\DC2\EOT\229\a\EOTC\n\
    \\SI\n\
    \\a\EOT\DC3\STX\SOH\b\DC4\SOH\DC2\EOT\230\a\EOTA\n\
    \\SO\n\
    \\EOT\EOT\DC3\EOT\STX\DC2\ACK\233\a\STX\237\a\ETX\n\
    \\r\n\
    \\ENQ\EOT\DC3\EOT\STX\SOH\DC2\EOT\233\a\a\FS\n\
    \\SO\n\
    \\ACK\EOT\DC3\EOT\STX\STX\NUL\DC2\EOT\234\a\EOT(\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\STX\STX\NUL\SOH\DC2\EOT\234\a\EOT#\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\STX\STX\NUL\STX\DC2\EOT\234\a&'\n\
    \\SO\n\
    \\ACK\EOT\DC3\EOT\STX\STX\SOH\DC2\EOT\235\a\EOT\SI\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\STX\STX\SOH\SOH\DC2\EOT\235\a\EOT\n\
    \\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\STX\STX\SOH\STX\DC2\EOT\235\a\r\SO\n\
    \\SO\n\
    \\ACK\EOT\DC3\EOT\STX\STX\STX\DC2\EOT\236\a\EOT\DC1\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\STX\STX\STX\SOH\DC2\EOT\236\a\EOT\f\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\STX\STX\STX\STX\DC2\EOT\236\a\SI\DLE\n\
    \\SO\n\
    \\EOT\EOT\DC3\STX\STX\DC2\ACK\238\a\STX\247\a\EOT\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\STX\EOT\DC2\EOT\238\a\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\STX\ACK\DC2\EOT\238\a\v \n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\STX\SOH\DC2\EOT\238\a!8\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\STX\ETX\DC2\EOT\238\a;<\n\
    \\SI\n\
    \\ENQ\EOT\DC3\STX\STX\b\DC2\ACK\238\a=\247\a\ETX\n\
    \\SO\n\
    \\ACK\EOT\DC3\STX\STX\b\DC1\DC2\EOT\239\a\EOT!\n\
    \\SI\n\
    \\a\EOT\DC3\STX\STX\b\DC3\NUL\DC2\EOT\240\a\EOT\US\n\
    \\SI\n\
    \\a\EOT\DC3\STX\STX\b\DC3\SOH\DC2\EOT\241\a\EOT\RS\n\
    \\DLE\n\
    \\ACK\EOT\DC3\STX\STX\b\SYN\DC2\ACK\242\a\EOT\244\a\ENQ\n\
    \\SI\n\
    \\a\EOT\DC3\STX\STX\b\DC4\NUL\DC2\EOT\245\a\EOTE\n\
    \\SI\n\
    \\a\EOT\DC3\STX\STX\b\DC4\SOH\DC2\EOT\246\a\EOTC\n\
    \\SO\n\
    \\EOT\EOT\DC3\EOT\ETX\DC2\ACK\249\a\STX\254\a\ETX\n\
    \\r\n\
    \\ENQ\EOT\DC3\EOT\ETX\SOH\DC2\EOT\249\a\a\NAK\n\
    \\SO\n\
    \\ACK\EOT\DC3\EOT\ETX\STX\NUL\DC2\EOT\250\a\EOT \n\
    \\SI\n\
    \\a\EOT\DC3\EOT\ETX\STX\NUL\SOH\DC2\EOT\250\a\EOT\ESC\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\ETX\STX\NUL\STX\DC2\EOT\250\a\RS\US\n\
    \\SO\n\
    \\ACK\EOT\DC3\EOT\ETX\STX\SOH\DC2\EOT\251\a\EOT\SI\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\ETX\STX\SOH\SOH\DC2\EOT\251\a\EOT\n\
    \\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\ETX\STX\SOH\STX\DC2\EOT\251\a\r\SO\n\
    \\SO\n\
    \\ACK\EOT\DC3\EOT\ETX\STX\STX\DC2\EOT\252\a\EOT\r\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\ETX\STX\STX\SOH\DC2\EOT\252\a\EOT\b\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\ETX\STX\STX\STX\DC2\EOT\252\a\v\f\n\
    \\r\n\
    \\ENQ\EOT\DC3\EOT\ETX\EOT\DC2\EOT\253\a\EOT\SI\n\
    \\SO\n\
    \\ACK\EOT\DC3\EOT\ETX\EOT\NUL\DC2\EOT\253\a\r\SO\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\ETX\EOT\NUL\SOH\DC2\EOT\253\a\r\SO\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\ETX\EOT\NUL\STX\DC2\EOT\253\a\r\SO\n\
    \\SO\n\
    \\EOT\EOT\DC3\STX\ETX\DC2\ACK\255\a\STX\136\b\EOT\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\ETX\EOT\DC2\EOT\255\a\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\ETX\ACK\DC2\EOT\255\a\v\EM\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\ETX\SOH\DC2\EOT\255\a\SUB)\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\ETX\ETX\DC2\EOT\255\a,-\n\
    \\SI\n\
    \\ENQ\EOT\DC3\STX\ETX\b\DC2\ACK\255\a.\136\b\ETX\n\
    \\SO\n\
    \\ACK\EOT\DC3\STX\ETX\b\DC1\DC2\EOT\128\b\EOT!\n\
    \\SI\n\
    \\a\EOT\DC3\STX\ETX\b\DC3\NUL\DC2\EOT\129\b\EOT\US\n\
    \\SI\n\
    \\a\EOT\DC3\STX\ETX\b\DC3\SOH\DC2\EOT\130\b\EOT\RS\n\
    \\DLE\n\
    \\ACK\EOT\DC3\STX\ETX\b\SYN\DC2\ACK\131\b\EOT\133\b\ENQ\n\
    \\SI\n\
    \\a\EOT\DC3\STX\ETX\b\DC4\NUL\DC2\EOT\134\b\EOTA\n\
    \\SI\n\
    \\a\EOT\DC3\STX\ETX\b\DC4\SOH\DC2\EOT\135\b\EOTC\n\
    \\SO\n\
    \\EOT\EOT\DC3\EOT\EOT\DC2\ACK\138\b\STX\142\b\ETX\n\
    \\r\n\
    \\ENQ\EOT\DC3\EOT\EOT\SOH\DC2\EOT\138\b\a\SYN\n\
    \\SO\n\
    \\ACK\EOT\DC3\EOT\EOT\STX\NUL\DC2\EOT\139\b\EOT!\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\EOT\STX\NUL\SOH\DC2\EOT\139\b\EOT\FS\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\EOT\STX\NUL\STX\DC2\EOT\139\b\US \n\
    \\SO\n\
    \\ACK\EOT\DC3\EOT\EOT\STX\SOH\DC2\EOT\140\b\EOT\CAN\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\EOT\STX\SOH\SOH\DC2\EOT\140\b\EOT\DC3\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\EOT\STX\SOH\STX\DC2\EOT\140\b\SYN\ETB\n\
    \\SO\n\
    \\ACK\EOT\DC3\EOT\EOT\STX\STX\DC2\EOT\141\b\EOT\DC2\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\EOT\STX\STX\SOH\DC2\EOT\141\b\EOT\r\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\EOT\STX\STX\STX\DC2\EOT\141\b\DLE\DC1\n\
    \\SO\n\
    \\EOT\EOT\DC3\STX\EOT\DC2\ACK\143\b\STX\151\b\EOT\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\EOT\EOT\DC2\EOT\143\b\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\EOT\ACK\DC2\EOT\143\b\v\SUB\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\EOT\SOH\DC2\EOT\143\b\ESC+\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\EOT\ETX\DC2\EOT\143\b./\n\
    \\SI\n\
    \\ENQ\EOT\DC3\STX\EOT\b\DC2\ACK\143\b0\151\b\ETX\n\
    \\SO\n\
    \\ACK\EOT\DC3\STX\EOT\b\DC1\DC2\EOT\144\b\EOT!\n\
    \\SI\n\
    \\a\EOT\DC3\STX\EOT\b\DC3\NUL\DC2\EOT\145\b\EOT\US\n\
    \\SI\n\
    \\a\EOT\DC3\STX\EOT\b\DC3\SOH\DC2\EOT\146\b\EOT\RS\n\
    \\DLE\n\
    \\ACK\EOT\DC3\STX\EOT\b\SYN\DC2\ACK\147\b\EOT\149\b\ENQ\n\
    \\SI\n\
    \\a\EOT\DC3\STX\EOT\b\DC4\NUL\DC2\EOT\150\b\EOTL\n\
    \\SO\n\
    \\EOT\EOT\DC3\EOT\ENQ\DC2\ACK\153\b\STX\157\b\ETX\n\
    \\r\n\
    \\ENQ\EOT\DC3\EOT\ENQ\SOH\DC2\EOT\153\b\a\DC1\n\
    \\SO\n\
    \\ACK\EOT\DC3\EOT\ENQ\STX\NUL\DC2\EOT\154\b\EOT\FS\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\ENQ\STX\NUL\SOH\DC2\EOT\154\b\EOT\ETB\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\ENQ\STX\NUL\STX\DC2\EOT\154\b\SUB\ESC\n\
    \\SO\n\
    \\ACK\EOT\DC3\EOT\ENQ\STX\SOH\DC2\EOT\155\b\EOT\SO\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\ENQ\STX\SOH\SOH\DC2\EOT\155\b\EOT\t\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\ENQ\STX\SOH\STX\DC2\EOT\155\b\f\r\n\
    \\SO\n\
    \\ACK\EOT\DC3\EOT\ENQ\STX\STX\DC2\EOT\156\b\EOT\ESC\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\ENQ\STX\STX\SOH\DC2\EOT\156\b\EOT\SYN\n\
    \\SI\n\
    \\a\EOT\DC3\EOT\ENQ\STX\STX\STX\DC2\EOT\156\b\EM\SUB\n\
    \\SO\n\
    \\EOT\EOT\DC3\STX\ENQ\DC2\ACK\158\b\STX\168\b\EOT\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\ENQ\EOT\DC2\EOT\158\b\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\ENQ\ACK\DC2\EOT\158\b\v\NAK\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\ENQ\SOH\DC2\EOT\158\b\SYN!\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\ENQ\ETX\DC2\EOT\158\b$%\n\
    \\SI\n\
    \\ENQ\EOT\DC3\STX\ENQ\b\DC2\ACK\158\b&\168\b\ETX\n\
    \\SO\n\
    \\ACK\EOT\DC3\STX\ENQ\b\DC1\DC2\EOT\159\b\EOT!\n\
    \\SI\n\
    \\a\EOT\DC3\STX\ENQ\b\DC3\NUL\DC2\EOT\160\b\EOT!\n\
    \\SI\n\
    \\a\EOT\DC3\STX\ENQ\b\DC3\SOH\DC2\EOT\161\b\EOT\RS\n\
    \\SI\n\
    \\a\EOT\DC3\STX\ENQ\b\DC3\STX\DC2\EOT\162\b\EOT\RS\n\
    \\DLE\n\
    \\ACK\EOT\DC3\STX\ENQ\b\SYN\DC2\ACK\163\b\EOT\165\b\ENQ\n\
    \\SI\n\
    \\a\EOT\DC3\STX\ENQ\b\DC4\NUL\DC2\EOT\166\b\EOTO\n\
    \\SI\n\
    \\a\EOT\DC3\STX\ENQ\b\DC4\SOH\DC2\EOT\167\b\EOTB\n\
    \\v\n\
    \\ETX\EOT\DC3\t\DC2\EOT\170\b\STX\SI\n\
    \\f\n\
    \\EOT\EOT\DC3\t\NUL\DC2\EOT\170\b\v\SO\n\
    \\r\n\
    \\ENQ\EOT\DC3\t\NUL\SOH\DC2\EOT\170\b\v\SO\n\
    \\r\n\
    \\ENQ\EOT\DC3\t\NUL\STX\DC2\EOT\170\b\v\SO\n\
    \\r\n\
    \\ETX\EOT\DC3\ENQ\DC2\ACK\172\b\STX\189\b\EOT\n\
    \\f\n\
    \\EOT\EOT\DC3\ENQ\NUL\DC2\EOT\172\b\r\EM\n\
    \\r\n\
    \\ENQ\EOT\DC3\ENQ\NUL\SOH\DC2\EOT\172\b\r\DC1\n\
    \\r\n\
    \\ENQ\EOT\DC3\ENQ\NUL\STX\DC2\EOT\172\b\NAK\EM\n\
    \#\n\
    \\ETX\EOT\DC3\ENQ\DC2\EOT\191\b\STX\SUB\"\SYN For internal testing\n\
    \\n\
    \\f\n\
    \\EOT\EOT\DC3\ENQ\SOH\DC2\EOT\191\b\r\EM\n\
    \\r\n\
    \\ENQ\EOT\DC3\ENQ\SOH\SOH\DC2\EOT\191\b\r\DC1\n\
    \\r\n\
    \\ENQ\EOT\DC3\ENQ\SOH\STX\DC2\EOT\191\b\NAK\EM\n\
    \:\n\
    \\ETX\EOT\DC3\ENQ\DC2\EOT\192\b\STX\DC3\"- for https://github.com/bufbuild/protobuf-es\n\
    \\n\
    \\f\n\
    \\EOT\EOT\DC3\ENQ\STX\DC2\EOT\192\b\r\DC2\n\
    \\r\n\
    \\ENQ\EOT\DC3\ENQ\STX\SOH\DC2\EOT\192\b\r\DC2\n\
    \\r\n\
    \\ENQ\EOT\DC3\ENQ\STX\STX\DC2\EOT\192\b\r\DC2\n\
    \\172\STX\n\
    \\STX\EOT\DC4\DC2\ACK\199\b\NUL\225\b\SOH\SUB\157\STX A compiled specification for the defaults of a set of features.  These\n\
    \ messages are generated from FeatureSet extensions and can be used to seed\n\
    \ feature resolution. The resolution with this object becomes a simple search\n\
    \ for the closest matching edition, followed by proto merges.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\DC4\SOH\DC2\EOT\199\b\b\SUB\n\
    \\176\STX\n\
    \\EOT\EOT\DC4\ETX\NUL\DC2\ACK\204\b\STX\215\b\ETX\SUB\159\STX A map from every known edition with a unique set of defaults to its\n\
    \ defaults. Not all editions may be contained here.  For a given edition,\n\
    \ the defaults at the closest matching edition ordered at or before it should\n\
    \ be used.  This field must be in strict ascending order by edition.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC4\ETX\NUL\SOH\DC2\EOT\204\b\n\
    \\"\n\
    \\SO\n\
    \\ACK\EOT\DC4\ETX\NUL\STX\NUL\DC2\EOT\205\b\EOT!\n\
    \\SI\n\
    \\a\EOT\DC4\ETX\NUL\STX\NUL\EOT\DC2\EOT\205\b\EOT\f\n\
    \\SI\n\
    \\a\EOT\DC4\ETX\NUL\STX\NUL\ACK\DC2\EOT\205\b\r\DC4\n\
    \\SI\n\
    \\a\EOT\DC4\ETX\NUL\STX\NUL\SOH\DC2\EOT\205\b\NAK\FS\n\
    \\SI\n\
    \\a\EOT\DC4\ETX\NUL\STX\NUL\ETX\DC2\EOT\205\b\US \n\
    \N\n\
    \\ACK\EOT\DC4\ETX\NUL\STX\SOH\DC2\EOT\208\b\EOT1\SUB> Defaults of features that can be overridden in this edition.\n\
    \\n\
    \\SI\n\
    \\a\EOT\DC4\ETX\NUL\STX\SOH\EOT\DC2\EOT\208\b\EOT\f\n\
    \\SI\n\
    \\a\EOT\DC4\ETX\NUL\STX\SOH\ACK\DC2\EOT\208\b\r\ETB\n\
    \\SI\n\
    \\a\EOT\DC4\ETX\NUL\STX\SOH\SOH\DC2\EOT\208\b\CAN,\n\
    \\SI\n\
    \\a\EOT\DC4\ETX\NUL\STX\SOH\ETX\DC2\EOT\208\b/0\n\
    \P\n\
    \\ACK\EOT\DC4\ETX\NUL\STX\STX\DC2\EOT\211\b\EOT+\SUB@ Defaults of features that can't be overridden in this edition.\n\
    \\n\
    \\SI\n\
    \\a\EOT\DC4\ETX\NUL\STX\STX\EOT\DC2\EOT\211\b\EOT\f\n\
    \\SI\n\
    \\a\EOT\DC4\ETX\NUL\STX\STX\ACK\DC2\EOT\211\b\r\ETB\n\
    \\SI\n\
    \\a\EOT\DC4\ETX\NUL\STX\STX\SOH\DC2\EOT\211\b\CAN&\n\
    \\SI\n\
    \\a\EOT\DC4\ETX\NUL\STX\STX\ETX\DC2\EOT\211\b)*\n\
    \\r\n\
    \\ENQ\EOT\DC4\ETX\NUL\t\DC2\EOT\213\b\EOT\DC2\n\
    \\SO\n\
    \\ACK\EOT\DC4\ETX\NUL\t\NUL\DC2\EOT\213\b\r\SO\n\
    \\SI\n\
    \\a\EOT\DC4\ETX\NUL\t\NUL\SOH\DC2\EOT\213\b\r\SO\n\
    \\SI\n\
    \\a\EOT\DC4\ETX\NUL\t\NUL\STX\DC2\EOT\213\b\r\SO\n\
    \\SO\n\
    \\ACK\EOT\DC4\ETX\NUL\t\SOH\DC2\EOT\213\b\DLE\DC1\n\
    \\SI\n\
    \\a\EOT\DC4\ETX\NUL\t\SOH\SOH\DC2\EOT\213\b\DLE\DC1\n\
    \\SI\n\
    \\a\EOT\DC4\ETX\NUL\t\SOH\STX\DC2\EOT\213\b\DLE\DC1\n\
    \\r\n\
    \\ENQ\EOT\DC4\ETX\NUL\n\
    \\DC2\EOT\214\b\EOT\CAN\n\
    \\SO\n\
    \\ACK\EOT\DC4\ETX\NUL\n\
    \\NUL\DC2\EOT\214\b\r\ETB\n\
    \\f\n\
    \\EOT\EOT\DC4\STX\NUL\DC2\EOT\216\b\STX1\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\NUL\EOT\DC2\EOT\216\b\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\NUL\ACK\DC2\EOT\216\b\v#\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\NUL\SOH\DC2\EOT\216\b$,\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\NUL\ETX\DC2\EOT\216\b/0\n\
    \\130\SOH\n\
    \\EOT\EOT\DC4\STX\SOH\DC2\EOT\220\b\STX'\SUBt The minimum supported edition (inclusive) when this was constructed.\n\
    \ Editions before this will not have defaults.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\SOH\EOT\DC2\EOT\220\b\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\SOH\ACK\DC2\EOT\220\b\v\DC2\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\SOH\SOH\DC2\EOT\220\b\DC3\"\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\SOH\ETX\DC2\EOT\220\b%&\n\
    \\134\SOH\n\
    \\EOT\EOT\DC4\STX\STX\DC2\EOT\224\b\STX'\SUBx The maximum known edition (inclusive) when this was constructed. Editions\n\
    \ after this will not have reliable defaults.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\STX\EOT\DC2\EOT\224\b\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\STX\ACK\DC2\EOT\224\b\v\DC2\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\STX\SOH\DC2\EOT\224\b\DC3\"\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\STX\ETX\DC2\EOT\224\b%&\n\
    \\218\SOH\n\
    \\STX\EOT\NAK\DC2\ACK\232\b\NUL\233\t\SOH\SUBj Encapsulates information about the original source file from which a\n\
    \ FileDescriptorProto was generated.\n\
    \2` ===================================================================\n\
    \ Optional source code info\n\
    \\n\
    \\v\n\
    \\ETX\EOT\NAK\SOH\DC2\EOT\232\b\b\SYN\n\
    \\130\DC1\n\
    \\EOT\EOT\NAK\STX\NUL\DC2\EOT\148\t\STX!\SUB\243\DLE A Location identifies a piece of source code in a .proto file which\n\
    \ corresponds to a particular definition.  This information is intended\n\
    \ to be useful to IDEs, code indexers, documentation generators, and similar\n\
    \ tools.\n\
    \\n\
    \ For example, say we have a file like:\n\
    \   message Foo {\n\
    \     optional string foo = 1;\n\
    \   }\n\
    \ Let's look at just the field definition:\n\
    \   optional string foo = 1;\n\
    \   ^       ^^     ^^  ^  ^^^\n\
    \   a       bc     de  f  ghi\n\
    \ We have the following locations:\n\
    \   span   path               represents\n\
    \   [a,i)  [ 4, 0, 2, 0 ]     The whole field definition.\n\
    \   [a,b)  [ 4, 0, 2, 0, 4 ]  The label (optional).\n\
    \   [c,d)  [ 4, 0, 2, 0, 5 ]  The type (string).\n\
    \   [e,f)  [ 4, 0, 2, 0, 1 ]  The name (foo).\n\
    \   [g,h)  [ 4, 0, 2, 0, 3 ]  The number (1).\n\
    \\n\
    \ Notes:\n\
    \ - A location may refer to a repeated field itself (i.e. not to any\n\
    \   particular index within it).  This is used whenever a set of elements are\n\
    \   logically enclosed in a single code segment.  For example, an entire\n\
    \   extend block (possibly containing multiple extension definitions) will\n\
    \   have an outer location whose path refers to the \"extensions\" repeated\n\
    \   field without an index.\n\
    \ - Multiple locations may have the same path.  This happens when a single\n\
    \   logical declaration is spread out across multiple places.  The most\n\
    \   obvious example is the \"extend\" block again -- there may be multiple\n\
    \   extend blocks in the same scope, each of which will have the same path.\n\
    \ - A location's span is not always a subset of its parent's span.  For\n\
    \   example, the \"extendee\" of an extension declaration appears at the\n\
    \   beginning of the \"extend\" block and is shared by all extensions within\n\
    \   the block.\n\
    \ - Just because a location's span is a subset of some other location's span\n\
    \   does not mean that it is a descendant.  For example, a \"group\" defines\n\
    \   both a type and a field in a single declaration.  Thus, the locations\n\
    \   corresponding to the type and field and their components will overlap.\n\
    \ - Code which tries to interpret locations should probably be designed to\n\
    \   ignore those that it doesn't understand, as more types of locations could\n\
    \   be recorded in the future.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\NAK\STX\NUL\EOT\DC2\EOT\148\t\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\NAK\STX\NUL\ACK\DC2\EOT\148\t\v\DC3\n\
    \\r\n\
    \\ENQ\EOT\NAK\STX\NUL\SOH\DC2\EOT\148\t\DC4\FS\n\
    \\r\n\
    \\ENQ\EOT\NAK\STX\NUL\ETX\DC2\EOT\148\t\US \n\
    \\SO\n\
    \\EOT\EOT\NAK\ETX\NUL\DC2\ACK\149\t\STX\232\t\ETX\n\
    \\r\n\
    \\ENQ\EOT\NAK\ETX\NUL\SOH\DC2\EOT\149\t\n\
    \\DC2\n\
    \\138\a\n\
    \\ACK\EOT\NAK\ETX\NUL\STX\NUL\DC2\EOT\173\t\EOT,\SUB\249\ACK Identifies which part of the FileDescriptorProto was defined at this\n\
    \ location.\n\
    \\n\
    \ Each element is a field number or an index.  They form a path from\n\
    \ the root FileDescriptorProto to the place where the definition appears.\n\
    \ For example, this path:\n\
    \   [ 4, 3, 2, 7, 1 ]\n\
    \ refers to:\n\
    \   file.message_type(3)  // 4, 3\n\
    \       .field(7)         // 2, 7\n\
    \       .name()           // 1\n\
    \ This is because FileDescriptorProto.message_type has field number 4:\n\
    \   repeated DescriptorProto message_type = 4;\n\
    \ and DescriptorProto.field has field number 2:\n\
    \   repeated FieldDescriptorProto field = 2;\n\
    \ and FieldDescriptorProto.name has field number 1:\n\
    \   optional string name = 1;\n\
    \\n\
    \ Thus, the above path gives the location of a field name.  If we removed\n\
    \ the last element:\n\
    \   [ 4, 3, 2, 7 ]\n\
    \ this path refers to the whole field declaration (from the beginning\n\
    \ of the label to the terminating semicolon).\n\
    \\n\
    \\SI\n\
    \\a\EOT\NAK\ETX\NUL\STX\NUL\EOT\DC2\EOT\173\t\EOT\f\n\
    \\SI\n\
    \\a\EOT\NAK\ETX\NUL\STX\NUL\ENQ\DC2\EOT\173\t\r\DC2\n\
    \\SI\n\
    \\a\EOT\NAK\ETX\NUL\STX\NUL\SOH\DC2\EOT\173\t\DC3\ETB\n\
    \\SI\n\
    \\a\EOT\NAK\ETX\NUL\STX\NUL\ETX\DC2\EOT\173\t\SUB\ESC\n\
    \\SI\n\
    \\a\EOT\NAK\ETX\NUL\STX\NUL\b\DC2\EOT\173\t\FS+\n\
    \\DLE\n\
    \\b\EOT\NAK\ETX\NUL\STX\NUL\b\STX\DC2\EOT\173\t\GS*\n\
    \\210\STX\n\
    \\ACK\EOT\NAK\ETX\NUL\STX\SOH\DC2\EOT\180\t\EOT,\SUB\193\STX Always has exactly three or four elements: start line, start column,\n\
    \ end line (optional, otherwise assumed same as start line), end column.\n\
    \ These are packed into a single field for efficiency.  Note that line\n\
    \ and column numbers are zero-based -- typically you will want to add\n\
    \ 1 to each before displaying to a user.\n\
    \\n\
    \\SI\n\
    \\a\EOT\NAK\ETX\NUL\STX\SOH\EOT\DC2\EOT\180\t\EOT\f\n\
    \\SI\n\
    \\a\EOT\NAK\ETX\NUL\STX\SOH\ENQ\DC2\EOT\180\t\r\DC2\n\
    \\SI\n\
    \\a\EOT\NAK\ETX\NUL\STX\SOH\SOH\DC2\EOT\180\t\DC3\ETB\n\
    \\SI\n\
    \\a\EOT\NAK\ETX\NUL\STX\SOH\ETX\DC2\EOT\180\t\SUB\ESC\n\
    \\SI\n\
    \\a\EOT\NAK\ETX\NUL\STX\SOH\b\DC2\EOT\180\t\FS+\n\
    \\DLE\n\
    \\b\EOT\NAK\ETX\NUL\STX\SOH\b\STX\DC2\EOT\180\t\GS*\n\
    \\165\f\n\
    \\ACK\EOT\NAK\ETX\NUL\STX\STX\DC2\EOT\229\t\EOT)\SUB\148\f If this SourceCodeInfo represents a complete declaration, these are any\n\
    \ comments appearing before and after the declaration which appear to be\n\
    \ attached to the declaration.\n\
    \\n\
    \ A series of line comments appearing on consecutive lines, with no other\n\
    \ tokens appearing on those lines, will be treated as a single comment.\n\
    \\n\
    \ leading_detached_comments will keep paragraphs of comments that appear\n\
    \ before (but not connected to) the current element. Each paragraph,\n\
    \ separated by empty lines, will be one comment element in the repeated\n\
    \ field.\n\
    \\n\
    \ Only the comment content is provided; comment markers (e.g. //) are\n\
    \ stripped out.  For block comments, leading whitespace and an asterisk\n\
    \ will be stripped from the beginning of each line other than the first.\n\
    \ Newlines are included in the output.\n\
    \\n\
    \ Examples:\n\
    \\n\
    \   optional int32 foo = 1;  // Comment attached to foo.\n\
    \   // Comment attached to bar.\n\
    \   optional int32 bar = 2;\n\
    \\n\
    \   optional string baz = 3;\n\
    \   // Comment attached to baz.\n\
    \   // Another line attached to baz.\n\
    \\n\
    \   // Comment attached to moo.\n\
    \   //\n\
    \   // Another line attached to moo.\n\
    \   optional double moo = 4;\n\
    \\n\
    \   // Detached comment for corge. This is not leading or trailing comments\n\
    \   // to moo or corge because there are blank lines separating it from\n\
    \   // both.\n\
    \\n\
    \   // Detached comment for corge paragraph 2.\n\
    \\n\
    \   optional string corge = 5;\n\
    \   /* Block comment attached\n\
    \    * to corge.  Leading asterisks\n\
    \    * will be removed. */\n\
    \   /* Block comment attached to\n\
    \    * grault. */\n\
    \   optional int32 grault = 6;\n\
    \\n\
    \   // ignored detached comments.\n\
    \\n\
    \\SI\n\
    \\a\EOT\NAK\ETX\NUL\STX\STX\EOT\DC2\EOT\229\t\EOT\f\n\
    \\SI\n\
    \\a\EOT\NAK\ETX\NUL\STX\STX\ENQ\DC2\EOT\229\t\r\DC3\n\
    \\SI\n\
    \\a\EOT\NAK\ETX\NUL\STX\STX\SOH\DC2\EOT\229\t\DC4$\n\
    \\SI\n\
    \\a\EOT\NAK\ETX\NUL\STX\STX\ETX\DC2\EOT\229\t'(\n\
    \\SO\n\
    \\ACK\EOT\NAK\ETX\NUL\STX\ETX\DC2\EOT\230\t\EOT*\n\
    \\SI\n\
    \\a\EOT\NAK\ETX\NUL\STX\ETX\EOT\DC2\EOT\230\t\EOT\f\n\
    \\SI\n\
    \\a\EOT\NAK\ETX\NUL\STX\ETX\ENQ\DC2\EOT\230\t\r\DC3\n\
    \\SI\n\
    \\a\EOT\NAK\ETX\NUL\STX\ETX\SOH\DC2\EOT\230\t\DC4%\n\
    \\SI\n\
    \\a\EOT\NAK\ETX\NUL\STX\ETX\ETX\DC2\EOT\230\t()\n\
    \\SO\n\
    \\ACK\EOT\NAK\ETX\NUL\STX\EOT\DC2\EOT\231\t\EOT2\n\
    \\SI\n\
    \\a\EOT\NAK\ETX\NUL\STX\EOT\EOT\DC2\EOT\231\t\EOT\f\n\
    \\SI\n\
    \\a\EOT\NAK\ETX\NUL\STX\EOT\ENQ\DC2\EOT\231\t\r\DC3\n\
    \\SI\n\
    \\a\EOT\NAK\ETX\NUL\STX\EOT\SOH\DC2\EOT\231\t\DC4-\n\
    \\SI\n\
    \\a\EOT\NAK\ETX\NUL\STX\EOT\ETX\DC2\EOT\231\t01\n\
    \\238\SOH\n\
    \\STX\EOT\SYN\DC2\ACK\238\t\NUL\143\n\
    \\SOH\SUB\223\SOH Describes the relationship between generated code and its original source\n\
    \ file. A GeneratedCodeInfo message is associated with only one generated\n\
    \ source file, but may contain references to different source .proto files.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\SYN\SOH\DC2\EOT\238\t\b\EM\n\
    \x\n\
    \\EOT\EOT\SYN\STX\NUL\DC2\EOT\241\t\STX%\SUBj An Annotation connects some span of text in generated code to an element\n\
    \ of its generating .proto file.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\NUL\EOT\DC2\EOT\241\t\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\NUL\ACK\DC2\EOT\241\t\v\NAK\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\NUL\SOH\DC2\EOT\241\t\SYN \n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\NUL\ETX\DC2\EOT\241\t#$\n\
    \\SO\n\
    \\EOT\EOT\SYN\ETX\NUL\DC2\ACK\242\t\STX\142\n\
    \\ETX\n\
    \\r\n\
    \\ENQ\EOT\SYN\ETX\NUL\SOH\DC2\EOT\242\t\n\
    \\DC4\n\
    \\143\SOH\n\
    \\ACK\EOT\SYN\ETX\NUL\STX\NUL\DC2\EOT\245\t\EOT,\SUB\DEL Identifies the element in the original source .proto file. This field\n\
    \ is formatted the same as SourceCodeInfo.Location.path.\n\
    \\n\
    \\SI\n\
    \\a\EOT\SYN\ETX\NUL\STX\NUL\EOT\DC2\EOT\245\t\EOT\f\n\
    \\SI\n\
    \\a\EOT\SYN\ETX\NUL\STX\NUL\ENQ\DC2\EOT\245\t\r\DC2\n\
    \\SI\n\
    \\a\EOT\SYN\ETX\NUL\STX\NUL\SOH\DC2\EOT\245\t\DC3\ETB\n\
    \\SI\n\
    \\a\EOT\SYN\ETX\NUL\STX\NUL\ETX\DC2\EOT\245\t\SUB\ESC\n\
    \\SI\n\
    \\a\EOT\SYN\ETX\NUL\STX\NUL\b\DC2\EOT\245\t\FS+\n\
    \\DLE\n\
    \\b\EOT\SYN\ETX\NUL\STX\NUL\b\STX\DC2\EOT\245\t\GS*\n\
    \O\n\
    \\ACK\EOT\SYN\ETX\NUL\STX\SOH\DC2\EOT\248\t\EOT$\SUB? Identifies the filesystem path to the original source .proto.\n\
    \\n\
    \\SI\n\
    \\a\EOT\SYN\ETX\NUL\STX\SOH\EOT\DC2\EOT\248\t\EOT\f\n\
    \\SI\n\
    \\a\EOT\SYN\ETX\NUL\STX\SOH\ENQ\DC2\EOT\248\t\r\DC3\n\
    \\SI\n\
    \\a\EOT\SYN\ETX\NUL\STX\SOH\SOH\DC2\EOT\248\t\DC4\US\n\
    \\SI\n\
    \\a\EOT\SYN\ETX\NUL\STX\SOH\ETX\DC2\EOT\248\t\"#\n\
    \w\n\
    \\ACK\EOT\SYN\ETX\NUL\STX\STX\DC2\EOT\252\t\EOT\GS\SUBg Identifies the starting offset in bytes in the generated code\n\
    \ that relates to the identified object.\n\
    \\n\
    \\SI\n\
    \\a\EOT\SYN\ETX\NUL\STX\STX\EOT\DC2\EOT\252\t\EOT\f\n\
    \\SI\n\
    \\a\EOT\SYN\ETX\NUL\STX\STX\ENQ\DC2\EOT\252\t\r\DC2\n\
    \\SI\n\
    \\a\EOT\SYN\ETX\NUL\STX\STX\SOH\DC2\EOT\252\t\DC3\CAN\n\
    \\SI\n\
    \\a\EOT\SYN\ETX\NUL\STX\STX\ETX\DC2\EOT\252\t\ESC\FS\n\
    \\219\SOH\n\
    \\ACK\EOT\SYN\ETX\NUL\STX\ETX\DC2\EOT\129\n\
    \\EOT\ESC\SUB\202\SOH Identifies the ending offset in bytes in the generated code that\n\
    \ relates to the identified object. The end offset should be one past\n\
    \ the last relevant byte (so the length of the text = end - begin).\n\
    \\n\
    \\SI\n\
    \\a\EOT\SYN\ETX\NUL\STX\ETX\EOT\DC2\EOT\129\n\
    \\EOT\f\n\
    \\SI\n\
    \\a\EOT\SYN\ETX\NUL\STX\ETX\ENQ\DC2\EOT\129\n\
    \\r\DC2\n\
    \\SI\n\
    \\a\EOT\SYN\ETX\NUL\STX\ETX\SOH\DC2\EOT\129\n\
    \\DC3\SYN\n\
    \\SI\n\
    \\a\EOT\SYN\ETX\NUL\STX\ETX\ETX\DC2\EOT\129\n\
    \\EM\SUB\n\
    \j\n\
    \\ACK\EOT\SYN\ETX\NUL\EOT\NUL\DC2\ACK\133\n\
    \\EOT\140\n\
    \\ENQ\SUBX Represents the identified object's effect on the element in the original\n\
    \ .proto file.\n\
    \\n\
    \\SI\n\
    \\a\EOT\SYN\ETX\NUL\EOT\NUL\SOH\DC2\EOT\133\n\
    \\t\DC1\n\
    \F\n\
    \\b\EOT\SYN\ETX\NUL\EOT\NUL\STX\NUL\DC2\EOT\135\n\
    \\ACK\SI\SUB4 There is no effect or the effect is indescribable.\n\
    \\n\
    \\DC1\n\
    \\t\EOT\SYN\ETX\NUL\EOT\NUL\STX\NUL\SOH\DC2\EOT\135\n\
    \\ACK\n\
    \\n\
    \\DC1\n\
    \\t\EOT\SYN\ETX\NUL\EOT\NUL\STX\NUL\STX\DC2\EOT\135\n\
    \\r\SO\n\
    \<\n\
    \\b\EOT\SYN\ETX\NUL\EOT\NUL\STX\SOH\DC2\EOT\137\n\
    \\ACK\SO\SUB* The element is set or otherwise mutated.\n\
    \\n\
    \\DC1\n\
    \\t\EOT\SYN\ETX\NUL\EOT\NUL\STX\SOH\SOH\DC2\EOT\137\n\
    \\ACK\t\n\
    \\DC1\n\
    \\t\EOT\SYN\ETX\NUL\EOT\NUL\STX\SOH\STX\DC2\EOT\137\n\
    \\f\r\n\
    \8\n\
    \\b\EOT\SYN\ETX\NUL\EOT\NUL\STX\STX\DC2\EOT\139\n\
    \\ACK\DLE\SUB& An alias to the element is returned.\n\
    \\n\
    \\DC1\n\
    \\t\EOT\SYN\ETX\NUL\EOT\NUL\STX\STX\SOH\DC2\EOT\139\n\
    \\ACK\v\n\
    \\DC1\n\
    \\t\EOT\SYN\ETX\NUL\EOT\NUL\STX\STX\STX\DC2\EOT\139\n\
    \\SO\SI\n\
    \\SO\n\
    \\ACK\EOT\SYN\ETX\NUL\STX\EOT\DC2\EOT\141\n\
    \\EOT#\n\
    \\SI\n\
    \\a\EOT\SYN\ETX\NUL\STX\EOT\EOT\DC2\EOT\141\n\
    \\EOT\f\n\
    \\SI\n\
    \\a\EOT\SYN\ETX\NUL\STX\EOT\ACK\DC2\EOT\141\n\
    \\r\NAK\n\
    \\SI\n\
    \\a\EOT\SYN\ETX\NUL\STX\EOT\SOH\DC2\EOT\141\n\
    \\SYN\RS\n\
    \\SI\n\
    \\a\EOT\SYN\ETX\NUL\STX\EOT\ETX\DC2\EOT\141\n\
    \!\""