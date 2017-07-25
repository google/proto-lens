{- This file was auto-generated from google/protobuf/descriptor.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies,
  UndecidableInstances, MultiParamTypeClasses, FlexibleContexts,
  FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude
  #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Proto.Google.Protobuf.Descriptor where
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

data DescriptorProto = DescriptorProto{_DescriptorProto'name ::
                                       !(Prelude.Maybe Data.Text.Text),
                                       _DescriptorProto'field :: ![FieldDescriptorProto],
                                       _DescriptorProto'extension :: ![FieldDescriptorProto],
                                       _DescriptorProto'nestedType :: ![DescriptorProto],
                                       _DescriptorProto'enumType :: ![EnumDescriptorProto],
                                       _DescriptorProto'extensionRange ::
                                       ![DescriptorProto'ExtensionRange],
                                       _DescriptorProto'oneofDecl :: ![OneofDescriptorProto],
                                       _DescriptorProto'options :: !(Prelude.Maybe MessageOptions),
                                       _DescriptorProto'reservedRange ::
                                       ![DescriptorProto'ReservedRange],
                                       _DescriptorProto'reservedName :: ![Data.Text.Text]}
                     deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "name" f DescriptorProto DescriptorProto a b
         where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DescriptorProto'name
                 (\ x__ y__ -> x__{_DescriptorProto'name = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'name" f DescriptorProto DescriptorProto
         a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DescriptorProto'name
                 (\ x__ y__ -> x__{_DescriptorProto'name = y__}))
              Prelude.id

instance (a ~ [FieldDescriptorProto], b ~ [FieldDescriptorProto],
          Prelude.Functor f) =>
         Lens.Labels.HasLens "field" f DescriptorProto DescriptorProto a b
         where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DescriptorProto'field
                 (\ x__ y__ -> x__{_DescriptorProto'field = y__}))
              Prelude.id

instance (a ~ [FieldDescriptorProto], b ~ [FieldDescriptorProto],
          Prelude.Functor f) =>
         Lens.Labels.HasLens "extension" f DescriptorProto DescriptorProto a
         b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DescriptorProto'extension
                 (\ x__ y__ -> x__{_DescriptorProto'extension = y__}))
              Prelude.id

instance (a ~ [DescriptorProto], b ~ [DescriptorProto],
          Prelude.Functor f) =>
         Lens.Labels.HasLens "nestedType" f DescriptorProto DescriptorProto
         a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DescriptorProto'nestedType
                 (\ x__ y__ -> x__{_DescriptorProto'nestedType = y__}))
              Prelude.id

instance (a ~ [EnumDescriptorProto], b ~ [EnumDescriptorProto],
          Prelude.Functor f) =>
         Lens.Labels.HasLens "enumType" f DescriptorProto DescriptorProto a
         b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DescriptorProto'enumType
                 (\ x__ y__ -> x__{_DescriptorProto'enumType = y__}))
              Prelude.id

instance (a ~ [DescriptorProto'ExtensionRange],
          b ~ [DescriptorProto'ExtensionRange], Prelude.Functor f) =>
         Lens.Labels.HasLens "extensionRange" f DescriptorProto
         DescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DescriptorProto'extensionRange
                 (\ x__ y__ -> x__{_DescriptorProto'extensionRange = y__}))
              Prelude.id

instance (a ~ [OneofDescriptorProto], b ~ [OneofDescriptorProto],
          Prelude.Functor f) =>
         Lens.Labels.HasLens "oneofDecl" f DescriptorProto DescriptorProto a
         b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DescriptorProto'oneofDecl
                 (\ x__ y__ -> x__{_DescriptorProto'oneofDecl = y__}))
              Prelude.id

instance (a ~ MessageOptions, b ~ MessageOptions,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "options" f DescriptorProto DescriptorProto a b
         where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DescriptorProto'options
                 (\ x__ y__ -> x__{_DescriptorProto'options = y__}))
              (Data.ProtoLens.maybeLens Data.Default.Class.def)

instance (a ~ Prelude.Maybe MessageOptions,
          b ~ Prelude.Maybe MessageOptions, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'options" f DescriptorProto
         DescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DescriptorProto'options
                 (\ x__ y__ -> x__{_DescriptorProto'options = y__}))
              Prelude.id

instance (a ~ [DescriptorProto'ReservedRange],
          b ~ [DescriptorProto'ReservedRange], Prelude.Functor f) =>
         Lens.Labels.HasLens "reservedRange" f DescriptorProto
         DescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DescriptorProto'reservedRange
                 (\ x__ y__ -> x__{_DescriptorProto'reservedRange = y__}))
              Prelude.id

instance (a ~ [Data.Text.Text], b ~ [Data.Text.Text],
          Prelude.Functor f) =>
         Lens.Labels.HasLens "reservedName" f DescriptorProto
         DescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DescriptorProto'reservedName
                 (\ x__ y__ -> x__{_DescriptorProto'reservedName = y__}))
              Prelude.id

instance Data.Default.Class.Default DescriptorProto where
        def
          = DescriptorProto{_DescriptorProto'name = Prelude.Nothing,
                            _DescriptorProto'field = [], _DescriptorProto'extension = [],
                            _DescriptorProto'nestedType = [], _DescriptorProto'enumType = [],
                            _DescriptorProto'extensionRange = [],
                            _DescriptorProto'oneofDecl = [],
                            _DescriptorProto'options = Prelude.Nothing,
                            _DescriptorProto'reservedRange = [],
                            _DescriptorProto'reservedName = []}

instance Data.ProtoLens.Message DescriptorProto where
        descriptor
          = let name__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "name"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'name)
                      :: Data.ProtoLens.FieldDescriptor DescriptorProto
                field__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "field"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor FieldDescriptorProto)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked field)
                      :: Data.ProtoLens.FieldDescriptor DescriptorProto
                extension__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "extension"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor FieldDescriptorProto)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked extension)
                      :: Data.ProtoLens.FieldDescriptor DescriptorProto
                nestedType__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "nested_type"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor DescriptorProto)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked nestedType)
                      :: Data.ProtoLens.FieldDescriptor DescriptorProto
                enumType__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "enum_type"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor EnumDescriptorProto)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked enumType)
                      :: Data.ProtoLens.FieldDescriptor DescriptorProto
                extensionRange__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "extension_range"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor DescriptorProto'ExtensionRange)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         extensionRange)
                      :: Data.ProtoLens.FieldDescriptor DescriptorProto
                oneofDecl__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "oneof_decl"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor OneofDescriptorProto)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked oneofDecl)
                      :: Data.ProtoLens.FieldDescriptor DescriptorProto
                options__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "options"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor MessageOptions)
                      (Data.ProtoLens.OptionalField maybe'options)
                      :: Data.ProtoLens.FieldDescriptor DescriptorProto
                reservedRange__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "reserved_range"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor DescriptorProto'ReservedRange)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         reservedRange)
                      :: Data.ProtoLens.FieldDescriptor DescriptorProto
                reservedName__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "reserved_name"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked reservedName)
                      :: Data.ProtoLens.FieldDescriptor DescriptorProto
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Text.pack "google.protobuf.DescriptorProto")
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, name__field_descriptor),
                    (Data.ProtoLens.Tag 2, field__field_descriptor),
                    (Data.ProtoLens.Tag 6, extension__field_descriptor),
                    (Data.ProtoLens.Tag 3, nestedType__field_descriptor),
                    (Data.ProtoLens.Tag 4, enumType__field_descriptor),
                    (Data.ProtoLens.Tag 5, extensionRange__field_descriptor),
                    (Data.ProtoLens.Tag 8, oneofDecl__field_descriptor),
                    (Data.ProtoLens.Tag 7, options__field_descriptor),
                    (Data.ProtoLens.Tag 9, reservedRange__field_descriptor),
                    (Data.ProtoLens.Tag 10, reservedName__field_descriptor)])
                (Data.Map.fromList
                   [("name", name__field_descriptor),
                    ("field", field__field_descriptor),
                    ("extension", extension__field_descriptor),
                    ("nested_type", nestedType__field_descriptor),
                    ("enum_type", enumType__field_descriptor),
                    ("extension_range", extensionRange__field_descriptor),
                    ("oneof_decl", oneofDecl__field_descriptor),
                    ("options", options__field_descriptor),
                    ("reserved_range", reservedRange__field_descriptor),
                    ("reserved_name", reservedName__field_descriptor)])

data DescriptorProto'ExtensionRange = DescriptorProto'ExtensionRange{_DescriptorProto'ExtensionRange'start
                                                                     ::
                                                                     !(Prelude.Maybe
                                                                         Data.Int.Int32),
                                                                     _DescriptorProto'ExtensionRange'end
                                                                     ::
                                                                     !(Prelude.Maybe
                                                                         Data.Int.Int32)}
                                    deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (a ~ Data.Int.Int32, b ~ Data.Int.Int32,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "start" f DescriptorProto'ExtensionRange
         DescriptorProto'ExtensionRange a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DescriptorProto'ExtensionRange'start
                 (\ x__ y__ -> x__{_DescriptorProto'ExtensionRange'start = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Int.Int32,
          b ~ Prelude.Maybe Data.Int.Int32, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'start" f DescriptorProto'ExtensionRange
         DescriptorProto'ExtensionRange a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DescriptorProto'ExtensionRange'start
                 (\ x__ y__ -> x__{_DescriptorProto'ExtensionRange'start = y__}))
              Prelude.id

instance (a ~ Data.Int.Int32, b ~ Data.Int.Int32,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "end" f DescriptorProto'ExtensionRange
         DescriptorProto'ExtensionRange a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DescriptorProto'ExtensionRange'end
                 (\ x__ y__ -> x__{_DescriptorProto'ExtensionRange'end = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Int.Int32,
          b ~ Prelude.Maybe Data.Int.Int32, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'end" f DescriptorProto'ExtensionRange
         DescriptorProto'ExtensionRange a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DescriptorProto'ExtensionRange'end
                 (\ x__ y__ -> x__{_DescriptorProto'ExtensionRange'end = y__}))
              Prelude.id

instance Data.Default.Class.Default DescriptorProto'ExtensionRange
         where
        def
          = DescriptorProto'ExtensionRange{_DescriptorProto'ExtensionRange'start
                                             = Prelude.Nothing,
                                           _DescriptorProto'ExtensionRange'end = Prelude.Nothing}

instance Data.ProtoLens.Message DescriptorProto'ExtensionRange
         where
        descriptor
          = let start__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "start"
                      (Data.ProtoLens.Int32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
                      (Data.ProtoLens.OptionalField maybe'start)
                      :: Data.ProtoLens.FieldDescriptor DescriptorProto'ExtensionRange
                end__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "end"
                      (Data.ProtoLens.Int32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
                      (Data.ProtoLens.OptionalField maybe'end)
                      :: Data.ProtoLens.FieldDescriptor DescriptorProto'ExtensionRange
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Text.pack "google.protobuf.DescriptorProto.ExtensionRange")
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, start__field_descriptor),
                    (Data.ProtoLens.Tag 2, end__field_descriptor)])
                (Data.Map.fromList
                   [("start", start__field_descriptor),
                    ("end", end__field_descriptor)])

data DescriptorProto'ReservedRange = DescriptorProto'ReservedRange{_DescriptorProto'ReservedRange'start
                                                                   ::
                                                                   !(Prelude.Maybe Data.Int.Int32),
                                                                   _DescriptorProto'ReservedRange'end
                                                                   ::
                                                                   !(Prelude.Maybe Data.Int.Int32)}
                                   deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (a ~ Data.Int.Int32, b ~ Data.Int.Int32,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "start" f DescriptorProto'ReservedRange
         DescriptorProto'ReservedRange a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DescriptorProto'ReservedRange'start
                 (\ x__ y__ -> x__{_DescriptorProto'ReservedRange'start = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Int.Int32,
          b ~ Prelude.Maybe Data.Int.Int32, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'start" f DescriptorProto'ReservedRange
         DescriptorProto'ReservedRange a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DescriptorProto'ReservedRange'start
                 (\ x__ y__ -> x__{_DescriptorProto'ReservedRange'start = y__}))
              Prelude.id

instance (a ~ Data.Int.Int32, b ~ Data.Int.Int32,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "end" f DescriptorProto'ReservedRange
         DescriptorProto'ReservedRange a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DescriptorProto'ReservedRange'end
                 (\ x__ y__ -> x__{_DescriptorProto'ReservedRange'end = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Int.Int32,
          b ~ Prelude.Maybe Data.Int.Int32, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'end" f DescriptorProto'ReservedRange
         DescriptorProto'ReservedRange a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _DescriptorProto'ReservedRange'end
                 (\ x__ y__ -> x__{_DescriptorProto'ReservedRange'end = y__}))
              Prelude.id

instance Data.Default.Class.Default DescriptorProto'ReservedRange
         where
        def
          = DescriptorProto'ReservedRange{_DescriptorProto'ReservedRange'start
                                            = Prelude.Nothing,
                                          _DescriptorProto'ReservedRange'end = Prelude.Nothing}

instance Data.ProtoLens.Message DescriptorProto'ReservedRange where
        descriptor
          = let start__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "start"
                      (Data.ProtoLens.Int32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
                      (Data.ProtoLens.OptionalField maybe'start)
                      :: Data.ProtoLens.FieldDescriptor DescriptorProto'ReservedRange
                end__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "end"
                      (Data.ProtoLens.Int32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
                      (Data.ProtoLens.OptionalField maybe'end)
                      :: Data.ProtoLens.FieldDescriptor DescriptorProto'ReservedRange
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Text.pack "google.protobuf.DescriptorProto.ReservedRange")
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, start__field_descriptor),
                    (Data.ProtoLens.Tag 2, end__field_descriptor)])
                (Data.Map.fromList
                   [("start", start__field_descriptor),
                    ("end", end__field_descriptor)])

data EnumDescriptorProto = EnumDescriptorProto{_EnumDescriptorProto'name
                                               :: !(Prelude.Maybe Data.Text.Text),
                                               _EnumDescriptorProto'value ::
                                               ![EnumValueDescriptorProto],
                                               _EnumDescriptorProto'options ::
                                               !(Prelude.Maybe EnumOptions)}
                         deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "name" f EnumDescriptorProto
         EnumDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _EnumDescriptorProto'name
                 (\ x__ y__ -> x__{_EnumDescriptorProto'name = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'name" f EnumDescriptorProto
         EnumDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _EnumDescriptorProto'name
                 (\ x__ y__ -> x__{_EnumDescriptorProto'name = y__}))
              Prelude.id

instance (a ~ [EnumValueDescriptorProto],
          b ~ [EnumValueDescriptorProto], Prelude.Functor f) =>
         Lens.Labels.HasLens "value" f EnumDescriptorProto
         EnumDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _EnumDescriptorProto'value
                 (\ x__ y__ -> x__{_EnumDescriptorProto'value = y__}))
              Prelude.id

instance (a ~ EnumOptions, b ~ EnumOptions, Prelude.Functor f) =>
         Lens.Labels.HasLens "options" f EnumDescriptorProto
         EnumDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _EnumDescriptorProto'options
                 (\ x__ y__ -> x__{_EnumDescriptorProto'options = y__}))
              (Data.ProtoLens.maybeLens Data.Default.Class.def)

instance (a ~ Prelude.Maybe EnumOptions,
          b ~ Prelude.Maybe EnumOptions, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'options" f EnumDescriptorProto
         EnumDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _EnumDescriptorProto'options
                 (\ x__ y__ -> x__{_EnumDescriptorProto'options = y__}))
              Prelude.id

instance Data.Default.Class.Default EnumDescriptorProto where
        def
          = EnumDescriptorProto{_EnumDescriptorProto'name = Prelude.Nothing,
                                _EnumDescriptorProto'value = [],
                                _EnumDescriptorProto'options = Prelude.Nothing}

instance Data.ProtoLens.Message EnumDescriptorProto where
        descriptor
          = let name__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "name"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'name)
                      :: Data.ProtoLens.FieldDescriptor EnumDescriptorProto
                value__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "value"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor EnumValueDescriptorProto)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked value)
                      :: Data.ProtoLens.FieldDescriptor EnumDescriptorProto
                options__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "options"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor EnumOptions)
                      (Data.ProtoLens.OptionalField maybe'options)
                      :: Data.ProtoLens.FieldDescriptor EnumDescriptorProto
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Text.pack "google.protobuf.EnumDescriptorProto")
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, name__field_descriptor),
                    (Data.ProtoLens.Tag 2, value__field_descriptor),
                    (Data.ProtoLens.Tag 3, options__field_descriptor)])
                (Data.Map.fromList
                   [("name", name__field_descriptor),
                    ("value", value__field_descriptor),
                    ("options", options__field_descriptor)])

data EnumOptions = EnumOptions{_EnumOptions'allowAlias ::
                               !(Prelude.Maybe Prelude.Bool),
                               _EnumOptions'deprecated :: !(Prelude.Maybe Prelude.Bool),
                               _EnumOptions'uninterpretedOption :: ![UninterpretedOption]}
                 deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (a ~ Prelude.Bool, b ~ Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "allowAlias" f EnumOptions EnumOptions a b
         where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _EnumOptions'allowAlias
                 (\ x__ y__ -> x__{_EnumOptions'allowAlias = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Prelude.Bool,
          b ~ Prelude.Maybe Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'allowAlias" f EnumOptions EnumOptions a
         b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _EnumOptions'allowAlias
                 (\ x__ y__ -> x__{_EnumOptions'allowAlias = y__}))
              Prelude.id

instance (a ~ Prelude.Bool, b ~ Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "deprecated" f EnumOptions EnumOptions a b
         where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _EnumOptions'deprecated
                 (\ x__ y__ -> x__{_EnumOptions'deprecated = y__}))
              (Data.ProtoLens.maybeLens Prelude.False)

instance (a ~ Prelude.Maybe Prelude.Bool,
          b ~ Prelude.Maybe Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'deprecated" f EnumOptions EnumOptions a
         b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _EnumOptions'deprecated
                 (\ x__ y__ -> x__{_EnumOptions'deprecated = y__}))
              Prelude.id

instance (a ~ [UninterpretedOption], b ~ [UninterpretedOption],
          Prelude.Functor f) =>
         Lens.Labels.HasLens "uninterpretedOption" f EnumOptions EnumOptions
         a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _EnumOptions'uninterpretedOption
                 (\ x__ y__ -> x__{_EnumOptions'uninterpretedOption = y__}))
              Prelude.id

instance Data.Default.Class.Default EnumOptions where
        def
          = EnumOptions{_EnumOptions'allowAlias = Prelude.Nothing,
                        _EnumOptions'deprecated = Prelude.Nothing,
                        _EnumOptions'uninterpretedOption = []}

instance Data.ProtoLens.Message EnumOptions where
        descriptor
          = let allowAlias__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "allow_alias"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'allowAlias)
                      :: Data.ProtoLens.FieldDescriptor EnumOptions
                deprecated__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "deprecated"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'deprecated)
                      :: Data.ProtoLens.FieldDescriptor EnumOptions
                uninterpretedOption__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "uninterpreted_option"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor UninterpretedOption)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         uninterpretedOption)
                      :: Data.ProtoLens.FieldDescriptor EnumOptions
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Text.pack "google.protobuf.EnumOptions")
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 2, allowAlias__field_descriptor),
                    (Data.ProtoLens.Tag 3, deprecated__field_descriptor),
                    (Data.ProtoLens.Tag 999, uninterpretedOption__field_descriptor)])
                (Data.Map.fromList
                   [("allow_alias", allowAlias__field_descriptor),
                    ("deprecated", deprecated__field_descriptor),
                    ("uninterpreted_option", uninterpretedOption__field_descriptor)])

data EnumValueDescriptorProto = EnumValueDescriptorProto{_EnumValueDescriptorProto'name
                                                         :: !(Prelude.Maybe Data.Text.Text),
                                                         _EnumValueDescriptorProto'number ::
                                                         !(Prelude.Maybe Data.Int.Int32),
                                                         _EnumValueDescriptorProto'options ::
                                                         !(Prelude.Maybe EnumValueOptions)}
                              deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "name" f EnumValueDescriptorProto
         EnumValueDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _EnumValueDescriptorProto'name
                 (\ x__ y__ -> x__{_EnumValueDescriptorProto'name = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'name" f EnumValueDescriptorProto
         EnumValueDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _EnumValueDescriptorProto'name
                 (\ x__ y__ -> x__{_EnumValueDescriptorProto'name = y__}))
              Prelude.id

instance (a ~ Data.Int.Int32, b ~ Data.Int.Int32,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "number" f EnumValueDescriptorProto
         EnumValueDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _EnumValueDescriptorProto'number
                 (\ x__ y__ -> x__{_EnumValueDescriptorProto'number = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Int.Int32,
          b ~ Prelude.Maybe Data.Int.Int32, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'number" f EnumValueDescriptorProto
         EnumValueDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _EnumValueDescriptorProto'number
                 (\ x__ y__ -> x__{_EnumValueDescriptorProto'number = y__}))
              Prelude.id

instance (a ~ EnumValueOptions, b ~ EnumValueOptions,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "options" f EnumValueDescriptorProto
         EnumValueDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _EnumValueDescriptorProto'options
                 (\ x__ y__ -> x__{_EnumValueDescriptorProto'options = y__}))
              (Data.ProtoLens.maybeLens Data.Default.Class.def)

instance (a ~ Prelude.Maybe EnumValueOptions,
          b ~ Prelude.Maybe EnumValueOptions, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'options" f EnumValueDescriptorProto
         EnumValueDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _EnumValueDescriptorProto'options
                 (\ x__ y__ -> x__{_EnumValueDescriptorProto'options = y__}))
              Prelude.id

instance Data.Default.Class.Default EnumValueDescriptorProto where
        def
          = EnumValueDescriptorProto{_EnumValueDescriptorProto'name =
                                       Prelude.Nothing,
                                     _EnumValueDescriptorProto'number = Prelude.Nothing,
                                     _EnumValueDescriptorProto'options = Prelude.Nothing}

instance Data.ProtoLens.Message EnumValueDescriptorProto where
        descriptor
          = let name__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "name"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'name)
                      :: Data.ProtoLens.FieldDescriptor EnumValueDescriptorProto
                number__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "number"
                      (Data.ProtoLens.Int32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
                      (Data.ProtoLens.OptionalField maybe'number)
                      :: Data.ProtoLens.FieldDescriptor EnumValueDescriptorProto
                options__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "options"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor EnumValueOptions)
                      (Data.ProtoLens.OptionalField maybe'options)
                      :: Data.ProtoLens.FieldDescriptor EnumValueDescriptorProto
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Text.pack "google.protobuf.EnumValueDescriptorProto")
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, name__field_descriptor),
                    (Data.ProtoLens.Tag 2, number__field_descriptor),
                    (Data.ProtoLens.Tag 3, options__field_descriptor)])
                (Data.Map.fromList
                   [("name", name__field_descriptor),
                    ("number", number__field_descriptor),
                    ("options", options__field_descriptor)])

data EnumValueOptions = EnumValueOptions{_EnumValueOptions'deprecated
                                         :: !(Prelude.Maybe Prelude.Bool),
                                         _EnumValueOptions'uninterpretedOption ::
                                         ![UninterpretedOption]}
                      deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (a ~ Prelude.Bool, b ~ Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "deprecated" f EnumValueOptions
         EnumValueOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _EnumValueOptions'deprecated
                 (\ x__ y__ -> x__{_EnumValueOptions'deprecated = y__}))
              (Data.ProtoLens.maybeLens Prelude.False)

instance (a ~ Prelude.Maybe Prelude.Bool,
          b ~ Prelude.Maybe Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'deprecated" f EnumValueOptions
         EnumValueOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _EnumValueOptions'deprecated
                 (\ x__ y__ -> x__{_EnumValueOptions'deprecated = y__}))
              Prelude.id

instance (a ~ [UninterpretedOption], b ~ [UninterpretedOption],
          Prelude.Functor f) =>
         Lens.Labels.HasLens "uninterpretedOption" f EnumValueOptions
         EnumValueOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _EnumValueOptions'uninterpretedOption
                 (\ x__ y__ -> x__{_EnumValueOptions'uninterpretedOption = y__}))
              Prelude.id

instance Data.Default.Class.Default EnumValueOptions where
        def
          = EnumValueOptions{_EnumValueOptions'deprecated = Prelude.Nothing,
                             _EnumValueOptions'uninterpretedOption = []}

instance Data.ProtoLens.Message EnumValueOptions where
        descriptor
          = let deprecated__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "deprecated"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'deprecated)
                      :: Data.ProtoLens.FieldDescriptor EnumValueOptions
                uninterpretedOption__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "uninterpreted_option"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor UninterpretedOption)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         uninterpretedOption)
                      :: Data.ProtoLens.FieldDescriptor EnumValueOptions
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Text.pack "google.protobuf.EnumValueOptions")
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, deprecated__field_descriptor),
                    (Data.ProtoLens.Tag 999, uninterpretedOption__field_descriptor)])
                (Data.Map.fromList
                   [("deprecated", deprecated__field_descriptor),
                    ("uninterpreted_option", uninterpretedOption__field_descriptor)])

data FieldDescriptorProto = FieldDescriptorProto{_FieldDescriptorProto'name
                                                 :: !(Prelude.Maybe Data.Text.Text),
                                                 _FieldDescriptorProto'number ::
                                                 !(Prelude.Maybe Data.Int.Int32),
                                                 _FieldDescriptorProto'label ::
                                                 !(Prelude.Maybe FieldDescriptorProto'Label),
                                                 _FieldDescriptorProto'type' ::
                                                 !(Prelude.Maybe FieldDescriptorProto'Type),
                                                 _FieldDescriptorProto'typeName ::
                                                 !(Prelude.Maybe Data.Text.Text),
                                                 _FieldDescriptorProto'extendee ::
                                                 !(Prelude.Maybe Data.Text.Text),
                                                 _FieldDescriptorProto'defaultValue ::
                                                 !(Prelude.Maybe Data.Text.Text),
                                                 _FieldDescriptorProto'oneofIndex ::
                                                 !(Prelude.Maybe Data.Int.Int32),
                                                 _FieldDescriptorProto'jsonName ::
                                                 !(Prelude.Maybe Data.Text.Text),
                                                 _FieldDescriptorProto'options ::
                                                 !(Prelude.Maybe FieldOptions)}
                          deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "name" f FieldDescriptorProto
         FieldDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldDescriptorProto'name
                 (\ x__ y__ -> x__{_FieldDescriptorProto'name = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'name" f FieldDescriptorProto
         FieldDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldDescriptorProto'name
                 (\ x__ y__ -> x__{_FieldDescriptorProto'name = y__}))
              Prelude.id

instance (a ~ Data.Int.Int32, b ~ Data.Int.Int32,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "number" f FieldDescriptorProto
         FieldDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldDescriptorProto'number
                 (\ x__ y__ -> x__{_FieldDescriptorProto'number = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Int.Int32,
          b ~ Prelude.Maybe Data.Int.Int32, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'number" f FieldDescriptorProto
         FieldDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldDescriptorProto'number
                 (\ x__ y__ -> x__{_FieldDescriptorProto'number = y__}))
              Prelude.id

instance (a ~ FieldDescriptorProto'Label,
          b ~ FieldDescriptorProto'Label, Prelude.Functor f) =>
         Lens.Labels.HasLens "label" f FieldDescriptorProto
         FieldDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldDescriptorProto'label
                 (\ x__ y__ -> x__{_FieldDescriptorProto'label = y__}))
              (Data.ProtoLens.maybeLens Data.Default.Class.def)

instance (a ~ Prelude.Maybe FieldDescriptorProto'Label,
          b ~ Prelude.Maybe FieldDescriptorProto'Label, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'label" f FieldDescriptorProto
         FieldDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldDescriptorProto'label
                 (\ x__ y__ -> x__{_FieldDescriptorProto'label = y__}))
              Prelude.id

instance (a ~ FieldDescriptorProto'Type,
          b ~ FieldDescriptorProto'Type, Prelude.Functor f) =>
         Lens.Labels.HasLens "type'" f FieldDescriptorProto
         FieldDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldDescriptorProto'type'
                 (\ x__ y__ -> x__{_FieldDescriptorProto'type' = y__}))
              (Data.ProtoLens.maybeLens Data.Default.Class.def)

instance (a ~ Prelude.Maybe FieldDescriptorProto'Type,
          b ~ Prelude.Maybe FieldDescriptorProto'Type, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'type'" f FieldDescriptorProto
         FieldDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldDescriptorProto'type'
                 (\ x__ y__ -> x__{_FieldDescriptorProto'type' = y__}))
              Prelude.id

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "typeName" f FieldDescriptorProto
         FieldDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldDescriptorProto'typeName
                 (\ x__ y__ -> x__{_FieldDescriptorProto'typeName = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'typeName" f FieldDescriptorProto
         FieldDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldDescriptorProto'typeName
                 (\ x__ y__ -> x__{_FieldDescriptorProto'typeName = y__}))
              Prelude.id

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "extendee" f FieldDescriptorProto
         FieldDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldDescriptorProto'extendee
                 (\ x__ y__ -> x__{_FieldDescriptorProto'extendee = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'extendee" f FieldDescriptorProto
         FieldDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldDescriptorProto'extendee
                 (\ x__ y__ -> x__{_FieldDescriptorProto'extendee = y__}))
              Prelude.id

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "defaultValue" f FieldDescriptorProto
         FieldDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldDescriptorProto'defaultValue
                 (\ x__ y__ -> x__{_FieldDescriptorProto'defaultValue = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'defaultValue" f FieldDescriptorProto
         FieldDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldDescriptorProto'defaultValue
                 (\ x__ y__ -> x__{_FieldDescriptorProto'defaultValue = y__}))
              Prelude.id

instance (a ~ Data.Int.Int32, b ~ Data.Int.Int32,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "oneofIndex" f FieldDescriptorProto
         FieldDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldDescriptorProto'oneofIndex
                 (\ x__ y__ -> x__{_FieldDescriptorProto'oneofIndex = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Int.Int32,
          b ~ Prelude.Maybe Data.Int.Int32, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'oneofIndex" f FieldDescriptorProto
         FieldDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldDescriptorProto'oneofIndex
                 (\ x__ y__ -> x__{_FieldDescriptorProto'oneofIndex = y__}))
              Prelude.id

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "jsonName" f FieldDescriptorProto
         FieldDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldDescriptorProto'jsonName
                 (\ x__ y__ -> x__{_FieldDescriptorProto'jsonName = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'jsonName" f FieldDescriptorProto
         FieldDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldDescriptorProto'jsonName
                 (\ x__ y__ -> x__{_FieldDescriptorProto'jsonName = y__}))
              Prelude.id

instance (a ~ FieldOptions, b ~ FieldOptions, Prelude.Functor f) =>
         Lens.Labels.HasLens "options" f FieldDescriptorProto
         FieldDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldDescriptorProto'options
                 (\ x__ y__ -> x__{_FieldDescriptorProto'options = y__}))
              (Data.ProtoLens.maybeLens Data.Default.Class.def)

instance (a ~ Prelude.Maybe FieldOptions,
          b ~ Prelude.Maybe FieldOptions, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'options" f FieldDescriptorProto
         FieldDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldDescriptorProto'options
                 (\ x__ y__ -> x__{_FieldDescriptorProto'options = y__}))
              Prelude.id

instance Data.Default.Class.Default FieldDescriptorProto where
        def
          = FieldDescriptorProto{_FieldDescriptorProto'name =
                                   Prelude.Nothing,
                                 _FieldDescriptorProto'number = Prelude.Nothing,
                                 _FieldDescriptorProto'label = Prelude.Nothing,
                                 _FieldDescriptorProto'type' = Prelude.Nothing,
                                 _FieldDescriptorProto'typeName = Prelude.Nothing,
                                 _FieldDescriptorProto'extendee = Prelude.Nothing,
                                 _FieldDescriptorProto'defaultValue = Prelude.Nothing,
                                 _FieldDescriptorProto'oneofIndex = Prelude.Nothing,
                                 _FieldDescriptorProto'jsonName = Prelude.Nothing,
                                 _FieldDescriptorProto'options = Prelude.Nothing}

instance Data.ProtoLens.Message FieldDescriptorProto where
        descriptor
          = let name__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "name"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'name)
                      :: Data.ProtoLens.FieldDescriptor FieldDescriptorProto
                number__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "number"
                      (Data.ProtoLens.Int32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
                      (Data.ProtoLens.OptionalField maybe'number)
                      :: Data.ProtoLens.FieldDescriptor FieldDescriptorProto
                label__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "label"
                      (Data.ProtoLens.EnumField ::
                         Data.ProtoLens.FieldTypeDescriptor FieldDescriptorProto'Label)
                      (Data.ProtoLens.OptionalField maybe'label)
                      :: Data.ProtoLens.FieldDescriptor FieldDescriptorProto
                type'__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "type"
                      (Data.ProtoLens.EnumField ::
                         Data.ProtoLens.FieldTypeDescriptor FieldDescriptorProto'Type)
                      (Data.ProtoLens.OptionalField maybe'type')
                      :: Data.ProtoLens.FieldDescriptor FieldDescriptorProto
                typeName__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "type_name"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'typeName)
                      :: Data.ProtoLens.FieldDescriptor FieldDescriptorProto
                extendee__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "extendee"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'extendee)
                      :: Data.ProtoLens.FieldDescriptor FieldDescriptorProto
                defaultValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "default_value"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'defaultValue)
                      :: Data.ProtoLens.FieldDescriptor FieldDescriptorProto
                oneofIndex__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "oneof_index"
                      (Data.ProtoLens.Int32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
                      (Data.ProtoLens.OptionalField maybe'oneofIndex)
                      :: Data.ProtoLens.FieldDescriptor FieldDescriptorProto
                jsonName__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "json_name"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'jsonName)
                      :: Data.ProtoLens.FieldDescriptor FieldDescriptorProto
                options__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "options"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor FieldOptions)
                      (Data.ProtoLens.OptionalField maybe'options)
                      :: Data.ProtoLens.FieldDescriptor FieldDescriptorProto
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Text.pack "google.protobuf.FieldDescriptorProto")
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, name__field_descriptor),
                    (Data.ProtoLens.Tag 3, number__field_descriptor),
                    (Data.ProtoLens.Tag 4, label__field_descriptor),
                    (Data.ProtoLens.Tag 5, type'__field_descriptor),
                    (Data.ProtoLens.Tag 6, typeName__field_descriptor),
                    (Data.ProtoLens.Tag 2, extendee__field_descriptor),
                    (Data.ProtoLens.Tag 7, defaultValue__field_descriptor),
                    (Data.ProtoLens.Tag 9, oneofIndex__field_descriptor),
                    (Data.ProtoLens.Tag 10, jsonName__field_descriptor),
                    (Data.ProtoLens.Tag 8, options__field_descriptor)])
                (Data.Map.fromList
                   [("name", name__field_descriptor),
                    ("number", number__field_descriptor),
                    ("label", label__field_descriptor),
                    ("type", type'__field_descriptor),
                    ("type_name", typeName__field_descriptor),
                    ("extendee", extendee__field_descriptor),
                    ("default_value", defaultValue__field_descriptor),
                    ("oneof_index", oneofIndex__field_descriptor),
                    ("json_name", jsonName__field_descriptor),
                    ("options", options__field_descriptor)])

data FieldDescriptorProto'Label = FieldDescriptorProto'LABEL_OPTIONAL
                                | FieldDescriptorProto'LABEL_REQUIRED
                                | FieldDescriptorProto'LABEL_REPEATED
                                deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance Data.Default.Class.Default FieldDescriptorProto'Label
         where
        def = FieldDescriptorProto'LABEL_OPTIONAL

instance Data.ProtoLens.FieldDefault FieldDescriptorProto'Label
         where
        fieldDefault = FieldDescriptorProto'LABEL_OPTIONAL

instance Data.ProtoLens.MessageEnum FieldDescriptorProto'Label
         where
        maybeToEnum 1 = Prelude.Just FieldDescriptorProto'LABEL_OPTIONAL
        maybeToEnum 2 = Prelude.Just FieldDescriptorProto'LABEL_REQUIRED
        maybeToEnum 3 = Prelude.Just FieldDescriptorProto'LABEL_REPEATED
        maybeToEnum _ = Prelude.Nothing
        showEnum FieldDescriptorProto'LABEL_OPTIONAL = "LABEL_OPTIONAL"
        showEnum FieldDescriptorProto'LABEL_REQUIRED = "LABEL_REQUIRED"
        showEnum FieldDescriptorProto'LABEL_REPEATED = "LABEL_REPEATED"
        readEnum "LABEL_OPTIONAL"
          = Prelude.Just FieldDescriptorProto'LABEL_OPTIONAL
        readEnum "LABEL_REQUIRED"
          = Prelude.Just FieldDescriptorProto'LABEL_REQUIRED
        readEnum "LABEL_REPEATED"
          = Prelude.Just FieldDescriptorProto'LABEL_REPEATED
        readEnum _ = Prelude.Nothing

instance Prelude.Enum FieldDescriptorProto'Label where
        toEnum k__
          = Prelude.maybe
              (Prelude.error
                 ((Prelude.++) "toEnum: unknown value for enum Label: "
                    (Prelude.show k__)))
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

instance Prelude.Bounded FieldDescriptorProto'Label where
        minBound = FieldDescriptorProto'LABEL_OPTIONAL
        maxBound = FieldDescriptorProto'LABEL_REPEATED

data FieldDescriptorProto'Type = FieldDescriptorProto'TYPE_DOUBLE
                               | FieldDescriptorProto'TYPE_FLOAT
                               | FieldDescriptorProto'TYPE_INT64
                               | FieldDescriptorProto'TYPE_UINT64
                               | FieldDescriptorProto'TYPE_INT32
                               | FieldDescriptorProto'TYPE_FIXED64
                               | FieldDescriptorProto'TYPE_FIXED32
                               | FieldDescriptorProto'TYPE_BOOL
                               | FieldDescriptorProto'TYPE_STRING
                               | FieldDescriptorProto'TYPE_GROUP
                               | FieldDescriptorProto'TYPE_MESSAGE
                               | FieldDescriptorProto'TYPE_BYTES
                               | FieldDescriptorProto'TYPE_UINT32
                               | FieldDescriptorProto'TYPE_ENUM
                               | FieldDescriptorProto'TYPE_SFIXED32
                               | FieldDescriptorProto'TYPE_SFIXED64
                               | FieldDescriptorProto'TYPE_SINT32
                               | FieldDescriptorProto'TYPE_SINT64
                               deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance Data.Default.Class.Default FieldDescriptorProto'Type where
        def = FieldDescriptorProto'TYPE_DOUBLE

instance Data.ProtoLens.FieldDefault FieldDescriptorProto'Type
         where
        fieldDefault = FieldDescriptorProto'TYPE_DOUBLE

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
        readEnum "TYPE_DOUBLE"
          = Prelude.Just FieldDescriptorProto'TYPE_DOUBLE
        readEnum "TYPE_FLOAT"
          = Prelude.Just FieldDescriptorProto'TYPE_FLOAT
        readEnum "TYPE_INT64"
          = Prelude.Just FieldDescriptorProto'TYPE_INT64
        readEnum "TYPE_UINT64"
          = Prelude.Just FieldDescriptorProto'TYPE_UINT64
        readEnum "TYPE_INT32"
          = Prelude.Just FieldDescriptorProto'TYPE_INT32
        readEnum "TYPE_FIXED64"
          = Prelude.Just FieldDescriptorProto'TYPE_FIXED64
        readEnum "TYPE_FIXED32"
          = Prelude.Just FieldDescriptorProto'TYPE_FIXED32
        readEnum "TYPE_BOOL" = Prelude.Just FieldDescriptorProto'TYPE_BOOL
        readEnum "TYPE_STRING"
          = Prelude.Just FieldDescriptorProto'TYPE_STRING
        readEnum "TYPE_GROUP"
          = Prelude.Just FieldDescriptorProto'TYPE_GROUP
        readEnum "TYPE_MESSAGE"
          = Prelude.Just FieldDescriptorProto'TYPE_MESSAGE
        readEnum "TYPE_BYTES"
          = Prelude.Just FieldDescriptorProto'TYPE_BYTES
        readEnum "TYPE_UINT32"
          = Prelude.Just FieldDescriptorProto'TYPE_UINT32
        readEnum "TYPE_ENUM" = Prelude.Just FieldDescriptorProto'TYPE_ENUM
        readEnum "TYPE_SFIXED32"
          = Prelude.Just FieldDescriptorProto'TYPE_SFIXED32
        readEnum "TYPE_SFIXED64"
          = Prelude.Just FieldDescriptorProto'TYPE_SFIXED64
        readEnum "TYPE_SINT32"
          = Prelude.Just FieldDescriptorProto'TYPE_SINT32
        readEnum "TYPE_SINT64"
          = Prelude.Just FieldDescriptorProto'TYPE_SINT64
        readEnum _ = Prelude.Nothing

instance Prelude.Enum FieldDescriptorProto'Type where
        toEnum k__
          = Prelude.maybe
              (Prelude.error
                 ((Prelude.++) "toEnum: unknown value for enum Type: "
                    (Prelude.show k__)))
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

instance Prelude.Bounded FieldDescriptorProto'Type where
        minBound = FieldDescriptorProto'TYPE_DOUBLE
        maxBound = FieldDescriptorProto'TYPE_SINT64

data FieldOptions = FieldOptions{_FieldOptions'ctype ::
                                 !(Prelude.Maybe FieldOptions'CType),
                                 _FieldOptions'packed :: !(Prelude.Maybe Prelude.Bool),
                                 _FieldOptions'jstype :: !(Prelude.Maybe FieldOptions'JSType),
                                 _FieldOptions'lazy :: !(Prelude.Maybe Prelude.Bool),
                                 _FieldOptions'deprecated :: !(Prelude.Maybe Prelude.Bool),
                                 _FieldOptions'weak :: !(Prelude.Maybe Prelude.Bool),
                                 _FieldOptions'uninterpretedOption :: ![UninterpretedOption]}
                  deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (a ~ FieldOptions'CType, b ~ FieldOptions'CType,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "ctype" f FieldOptions FieldOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldOptions'ctype
                 (\ x__ y__ -> x__{_FieldOptions'ctype = y__}))
              (Data.ProtoLens.maybeLens FieldOptions'STRING)

instance (a ~ Prelude.Maybe FieldOptions'CType,
          b ~ Prelude.Maybe FieldOptions'CType, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'ctype" f FieldOptions FieldOptions a b
         where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldOptions'ctype
                 (\ x__ y__ -> x__{_FieldOptions'ctype = y__}))
              Prelude.id

instance (a ~ Prelude.Bool, b ~ Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "packed" f FieldOptions FieldOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldOptions'packed
                 (\ x__ y__ -> x__{_FieldOptions'packed = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Prelude.Bool,
          b ~ Prelude.Maybe Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'packed" f FieldOptions FieldOptions a b
         where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldOptions'packed
                 (\ x__ y__ -> x__{_FieldOptions'packed = y__}))
              Prelude.id

instance (a ~ FieldOptions'JSType, b ~ FieldOptions'JSType,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "jstype" f FieldOptions FieldOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldOptions'jstype
                 (\ x__ y__ -> x__{_FieldOptions'jstype = y__}))
              (Data.ProtoLens.maybeLens FieldOptions'JS_NORMAL)

instance (a ~ Prelude.Maybe FieldOptions'JSType,
          b ~ Prelude.Maybe FieldOptions'JSType, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'jstype" f FieldOptions FieldOptions a b
         where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldOptions'jstype
                 (\ x__ y__ -> x__{_FieldOptions'jstype = y__}))
              Prelude.id

instance (a ~ Prelude.Bool, b ~ Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "lazy" f FieldOptions FieldOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldOptions'lazy
                 (\ x__ y__ -> x__{_FieldOptions'lazy = y__}))
              (Data.ProtoLens.maybeLens Prelude.False)

instance (a ~ Prelude.Maybe Prelude.Bool,
          b ~ Prelude.Maybe Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'lazy" f FieldOptions FieldOptions a b
         where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldOptions'lazy
                 (\ x__ y__ -> x__{_FieldOptions'lazy = y__}))
              Prelude.id

instance (a ~ Prelude.Bool, b ~ Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "deprecated" f FieldOptions FieldOptions a b
         where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldOptions'deprecated
                 (\ x__ y__ -> x__{_FieldOptions'deprecated = y__}))
              (Data.ProtoLens.maybeLens Prelude.False)

instance (a ~ Prelude.Maybe Prelude.Bool,
          b ~ Prelude.Maybe Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'deprecated" f FieldOptions FieldOptions
         a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldOptions'deprecated
                 (\ x__ y__ -> x__{_FieldOptions'deprecated = y__}))
              Prelude.id

instance (a ~ Prelude.Bool, b ~ Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "weak" f FieldOptions FieldOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldOptions'weak
                 (\ x__ y__ -> x__{_FieldOptions'weak = y__}))
              (Data.ProtoLens.maybeLens Prelude.False)

instance (a ~ Prelude.Maybe Prelude.Bool,
          b ~ Prelude.Maybe Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'weak" f FieldOptions FieldOptions a b
         where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldOptions'weak
                 (\ x__ y__ -> x__{_FieldOptions'weak = y__}))
              Prelude.id

instance (a ~ [UninterpretedOption], b ~ [UninterpretedOption],
          Prelude.Functor f) =>
         Lens.Labels.HasLens "uninterpretedOption" f FieldOptions
         FieldOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FieldOptions'uninterpretedOption
                 (\ x__ y__ -> x__{_FieldOptions'uninterpretedOption = y__}))
              Prelude.id

instance Data.Default.Class.Default FieldOptions where
        def
          = FieldOptions{_FieldOptions'ctype = Prelude.Nothing,
                         _FieldOptions'packed = Prelude.Nothing,
                         _FieldOptions'jstype = Prelude.Nothing,
                         _FieldOptions'lazy = Prelude.Nothing,
                         _FieldOptions'deprecated = Prelude.Nothing,
                         _FieldOptions'weak = Prelude.Nothing,
                         _FieldOptions'uninterpretedOption = []}

instance Data.ProtoLens.Message FieldOptions where
        descriptor
          = let ctype__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "ctype"
                      (Data.ProtoLens.EnumField ::
                         Data.ProtoLens.FieldTypeDescriptor FieldOptions'CType)
                      (Data.ProtoLens.OptionalField maybe'ctype)
                      :: Data.ProtoLens.FieldDescriptor FieldOptions
                packed__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "packed"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'packed)
                      :: Data.ProtoLens.FieldDescriptor FieldOptions
                jstype__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "jstype"
                      (Data.ProtoLens.EnumField ::
                         Data.ProtoLens.FieldTypeDescriptor FieldOptions'JSType)
                      (Data.ProtoLens.OptionalField maybe'jstype)
                      :: Data.ProtoLens.FieldDescriptor FieldOptions
                lazy__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "lazy"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'lazy)
                      :: Data.ProtoLens.FieldDescriptor FieldOptions
                deprecated__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "deprecated"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'deprecated)
                      :: Data.ProtoLens.FieldDescriptor FieldOptions
                weak__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "weak"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'weak)
                      :: Data.ProtoLens.FieldDescriptor FieldOptions
                uninterpretedOption__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "uninterpreted_option"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor UninterpretedOption)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         uninterpretedOption)
                      :: Data.ProtoLens.FieldDescriptor FieldOptions
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Text.pack "google.protobuf.FieldOptions")
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, ctype__field_descriptor),
                    (Data.ProtoLens.Tag 2, packed__field_descriptor),
                    (Data.ProtoLens.Tag 6, jstype__field_descriptor),
                    (Data.ProtoLens.Tag 5, lazy__field_descriptor),
                    (Data.ProtoLens.Tag 3, deprecated__field_descriptor),
                    (Data.ProtoLens.Tag 10, weak__field_descriptor),
                    (Data.ProtoLens.Tag 999, uninterpretedOption__field_descriptor)])
                (Data.Map.fromList
                   [("ctype", ctype__field_descriptor),
                    ("packed", packed__field_descriptor),
                    ("jstype", jstype__field_descriptor),
                    ("lazy", lazy__field_descriptor),
                    ("deprecated", deprecated__field_descriptor),
                    ("weak", weak__field_descriptor),
                    ("uninterpreted_option", uninterpretedOption__field_descriptor)])

data FieldOptions'CType = FieldOptions'STRING
                        | FieldOptions'CORD
                        | FieldOptions'STRING_PIECE
                        deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance Data.Default.Class.Default FieldOptions'CType where
        def = FieldOptions'STRING

instance Data.ProtoLens.FieldDefault FieldOptions'CType where
        fieldDefault = FieldOptions'STRING

instance Data.ProtoLens.MessageEnum FieldOptions'CType where
        maybeToEnum 0 = Prelude.Just FieldOptions'STRING
        maybeToEnum 1 = Prelude.Just FieldOptions'CORD
        maybeToEnum 2 = Prelude.Just FieldOptions'STRING_PIECE
        maybeToEnum _ = Prelude.Nothing
        showEnum FieldOptions'STRING = "STRING"
        showEnum FieldOptions'CORD = "CORD"
        showEnum FieldOptions'STRING_PIECE = "STRING_PIECE"
        readEnum "STRING" = Prelude.Just FieldOptions'STRING
        readEnum "CORD" = Prelude.Just FieldOptions'CORD
        readEnum "STRING_PIECE" = Prelude.Just FieldOptions'STRING_PIECE
        readEnum _ = Prelude.Nothing

instance Prelude.Enum FieldOptions'CType where
        toEnum k__
          = Prelude.maybe
              (Prelude.error
                 ((Prelude.++) "toEnum: unknown value for enum CType: "
                    (Prelude.show k__)))
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

instance Prelude.Bounded FieldOptions'CType where
        minBound = FieldOptions'STRING
        maxBound = FieldOptions'STRING_PIECE

data FieldOptions'JSType = FieldOptions'JS_NORMAL
                         | FieldOptions'JS_STRING
                         | FieldOptions'JS_NUMBER
                         deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance Data.Default.Class.Default FieldOptions'JSType where
        def = FieldOptions'JS_NORMAL

instance Data.ProtoLens.FieldDefault FieldOptions'JSType where
        fieldDefault = FieldOptions'JS_NORMAL

instance Data.ProtoLens.MessageEnum FieldOptions'JSType where
        maybeToEnum 0 = Prelude.Just FieldOptions'JS_NORMAL
        maybeToEnum 1 = Prelude.Just FieldOptions'JS_STRING
        maybeToEnum 2 = Prelude.Just FieldOptions'JS_NUMBER
        maybeToEnum _ = Prelude.Nothing
        showEnum FieldOptions'JS_NORMAL = "JS_NORMAL"
        showEnum FieldOptions'JS_STRING = "JS_STRING"
        showEnum FieldOptions'JS_NUMBER = "JS_NUMBER"
        readEnum "JS_NORMAL" = Prelude.Just FieldOptions'JS_NORMAL
        readEnum "JS_STRING" = Prelude.Just FieldOptions'JS_STRING
        readEnum "JS_NUMBER" = Prelude.Just FieldOptions'JS_NUMBER
        readEnum _ = Prelude.Nothing

instance Prelude.Enum FieldOptions'JSType where
        toEnum k__
          = Prelude.maybe
              (Prelude.error
                 ((Prelude.++) "toEnum: unknown value for enum JSType: "
                    (Prelude.show k__)))
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

instance Prelude.Bounded FieldOptions'JSType where
        minBound = FieldOptions'JS_NORMAL
        maxBound = FieldOptions'JS_NUMBER

data FileDescriptorProto = FileDescriptorProto{_FileDescriptorProto'name
                                               :: !(Prelude.Maybe Data.Text.Text),
                                               _FileDescriptorProto'package ::
                                               !(Prelude.Maybe Data.Text.Text),
                                               _FileDescriptorProto'dependency :: ![Data.Text.Text],
                                               _FileDescriptorProto'publicDependency ::
                                               ![Data.Int.Int32],
                                               _FileDescriptorProto'weakDependency ::
                                               ![Data.Int.Int32],
                                               _FileDescriptorProto'messageType ::
                                               ![DescriptorProto],
                                               _FileDescriptorProto'enumType ::
                                               ![EnumDescriptorProto],
                                               _FileDescriptorProto'service ::
                                               ![ServiceDescriptorProto],
                                               _FileDescriptorProto'extension ::
                                               ![FieldDescriptorProto],
                                               _FileDescriptorProto'options ::
                                               !(Prelude.Maybe FileOptions),
                                               _FileDescriptorProto'sourceCodeInfo ::
                                               !(Prelude.Maybe SourceCodeInfo),
                                               _FileDescriptorProto'syntax ::
                                               !(Prelude.Maybe Data.Text.Text)}
                         deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "name" f FileDescriptorProto
         FileDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileDescriptorProto'name
                 (\ x__ y__ -> x__{_FileDescriptorProto'name = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'name" f FileDescriptorProto
         FileDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileDescriptorProto'name
                 (\ x__ y__ -> x__{_FileDescriptorProto'name = y__}))
              Prelude.id

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "package" f FileDescriptorProto
         FileDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileDescriptorProto'package
                 (\ x__ y__ -> x__{_FileDescriptorProto'package = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'package" f FileDescriptorProto
         FileDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileDescriptorProto'package
                 (\ x__ y__ -> x__{_FileDescriptorProto'package = y__}))
              Prelude.id

instance (a ~ [Data.Text.Text], b ~ [Data.Text.Text],
          Prelude.Functor f) =>
         Lens.Labels.HasLens "dependency" f FileDescriptorProto
         FileDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileDescriptorProto'dependency
                 (\ x__ y__ -> x__{_FileDescriptorProto'dependency = y__}))
              Prelude.id

instance (a ~ [Data.Int.Int32], b ~ [Data.Int.Int32],
          Prelude.Functor f) =>
         Lens.Labels.HasLens "publicDependency" f FileDescriptorProto
         FileDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileDescriptorProto'publicDependency
                 (\ x__ y__ -> x__{_FileDescriptorProto'publicDependency = y__}))
              Prelude.id

instance (a ~ [Data.Int.Int32], b ~ [Data.Int.Int32],
          Prelude.Functor f) =>
         Lens.Labels.HasLens "weakDependency" f FileDescriptorProto
         FileDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileDescriptorProto'weakDependency
                 (\ x__ y__ -> x__{_FileDescriptorProto'weakDependency = y__}))
              Prelude.id

instance (a ~ [DescriptorProto], b ~ [DescriptorProto],
          Prelude.Functor f) =>
         Lens.Labels.HasLens "messageType" f FileDescriptorProto
         FileDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileDescriptorProto'messageType
                 (\ x__ y__ -> x__{_FileDescriptorProto'messageType = y__}))
              Prelude.id

instance (a ~ [EnumDescriptorProto], b ~ [EnumDescriptorProto],
          Prelude.Functor f) =>
         Lens.Labels.HasLens "enumType" f FileDescriptorProto
         FileDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileDescriptorProto'enumType
                 (\ x__ y__ -> x__{_FileDescriptorProto'enumType = y__}))
              Prelude.id

instance (a ~ [ServiceDescriptorProto],
          b ~ [ServiceDescriptorProto], Prelude.Functor f) =>
         Lens.Labels.HasLens "service" f FileDescriptorProto
         FileDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileDescriptorProto'service
                 (\ x__ y__ -> x__{_FileDescriptorProto'service = y__}))
              Prelude.id

instance (a ~ [FieldDescriptorProto], b ~ [FieldDescriptorProto],
          Prelude.Functor f) =>
         Lens.Labels.HasLens "extension" f FileDescriptorProto
         FileDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileDescriptorProto'extension
                 (\ x__ y__ -> x__{_FileDescriptorProto'extension = y__}))
              Prelude.id

instance (a ~ FileOptions, b ~ FileOptions, Prelude.Functor f) =>
         Lens.Labels.HasLens "options" f FileDescriptorProto
         FileDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileDescriptorProto'options
                 (\ x__ y__ -> x__{_FileDescriptorProto'options = y__}))
              (Data.ProtoLens.maybeLens Data.Default.Class.def)

instance (a ~ Prelude.Maybe FileOptions,
          b ~ Prelude.Maybe FileOptions, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'options" f FileDescriptorProto
         FileDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileDescriptorProto'options
                 (\ x__ y__ -> x__{_FileDescriptorProto'options = y__}))
              Prelude.id

instance (a ~ SourceCodeInfo, b ~ SourceCodeInfo,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "sourceCodeInfo" f FileDescriptorProto
         FileDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileDescriptorProto'sourceCodeInfo
                 (\ x__ y__ -> x__{_FileDescriptorProto'sourceCodeInfo = y__}))
              (Data.ProtoLens.maybeLens Data.Default.Class.def)

instance (a ~ Prelude.Maybe SourceCodeInfo,
          b ~ Prelude.Maybe SourceCodeInfo, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'sourceCodeInfo" f FileDescriptorProto
         FileDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileDescriptorProto'sourceCodeInfo
                 (\ x__ y__ -> x__{_FileDescriptorProto'sourceCodeInfo = y__}))
              Prelude.id

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "syntax" f FileDescriptorProto
         FileDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileDescriptorProto'syntax
                 (\ x__ y__ -> x__{_FileDescriptorProto'syntax = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'syntax" f FileDescriptorProto
         FileDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileDescriptorProto'syntax
                 (\ x__ y__ -> x__{_FileDescriptorProto'syntax = y__}))
              Prelude.id

instance Data.Default.Class.Default FileDescriptorProto where
        def
          = FileDescriptorProto{_FileDescriptorProto'name = Prelude.Nothing,
                                _FileDescriptorProto'package = Prelude.Nothing,
                                _FileDescriptorProto'dependency = [],
                                _FileDescriptorProto'publicDependency = [],
                                _FileDescriptorProto'weakDependency = [],
                                _FileDescriptorProto'messageType = [],
                                _FileDescriptorProto'enumType = [],
                                _FileDescriptorProto'service = [],
                                _FileDescriptorProto'extension = [],
                                _FileDescriptorProto'options = Prelude.Nothing,
                                _FileDescriptorProto'sourceCodeInfo = Prelude.Nothing,
                                _FileDescriptorProto'syntax = Prelude.Nothing}

instance Data.ProtoLens.Message FileDescriptorProto where
        descriptor
          = let name__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "name"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'name)
                      :: Data.ProtoLens.FieldDescriptor FileDescriptorProto
                package__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "package"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'package)
                      :: Data.ProtoLens.FieldDescriptor FileDescriptorProto
                dependency__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "dependency"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked dependency)
                      :: Data.ProtoLens.FieldDescriptor FileDescriptorProto
                publicDependency__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "public_dependency"
                      (Data.ProtoLens.Int32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         publicDependency)
                      :: Data.ProtoLens.FieldDescriptor FileDescriptorProto
                weakDependency__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "weak_dependency"
                      (Data.ProtoLens.Int32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         weakDependency)
                      :: Data.ProtoLens.FieldDescriptor FileDescriptorProto
                messageType__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "message_type"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor DescriptorProto)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked messageType)
                      :: Data.ProtoLens.FieldDescriptor FileDescriptorProto
                enumType__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "enum_type"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor EnumDescriptorProto)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked enumType)
                      :: Data.ProtoLens.FieldDescriptor FileDescriptorProto
                service__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "service"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor ServiceDescriptorProto)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked service)
                      :: Data.ProtoLens.FieldDescriptor FileDescriptorProto
                extension__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "extension"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor FieldDescriptorProto)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked extension)
                      :: Data.ProtoLens.FieldDescriptor FileDescriptorProto
                options__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "options"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor FileOptions)
                      (Data.ProtoLens.OptionalField maybe'options)
                      :: Data.ProtoLens.FieldDescriptor FileDescriptorProto
                sourceCodeInfo__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "source_code_info"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor SourceCodeInfo)
                      (Data.ProtoLens.OptionalField maybe'sourceCodeInfo)
                      :: Data.ProtoLens.FieldDescriptor FileDescriptorProto
                syntax__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "syntax"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'syntax)
                      :: Data.ProtoLens.FieldDescriptor FileDescriptorProto
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Text.pack "google.protobuf.FileDescriptorProto")
                (Data.Map.fromList
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
                    (Data.ProtoLens.Tag 12, syntax__field_descriptor)])
                (Data.Map.fromList
                   [("name", name__field_descriptor),
                    ("package", package__field_descriptor),
                    ("dependency", dependency__field_descriptor),
                    ("public_dependency", publicDependency__field_descriptor),
                    ("weak_dependency", weakDependency__field_descriptor),
                    ("message_type", messageType__field_descriptor),
                    ("enum_type", enumType__field_descriptor),
                    ("service", service__field_descriptor),
                    ("extension", extension__field_descriptor),
                    ("options", options__field_descriptor),
                    ("source_code_info", sourceCodeInfo__field_descriptor),
                    ("syntax", syntax__field_descriptor)])

data FileDescriptorSet = FileDescriptorSet{_FileDescriptorSet'file
                                           :: ![FileDescriptorProto]}
                       deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (a ~ [FileDescriptorProto], b ~ [FileDescriptorProto],
          Prelude.Functor f) =>
         Lens.Labels.HasLens "file" f FileDescriptorSet FileDescriptorSet a
         b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileDescriptorSet'file
                 (\ x__ y__ -> x__{_FileDescriptorSet'file = y__}))
              Prelude.id

instance Data.Default.Class.Default FileDescriptorSet where
        def = FileDescriptorSet{_FileDescriptorSet'file = []}

instance Data.ProtoLens.Message FileDescriptorSet where
        descriptor
          = let file__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "file"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor FileDescriptorProto)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked file)
                      :: Data.ProtoLens.FieldDescriptor FileDescriptorSet
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Text.pack "google.protobuf.FileDescriptorSet")
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, file__field_descriptor)])
                (Data.Map.fromList [("file", file__field_descriptor)])

data FileOptions = FileOptions{_FileOptions'javaPackage ::
                               !(Prelude.Maybe Data.Text.Text),
                               _FileOptions'javaOuterClassname :: !(Prelude.Maybe Data.Text.Text),
                               _FileOptions'javaMultipleFiles :: !(Prelude.Maybe Prelude.Bool),
                               _FileOptions'javaGenerateEqualsAndHash ::
                               !(Prelude.Maybe Prelude.Bool),
                               _FileOptions'javaStringCheckUtf8 :: !(Prelude.Maybe Prelude.Bool),
                               _FileOptions'optimizeFor ::
                               !(Prelude.Maybe FileOptions'OptimizeMode),
                               _FileOptions'goPackage :: !(Prelude.Maybe Data.Text.Text),
                               _FileOptions'ccGenericServices :: !(Prelude.Maybe Prelude.Bool),
                               _FileOptions'javaGenericServices :: !(Prelude.Maybe Prelude.Bool),
                               _FileOptions'pyGenericServices :: !(Prelude.Maybe Prelude.Bool),
                               _FileOptions'deprecated :: !(Prelude.Maybe Prelude.Bool),
                               _FileOptions'ccEnableArenas :: !(Prelude.Maybe Prelude.Bool),
                               _FileOptions'objcClassPrefix :: !(Prelude.Maybe Data.Text.Text),
                               _FileOptions'csharpNamespace :: !(Prelude.Maybe Data.Text.Text),
                               _FileOptions'uninterpretedOption :: ![UninterpretedOption]}
                 deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "javaPackage" f FileOptions FileOptions a b
         where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'javaPackage
                 (\ x__ y__ -> x__{_FileOptions'javaPackage = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'javaPackage" f FileOptions FileOptions a
         b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'javaPackage
                 (\ x__ y__ -> x__{_FileOptions'javaPackage = y__}))
              Prelude.id

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "javaOuterClassname" f FileOptions FileOptions
         a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'javaOuterClassname
                 (\ x__ y__ -> x__{_FileOptions'javaOuterClassname = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'javaOuterClassname" f FileOptions
         FileOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'javaOuterClassname
                 (\ x__ y__ -> x__{_FileOptions'javaOuterClassname = y__}))
              Prelude.id

instance (a ~ Prelude.Bool, b ~ Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "javaMultipleFiles" f FileOptions FileOptions a
         b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'javaMultipleFiles
                 (\ x__ y__ -> x__{_FileOptions'javaMultipleFiles = y__}))
              (Data.ProtoLens.maybeLens Prelude.False)

instance (a ~ Prelude.Maybe Prelude.Bool,
          b ~ Prelude.Maybe Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'javaMultipleFiles" f FileOptions
         FileOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'javaMultipleFiles
                 (\ x__ y__ -> x__{_FileOptions'javaMultipleFiles = y__}))
              Prelude.id

instance (a ~ Prelude.Bool, b ~ Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "javaGenerateEqualsAndHash" f FileOptions
         FileOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'javaGenerateEqualsAndHash
                 (\ x__ y__ -> x__{_FileOptions'javaGenerateEqualsAndHash = y__}))
              (Data.ProtoLens.maybeLens Prelude.False)

instance (a ~ Prelude.Maybe Prelude.Bool,
          b ~ Prelude.Maybe Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'javaGenerateEqualsAndHash" f FileOptions
         FileOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'javaGenerateEqualsAndHash
                 (\ x__ y__ -> x__{_FileOptions'javaGenerateEqualsAndHash = y__}))
              Prelude.id

instance (a ~ Prelude.Bool, b ~ Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "javaStringCheckUtf8" f FileOptions FileOptions
         a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'javaStringCheckUtf8
                 (\ x__ y__ -> x__{_FileOptions'javaStringCheckUtf8 = y__}))
              (Data.ProtoLens.maybeLens Prelude.False)

instance (a ~ Prelude.Maybe Prelude.Bool,
          b ~ Prelude.Maybe Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'javaStringCheckUtf8" f FileOptions
         FileOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'javaStringCheckUtf8
                 (\ x__ y__ -> x__{_FileOptions'javaStringCheckUtf8 = y__}))
              Prelude.id

instance (a ~ FileOptions'OptimizeMode,
          b ~ FileOptions'OptimizeMode, Prelude.Functor f) =>
         Lens.Labels.HasLens "optimizeFor" f FileOptions FileOptions a b
         where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'optimizeFor
                 (\ x__ y__ -> x__{_FileOptions'optimizeFor = y__}))
              (Data.ProtoLens.maybeLens FileOptions'SPEED)

instance (a ~ Prelude.Maybe FileOptions'OptimizeMode,
          b ~ Prelude.Maybe FileOptions'OptimizeMode, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'optimizeFor" f FileOptions FileOptions a
         b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'optimizeFor
                 (\ x__ y__ -> x__{_FileOptions'optimizeFor = y__}))
              Prelude.id

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "goPackage" f FileOptions FileOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'goPackage
                 (\ x__ y__ -> x__{_FileOptions'goPackage = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'goPackage" f FileOptions FileOptions a b
         where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'goPackage
                 (\ x__ y__ -> x__{_FileOptions'goPackage = y__}))
              Prelude.id

instance (a ~ Prelude.Bool, b ~ Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "ccGenericServices" f FileOptions FileOptions a
         b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'ccGenericServices
                 (\ x__ y__ -> x__{_FileOptions'ccGenericServices = y__}))
              (Data.ProtoLens.maybeLens Prelude.False)

instance (a ~ Prelude.Maybe Prelude.Bool,
          b ~ Prelude.Maybe Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'ccGenericServices" f FileOptions
         FileOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'ccGenericServices
                 (\ x__ y__ -> x__{_FileOptions'ccGenericServices = y__}))
              Prelude.id

instance (a ~ Prelude.Bool, b ~ Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "javaGenericServices" f FileOptions FileOptions
         a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'javaGenericServices
                 (\ x__ y__ -> x__{_FileOptions'javaGenericServices = y__}))
              (Data.ProtoLens.maybeLens Prelude.False)

instance (a ~ Prelude.Maybe Prelude.Bool,
          b ~ Prelude.Maybe Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'javaGenericServices" f FileOptions
         FileOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'javaGenericServices
                 (\ x__ y__ -> x__{_FileOptions'javaGenericServices = y__}))
              Prelude.id

instance (a ~ Prelude.Bool, b ~ Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "pyGenericServices" f FileOptions FileOptions a
         b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'pyGenericServices
                 (\ x__ y__ -> x__{_FileOptions'pyGenericServices = y__}))
              (Data.ProtoLens.maybeLens Prelude.False)

instance (a ~ Prelude.Maybe Prelude.Bool,
          b ~ Prelude.Maybe Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'pyGenericServices" f FileOptions
         FileOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'pyGenericServices
                 (\ x__ y__ -> x__{_FileOptions'pyGenericServices = y__}))
              Prelude.id

instance (a ~ Prelude.Bool, b ~ Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "deprecated" f FileOptions FileOptions a b
         where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'deprecated
                 (\ x__ y__ -> x__{_FileOptions'deprecated = y__}))
              (Data.ProtoLens.maybeLens Prelude.False)

instance (a ~ Prelude.Maybe Prelude.Bool,
          b ~ Prelude.Maybe Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'deprecated" f FileOptions FileOptions a
         b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'deprecated
                 (\ x__ y__ -> x__{_FileOptions'deprecated = y__}))
              Prelude.id

instance (a ~ Prelude.Bool, b ~ Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "ccEnableArenas" f FileOptions FileOptions a b
         where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'ccEnableArenas
                 (\ x__ y__ -> x__{_FileOptions'ccEnableArenas = y__}))
              (Data.ProtoLens.maybeLens Prelude.False)

instance (a ~ Prelude.Maybe Prelude.Bool,
          b ~ Prelude.Maybe Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'ccEnableArenas" f FileOptions
         FileOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'ccEnableArenas
                 (\ x__ y__ -> x__{_FileOptions'ccEnableArenas = y__}))
              Prelude.id

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "objcClassPrefix" f FileOptions FileOptions a b
         where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'objcClassPrefix
                 (\ x__ y__ -> x__{_FileOptions'objcClassPrefix = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'objcClassPrefix" f FileOptions
         FileOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'objcClassPrefix
                 (\ x__ y__ -> x__{_FileOptions'objcClassPrefix = y__}))
              Prelude.id

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "csharpNamespace" f FileOptions FileOptions a b
         where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'csharpNamespace
                 (\ x__ y__ -> x__{_FileOptions'csharpNamespace = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'csharpNamespace" f FileOptions
         FileOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'csharpNamespace
                 (\ x__ y__ -> x__{_FileOptions'csharpNamespace = y__}))
              Prelude.id

instance (a ~ [UninterpretedOption], b ~ [UninterpretedOption],
          Prelude.Functor f) =>
         Lens.Labels.HasLens "uninterpretedOption" f FileOptions FileOptions
         a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _FileOptions'uninterpretedOption
                 (\ x__ y__ -> x__{_FileOptions'uninterpretedOption = y__}))
              Prelude.id

instance Data.Default.Class.Default FileOptions where
        def
          = FileOptions{_FileOptions'javaPackage = Prelude.Nothing,
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
                        _FileOptions'uninterpretedOption = []}

instance Data.ProtoLens.Message FileOptions where
        descriptor
          = let javaPackage__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "java_package"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'javaPackage)
                      :: Data.ProtoLens.FieldDescriptor FileOptions
                javaOuterClassname__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "java_outer_classname"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'javaOuterClassname)
                      :: Data.ProtoLens.FieldDescriptor FileOptions
                javaMultipleFiles__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "java_multiple_files"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'javaMultipleFiles)
                      :: Data.ProtoLens.FieldDescriptor FileOptions
                javaGenerateEqualsAndHash__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "java_generate_equals_and_hash"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'javaGenerateEqualsAndHash)
                      :: Data.ProtoLens.FieldDescriptor FileOptions
                javaStringCheckUtf8__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "java_string_check_utf8"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'javaStringCheckUtf8)
                      :: Data.ProtoLens.FieldDescriptor FileOptions
                optimizeFor__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "optimize_for"
                      (Data.ProtoLens.EnumField ::
                         Data.ProtoLens.FieldTypeDescriptor FileOptions'OptimizeMode)
                      (Data.ProtoLens.OptionalField maybe'optimizeFor)
                      :: Data.ProtoLens.FieldDescriptor FileOptions
                goPackage__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "go_package"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'goPackage)
                      :: Data.ProtoLens.FieldDescriptor FileOptions
                ccGenericServices__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "cc_generic_services"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'ccGenericServices)
                      :: Data.ProtoLens.FieldDescriptor FileOptions
                javaGenericServices__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "java_generic_services"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'javaGenericServices)
                      :: Data.ProtoLens.FieldDescriptor FileOptions
                pyGenericServices__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "py_generic_services"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'pyGenericServices)
                      :: Data.ProtoLens.FieldDescriptor FileOptions
                deprecated__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "deprecated"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'deprecated)
                      :: Data.ProtoLens.FieldDescriptor FileOptions
                ccEnableArenas__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "cc_enable_arenas"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'ccEnableArenas)
                      :: Data.ProtoLens.FieldDescriptor FileOptions
                objcClassPrefix__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "objc_class_prefix"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'objcClassPrefix)
                      :: Data.ProtoLens.FieldDescriptor FileOptions
                csharpNamespace__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "csharp_namespace"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'csharpNamespace)
                      :: Data.ProtoLens.FieldDescriptor FileOptions
                uninterpretedOption__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "uninterpreted_option"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor UninterpretedOption)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         uninterpretedOption)
                      :: Data.ProtoLens.FieldDescriptor FileOptions
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Text.pack "google.protobuf.FileOptions")
                (Data.Map.fromList
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
                    (Data.ProtoLens.Tag 999, uninterpretedOption__field_descriptor)])
                (Data.Map.fromList
                   [("java_package", javaPackage__field_descriptor),
                    ("java_outer_classname", javaOuterClassname__field_descriptor),
                    ("java_multiple_files", javaMultipleFiles__field_descriptor),
                    ("java_generate_equals_and_hash",
                     javaGenerateEqualsAndHash__field_descriptor),
                    ("java_string_check_utf8", javaStringCheckUtf8__field_descriptor),
                    ("optimize_for", optimizeFor__field_descriptor),
                    ("go_package", goPackage__field_descriptor),
                    ("cc_generic_services", ccGenericServices__field_descriptor),
                    ("java_generic_services", javaGenericServices__field_descriptor),
                    ("py_generic_services", pyGenericServices__field_descriptor),
                    ("deprecated", deprecated__field_descriptor),
                    ("cc_enable_arenas", ccEnableArenas__field_descriptor),
                    ("objc_class_prefix", objcClassPrefix__field_descriptor),
                    ("csharp_namespace", csharpNamespace__field_descriptor),
                    ("uninterpreted_option", uninterpretedOption__field_descriptor)])

data FileOptions'OptimizeMode = FileOptions'SPEED
                              | FileOptions'CODE_SIZE
                              | FileOptions'LITE_RUNTIME
                              deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance Data.Default.Class.Default FileOptions'OptimizeMode where
        def = FileOptions'SPEED

instance Data.ProtoLens.FieldDefault FileOptions'OptimizeMode where
        fieldDefault = FileOptions'SPEED

instance Data.ProtoLens.MessageEnum FileOptions'OptimizeMode where
        maybeToEnum 1 = Prelude.Just FileOptions'SPEED
        maybeToEnum 2 = Prelude.Just FileOptions'CODE_SIZE
        maybeToEnum 3 = Prelude.Just FileOptions'LITE_RUNTIME
        maybeToEnum _ = Prelude.Nothing
        showEnum FileOptions'SPEED = "SPEED"
        showEnum FileOptions'CODE_SIZE = "CODE_SIZE"
        showEnum FileOptions'LITE_RUNTIME = "LITE_RUNTIME"
        readEnum "SPEED" = Prelude.Just FileOptions'SPEED
        readEnum "CODE_SIZE" = Prelude.Just FileOptions'CODE_SIZE
        readEnum "LITE_RUNTIME" = Prelude.Just FileOptions'LITE_RUNTIME
        readEnum _ = Prelude.Nothing

instance Prelude.Enum FileOptions'OptimizeMode where
        toEnum k__
          = Prelude.maybe
              (Prelude.error
                 ((Prelude.++) "toEnum: unknown value for enum OptimizeMode: "
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

instance Prelude.Bounded FileOptions'OptimizeMode where
        minBound = FileOptions'SPEED
        maxBound = FileOptions'LITE_RUNTIME

data GeneratedCodeInfo = GeneratedCodeInfo{_GeneratedCodeInfo'annotation
                                           :: ![GeneratedCodeInfo'Annotation]}
                       deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (a ~ [GeneratedCodeInfo'Annotation],
          b ~ [GeneratedCodeInfo'Annotation], Prelude.Functor f) =>
         Lens.Labels.HasLens "annotation" f GeneratedCodeInfo
         GeneratedCodeInfo a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _GeneratedCodeInfo'annotation
                 (\ x__ y__ -> x__{_GeneratedCodeInfo'annotation = y__}))
              Prelude.id

instance Data.Default.Class.Default GeneratedCodeInfo where
        def = GeneratedCodeInfo{_GeneratedCodeInfo'annotation = []}

instance Data.ProtoLens.Message GeneratedCodeInfo where
        descriptor
          = let annotation__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "annotation"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor GeneratedCodeInfo'Annotation)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked annotation)
                      :: Data.ProtoLens.FieldDescriptor GeneratedCodeInfo
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Text.pack "google.protobuf.GeneratedCodeInfo")
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, annotation__field_descriptor)])
                (Data.Map.fromList [("annotation", annotation__field_descriptor)])

data GeneratedCodeInfo'Annotation = GeneratedCodeInfo'Annotation{_GeneratedCodeInfo'Annotation'path
                                                                 :: ![Data.Int.Int32],
                                                                 _GeneratedCodeInfo'Annotation'sourceFile
                                                                 :: !(Prelude.Maybe Data.Text.Text),
                                                                 _GeneratedCodeInfo'Annotation'begin
                                                                 :: !(Prelude.Maybe Data.Int.Int32),
                                                                 _GeneratedCodeInfo'Annotation'end
                                                                 :: !(Prelude.Maybe Data.Int.Int32)}
                                  deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (a ~ [Data.Int.Int32], b ~ [Data.Int.Int32],
          Prelude.Functor f) =>
         Lens.Labels.HasLens "path" f GeneratedCodeInfo'Annotation
         GeneratedCodeInfo'Annotation a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _GeneratedCodeInfo'Annotation'path
                 (\ x__ y__ -> x__{_GeneratedCodeInfo'Annotation'path = y__}))
              Prelude.id

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "sourceFile" f GeneratedCodeInfo'Annotation
         GeneratedCodeInfo'Annotation a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens
                 _GeneratedCodeInfo'Annotation'sourceFile
                 (\ x__ y__ -> x__{_GeneratedCodeInfo'Annotation'sourceFile = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'sourceFile" f
         GeneratedCodeInfo'Annotation GeneratedCodeInfo'Annotation a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens
                 _GeneratedCodeInfo'Annotation'sourceFile
                 (\ x__ y__ -> x__{_GeneratedCodeInfo'Annotation'sourceFile = y__}))
              Prelude.id

instance (a ~ Data.Int.Int32, b ~ Data.Int.Int32,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "begin" f GeneratedCodeInfo'Annotation
         GeneratedCodeInfo'Annotation a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _GeneratedCodeInfo'Annotation'begin
                 (\ x__ y__ -> x__{_GeneratedCodeInfo'Annotation'begin = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Int.Int32,
          b ~ Prelude.Maybe Data.Int.Int32, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'begin" f GeneratedCodeInfo'Annotation
         GeneratedCodeInfo'Annotation a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _GeneratedCodeInfo'Annotation'begin
                 (\ x__ y__ -> x__{_GeneratedCodeInfo'Annotation'begin = y__}))
              Prelude.id

instance (a ~ Data.Int.Int32, b ~ Data.Int.Int32,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "end" f GeneratedCodeInfo'Annotation
         GeneratedCodeInfo'Annotation a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _GeneratedCodeInfo'Annotation'end
                 (\ x__ y__ -> x__{_GeneratedCodeInfo'Annotation'end = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Int.Int32,
          b ~ Prelude.Maybe Data.Int.Int32, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'end" f GeneratedCodeInfo'Annotation
         GeneratedCodeInfo'Annotation a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _GeneratedCodeInfo'Annotation'end
                 (\ x__ y__ -> x__{_GeneratedCodeInfo'Annotation'end = y__}))
              Prelude.id

instance Data.Default.Class.Default GeneratedCodeInfo'Annotation
         where
        def
          = GeneratedCodeInfo'Annotation{_GeneratedCodeInfo'Annotation'path =
                                           [],
                                         _GeneratedCodeInfo'Annotation'sourceFile = Prelude.Nothing,
                                         _GeneratedCodeInfo'Annotation'begin = Prelude.Nothing,
                                         _GeneratedCodeInfo'Annotation'end = Prelude.Nothing}

instance Data.ProtoLens.Message GeneratedCodeInfo'Annotation where
        descriptor
          = let path__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "path"
                      (Data.ProtoLens.Int32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Packed path)
                      :: Data.ProtoLens.FieldDescriptor GeneratedCodeInfo'Annotation
                sourceFile__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "source_file"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'sourceFile)
                      :: Data.ProtoLens.FieldDescriptor GeneratedCodeInfo'Annotation
                begin__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "begin"
                      (Data.ProtoLens.Int32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
                      (Data.ProtoLens.OptionalField maybe'begin)
                      :: Data.ProtoLens.FieldDescriptor GeneratedCodeInfo'Annotation
                end__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "end"
                      (Data.ProtoLens.Int32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
                      (Data.ProtoLens.OptionalField maybe'end)
                      :: Data.ProtoLens.FieldDescriptor GeneratedCodeInfo'Annotation
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Text.pack "google.protobuf.GeneratedCodeInfo.Annotation")
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, path__field_descriptor),
                    (Data.ProtoLens.Tag 2, sourceFile__field_descriptor),
                    (Data.ProtoLens.Tag 3, begin__field_descriptor),
                    (Data.ProtoLens.Tag 4, end__field_descriptor)])
                (Data.Map.fromList
                   [("path", path__field_descriptor),
                    ("source_file", sourceFile__field_descriptor),
                    ("begin", begin__field_descriptor),
                    ("end", end__field_descriptor)])

data MessageOptions = MessageOptions{_MessageOptions'messageSetWireFormat
                                     :: !(Prelude.Maybe Prelude.Bool),
                                     _MessageOptions'noStandardDescriptorAccessor ::
                                     !(Prelude.Maybe Prelude.Bool),
                                     _MessageOptions'deprecated :: !(Prelude.Maybe Prelude.Bool),
                                     _MessageOptions'mapEntry :: !(Prelude.Maybe Prelude.Bool),
                                     _MessageOptions'uninterpretedOption :: ![UninterpretedOption]}
                    deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (a ~ Prelude.Bool, b ~ Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "messageSetWireFormat" f MessageOptions
         MessageOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MessageOptions'messageSetWireFormat
                 (\ x__ y__ -> x__{_MessageOptions'messageSetWireFormat = y__}))
              (Data.ProtoLens.maybeLens Prelude.False)

instance (a ~ Prelude.Maybe Prelude.Bool,
          b ~ Prelude.Maybe Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'messageSetWireFormat" f MessageOptions
         MessageOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MessageOptions'messageSetWireFormat
                 (\ x__ y__ -> x__{_MessageOptions'messageSetWireFormat = y__}))
              Prelude.id

instance (a ~ Prelude.Bool, b ~ Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "noStandardDescriptorAccessor" f MessageOptions
         MessageOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens
                 _MessageOptions'noStandardDescriptorAccessor
                 (\ x__ y__ ->
                    x__{_MessageOptions'noStandardDescriptorAccessor = y__}))
              (Data.ProtoLens.maybeLens Prelude.False)

instance (a ~ Prelude.Maybe Prelude.Bool,
          b ~ Prelude.Maybe Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'noStandardDescriptorAccessor" f
         MessageOptions MessageOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens
                 _MessageOptions'noStandardDescriptorAccessor
                 (\ x__ y__ ->
                    x__{_MessageOptions'noStandardDescriptorAccessor = y__}))
              Prelude.id

instance (a ~ Prelude.Bool, b ~ Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "deprecated" f MessageOptions MessageOptions a
         b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MessageOptions'deprecated
                 (\ x__ y__ -> x__{_MessageOptions'deprecated = y__}))
              (Data.ProtoLens.maybeLens Prelude.False)

instance (a ~ Prelude.Maybe Prelude.Bool,
          b ~ Prelude.Maybe Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'deprecated" f MessageOptions
         MessageOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MessageOptions'deprecated
                 (\ x__ y__ -> x__{_MessageOptions'deprecated = y__}))
              Prelude.id

instance (a ~ Prelude.Bool, b ~ Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "mapEntry" f MessageOptions MessageOptions a b
         where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MessageOptions'mapEntry
                 (\ x__ y__ -> x__{_MessageOptions'mapEntry = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Prelude.Bool,
          b ~ Prelude.Maybe Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'mapEntry" f MessageOptions
         MessageOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MessageOptions'mapEntry
                 (\ x__ y__ -> x__{_MessageOptions'mapEntry = y__}))
              Prelude.id

instance (a ~ [UninterpretedOption], b ~ [UninterpretedOption],
          Prelude.Functor f) =>
         Lens.Labels.HasLens "uninterpretedOption" f MessageOptions
         MessageOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MessageOptions'uninterpretedOption
                 (\ x__ y__ -> x__{_MessageOptions'uninterpretedOption = y__}))
              Prelude.id

instance Data.Default.Class.Default MessageOptions where
        def
          = MessageOptions{_MessageOptions'messageSetWireFormat =
                             Prelude.Nothing,
                           _MessageOptions'noStandardDescriptorAccessor = Prelude.Nothing,
                           _MessageOptions'deprecated = Prelude.Nothing,
                           _MessageOptions'mapEntry = Prelude.Nothing,
                           _MessageOptions'uninterpretedOption = []}

instance Data.ProtoLens.Message MessageOptions where
        descriptor
          = let messageSetWireFormat__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "message_set_wire_format"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'messageSetWireFormat)
                      :: Data.ProtoLens.FieldDescriptor MessageOptions
                noStandardDescriptorAccessor__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "no_standard_descriptor_accessor"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'noStandardDescriptorAccessor)
                      :: Data.ProtoLens.FieldDescriptor MessageOptions
                deprecated__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "deprecated"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'deprecated)
                      :: Data.ProtoLens.FieldDescriptor MessageOptions
                mapEntry__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "map_entry"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'mapEntry)
                      :: Data.ProtoLens.FieldDescriptor MessageOptions
                uninterpretedOption__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "uninterpreted_option"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor UninterpretedOption)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         uninterpretedOption)
                      :: Data.ProtoLens.FieldDescriptor MessageOptions
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Text.pack "google.protobuf.MessageOptions")
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, messageSetWireFormat__field_descriptor),
                    (Data.ProtoLens.Tag 2,
                     noStandardDescriptorAccessor__field_descriptor),
                    (Data.ProtoLens.Tag 3, deprecated__field_descriptor),
                    (Data.ProtoLens.Tag 7, mapEntry__field_descriptor),
                    (Data.ProtoLens.Tag 999, uninterpretedOption__field_descriptor)])
                (Data.Map.fromList
                   [("message_set_wire_format",
                     messageSetWireFormat__field_descriptor),
                    ("no_standard_descriptor_accessor",
                     noStandardDescriptorAccessor__field_descriptor),
                    ("deprecated", deprecated__field_descriptor),
                    ("map_entry", mapEntry__field_descriptor),
                    ("uninterpreted_option", uninterpretedOption__field_descriptor)])

data MethodDescriptorProto = MethodDescriptorProto{_MethodDescriptorProto'name
                                                   :: !(Prelude.Maybe Data.Text.Text),
                                                   _MethodDescriptorProto'inputType ::
                                                   !(Prelude.Maybe Data.Text.Text),
                                                   _MethodDescriptorProto'outputType ::
                                                   !(Prelude.Maybe Data.Text.Text),
                                                   _MethodDescriptorProto'options ::
                                                   !(Prelude.Maybe MethodOptions),
                                                   _MethodDescriptorProto'clientStreaming ::
                                                   !(Prelude.Maybe Prelude.Bool),
                                                   _MethodDescriptorProto'serverStreaming ::
                                                   !(Prelude.Maybe Prelude.Bool)}
                           deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "name" f MethodDescriptorProto
         MethodDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MethodDescriptorProto'name
                 (\ x__ y__ -> x__{_MethodDescriptorProto'name = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'name" f MethodDescriptorProto
         MethodDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MethodDescriptorProto'name
                 (\ x__ y__ -> x__{_MethodDescriptorProto'name = y__}))
              Prelude.id

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "inputType" f MethodDescriptorProto
         MethodDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MethodDescriptorProto'inputType
                 (\ x__ y__ -> x__{_MethodDescriptorProto'inputType = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'inputType" f MethodDescriptorProto
         MethodDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MethodDescriptorProto'inputType
                 (\ x__ y__ -> x__{_MethodDescriptorProto'inputType = y__}))
              Prelude.id

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "outputType" f MethodDescriptorProto
         MethodDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MethodDescriptorProto'outputType
                 (\ x__ y__ -> x__{_MethodDescriptorProto'outputType = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'outputType" f MethodDescriptorProto
         MethodDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MethodDescriptorProto'outputType
                 (\ x__ y__ -> x__{_MethodDescriptorProto'outputType = y__}))
              Prelude.id

instance (a ~ MethodOptions, b ~ MethodOptions,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "options" f MethodDescriptorProto
         MethodDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MethodDescriptorProto'options
                 (\ x__ y__ -> x__{_MethodDescriptorProto'options = y__}))
              (Data.ProtoLens.maybeLens Data.Default.Class.def)

instance (a ~ Prelude.Maybe MethodOptions,
          b ~ Prelude.Maybe MethodOptions, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'options" f MethodDescriptorProto
         MethodDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MethodDescriptorProto'options
                 (\ x__ y__ -> x__{_MethodDescriptorProto'options = y__}))
              Prelude.id

instance (a ~ Prelude.Bool, b ~ Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "clientStreaming" f MethodDescriptorProto
         MethodDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MethodDescriptorProto'clientStreaming
                 (\ x__ y__ -> x__{_MethodDescriptorProto'clientStreaming = y__}))
              (Data.ProtoLens.maybeLens Prelude.False)

instance (a ~ Prelude.Maybe Prelude.Bool,
          b ~ Prelude.Maybe Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'clientStreaming" f MethodDescriptorProto
         MethodDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MethodDescriptorProto'clientStreaming
                 (\ x__ y__ -> x__{_MethodDescriptorProto'clientStreaming = y__}))
              Prelude.id

instance (a ~ Prelude.Bool, b ~ Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "serverStreaming" f MethodDescriptorProto
         MethodDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MethodDescriptorProto'serverStreaming
                 (\ x__ y__ -> x__{_MethodDescriptorProto'serverStreaming = y__}))
              (Data.ProtoLens.maybeLens Prelude.False)

instance (a ~ Prelude.Maybe Prelude.Bool,
          b ~ Prelude.Maybe Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'serverStreaming" f MethodDescriptorProto
         MethodDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MethodDescriptorProto'serverStreaming
                 (\ x__ y__ -> x__{_MethodDescriptorProto'serverStreaming = y__}))
              Prelude.id

instance Data.Default.Class.Default MethodDescriptorProto where
        def
          = MethodDescriptorProto{_MethodDescriptorProto'name =
                                    Prelude.Nothing,
                                  _MethodDescriptorProto'inputType = Prelude.Nothing,
                                  _MethodDescriptorProto'outputType = Prelude.Nothing,
                                  _MethodDescriptorProto'options = Prelude.Nothing,
                                  _MethodDescriptorProto'clientStreaming = Prelude.Nothing,
                                  _MethodDescriptorProto'serverStreaming = Prelude.Nothing}

instance Data.ProtoLens.Message MethodDescriptorProto where
        descriptor
          = let name__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "name"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'name)
                      :: Data.ProtoLens.FieldDescriptor MethodDescriptorProto
                inputType__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "input_type"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'inputType)
                      :: Data.ProtoLens.FieldDescriptor MethodDescriptorProto
                outputType__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "output_type"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'outputType)
                      :: Data.ProtoLens.FieldDescriptor MethodDescriptorProto
                options__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "options"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor MethodOptions)
                      (Data.ProtoLens.OptionalField maybe'options)
                      :: Data.ProtoLens.FieldDescriptor MethodDescriptorProto
                clientStreaming__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "client_streaming"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'clientStreaming)
                      :: Data.ProtoLens.FieldDescriptor MethodDescriptorProto
                serverStreaming__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "server_streaming"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'serverStreaming)
                      :: Data.ProtoLens.FieldDescriptor MethodDescriptorProto
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Text.pack "google.protobuf.MethodDescriptorProto")
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, name__field_descriptor),
                    (Data.ProtoLens.Tag 2, inputType__field_descriptor),
                    (Data.ProtoLens.Tag 3, outputType__field_descriptor),
                    (Data.ProtoLens.Tag 4, options__field_descriptor),
                    (Data.ProtoLens.Tag 5, clientStreaming__field_descriptor),
                    (Data.ProtoLens.Tag 6, serverStreaming__field_descriptor)])
                (Data.Map.fromList
                   [("name", name__field_descriptor),
                    ("input_type", inputType__field_descriptor),
                    ("output_type", outputType__field_descriptor),
                    ("options", options__field_descriptor),
                    ("client_streaming", clientStreaming__field_descriptor),
                    ("server_streaming", serverStreaming__field_descriptor)])

data MethodOptions = MethodOptions{_MethodOptions'deprecated ::
                                   !(Prelude.Maybe Prelude.Bool),
                                   _MethodOptions'uninterpretedOption :: ![UninterpretedOption]}
                   deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (a ~ Prelude.Bool, b ~ Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "deprecated" f MethodOptions MethodOptions a b
         where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MethodOptions'deprecated
                 (\ x__ y__ -> x__{_MethodOptions'deprecated = y__}))
              (Data.ProtoLens.maybeLens Prelude.False)

instance (a ~ Prelude.Maybe Prelude.Bool,
          b ~ Prelude.Maybe Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'deprecated" f MethodOptions
         MethodOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MethodOptions'deprecated
                 (\ x__ y__ -> x__{_MethodOptions'deprecated = y__}))
              Prelude.id

instance (a ~ [UninterpretedOption], b ~ [UninterpretedOption],
          Prelude.Functor f) =>
         Lens.Labels.HasLens "uninterpretedOption" f MethodOptions
         MethodOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _MethodOptions'uninterpretedOption
                 (\ x__ y__ -> x__{_MethodOptions'uninterpretedOption = y__}))
              Prelude.id

instance Data.Default.Class.Default MethodOptions where
        def
          = MethodOptions{_MethodOptions'deprecated = Prelude.Nothing,
                          _MethodOptions'uninterpretedOption = []}

instance Data.ProtoLens.Message MethodOptions where
        descriptor
          = let deprecated__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "deprecated"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'deprecated)
                      :: Data.ProtoLens.FieldDescriptor MethodOptions
                uninterpretedOption__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "uninterpreted_option"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor UninterpretedOption)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         uninterpretedOption)
                      :: Data.ProtoLens.FieldDescriptor MethodOptions
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Text.pack "google.protobuf.MethodOptions")
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 33, deprecated__field_descriptor),
                    (Data.ProtoLens.Tag 999, uninterpretedOption__field_descriptor)])
                (Data.Map.fromList
                   [("deprecated", deprecated__field_descriptor),
                    ("uninterpreted_option", uninterpretedOption__field_descriptor)])

data OneofDescriptorProto = OneofDescriptorProto{_OneofDescriptorProto'name
                                                 :: !(Prelude.Maybe Data.Text.Text)}
                          deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "name" f OneofDescriptorProto
         OneofDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _OneofDescriptorProto'name
                 (\ x__ y__ -> x__{_OneofDescriptorProto'name = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'name" f OneofDescriptorProto
         OneofDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _OneofDescriptorProto'name
                 (\ x__ y__ -> x__{_OneofDescriptorProto'name = y__}))
              Prelude.id

instance Data.Default.Class.Default OneofDescriptorProto where
        def
          = OneofDescriptorProto{_OneofDescriptorProto'name =
                                   Prelude.Nothing}

instance Data.ProtoLens.Message OneofDescriptorProto where
        descriptor
          = let name__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "name"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'name)
                      :: Data.ProtoLens.FieldDescriptor OneofDescriptorProto
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Text.pack "google.protobuf.OneofDescriptorProto")
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, name__field_descriptor)])
                (Data.Map.fromList [("name", name__field_descriptor)])

data ServiceDescriptorProto = ServiceDescriptorProto{_ServiceDescriptorProto'name
                                                     :: !(Prelude.Maybe Data.Text.Text),
                                                     _ServiceDescriptorProto'method ::
                                                     ![MethodDescriptorProto],
                                                     _ServiceDescriptorProto'options ::
                                                     !(Prelude.Maybe ServiceOptions)}
                            deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "name" f ServiceDescriptorProto
         ServiceDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _ServiceDescriptorProto'name
                 (\ x__ y__ -> x__{_ServiceDescriptorProto'name = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'name" f ServiceDescriptorProto
         ServiceDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _ServiceDescriptorProto'name
                 (\ x__ y__ -> x__{_ServiceDescriptorProto'name = y__}))
              Prelude.id

instance (a ~ [MethodDescriptorProto], b ~ [MethodDescriptorProto],
          Prelude.Functor f) =>
         Lens.Labels.HasLens "method" f ServiceDescriptorProto
         ServiceDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _ServiceDescriptorProto'method
                 (\ x__ y__ -> x__{_ServiceDescriptorProto'method = y__}))
              Prelude.id

instance (a ~ ServiceOptions, b ~ ServiceOptions,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "options" f ServiceDescriptorProto
         ServiceDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _ServiceDescriptorProto'options
                 (\ x__ y__ -> x__{_ServiceDescriptorProto'options = y__}))
              (Data.ProtoLens.maybeLens Data.Default.Class.def)

instance (a ~ Prelude.Maybe ServiceOptions,
          b ~ Prelude.Maybe ServiceOptions, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'options" f ServiceDescriptorProto
         ServiceDescriptorProto a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _ServiceDescriptorProto'options
                 (\ x__ y__ -> x__{_ServiceDescriptorProto'options = y__}))
              Prelude.id

instance Data.Default.Class.Default ServiceDescriptorProto where
        def
          = ServiceDescriptorProto{_ServiceDescriptorProto'name =
                                     Prelude.Nothing,
                                   _ServiceDescriptorProto'method = [],
                                   _ServiceDescriptorProto'options = Prelude.Nothing}

instance Data.ProtoLens.Message ServiceDescriptorProto where
        descriptor
          = let name__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "name"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'name)
                      :: Data.ProtoLens.FieldDescriptor ServiceDescriptorProto
                method__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "method"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor MethodDescriptorProto)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked method)
                      :: Data.ProtoLens.FieldDescriptor ServiceDescriptorProto
                options__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "options"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor ServiceOptions)
                      (Data.ProtoLens.OptionalField maybe'options)
                      :: Data.ProtoLens.FieldDescriptor ServiceDescriptorProto
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Text.pack "google.protobuf.ServiceDescriptorProto")
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, name__field_descriptor),
                    (Data.ProtoLens.Tag 2, method__field_descriptor),
                    (Data.ProtoLens.Tag 3, options__field_descriptor)])
                (Data.Map.fromList
                   [("name", name__field_descriptor),
                    ("method", method__field_descriptor),
                    ("options", options__field_descriptor)])

data ServiceOptions = ServiceOptions{_ServiceOptions'deprecated ::
                                     !(Prelude.Maybe Prelude.Bool),
                                     _ServiceOptions'uninterpretedOption :: ![UninterpretedOption]}
                    deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (a ~ Prelude.Bool, b ~ Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "deprecated" f ServiceOptions ServiceOptions a
         b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _ServiceOptions'deprecated
                 (\ x__ y__ -> x__{_ServiceOptions'deprecated = y__}))
              (Data.ProtoLens.maybeLens Prelude.False)

instance (a ~ Prelude.Maybe Prelude.Bool,
          b ~ Prelude.Maybe Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'deprecated" f ServiceOptions
         ServiceOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _ServiceOptions'deprecated
                 (\ x__ y__ -> x__{_ServiceOptions'deprecated = y__}))
              Prelude.id

instance (a ~ [UninterpretedOption], b ~ [UninterpretedOption],
          Prelude.Functor f) =>
         Lens.Labels.HasLens "uninterpretedOption" f ServiceOptions
         ServiceOptions a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _ServiceOptions'uninterpretedOption
                 (\ x__ y__ -> x__{_ServiceOptions'uninterpretedOption = y__}))
              Prelude.id

instance Data.Default.Class.Default ServiceOptions where
        def
          = ServiceOptions{_ServiceOptions'deprecated = Prelude.Nothing,
                           _ServiceOptions'uninterpretedOption = []}

instance Data.ProtoLens.Message ServiceOptions where
        descriptor
          = let deprecated__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "deprecated"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'deprecated)
                      :: Data.ProtoLens.FieldDescriptor ServiceOptions
                uninterpretedOption__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "uninterpreted_option"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor UninterpretedOption)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         uninterpretedOption)
                      :: Data.ProtoLens.FieldDescriptor ServiceOptions
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Text.pack "google.protobuf.ServiceOptions")
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 33, deprecated__field_descriptor),
                    (Data.ProtoLens.Tag 999, uninterpretedOption__field_descriptor)])
                (Data.Map.fromList
                   [("deprecated", deprecated__field_descriptor),
                    ("uninterpreted_option", uninterpretedOption__field_descriptor)])

data SourceCodeInfo = SourceCodeInfo{_SourceCodeInfo'location ::
                                     ![SourceCodeInfo'Location]}
                    deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (a ~ [SourceCodeInfo'Location],
          b ~ [SourceCodeInfo'Location], Prelude.Functor f) =>
         Lens.Labels.HasLens "location" f SourceCodeInfo SourceCodeInfo a b
         where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _SourceCodeInfo'location
                 (\ x__ y__ -> x__{_SourceCodeInfo'location = y__}))
              Prelude.id

instance Data.Default.Class.Default SourceCodeInfo where
        def = SourceCodeInfo{_SourceCodeInfo'location = []}

instance Data.ProtoLens.Message SourceCodeInfo where
        descriptor
          = let location__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "location"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor SourceCodeInfo'Location)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked location)
                      :: Data.ProtoLens.FieldDescriptor SourceCodeInfo
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Text.pack "google.protobuf.SourceCodeInfo")
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, location__field_descriptor)])
                (Data.Map.fromList [("location", location__field_descriptor)])

data SourceCodeInfo'Location = SourceCodeInfo'Location{_SourceCodeInfo'Location'path
                                                       :: ![Data.Int.Int32],
                                                       _SourceCodeInfo'Location'span ::
                                                       ![Data.Int.Int32],
                                                       _SourceCodeInfo'Location'leadingComments ::
                                                       !(Prelude.Maybe Data.Text.Text),
                                                       _SourceCodeInfo'Location'trailingComments ::
                                                       !(Prelude.Maybe Data.Text.Text),
                                                       _SourceCodeInfo'Location'leadingDetachedComments
                                                       :: ![Data.Text.Text]}
                             deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (a ~ [Data.Int.Int32], b ~ [Data.Int.Int32],
          Prelude.Functor f) =>
         Lens.Labels.HasLens "path" f SourceCodeInfo'Location
         SourceCodeInfo'Location a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _SourceCodeInfo'Location'path
                 (\ x__ y__ -> x__{_SourceCodeInfo'Location'path = y__}))
              Prelude.id

instance (a ~ [Data.Int.Int32], b ~ [Data.Int.Int32],
          Prelude.Functor f) =>
         Lens.Labels.HasLens "span" f SourceCodeInfo'Location
         SourceCodeInfo'Location a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _SourceCodeInfo'Location'span
                 (\ x__ y__ -> x__{_SourceCodeInfo'Location'span = y__}))
              Prelude.id

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "leadingComments" f SourceCodeInfo'Location
         SourceCodeInfo'Location a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens
                 _SourceCodeInfo'Location'leadingComments
                 (\ x__ y__ -> x__{_SourceCodeInfo'Location'leadingComments = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'leadingComments" f
         SourceCodeInfo'Location SourceCodeInfo'Location a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens
                 _SourceCodeInfo'Location'leadingComments
                 (\ x__ y__ -> x__{_SourceCodeInfo'Location'leadingComments = y__}))
              Prelude.id

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "trailingComments" f SourceCodeInfo'Location
         SourceCodeInfo'Location a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens
                 _SourceCodeInfo'Location'trailingComments
                 (\ x__ y__ ->
                    x__{_SourceCodeInfo'Location'trailingComments = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'trailingComments" f
         SourceCodeInfo'Location SourceCodeInfo'Location a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens
                 _SourceCodeInfo'Location'trailingComments
                 (\ x__ y__ ->
                    x__{_SourceCodeInfo'Location'trailingComments = y__}))
              Prelude.id

instance (a ~ [Data.Text.Text], b ~ [Data.Text.Text],
          Prelude.Functor f) =>
         Lens.Labels.HasLens "leadingDetachedComments" f
         SourceCodeInfo'Location SourceCodeInfo'Location a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens
                 _SourceCodeInfo'Location'leadingDetachedComments
                 (\ x__ y__ ->
                    x__{_SourceCodeInfo'Location'leadingDetachedComments = y__}))
              Prelude.id

instance Data.Default.Class.Default SourceCodeInfo'Location where
        def
          = SourceCodeInfo'Location{_SourceCodeInfo'Location'path = [],
                                    _SourceCodeInfo'Location'span = [],
                                    _SourceCodeInfo'Location'leadingComments = Prelude.Nothing,
                                    _SourceCodeInfo'Location'trailingComments = Prelude.Nothing,
                                    _SourceCodeInfo'Location'leadingDetachedComments = []}

instance Data.ProtoLens.Message SourceCodeInfo'Location where
        descriptor
          = let path__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "path"
                      (Data.ProtoLens.Int32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Packed path)
                      :: Data.ProtoLens.FieldDescriptor SourceCodeInfo'Location
                span__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "span"
                      (Data.ProtoLens.Int32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Packed span)
                      :: Data.ProtoLens.FieldDescriptor SourceCodeInfo'Location
                leadingComments__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "leading_comments"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'leadingComments)
                      :: Data.ProtoLens.FieldDescriptor SourceCodeInfo'Location
                trailingComments__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "trailing_comments"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'trailingComments)
                      :: Data.ProtoLens.FieldDescriptor SourceCodeInfo'Location
                leadingDetachedComments__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "leading_detached_comments"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         leadingDetachedComments)
                      :: Data.ProtoLens.FieldDescriptor SourceCodeInfo'Location
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Text.pack "google.protobuf.SourceCodeInfo.Location")
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, path__field_descriptor),
                    (Data.ProtoLens.Tag 2, span__field_descriptor),
                    (Data.ProtoLens.Tag 3, leadingComments__field_descriptor),
                    (Data.ProtoLens.Tag 4, trailingComments__field_descriptor),
                    (Data.ProtoLens.Tag 6, leadingDetachedComments__field_descriptor)])
                (Data.Map.fromList
                   [("path", path__field_descriptor),
                    ("span", span__field_descriptor),
                    ("leading_comments", leadingComments__field_descriptor),
                    ("trailing_comments", trailingComments__field_descriptor),
                    ("leading_detached_comments",
                     leadingDetachedComments__field_descriptor)])

data UninterpretedOption = UninterpretedOption{_UninterpretedOption'name
                                               :: ![UninterpretedOption'NamePart],
                                               _UninterpretedOption'identifierValue ::
                                               !(Prelude.Maybe Data.Text.Text),
                                               _UninterpretedOption'positiveIntValue ::
                                               !(Prelude.Maybe Data.Word.Word64),
                                               _UninterpretedOption'negativeIntValue ::
                                               !(Prelude.Maybe Data.Int.Int64),
                                               _UninterpretedOption'doubleValue ::
                                               !(Prelude.Maybe Prelude.Double),
                                               _UninterpretedOption'stringValue ::
                                               !(Prelude.Maybe Data.ByteString.ByteString),
                                               _UninterpretedOption'aggregateValue ::
                                               !(Prelude.Maybe Data.Text.Text)}
                         deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (a ~ [UninterpretedOption'NamePart],
          b ~ [UninterpretedOption'NamePart], Prelude.Functor f) =>
         Lens.Labels.HasLens "name" f UninterpretedOption
         UninterpretedOption a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _UninterpretedOption'name
                 (\ x__ y__ -> x__{_UninterpretedOption'name = y__}))
              Prelude.id

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "identifierValue" f UninterpretedOption
         UninterpretedOption a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _UninterpretedOption'identifierValue
                 (\ x__ y__ -> x__{_UninterpretedOption'identifierValue = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'identifierValue" f UninterpretedOption
         UninterpretedOption a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _UninterpretedOption'identifierValue
                 (\ x__ y__ -> x__{_UninterpretedOption'identifierValue = y__}))
              Prelude.id

instance (a ~ Data.Word.Word64, b ~ Data.Word.Word64,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "positiveIntValue" f UninterpretedOption
         UninterpretedOption a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _UninterpretedOption'positiveIntValue
                 (\ x__ y__ -> x__{_UninterpretedOption'positiveIntValue = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Word.Word64,
          b ~ Prelude.Maybe Data.Word.Word64, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'positiveIntValue" f UninterpretedOption
         UninterpretedOption a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _UninterpretedOption'positiveIntValue
                 (\ x__ y__ -> x__{_UninterpretedOption'positiveIntValue = y__}))
              Prelude.id

instance (a ~ Data.Int.Int64, b ~ Data.Int.Int64,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "negativeIntValue" f UninterpretedOption
         UninterpretedOption a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _UninterpretedOption'negativeIntValue
                 (\ x__ y__ -> x__{_UninterpretedOption'negativeIntValue = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Int.Int64,
          b ~ Prelude.Maybe Data.Int.Int64, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'negativeIntValue" f UninterpretedOption
         UninterpretedOption a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _UninterpretedOption'negativeIntValue
                 (\ x__ y__ -> x__{_UninterpretedOption'negativeIntValue = y__}))
              Prelude.id

instance (a ~ Prelude.Double, b ~ Prelude.Double,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "doubleValue" f UninterpretedOption
         UninterpretedOption a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _UninterpretedOption'doubleValue
                 (\ x__ y__ -> x__{_UninterpretedOption'doubleValue = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Prelude.Double,
          b ~ Prelude.Maybe Prelude.Double, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'doubleValue" f UninterpretedOption
         UninterpretedOption a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _UninterpretedOption'doubleValue
                 (\ x__ y__ -> x__{_UninterpretedOption'doubleValue = y__}))
              Prelude.id

instance (a ~ Data.ByteString.ByteString,
          b ~ Data.ByteString.ByteString, Prelude.Functor f) =>
         Lens.Labels.HasLens "stringValue" f UninterpretedOption
         UninterpretedOption a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _UninterpretedOption'stringValue
                 (\ x__ y__ -> x__{_UninterpretedOption'stringValue = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.ByteString.ByteString,
          b ~ Prelude.Maybe Data.ByteString.ByteString, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'stringValue" f UninterpretedOption
         UninterpretedOption a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _UninterpretedOption'stringValue
                 (\ x__ y__ -> x__{_UninterpretedOption'stringValue = y__}))
              Prelude.id

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "aggregateValue" f UninterpretedOption
         UninterpretedOption a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _UninterpretedOption'aggregateValue
                 (\ x__ y__ -> x__{_UninterpretedOption'aggregateValue = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'aggregateValue" f UninterpretedOption
         UninterpretedOption a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _UninterpretedOption'aggregateValue
                 (\ x__ y__ -> x__{_UninterpretedOption'aggregateValue = y__}))
              Prelude.id

instance Data.Default.Class.Default UninterpretedOption where
        def
          = UninterpretedOption{_UninterpretedOption'name = [],
                                _UninterpretedOption'identifierValue = Prelude.Nothing,
                                _UninterpretedOption'positiveIntValue = Prelude.Nothing,
                                _UninterpretedOption'negativeIntValue = Prelude.Nothing,
                                _UninterpretedOption'doubleValue = Prelude.Nothing,
                                _UninterpretedOption'stringValue = Prelude.Nothing,
                                _UninterpretedOption'aggregateValue = Prelude.Nothing}

instance Data.ProtoLens.Message UninterpretedOption where
        descriptor
          = let name__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "name"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor UninterpretedOption'NamePart)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked name)
                      :: Data.ProtoLens.FieldDescriptor UninterpretedOption
                identifierValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "identifier_value"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'identifierValue)
                      :: Data.ProtoLens.FieldDescriptor UninterpretedOption
                positiveIntValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "positive_int_value"
                      (Data.ProtoLens.UInt64Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
                      (Data.ProtoLens.OptionalField maybe'positiveIntValue)
                      :: Data.ProtoLens.FieldDescriptor UninterpretedOption
                negativeIntValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "negative_int_value"
                      (Data.ProtoLens.Int64Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
                      (Data.ProtoLens.OptionalField maybe'negativeIntValue)
                      :: Data.ProtoLens.FieldDescriptor UninterpretedOption
                doubleValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "double_value"
                      (Data.ProtoLens.DoubleField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Double)
                      (Data.ProtoLens.OptionalField maybe'doubleValue)
                      :: Data.ProtoLens.FieldDescriptor UninterpretedOption
                stringValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "string_value"
                      (Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField maybe'stringValue)
                      :: Data.ProtoLens.FieldDescriptor UninterpretedOption
                aggregateValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "aggregate_value"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'aggregateValue)
                      :: Data.ProtoLens.FieldDescriptor UninterpretedOption
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Text.pack "google.protobuf.UninterpretedOption")
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 2, name__field_descriptor),
                    (Data.ProtoLens.Tag 3, identifierValue__field_descriptor),
                    (Data.ProtoLens.Tag 4, positiveIntValue__field_descriptor),
                    (Data.ProtoLens.Tag 5, negativeIntValue__field_descriptor),
                    (Data.ProtoLens.Tag 6, doubleValue__field_descriptor),
                    (Data.ProtoLens.Tag 7, stringValue__field_descriptor),
                    (Data.ProtoLens.Tag 8, aggregateValue__field_descriptor)])
                (Data.Map.fromList
                   [("name", name__field_descriptor),
                    ("identifier_value", identifierValue__field_descriptor),
                    ("positive_int_value", positiveIntValue__field_descriptor),
                    ("negative_int_value", negativeIntValue__field_descriptor),
                    ("double_value", doubleValue__field_descriptor),
                    ("string_value", stringValue__field_descriptor),
                    ("aggregate_value", aggregateValue__field_descriptor)])

data UninterpretedOption'NamePart = UninterpretedOption'NamePart{_UninterpretedOption'NamePart'namePart
                                                                 :: !Data.Text.Text,
                                                                 _UninterpretedOption'NamePart'isExtension
                                                                 :: !Prelude.Bool}
                                  deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "namePart" f UninterpretedOption'NamePart
         UninterpretedOption'NamePart a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _UninterpretedOption'NamePart'namePart
                 (\ x__ y__ -> x__{_UninterpretedOption'NamePart'namePart = y__}))
              Prelude.id

instance (a ~ Prelude.Bool, b ~ Prelude.Bool, Prelude.Functor f) =>
         Lens.Labels.HasLens "isExtension" f UninterpretedOption'NamePart
         UninterpretedOption'NamePart a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens
                 _UninterpretedOption'NamePart'isExtension
                 (\ x__ y__ ->
                    x__{_UninterpretedOption'NamePart'isExtension = y__}))
              Prelude.id

instance Data.Default.Class.Default UninterpretedOption'NamePart
         where
        def
          = UninterpretedOption'NamePart{_UninterpretedOption'NamePart'namePart
                                           = Data.ProtoLens.fieldDefault,
                                         _UninterpretedOption'NamePart'isExtension =
                                           Data.ProtoLens.fieldDefault}

instance Data.ProtoLens.Message UninterpretedOption'NamePart where
        descriptor
          = let namePart__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "name_part"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required namePart)
                      :: Data.ProtoLens.FieldDescriptor UninterpretedOption'NamePart
                isExtension__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "is_extension"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required isExtension)
                      :: Data.ProtoLens.FieldDescriptor UninterpretedOption'NamePart
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Text.pack "google.protobuf.UninterpretedOption.NamePart")
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, namePart__field_descriptor),
                    (Data.ProtoLens.Tag 2, isExtension__field_descriptor)])
                (Data.Map.fromList
                   [("name_part", namePart__field_descriptor),
                    ("is_extension", isExtension__field_descriptor)])

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