{- This file was auto-generated from google/protobuf/descriptor.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies,
  MultiParamTypeClasses, FlexibleContexts, FlexibleInstances #-}
{-# OPTIONS_GHC -fno-warn-unused-imports#-}
module Bootstrap.Proto.Google.Protobuf.Descriptor where
import qualified Prelude
import qualified Data.ProtoLens
import qualified Data.ProtoLens.Message.Enum
import qualified Lens.Family2
import qualified Lens.Family2.Unchecked
import qualified Data.Default.Class
import qualified Data.Text
import qualified Data.Int
import qualified Data.Word
import qualified Data.Map
import qualified Data.ByteString

data DescriptorProto = DescriptorProto{_DescriptorProto'name ::
                                       Prelude.Maybe Data.Text.Text,
                                       _DescriptorProto'field :: [FieldDescriptorProto],
                                       _DescriptorProto'extension :: [FieldDescriptorProto],
                                       _DescriptorProto'nestedType :: [DescriptorProto],
                                       _DescriptorProto'enumType :: [EnumDescriptorProto],
                                       _DescriptorProto'extensionRange ::
                                       [DescriptorProto'ExtensionRange],
                                       _DescriptorProto'oneofDecl :: [OneofDescriptorProto],
                                       _DescriptorProto'options :: Prelude.Maybe MessageOptions,
                                       _DescriptorProto'reservedRange ::
                                       [DescriptorProto'ReservedRange],
                                       _DescriptorProto'reservedName :: [Data.Text.Text]}
                     deriving (Prelude.Show, Prelude.Eq)

type instance Data.ProtoLens.Field "name" DescriptorProto =
     Data.Text.Text

instance Data.ProtoLens.HasField "name" DescriptorProto
         DescriptorProto where
        field _
          = (Prelude..) maybe'name
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance Data.ProtoLens.Field "maybe'name" DescriptorProto =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'name" DescriptorProto
         DescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _DescriptorProto'name
              (\ x__ y__ -> x__{_DescriptorProto'name = y__})

type instance Data.ProtoLens.Field "field" DescriptorProto =
     [FieldDescriptorProto]

instance Data.ProtoLens.HasField "field" DescriptorProto
         DescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _DescriptorProto'field
              (\ x__ y__ -> x__{_DescriptorProto'field = y__})

type instance Data.ProtoLens.Field "extension" DescriptorProto =
     [FieldDescriptorProto]

instance Data.ProtoLens.HasField "extension" DescriptorProto
         DescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _DescriptorProto'extension
              (\ x__ y__ -> x__{_DescriptorProto'extension = y__})

type instance Data.ProtoLens.Field "nestedType" DescriptorProto =
     [DescriptorProto]

instance Data.ProtoLens.HasField "nestedType" DescriptorProto
         DescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _DescriptorProto'nestedType
              (\ x__ y__ -> x__{_DescriptorProto'nestedType = y__})

type instance Data.ProtoLens.Field "enumType" DescriptorProto =
     [EnumDescriptorProto]

instance Data.ProtoLens.HasField "enumType" DescriptorProto
         DescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _DescriptorProto'enumType
              (\ x__ y__ -> x__{_DescriptorProto'enumType = y__})

type instance Data.ProtoLens.Field "extensionRange" DescriptorProto
     = [DescriptorProto'ExtensionRange]

instance Data.ProtoLens.HasField "extensionRange" DescriptorProto
         DescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _DescriptorProto'extensionRange
              (\ x__ y__ -> x__{_DescriptorProto'extensionRange = y__})

type instance Data.ProtoLens.Field "oneofDecl" DescriptorProto =
     [OneofDescriptorProto]

instance Data.ProtoLens.HasField "oneofDecl" DescriptorProto
         DescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _DescriptorProto'oneofDecl
              (\ x__ y__ -> x__{_DescriptorProto'oneofDecl = y__})

type instance Data.ProtoLens.Field "options" DescriptorProto =
     MessageOptions

instance Data.ProtoLens.HasField "options" DescriptorProto
         DescriptorProto where
        field _
          = (Prelude..) maybe'options
              (Data.ProtoLens.maybeLens Data.Default.Class.def)

type instance Data.ProtoLens.Field "maybe'options" DescriptorProto
     = Prelude.Maybe MessageOptions

instance Data.ProtoLens.HasField "maybe'options" DescriptorProto
         DescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _DescriptorProto'options
              (\ x__ y__ -> x__{_DescriptorProto'options = y__})

type instance Data.ProtoLens.Field "reservedRange" DescriptorProto
     = [DescriptorProto'ReservedRange]

instance Data.ProtoLens.HasField "reservedRange" DescriptorProto
         DescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _DescriptorProto'reservedRange
              (\ x__ y__ -> x__{_DescriptorProto'reservedRange = y__})

type instance Data.ProtoLens.Field "reservedName" DescriptorProto =
     [Data.Text.Text]

instance Data.ProtoLens.HasField "reservedName" DescriptorProto
         DescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _DescriptorProto'reservedName
              (\ x__ y__ -> x__{_DescriptorProto'reservedName = y__})

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
                field__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "field"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor FieldDescriptorProto)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked field)
                extension__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "extension"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor FieldDescriptorProto)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked extension)
                nestedType__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "nested_type"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor DescriptorProto)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked nestedType)
                enumType__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "enum_type"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor EnumDescriptorProto)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked enumType)
                extensionRange__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "extension_range"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor DescriptorProto'ExtensionRange)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         extensionRange)
                oneofDecl__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "oneof_decl"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor OneofDescriptorProto)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked oneofDecl)
                options__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "options"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor MessageOptions)
                      (Data.ProtoLens.OptionalField maybe'options)
                reservedRange__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "reserved_range"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor DescriptorProto'ReservedRange)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         reservedRange)
                reservedName__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "reserved_name"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked reservedName)
              in
              Data.ProtoLens.MessageDescriptor
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
                                                                     Prelude.Maybe Data.Int.Int32,
                                                                     _DescriptorProto'ExtensionRange'end
                                                                     ::
                                                                     Prelude.Maybe Data.Int.Int32}
                                    deriving (Prelude.Show, Prelude.Eq)

type instance
     Data.ProtoLens.Field "start" DescriptorProto'ExtensionRange =
     Data.Int.Int32

instance Data.ProtoLens.HasField "start"
         DescriptorProto'ExtensionRange DescriptorProto'ExtensionRange where
        field _
          = (Prelude..) maybe'start
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'start" DescriptorProto'ExtensionRange =
     Prelude.Maybe Data.Int.Int32

instance Data.ProtoLens.HasField "maybe'start"
         DescriptorProto'ExtensionRange DescriptorProto'ExtensionRange where
        field _
          = Lens.Family2.Unchecked.lens _DescriptorProto'ExtensionRange'start
              (\ x__ y__ -> x__{_DescriptorProto'ExtensionRange'start = y__})

type instance
     Data.ProtoLens.Field "end" DescriptorProto'ExtensionRange =
     Data.Int.Int32

instance Data.ProtoLens.HasField "end"
         DescriptorProto'ExtensionRange DescriptorProto'ExtensionRange where
        field _
          = (Prelude..) maybe'end
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'end" DescriptorProto'ExtensionRange =
     Prelude.Maybe Data.Int.Int32

instance Data.ProtoLens.HasField "maybe'end"
         DescriptorProto'ExtensionRange DescriptorProto'ExtensionRange where
        field _
          = Lens.Family2.Unchecked.lens _DescriptorProto'ExtensionRange'end
              (\ x__ y__ -> x__{_DescriptorProto'ExtensionRange'end = y__})

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
                end__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "end"
                      (Data.ProtoLens.Int32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
                      (Data.ProtoLens.OptionalField maybe'end)
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, start__field_descriptor),
                    (Data.ProtoLens.Tag 2, end__field_descriptor)])
                (Data.Map.fromList
                   [("start", start__field_descriptor),
                    ("end", end__field_descriptor)])

data DescriptorProto'ReservedRange = DescriptorProto'ReservedRange{_DescriptorProto'ReservedRange'start
                                                                   :: Prelude.Maybe Data.Int.Int32,
                                                                   _DescriptorProto'ReservedRange'end
                                                                   :: Prelude.Maybe Data.Int.Int32}
                                   deriving (Prelude.Show, Prelude.Eq)

type instance
     Data.ProtoLens.Field "start" DescriptorProto'ReservedRange =
     Data.Int.Int32

instance Data.ProtoLens.HasField "start"
         DescriptorProto'ReservedRange DescriptorProto'ReservedRange where
        field _
          = (Prelude..) maybe'start
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'start" DescriptorProto'ReservedRange =
     Prelude.Maybe Data.Int.Int32

instance Data.ProtoLens.HasField "maybe'start"
         DescriptorProto'ReservedRange DescriptorProto'ReservedRange where
        field _
          = Lens.Family2.Unchecked.lens _DescriptorProto'ReservedRange'start
              (\ x__ y__ -> x__{_DescriptorProto'ReservedRange'start = y__})

type instance
     Data.ProtoLens.Field "end" DescriptorProto'ReservedRange =
     Data.Int.Int32

instance Data.ProtoLens.HasField "end"
         DescriptorProto'ReservedRange DescriptorProto'ReservedRange where
        field _
          = (Prelude..) maybe'end
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'end" DescriptorProto'ReservedRange =
     Prelude.Maybe Data.Int.Int32

instance Data.ProtoLens.HasField "maybe'end"
         DescriptorProto'ReservedRange DescriptorProto'ReservedRange where
        field _
          = Lens.Family2.Unchecked.lens _DescriptorProto'ReservedRange'end
              (\ x__ y__ -> x__{_DescriptorProto'ReservedRange'end = y__})

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
                end__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "end"
                      (Data.ProtoLens.Int32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
                      (Data.ProtoLens.OptionalField maybe'end)
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, start__field_descriptor),
                    (Data.ProtoLens.Tag 2, end__field_descriptor)])
                (Data.Map.fromList
                   [("start", start__field_descriptor),
                    ("end", end__field_descriptor)])

data EnumDescriptorProto = EnumDescriptorProto{_EnumDescriptorProto'name
                                               :: Prelude.Maybe Data.Text.Text,
                                               _EnumDescriptorProto'value ::
                                               [EnumValueDescriptorProto],
                                               _EnumDescriptorProto'options ::
                                               Prelude.Maybe EnumOptions}
                         deriving (Prelude.Show, Prelude.Eq)

type instance Data.ProtoLens.Field "name" EnumDescriptorProto =
     Data.Text.Text

instance Data.ProtoLens.HasField "name" EnumDescriptorProto
         EnumDescriptorProto where
        field _
          = (Prelude..) maybe'name
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance Data.ProtoLens.Field "maybe'name" EnumDescriptorProto
     = Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'name" EnumDescriptorProto
         EnumDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _EnumDescriptorProto'name
              (\ x__ y__ -> x__{_EnumDescriptorProto'name = y__})

type instance Data.ProtoLens.Field "value" EnumDescriptorProto =
     [EnumValueDescriptorProto]

instance Data.ProtoLens.HasField "value" EnumDescriptorProto
         EnumDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _EnumDescriptorProto'value
              (\ x__ y__ -> x__{_EnumDescriptorProto'value = y__})

type instance Data.ProtoLens.Field "options" EnumDescriptorProto =
     EnumOptions

instance Data.ProtoLens.HasField "options" EnumDescriptorProto
         EnumDescriptorProto where
        field _
          = (Prelude..) maybe'options
              (Data.ProtoLens.maybeLens Data.Default.Class.def)

type instance
     Data.ProtoLens.Field "maybe'options" EnumDescriptorProto =
     Prelude.Maybe EnumOptions

instance Data.ProtoLens.HasField "maybe'options"
         EnumDescriptorProto EnumDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _EnumDescriptorProto'options
              (\ x__ y__ -> x__{_EnumDescriptorProto'options = y__})

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
                value__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "value"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor EnumValueDescriptorProto)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked value)
                options__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "options"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor EnumOptions)
                      (Data.ProtoLens.OptionalField maybe'options)
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, name__field_descriptor),
                    (Data.ProtoLens.Tag 2, value__field_descriptor),
                    (Data.ProtoLens.Tag 3, options__field_descriptor)])
                (Data.Map.fromList
                   [("name", name__field_descriptor),
                    ("value", value__field_descriptor),
                    ("options", options__field_descriptor)])

data EnumOptions = EnumOptions{_EnumOptions'allowAlias ::
                               Prelude.Maybe Prelude.Bool,
                               _EnumOptions'deprecated :: Prelude.Maybe Prelude.Bool,
                               _EnumOptions'uninterpretedOption :: [UninterpretedOption]}
                 deriving (Prelude.Show, Prelude.Eq)

type instance Data.ProtoLens.Field "allowAlias" EnumOptions =
     Prelude.Bool

instance Data.ProtoLens.HasField "allowAlias" EnumOptions
         EnumOptions where
        field _
          = (Prelude..) maybe'allowAlias
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance Data.ProtoLens.Field "maybe'allowAlias" EnumOptions =
     Prelude.Maybe Prelude.Bool

instance Data.ProtoLens.HasField "maybe'allowAlias" EnumOptions
         EnumOptions where
        field _
          = Lens.Family2.Unchecked.lens _EnumOptions'allowAlias
              (\ x__ y__ -> x__{_EnumOptions'allowAlias = y__})

type instance Data.ProtoLens.Field "deprecated" EnumOptions =
     Prelude.Bool

instance Data.ProtoLens.HasField "deprecated" EnumOptions
         EnumOptions where
        field _
          = (Prelude..) maybe'deprecated
              (Data.ProtoLens.maybeLens Prelude.False)

type instance Data.ProtoLens.Field "maybe'deprecated" EnumOptions =
     Prelude.Maybe Prelude.Bool

instance Data.ProtoLens.HasField "maybe'deprecated" EnumOptions
         EnumOptions where
        field _
          = Lens.Family2.Unchecked.lens _EnumOptions'deprecated
              (\ x__ y__ -> x__{_EnumOptions'deprecated = y__})

type instance
     Data.ProtoLens.Field "uninterpretedOption" EnumOptions =
     [UninterpretedOption]

instance Data.ProtoLens.HasField "uninterpretedOption" EnumOptions
         EnumOptions where
        field _
          = Lens.Family2.Unchecked.lens _EnumOptions'uninterpretedOption
              (\ x__ y__ -> x__{_EnumOptions'uninterpretedOption = y__})

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
                deprecated__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "deprecated"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'deprecated)
                uninterpretedOption__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "uninterpreted_option"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor UninterpretedOption)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         uninterpretedOption)
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 2, allowAlias__field_descriptor),
                    (Data.ProtoLens.Tag 3, deprecated__field_descriptor),
                    (Data.ProtoLens.Tag 999, uninterpretedOption__field_descriptor)])
                (Data.Map.fromList
                   [("allow_alias", allowAlias__field_descriptor),
                    ("deprecated", deprecated__field_descriptor),
                    ("uninterpreted_option", uninterpretedOption__field_descriptor)])

data EnumValueDescriptorProto = EnumValueDescriptorProto{_EnumValueDescriptorProto'name
                                                         :: Prelude.Maybe Data.Text.Text,
                                                         _EnumValueDescriptorProto'number ::
                                                         Prelude.Maybe Data.Int.Int32,
                                                         _EnumValueDescriptorProto'options ::
                                                         Prelude.Maybe EnumValueOptions}
                              deriving (Prelude.Show, Prelude.Eq)

type instance Data.ProtoLens.Field "name" EnumValueDescriptorProto
     = Data.Text.Text

instance Data.ProtoLens.HasField "name" EnumValueDescriptorProto
         EnumValueDescriptorProto where
        field _
          = (Prelude..) maybe'name
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'name" EnumValueDescriptorProto =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'name"
         EnumValueDescriptorProto EnumValueDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _EnumValueDescriptorProto'name
              (\ x__ y__ -> x__{_EnumValueDescriptorProto'name = y__})

type instance
     Data.ProtoLens.Field "number" EnumValueDescriptorProto =
     Data.Int.Int32

instance Data.ProtoLens.HasField "number" EnumValueDescriptorProto
         EnumValueDescriptorProto where
        field _
          = (Prelude..) maybe'number
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'number" EnumValueDescriptorProto =
     Prelude.Maybe Data.Int.Int32

instance Data.ProtoLens.HasField "maybe'number"
         EnumValueDescriptorProto EnumValueDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _EnumValueDescriptorProto'number
              (\ x__ y__ -> x__{_EnumValueDescriptorProto'number = y__})

type instance
     Data.ProtoLens.Field "options" EnumValueDescriptorProto =
     EnumValueOptions

instance Data.ProtoLens.HasField "options" EnumValueDescriptorProto
         EnumValueDescriptorProto where
        field _
          = (Prelude..) maybe'options
              (Data.ProtoLens.maybeLens Data.Default.Class.def)

type instance
     Data.ProtoLens.Field "maybe'options" EnumValueDescriptorProto =
     Prelude.Maybe EnumValueOptions

instance Data.ProtoLens.HasField "maybe'options"
         EnumValueDescriptorProto EnumValueDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _EnumValueDescriptorProto'options
              (\ x__ y__ -> x__{_EnumValueDescriptorProto'options = y__})

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
                number__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "number"
                      (Data.ProtoLens.Int32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
                      (Data.ProtoLens.OptionalField maybe'number)
                options__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "options"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor EnumValueOptions)
                      (Data.ProtoLens.OptionalField maybe'options)
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, name__field_descriptor),
                    (Data.ProtoLens.Tag 2, number__field_descriptor),
                    (Data.ProtoLens.Tag 3, options__field_descriptor)])
                (Data.Map.fromList
                   [("name", name__field_descriptor),
                    ("number", number__field_descriptor),
                    ("options", options__field_descriptor)])

data EnumValueOptions = EnumValueOptions{_EnumValueOptions'deprecated
                                         :: Prelude.Maybe Prelude.Bool,
                                         _EnumValueOptions'uninterpretedOption ::
                                         [UninterpretedOption]}
                      deriving (Prelude.Show, Prelude.Eq)

type instance Data.ProtoLens.Field "deprecated" EnumValueOptions =
     Prelude.Bool

instance Data.ProtoLens.HasField "deprecated" EnumValueOptions
         EnumValueOptions where
        field _
          = (Prelude..) maybe'deprecated
              (Data.ProtoLens.maybeLens Prelude.False)

type instance
     Data.ProtoLens.Field "maybe'deprecated" EnumValueOptions =
     Prelude.Maybe Prelude.Bool

instance Data.ProtoLens.HasField "maybe'deprecated"
         EnumValueOptions EnumValueOptions where
        field _
          = Lens.Family2.Unchecked.lens _EnumValueOptions'deprecated
              (\ x__ y__ -> x__{_EnumValueOptions'deprecated = y__})

type instance
     Data.ProtoLens.Field "uninterpretedOption" EnumValueOptions =
     [UninterpretedOption]

instance Data.ProtoLens.HasField "uninterpretedOption"
         EnumValueOptions EnumValueOptions where
        field _
          = Lens.Family2.Unchecked.lens _EnumValueOptions'uninterpretedOption
              (\ x__ y__ -> x__{_EnumValueOptions'uninterpretedOption = y__})

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
                uninterpretedOption__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "uninterpreted_option"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor UninterpretedOption)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         uninterpretedOption)
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, deprecated__field_descriptor),
                    (Data.ProtoLens.Tag 999, uninterpretedOption__field_descriptor)])
                (Data.Map.fromList
                   [("deprecated", deprecated__field_descriptor),
                    ("uninterpreted_option", uninterpretedOption__field_descriptor)])

data FieldDescriptorProto = FieldDescriptorProto{_FieldDescriptorProto'name
                                                 :: Prelude.Maybe Data.Text.Text,
                                                 _FieldDescriptorProto'number ::
                                                 Prelude.Maybe Data.Int.Int32,
                                                 _FieldDescriptorProto'label ::
                                                 Prelude.Maybe FieldDescriptorProto'Label,
                                                 _FieldDescriptorProto'type' ::
                                                 Prelude.Maybe FieldDescriptorProto'Type,
                                                 _FieldDescriptorProto'typeName ::
                                                 Prelude.Maybe Data.Text.Text,
                                                 _FieldDescriptorProto'extendee ::
                                                 Prelude.Maybe Data.Text.Text,
                                                 _FieldDescriptorProto'defaultValue ::
                                                 Prelude.Maybe Data.Text.Text,
                                                 _FieldDescriptorProto'oneofIndex ::
                                                 Prelude.Maybe Data.Int.Int32,
                                                 _FieldDescriptorProto'jsonName ::
                                                 Prelude.Maybe Data.Text.Text,
                                                 _FieldDescriptorProto'options ::
                                                 Prelude.Maybe FieldOptions}
                          deriving (Prelude.Show, Prelude.Eq)

type instance Data.ProtoLens.Field "name" FieldDescriptorProto =
     Data.Text.Text

instance Data.ProtoLens.HasField "name" FieldDescriptorProto
         FieldDescriptorProto where
        field _
          = (Prelude..) maybe'name
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'name" FieldDescriptorProto =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'name" FieldDescriptorProto
         FieldDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _FieldDescriptorProto'name
              (\ x__ y__ -> x__{_FieldDescriptorProto'name = y__})

type instance Data.ProtoLens.Field "number" FieldDescriptorProto =
     Data.Int.Int32

instance Data.ProtoLens.HasField "number" FieldDescriptorProto
         FieldDescriptorProto where
        field _
          = (Prelude..) maybe'number
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'number" FieldDescriptorProto =
     Prelude.Maybe Data.Int.Int32

instance Data.ProtoLens.HasField "maybe'number"
         FieldDescriptorProto FieldDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _FieldDescriptorProto'number
              (\ x__ y__ -> x__{_FieldDescriptorProto'number = y__})

type instance Data.ProtoLens.Field "label" FieldDescriptorProto =
     FieldDescriptorProto'Label

instance Data.ProtoLens.HasField "label" FieldDescriptorProto
         FieldDescriptorProto where
        field _
          = (Prelude..) maybe'label
              (Data.ProtoLens.maybeLens Data.Default.Class.def)

type instance
     Data.ProtoLens.Field "maybe'label" FieldDescriptorProto =
     Prelude.Maybe FieldDescriptorProto'Label

instance Data.ProtoLens.HasField "maybe'label" FieldDescriptorProto
         FieldDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _FieldDescriptorProto'label
              (\ x__ y__ -> x__{_FieldDescriptorProto'label = y__})

type instance Data.ProtoLens.Field "type'" FieldDescriptorProto =
     FieldDescriptorProto'Type

instance Data.ProtoLens.HasField "type'" FieldDescriptorProto
         FieldDescriptorProto where
        field _
          = (Prelude..) maybe'type'
              (Data.ProtoLens.maybeLens Data.Default.Class.def)

type instance
     Data.ProtoLens.Field "maybe'type'" FieldDescriptorProto =
     Prelude.Maybe FieldDescriptorProto'Type

instance Data.ProtoLens.HasField "maybe'type'" FieldDescriptorProto
         FieldDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _FieldDescriptorProto'type'
              (\ x__ y__ -> x__{_FieldDescriptorProto'type' = y__})

type instance Data.ProtoLens.Field "typeName" FieldDescriptorProto
     = Data.Text.Text

instance Data.ProtoLens.HasField "typeName" FieldDescriptorProto
         FieldDescriptorProto where
        field _
          = (Prelude..) maybe'typeName
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'typeName" FieldDescriptorProto =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'typeName"
         FieldDescriptorProto FieldDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _FieldDescriptorProto'typeName
              (\ x__ y__ -> x__{_FieldDescriptorProto'typeName = y__})

type instance Data.ProtoLens.Field "extendee" FieldDescriptorProto
     = Data.Text.Text

instance Data.ProtoLens.HasField "extendee" FieldDescriptorProto
         FieldDescriptorProto where
        field _
          = (Prelude..) maybe'extendee
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'extendee" FieldDescriptorProto =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'extendee"
         FieldDescriptorProto FieldDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _FieldDescriptorProto'extendee
              (\ x__ y__ -> x__{_FieldDescriptorProto'extendee = y__})

type instance
     Data.ProtoLens.Field "defaultValue" FieldDescriptorProto =
     Data.Text.Text

instance Data.ProtoLens.HasField "defaultValue"
         FieldDescriptorProto FieldDescriptorProto where
        field _
          = (Prelude..) maybe'defaultValue
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'defaultValue" FieldDescriptorProto =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'defaultValue"
         FieldDescriptorProto FieldDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _FieldDescriptorProto'defaultValue
              (\ x__ y__ -> x__{_FieldDescriptorProto'defaultValue = y__})

type instance
     Data.ProtoLens.Field "oneofIndex" FieldDescriptorProto =
     Data.Int.Int32

instance Data.ProtoLens.HasField "oneofIndex" FieldDescriptorProto
         FieldDescriptorProto where
        field _
          = (Prelude..) maybe'oneofIndex
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'oneofIndex" FieldDescriptorProto =
     Prelude.Maybe Data.Int.Int32

instance Data.ProtoLens.HasField "maybe'oneofIndex"
         FieldDescriptorProto FieldDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _FieldDescriptorProto'oneofIndex
              (\ x__ y__ -> x__{_FieldDescriptorProto'oneofIndex = y__})

type instance Data.ProtoLens.Field "jsonName" FieldDescriptorProto
     = Data.Text.Text

instance Data.ProtoLens.HasField "jsonName" FieldDescriptorProto
         FieldDescriptorProto where
        field _
          = (Prelude..) maybe'jsonName
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'jsonName" FieldDescriptorProto =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'jsonName"
         FieldDescriptorProto FieldDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _FieldDescriptorProto'jsonName
              (\ x__ y__ -> x__{_FieldDescriptorProto'jsonName = y__})

type instance Data.ProtoLens.Field "options" FieldDescriptorProto =
     FieldOptions

instance Data.ProtoLens.HasField "options" FieldDescriptorProto
         FieldDescriptorProto where
        field _
          = (Prelude..) maybe'options
              (Data.ProtoLens.maybeLens Data.Default.Class.def)

type instance
     Data.ProtoLens.Field "maybe'options" FieldDescriptorProto =
     Prelude.Maybe FieldOptions

instance Data.ProtoLens.HasField "maybe'options"
         FieldDescriptorProto FieldDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _FieldDescriptorProto'options
              (\ x__ y__ -> x__{_FieldDescriptorProto'options = y__})

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
                number__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "number"
                      (Data.ProtoLens.Int32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
                      (Data.ProtoLens.OptionalField maybe'number)
                label__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "label"
                      (Data.ProtoLens.EnumField ::
                         Data.ProtoLens.FieldTypeDescriptor FieldDescriptorProto'Label)
                      (Data.ProtoLens.OptionalField maybe'label)
                type'__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "type"
                      (Data.ProtoLens.EnumField ::
                         Data.ProtoLens.FieldTypeDescriptor FieldDescriptorProto'Type)
                      (Data.ProtoLens.OptionalField maybe'type')
                typeName__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "type_name"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'typeName)
                extendee__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "extendee"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'extendee)
                defaultValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "default_value"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'defaultValue)
                oneofIndex__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "oneof_index"
                      (Data.ProtoLens.Int32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
                      (Data.ProtoLens.OptionalField maybe'oneofIndex)
                jsonName__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "json_name"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'jsonName)
                options__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "options"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor FieldOptions)
                      (Data.ProtoLens.OptionalField maybe'options)
              in
              Data.ProtoLens.MessageDescriptor
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
                                deriving (Prelude.Show, Prelude.Eq)

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
              "Ident \"FieldDescriptorProto'Label\".Ident \"succ\": bad argument Ident \"FieldDescriptorProto'LABEL_REPEATED\". This value would be out of bounds."
        succ FieldDescriptorProto'LABEL_OPTIONAL
          = FieldDescriptorProto'LABEL_REQUIRED
        succ FieldDescriptorProto'LABEL_REQUIRED
          = FieldDescriptorProto'LABEL_REPEATED
        pred FieldDescriptorProto'LABEL_OPTIONAL
          = Prelude.error
              "Ident \"FieldDescriptorProto'Label\".Ident \"pred\": bad argument Ident \"FieldDescriptorProto'LABEL_OPTIONAL\". This value would be out of bounds."
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
                               deriving (Prelude.Show, Prelude.Eq)

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
              "Ident \"FieldDescriptorProto'Type\".Ident \"succ\": bad argument Ident \"FieldDescriptorProto'TYPE_SINT64\". This value would be out of bounds."
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
              "Ident \"FieldDescriptorProto'Type\".Ident \"pred\": bad argument Ident \"FieldDescriptorProto'TYPE_DOUBLE\". This value would be out of bounds."
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
                                 Prelude.Maybe FieldOptions'CType,
                                 _FieldOptions'packed :: Prelude.Maybe Prelude.Bool,
                                 _FieldOptions'jstype :: Prelude.Maybe FieldOptions'JSType,
                                 _FieldOptions'lazy :: Prelude.Maybe Prelude.Bool,
                                 _FieldOptions'deprecated :: Prelude.Maybe Prelude.Bool,
                                 _FieldOptions'weak :: Prelude.Maybe Prelude.Bool,
                                 _FieldOptions'uninterpretedOption :: [UninterpretedOption]}
                  deriving (Prelude.Show, Prelude.Eq)

type instance Data.ProtoLens.Field "ctype" FieldOptions =
     FieldOptions'CType

instance Data.ProtoLens.HasField "ctype" FieldOptions FieldOptions
         where
        field _
          = (Prelude..) maybe'ctype
              (Data.ProtoLens.maybeLens FieldOptions'STRING)

type instance Data.ProtoLens.Field "maybe'ctype" FieldOptions =
     Prelude.Maybe FieldOptions'CType

instance Data.ProtoLens.HasField "maybe'ctype" FieldOptions
         FieldOptions where
        field _
          = Lens.Family2.Unchecked.lens _FieldOptions'ctype
              (\ x__ y__ -> x__{_FieldOptions'ctype = y__})

type instance Data.ProtoLens.Field "packed" FieldOptions =
     Prelude.Bool

instance Data.ProtoLens.HasField "packed" FieldOptions FieldOptions
         where
        field _
          = (Prelude..) maybe'packed
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance Data.ProtoLens.Field "maybe'packed" FieldOptions =
     Prelude.Maybe Prelude.Bool

instance Data.ProtoLens.HasField "maybe'packed" FieldOptions
         FieldOptions where
        field _
          = Lens.Family2.Unchecked.lens _FieldOptions'packed
              (\ x__ y__ -> x__{_FieldOptions'packed = y__})

type instance Data.ProtoLens.Field "jstype" FieldOptions =
     FieldOptions'JSType

instance Data.ProtoLens.HasField "jstype" FieldOptions FieldOptions
         where
        field _
          = (Prelude..) maybe'jstype
              (Data.ProtoLens.maybeLens FieldOptions'JS_NORMAL)

type instance Data.ProtoLens.Field "maybe'jstype" FieldOptions =
     Prelude.Maybe FieldOptions'JSType

instance Data.ProtoLens.HasField "maybe'jstype" FieldOptions
         FieldOptions where
        field _
          = Lens.Family2.Unchecked.lens _FieldOptions'jstype
              (\ x__ y__ -> x__{_FieldOptions'jstype = y__})

type instance Data.ProtoLens.Field "lazy" FieldOptions =
     Prelude.Bool

instance Data.ProtoLens.HasField "lazy" FieldOptions FieldOptions
         where
        field _
          = (Prelude..) maybe'lazy (Data.ProtoLens.maybeLens Prelude.False)

type instance Data.ProtoLens.Field "maybe'lazy" FieldOptions =
     Prelude.Maybe Prelude.Bool

instance Data.ProtoLens.HasField "maybe'lazy" FieldOptions
         FieldOptions where
        field _
          = Lens.Family2.Unchecked.lens _FieldOptions'lazy
              (\ x__ y__ -> x__{_FieldOptions'lazy = y__})

type instance Data.ProtoLens.Field "deprecated" FieldOptions =
     Prelude.Bool

instance Data.ProtoLens.HasField "deprecated" FieldOptions
         FieldOptions where
        field _
          = (Prelude..) maybe'deprecated
              (Data.ProtoLens.maybeLens Prelude.False)

type instance Data.ProtoLens.Field "maybe'deprecated" FieldOptions
     = Prelude.Maybe Prelude.Bool

instance Data.ProtoLens.HasField "maybe'deprecated" FieldOptions
         FieldOptions where
        field _
          = Lens.Family2.Unchecked.lens _FieldOptions'deprecated
              (\ x__ y__ -> x__{_FieldOptions'deprecated = y__})

type instance Data.ProtoLens.Field "weak" FieldOptions =
     Prelude.Bool

instance Data.ProtoLens.HasField "weak" FieldOptions FieldOptions
         where
        field _
          = (Prelude..) maybe'weak (Data.ProtoLens.maybeLens Prelude.False)

type instance Data.ProtoLens.Field "maybe'weak" FieldOptions =
     Prelude.Maybe Prelude.Bool

instance Data.ProtoLens.HasField "maybe'weak" FieldOptions
         FieldOptions where
        field _
          = Lens.Family2.Unchecked.lens _FieldOptions'weak
              (\ x__ y__ -> x__{_FieldOptions'weak = y__})

type instance
     Data.ProtoLens.Field "uninterpretedOption" FieldOptions =
     [UninterpretedOption]

instance Data.ProtoLens.HasField "uninterpretedOption" FieldOptions
         FieldOptions where
        field _
          = Lens.Family2.Unchecked.lens _FieldOptions'uninterpretedOption
              (\ x__ y__ -> x__{_FieldOptions'uninterpretedOption = y__})

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
                packed__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "packed"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'packed)
                jstype__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "jstype"
                      (Data.ProtoLens.EnumField ::
                         Data.ProtoLens.FieldTypeDescriptor FieldOptions'JSType)
                      (Data.ProtoLens.OptionalField maybe'jstype)
                lazy__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "lazy"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'lazy)
                deprecated__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "deprecated"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'deprecated)
                weak__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "weak"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'weak)
                uninterpretedOption__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "uninterpreted_option"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor UninterpretedOption)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         uninterpretedOption)
              in
              Data.ProtoLens.MessageDescriptor
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
                        deriving (Prelude.Show, Prelude.Eq)

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
              "Ident \"FieldOptions'CType\".Ident \"succ\": bad argument Ident \"FieldOptions'STRING_PIECE\". This value would be out of bounds."
        succ FieldOptions'STRING = FieldOptions'CORD
        succ FieldOptions'CORD = FieldOptions'STRING_PIECE
        pred FieldOptions'STRING
          = Prelude.error
              "Ident \"FieldOptions'CType\".Ident \"pred\": bad argument Ident \"FieldOptions'STRING\". This value would be out of bounds."
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
                         deriving (Prelude.Show, Prelude.Eq)

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
              "Ident \"FieldOptions'JSType\".Ident \"succ\": bad argument Ident \"FieldOptions'JS_NUMBER\". This value would be out of bounds."
        succ FieldOptions'JS_NORMAL = FieldOptions'JS_STRING
        succ FieldOptions'JS_STRING = FieldOptions'JS_NUMBER
        pred FieldOptions'JS_NORMAL
          = Prelude.error
              "Ident \"FieldOptions'JSType\".Ident \"pred\": bad argument Ident \"FieldOptions'JS_NORMAL\". This value would be out of bounds."
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
                                               :: Prelude.Maybe Data.Text.Text,
                                               _FileDescriptorProto'package ::
                                               Prelude.Maybe Data.Text.Text,
                                               _FileDescriptorProto'dependency :: [Data.Text.Text],
                                               _FileDescriptorProto'publicDependency ::
                                               [Data.Int.Int32],
                                               _FileDescriptorProto'weakDependency ::
                                               [Data.Int.Int32],
                                               _FileDescriptorProto'messageType ::
                                               [DescriptorProto],
                                               _FileDescriptorProto'enumType ::
                                               [EnumDescriptorProto],
                                               _FileDescriptorProto'service ::
                                               [ServiceDescriptorProto],
                                               _FileDescriptorProto'extension ::
                                               [FieldDescriptorProto],
                                               _FileDescriptorProto'options ::
                                               Prelude.Maybe FileOptions,
                                               _FileDescriptorProto'sourceCodeInfo ::
                                               Prelude.Maybe SourceCodeInfo,
                                               _FileDescriptorProto'syntax ::
                                               Prelude.Maybe Data.Text.Text}
                         deriving (Prelude.Show, Prelude.Eq)

type instance Data.ProtoLens.Field "name" FileDescriptorProto =
     Data.Text.Text

instance Data.ProtoLens.HasField "name" FileDescriptorProto
         FileDescriptorProto where
        field _
          = (Prelude..) maybe'name
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance Data.ProtoLens.Field "maybe'name" FileDescriptorProto
     = Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'name" FileDescriptorProto
         FileDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _FileDescriptorProto'name
              (\ x__ y__ -> x__{_FileDescriptorProto'name = y__})

type instance Data.ProtoLens.Field "package" FileDescriptorProto =
     Data.Text.Text

instance Data.ProtoLens.HasField "package" FileDescriptorProto
         FileDescriptorProto where
        field _
          = (Prelude..) maybe'package
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'package" FileDescriptorProto =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'package"
         FileDescriptorProto FileDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _FileDescriptorProto'package
              (\ x__ y__ -> x__{_FileDescriptorProto'package = y__})

type instance Data.ProtoLens.Field "dependency" FileDescriptorProto
     = [Data.Text.Text]

instance Data.ProtoLens.HasField "dependency" FileDescriptorProto
         FileDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _FileDescriptorProto'dependency
              (\ x__ y__ -> x__{_FileDescriptorProto'dependency = y__})

type instance
     Data.ProtoLens.Field "publicDependency" FileDescriptorProto =
     [Data.Int.Int32]

instance Data.ProtoLens.HasField "publicDependency"
         FileDescriptorProto FileDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _FileDescriptorProto'publicDependency
              (\ x__ y__ -> x__{_FileDescriptorProto'publicDependency = y__})

type instance
     Data.ProtoLens.Field "weakDependency" FileDescriptorProto =
     [Data.Int.Int32]

instance Data.ProtoLens.HasField "weakDependency"
         FileDescriptorProto FileDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _FileDescriptorProto'weakDependency
              (\ x__ y__ -> x__{_FileDescriptorProto'weakDependency = y__})

type instance
     Data.ProtoLens.Field "messageType" FileDescriptorProto =
     [DescriptorProto]

instance Data.ProtoLens.HasField "messageType" FileDescriptorProto
         FileDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _FileDescriptorProto'messageType
              (\ x__ y__ -> x__{_FileDescriptorProto'messageType = y__})

type instance Data.ProtoLens.Field "enumType" FileDescriptorProto =
     [EnumDescriptorProto]

instance Data.ProtoLens.HasField "enumType" FileDescriptorProto
         FileDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _FileDescriptorProto'enumType
              (\ x__ y__ -> x__{_FileDescriptorProto'enumType = y__})

type instance Data.ProtoLens.Field "service" FileDescriptorProto =
     [ServiceDescriptorProto]

instance Data.ProtoLens.HasField "service" FileDescriptorProto
         FileDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _FileDescriptorProto'service
              (\ x__ y__ -> x__{_FileDescriptorProto'service = y__})

type instance Data.ProtoLens.Field "extension" FileDescriptorProto
     = [FieldDescriptorProto]

instance Data.ProtoLens.HasField "extension" FileDescriptorProto
         FileDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _FileDescriptorProto'extension
              (\ x__ y__ -> x__{_FileDescriptorProto'extension = y__})

type instance Data.ProtoLens.Field "options" FileDescriptorProto =
     FileOptions

instance Data.ProtoLens.HasField "options" FileDescriptorProto
         FileDescriptorProto where
        field _
          = (Prelude..) maybe'options
              (Data.ProtoLens.maybeLens Data.Default.Class.def)

type instance
     Data.ProtoLens.Field "maybe'options" FileDescriptorProto =
     Prelude.Maybe FileOptions

instance Data.ProtoLens.HasField "maybe'options"
         FileDescriptorProto FileDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _FileDescriptorProto'options
              (\ x__ y__ -> x__{_FileDescriptorProto'options = y__})

type instance
     Data.ProtoLens.Field "sourceCodeInfo" FileDescriptorProto =
     SourceCodeInfo

instance Data.ProtoLens.HasField "sourceCodeInfo"
         FileDescriptorProto FileDescriptorProto where
        field _
          = (Prelude..) maybe'sourceCodeInfo
              (Data.ProtoLens.maybeLens Data.Default.Class.def)

type instance
     Data.ProtoLens.Field "maybe'sourceCodeInfo" FileDescriptorProto =
     Prelude.Maybe SourceCodeInfo

instance Data.ProtoLens.HasField "maybe'sourceCodeInfo"
         FileDescriptorProto FileDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _FileDescriptorProto'sourceCodeInfo
              (\ x__ y__ -> x__{_FileDescriptorProto'sourceCodeInfo = y__})

type instance Data.ProtoLens.Field "syntax" FileDescriptorProto =
     Data.Text.Text

instance Data.ProtoLens.HasField "syntax" FileDescriptorProto
         FileDescriptorProto where
        field _
          = (Prelude..) maybe'syntax
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'syntax" FileDescriptorProto =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'syntax" FileDescriptorProto
         FileDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _FileDescriptorProto'syntax
              (\ x__ y__ -> x__{_FileDescriptorProto'syntax = y__})

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
                package__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "package"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'package)
                dependency__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "dependency"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked dependency)
                publicDependency__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "public_dependency"
                      (Data.ProtoLens.Int32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         publicDependency)
                weakDependency__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "weak_dependency"
                      (Data.ProtoLens.Int32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         weakDependency)
                messageType__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "message_type"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor DescriptorProto)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked messageType)
                enumType__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "enum_type"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor EnumDescriptorProto)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked enumType)
                service__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "service"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor ServiceDescriptorProto)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked service)
                extension__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "extension"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor FieldDescriptorProto)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked extension)
                options__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "options"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor FileOptions)
                      (Data.ProtoLens.OptionalField maybe'options)
                sourceCodeInfo__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "source_code_info"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor SourceCodeInfo)
                      (Data.ProtoLens.OptionalField maybe'sourceCodeInfo)
                syntax__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "syntax"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'syntax)
              in
              Data.ProtoLens.MessageDescriptor
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
                                           :: [FileDescriptorProto]}
                       deriving (Prelude.Show, Prelude.Eq)

type instance Data.ProtoLens.Field "file" FileDescriptorSet =
     [FileDescriptorProto]

instance Data.ProtoLens.HasField "file" FileDescriptorSet
         FileDescriptorSet where
        field _
          = Lens.Family2.Unchecked.lens _FileDescriptorSet'file
              (\ x__ y__ -> x__{_FileDescriptorSet'file = y__})

instance Data.Default.Class.Default FileDescriptorSet where
        def = FileDescriptorSet{_FileDescriptorSet'file = []}

instance Data.ProtoLens.Message FileDescriptorSet where
        descriptor
          = let file__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "file"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor FileDescriptorProto)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked file)
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, file__field_descriptor)])
                (Data.Map.fromList [("file", file__field_descriptor)])

data FileOptions = FileOptions{_FileOptions'javaPackage ::
                               Prelude.Maybe Data.Text.Text,
                               _FileOptions'javaOuterClassname :: Prelude.Maybe Data.Text.Text,
                               _FileOptions'javaMultipleFiles :: Prelude.Maybe Prelude.Bool,
                               _FileOptions'javaGenerateEqualsAndHash ::
                               Prelude.Maybe Prelude.Bool,
                               _FileOptions'javaStringCheckUtf8 :: Prelude.Maybe Prelude.Bool,
                               _FileOptions'optimizeFor :: Prelude.Maybe FileOptions'OptimizeMode,
                               _FileOptions'goPackage :: Prelude.Maybe Data.Text.Text,
                               _FileOptions'ccGenericServices :: Prelude.Maybe Prelude.Bool,
                               _FileOptions'javaGenericServices :: Prelude.Maybe Prelude.Bool,
                               _FileOptions'pyGenericServices :: Prelude.Maybe Prelude.Bool,
                               _FileOptions'deprecated :: Prelude.Maybe Prelude.Bool,
                               _FileOptions'ccEnableArenas :: Prelude.Maybe Prelude.Bool,
                               _FileOptions'objcClassPrefix :: Prelude.Maybe Data.Text.Text,
                               _FileOptions'csharpNamespace :: Prelude.Maybe Data.Text.Text,
                               _FileOptions'uninterpretedOption :: [UninterpretedOption]}
                 deriving (Prelude.Show, Prelude.Eq)

type instance Data.ProtoLens.Field "javaPackage" FileOptions =
     Data.Text.Text

instance Data.ProtoLens.HasField "javaPackage" FileOptions
         FileOptions where
        field _
          = (Prelude..) maybe'javaPackage
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance Data.ProtoLens.Field "maybe'javaPackage" FileOptions
     = Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'javaPackage" FileOptions
         FileOptions where
        field _
          = Lens.Family2.Unchecked.lens _FileOptions'javaPackage
              (\ x__ y__ -> x__{_FileOptions'javaPackage = y__})

type instance Data.ProtoLens.Field "javaOuterClassname" FileOptions
     = Data.Text.Text

instance Data.ProtoLens.HasField "javaOuterClassname" FileOptions
         FileOptions where
        field _
          = (Prelude..) maybe'javaOuterClassname
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'javaOuterClassname" FileOptions =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'javaOuterClassname"
         FileOptions FileOptions where
        field _
          = Lens.Family2.Unchecked.lens _FileOptions'javaOuterClassname
              (\ x__ y__ -> x__{_FileOptions'javaOuterClassname = y__})

type instance Data.ProtoLens.Field "javaMultipleFiles" FileOptions
     = Prelude.Bool

instance Data.ProtoLens.HasField "javaMultipleFiles" FileOptions
         FileOptions where
        field _
          = (Prelude..) maybe'javaMultipleFiles
              (Data.ProtoLens.maybeLens Prelude.False)

type instance
     Data.ProtoLens.Field "maybe'javaMultipleFiles" FileOptions =
     Prelude.Maybe Prelude.Bool

instance Data.ProtoLens.HasField "maybe'javaMultipleFiles"
         FileOptions FileOptions where
        field _
          = Lens.Family2.Unchecked.lens _FileOptions'javaMultipleFiles
              (\ x__ y__ -> x__{_FileOptions'javaMultipleFiles = y__})

type instance
     Data.ProtoLens.Field "javaGenerateEqualsAndHash" FileOptions =
     Prelude.Bool

instance Data.ProtoLens.HasField "javaGenerateEqualsAndHash"
         FileOptions FileOptions where
        field _
          = (Prelude..) maybe'javaGenerateEqualsAndHash
              (Data.ProtoLens.maybeLens Prelude.False)

type instance
     Data.ProtoLens.Field "maybe'javaGenerateEqualsAndHash" FileOptions
     = Prelude.Maybe Prelude.Bool

instance Data.ProtoLens.HasField "maybe'javaGenerateEqualsAndHash"
         FileOptions FileOptions where
        field _
          = Lens.Family2.Unchecked.lens
              _FileOptions'javaGenerateEqualsAndHash
              (\ x__ y__ -> x__{_FileOptions'javaGenerateEqualsAndHash = y__})

type instance
     Data.ProtoLens.Field "javaStringCheckUtf8" FileOptions =
     Prelude.Bool

instance Data.ProtoLens.HasField "javaStringCheckUtf8" FileOptions
         FileOptions where
        field _
          = (Prelude..) maybe'javaStringCheckUtf8
              (Data.ProtoLens.maybeLens Prelude.False)

type instance
     Data.ProtoLens.Field "maybe'javaStringCheckUtf8" FileOptions =
     Prelude.Maybe Prelude.Bool

instance Data.ProtoLens.HasField "maybe'javaStringCheckUtf8"
         FileOptions FileOptions where
        field _
          = Lens.Family2.Unchecked.lens _FileOptions'javaStringCheckUtf8
              (\ x__ y__ -> x__{_FileOptions'javaStringCheckUtf8 = y__})

type instance Data.ProtoLens.Field "optimizeFor" FileOptions =
     FileOptions'OptimizeMode

instance Data.ProtoLens.HasField "optimizeFor" FileOptions
         FileOptions where
        field _
          = (Prelude..) maybe'optimizeFor
              (Data.ProtoLens.maybeLens FileOptions'SPEED)

type instance Data.ProtoLens.Field "maybe'optimizeFor" FileOptions
     = Prelude.Maybe FileOptions'OptimizeMode

instance Data.ProtoLens.HasField "maybe'optimizeFor" FileOptions
         FileOptions where
        field _
          = Lens.Family2.Unchecked.lens _FileOptions'optimizeFor
              (\ x__ y__ -> x__{_FileOptions'optimizeFor = y__})

type instance Data.ProtoLens.Field "goPackage" FileOptions =
     Data.Text.Text

instance Data.ProtoLens.HasField "goPackage" FileOptions
         FileOptions where
        field _
          = (Prelude..) maybe'goPackage
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance Data.ProtoLens.Field "maybe'goPackage" FileOptions =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'goPackage" FileOptions
         FileOptions where
        field _
          = Lens.Family2.Unchecked.lens _FileOptions'goPackage
              (\ x__ y__ -> x__{_FileOptions'goPackage = y__})

type instance Data.ProtoLens.Field "ccGenericServices" FileOptions
     = Prelude.Bool

instance Data.ProtoLens.HasField "ccGenericServices" FileOptions
         FileOptions where
        field _
          = (Prelude..) maybe'ccGenericServices
              (Data.ProtoLens.maybeLens Prelude.False)

type instance
     Data.ProtoLens.Field "maybe'ccGenericServices" FileOptions =
     Prelude.Maybe Prelude.Bool

instance Data.ProtoLens.HasField "maybe'ccGenericServices"
         FileOptions FileOptions where
        field _
          = Lens.Family2.Unchecked.lens _FileOptions'ccGenericServices
              (\ x__ y__ -> x__{_FileOptions'ccGenericServices = y__})

type instance
     Data.ProtoLens.Field "javaGenericServices" FileOptions =
     Prelude.Bool

instance Data.ProtoLens.HasField "javaGenericServices" FileOptions
         FileOptions where
        field _
          = (Prelude..) maybe'javaGenericServices
              (Data.ProtoLens.maybeLens Prelude.False)

type instance
     Data.ProtoLens.Field "maybe'javaGenericServices" FileOptions =
     Prelude.Maybe Prelude.Bool

instance Data.ProtoLens.HasField "maybe'javaGenericServices"
         FileOptions FileOptions where
        field _
          = Lens.Family2.Unchecked.lens _FileOptions'javaGenericServices
              (\ x__ y__ -> x__{_FileOptions'javaGenericServices = y__})

type instance Data.ProtoLens.Field "pyGenericServices" FileOptions
     = Prelude.Bool

instance Data.ProtoLens.HasField "pyGenericServices" FileOptions
         FileOptions where
        field _
          = (Prelude..) maybe'pyGenericServices
              (Data.ProtoLens.maybeLens Prelude.False)

type instance
     Data.ProtoLens.Field "maybe'pyGenericServices" FileOptions =
     Prelude.Maybe Prelude.Bool

instance Data.ProtoLens.HasField "maybe'pyGenericServices"
         FileOptions FileOptions where
        field _
          = Lens.Family2.Unchecked.lens _FileOptions'pyGenericServices
              (\ x__ y__ -> x__{_FileOptions'pyGenericServices = y__})

type instance Data.ProtoLens.Field "deprecated" FileOptions =
     Prelude.Bool

instance Data.ProtoLens.HasField "deprecated" FileOptions
         FileOptions where
        field _
          = (Prelude..) maybe'deprecated
              (Data.ProtoLens.maybeLens Prelude.False)

type instance Data.ProtoLens.Field "maybe'deprecated" FileOptions =
     Prelude.Maybe Prelude.Bool

instance Data.ProtoLens.HasField "maybe'deprecated" FileOptions
         FileOptions where
        field _
          = Lens.Family2.Unchecked.lens _FileOptions'deprecated
              (\ x__ y__ -> x__{_FileOptions'deprecated = y__})

type instance Data.ProtoLens.Field "ccEnableArenas" FileOptions =
     Prelude.Bool

instance Data.ProtoLens.HasField "ccEnableArenas" FileOptions
         FileOptions where
        field _
          = (Prelude..) maybe'ccEnableArenas
              (Data.ProtoLens.maybeLens Prelude.False)

type instance
     Data.ProtoLens.Field "maybe'ccEnableArenas" FileOptions =
     Prelude.Maybe Prelude.Bool

instance Data.ProtoLens.HasField "maybe'ccEnableArenas" FileOptions
         FileOptions where
        field _
          = Lens.Family2.Unchecked.lens _FileOptions'ccEnableArenas
              (\ x__ y__ -> x__{_FileOptions'ccEnableArenas = y__})

type instance Data.ProtoLens.Field "objcClassPrefix" FileOptions =
     Data.Text.Text

instance Data.ProtoLens.HasField "objcClassPrefix" FileOptions
         FileOptions where
        field _
          = (Prelude..) maybe'objcClassPrefix
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'objcClassPrefix" FileOptions =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'objcClassPrefix"
         FileOptions FileOptions where
        field _
          = Lens.Family2.Unchecked.lens _FileOptions'objcClassPrefix
              (\ x__ y__ -> x__{_FileOptions'objcClassPrefix = y__})

type instance Data.ProtoLens.Field "csharpNamespace" FileOptions =
     Data.Text.Text

instance Data.ProtoLens.HasField "csharpNamespace" FileOptions
         FileOptions where
        field _
          = (Prelude..) maybe'csharpNamespace
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'csharpNamespace" FileOptions =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'csharpNamespace"
         FileOptions FileOptions where
        field _
          = Lens.Family2.Unchecked.lens _FileOptions'csharpNamespace
              (\ x__ y__ -> x__{_FileOptions'csharpNamespace = y__})

type instance
     Data.ProtoLens.Field "uninterpretedOption" FileOptions =
     [UninterpretedOption]

instance Data.ProtoLens.HasField "uninterpretedOption" FileOptions
         FileOptions where
        field _
          = Lens.Family2.Unchecked.lens _FileOptions'uninterpretedOption
              (\ x__ y__ -> x__{_FileOptions'uninterpretedOption = y__})

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
                javaOuterClassname__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "java_outer_classname"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'javaOuterClassname)
                javaMultipleFiles__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "java_multiple_files"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'javaMultipleFiles)
                javaGenerateEqualsAndHash__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "java_generate_equals_and_hash"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'javaGenerateEqualsAndHash)
                javaStringCheckUtf8__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "java_string_check_utf8"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'javaStringCheckUtf8)
                optimizeFor__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "optimize_for"
                      (Data.ProtoLens.EnumField ::
                         Data.ProtoLens.FieldTypeDescriptor FileOptions'OptimizeMode)
                      (Data.ProtoLens.OptionalField maybe'optimizeFor)
                goPackage__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "go_package"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'goPackage)
                ccGenericServices__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "cc_generic_services"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'ccGenericServices)
                javaGenericServices__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "java_generic_services"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'javaGenericServices)
                pyGenericServices__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "py_generic_services"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'pyGenericServices)
                deprecated__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "deprecated"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'deprecated)
                ccEnableArenas__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "cc_enable_arenas"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'ccEnableArenas)
                objcClassPrefix__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "objc_class_prefix"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'objcClassPrefix)
                csharpNamespace__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "csharp_namespace"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'csharpNamespace)
                uninterpretedOption__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "uninterpreted_option"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor UninterpretedOption)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         uninterpretedOption)
              in
              Data.ProtoLens.MessageDescriptor
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
                              deriving (Prelude.Show, Prelude.Eq)

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
              "Ident \"FileOptions'OptimizeMode\".Ident \"succ\": bad argument Ident \"FileOptions'LITE_RUNTIME\". This value would be out of bounds."
        succ FileOptions'SPEED = FileOptions'CODE_SIZE
        succ FileOptions'CODE_SIZE = FileOptions'LITE_RUNTIME
        pred FileOptions'SPEED
          = Prelude.error
              "Ident \"FileOptions'OptimizeMode\".Ident \"pred\": bad argument Ident \"FileOptions'SPEED\". This value would be out of bounds."
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
                                           :: [GeneratedCodeInfo'Annotation]}
                       deriving (Prelude.Show, Prelude.Eq)

type instance Data.ProtoLens.Field "annotation" GeneratedCodeInfo =
     [GeneratedCodeInfo'Annotation]

instance Data.ProtoLens.HasField "annotation" GeneratedCodeInfo
         GeneratedCodeInfo where
        field _
          = Lens.Family2.Unchecked.lens _GeneratedCodeInfo'annotation
              (\ x__ y__ -> x__{_GeneratedCodeInfo'annotation = y__})

instance Data.Default.Class.Default GeneratedCodeInfo where
        def = GeneratedCodeInfo{_GeneratedCodeInfo'annotation = []}

instance Data.ProtoLens.Message GeneratedCodeInfo where
        descriptor
          = let annotation__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "annotation"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor GeneratedCodeInfo'Annotation)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked annotation)
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, annotation__field_descriptor)])
                (Data.Map.fromList [("annotation", annotation__field_descriptor)])

data GeneratedCodeInfo'Annotation = GeneratedCodeInfo'Annotation{_GeneratedCodeInfo'Annotation'path
                                                                 :: [Data.Int.Int32],
                                                                 _GeneratedCodeInfo'Annotation'sourceFile
                                                                 :: Prelude.Maybe Data.Text.Text,
                                                                 _GeneratedCodeInfo'Annotation'begin
                                                                 :: Prelude.Maybe Data.Int.Int32,
                                                                 _GeneratedCodeInfo'Annotation'end
                                                                 :: Prelude.Maybe Data.Int.Int32}
                                  deriving (Prelude.Show, Prelude.Eq)

type instance
     Data.ProtoLens.Field "path" GeneratedCodeInfo'Annotation =
     [Data.Int.Int32]

instance Data.ProtoLens.HasField "path"
         GeneratedCodeInfo'Annotation GeneratedCodeInfo'Annotation where
        field _
          = Lens.Family2.Unchecked.lens _GeneratedCodeInfo'Annotation'path
              (\ x__ y__ -> x__{_GeneratedCodeInfo'Annotation'path = y__})

type instance
     Data.ProtoLens.Field "sourceFile" GeneratedCodeInfo'Annotation =
     Data.Text.Text

instance Data.ProtoLens.HasField "sourceFile"
         GeneratedCodeInfo'Annotation GeneratedCodeInfo'Annotation where
        field _
          = (Prelude..) maybe'sourceFile
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'sourceFile"
       GeneratedCodeInfo'Annotation
     = Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'sourceFile"
         GeneratedCodeInfo'Annotation GeneratedCodeInfo'Annotation where
        field _
          = Lens.Family2.Unchecked.lens
              _GeneratedCodeInfo'Annotation'sourceFile
              (\ x__ y__ -> x__{_GeneratedCodeInfo'Annotation'sourceFile = y__})

type instance
     Data.ProtoLens.Field "begin" GeneratedCodeInfo'Annotation =
     Data.Int.Int32

instance Data.ProtoLens.HasField "begin"
         GeneratedCodeInfo'Annotation GeneratedCodeInfo'Annotation where
        field _
          = (Prelude..) maybe'begin
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'begin" GeneratedCodeInfo'Annotation =
     Prelude.Maybe Data.Int.Int32

instance Data.ProtoLens.HasField "maybe'begin"
         GeneratedCodeInfo'Annotation GeneratedCodeInfo'Annotation where
        field _
          = Lens.Family2.Unchecked.lens _GeneratedCodeInfo'Annotation'begin
              (\ x__ y__ -> x__{_GeneratedCodeInfo'Annotation'begin = y__})

type instance
     Data.ProtoLens.Field "end" GeneratedCodeInfo'Annotation =
     Data.Int.Int32

instance Data.ProtoLens.HasField "end" GeneratedCodeInfo'Annotation
         GeneratedCodeInfo'Annotation where
        field _
          = (Prelude..) maybe'end
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'end" GeneratedCodeInfo'Annotation =
     Prelude.Maybe Data.Int.Int32

instance Data.ProtoLens.HasField "maybe'end"
         GeneratedCodeInfo'Annotation GeneratedCodeInfo'Annotation where
        field _
          = Lens.Family2.Unchecked.lens _GeneratedCodeInfo'Annotation'end
              (\ x__ y__ -> x__{_GeneratedCodeInfo'Annotation'end = y__})

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
                sourceFile__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "source_file"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'sourceFile)
                begin__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "begin"
                      (Data.ProtoLens.Int32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
                      (Data.ProtoLens.OptionalField maybe'begin)
                end__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "end"
                      (Data.ProtoLens.Int32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
                      (Data.ProtoLens.OptionalField maybe'end)
              in
              Data.ProtoLens.MessageDescriptor
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
                                     :: Prelude.Maybe Prelude.Bool,
                                     _MessageOptions'noStandardDescriptorAccessor ::
                                     Prelude.Maybe Prelude.Bool,
                                     _MessageOptions'deprecated :: Prelude.Maybe Prelude.Bool,
                                     _MessageOptions'mapEntry :: Prelude.Maybe Prelude.Bool,
                                     _MessageOptions'uninterpretedOption :: [UninterpretedOption]}
                    deriving (Prelude.Show, Prelude.Eq)

type instance
     Data.ProtoLens.Field "messageSetWireFormat" MessageOptions =
     Prelude.Bool

instance Data.ProtoLens.HasField "messageSetWireFormat"
         MessageOptions MessageOptions where
        field _
          = (Prelude..) maybe'messageSetWireFormat
              (Data.ProtoLens.maybeLens Prelude.False)

type instance
     Data.ProtoLens.Field "maybe'messageSetWireFormat" MessageOptions =
     Prelude.Maybe Prelude.Bool

instance Data.ProtoLens.HasField "maybe'messageSetWireFormat"
         MessageOptions MessageOptions where
        field _
          = Lens.Family2.Unchecked.lens _MessageOptions'messageSetWireFormat
              (\ x__ y__ -> x__{_MessageOptions'messageSetWireFormat = y__})

type instance
     Data.ProtoLens.Field "noStandardDescriptorAccessor" MessageOptions
     = Prelude.Bool

instance Data.ProtoLens.HasField "noStandardDescriptorAccessor"
         MessageOptions MessageOptions where
        field _
          = (Prelude..) maybe'noStandardDescriptorAccessor
              (Data.ProtoLens.maybeLens Prelude.False)

type instance
     Data.ProtoLens.Field "maybe'noStandardDescriptorAccessor"
       MessageOptions
     = Prelude.Maybe Prelude.Bool

instance Data.ProtoLens.HasField
         "maybe'noStandardDescriptorAccessor" MessageOptions MessageOptions
         where
        field _
          = Lens.Family2.Unchecked.lens
              _MessageOptions'noStandardDescriptorAccessor
              (\ x__ y__ ->
                 x__{_MessageOptions'noStandardDescriptorAccessor = y__})

type instance Data.ProtoLens.Field "deprecated" MessageOptions =
     Prelude.Bool

instance Data.ProtoLens.HasField "deprecated" MessageOptions
         MessageOptions where
        field _
          = (Prelude..) maybe'deprecated
              (Data.ProtoLens.maybeLens Prelude.False)

type instance
     Data.ProtoLens.Field "maybe'deprecated" MessageOptions =
     Prelude.Maybe Prelude.Bool

instance Data.ProtoLens.HasField "maybe'deprecated" MessageOptions
         MessageOptions where
        field _
          = Lens.Family2.Unchecked.lens _MessageOptions'deprecated
              (\ x__ y__ -> x__{_MessageOptions'deprecated = y__})

type instance Data.ProtoLens.Field "mapEntry" MessageOptions =
     Prelude.Bool

instance Data.ProtoLens.HasField "mapEntry" MessageOptions
         MessageOptions where
        field _
          = (Prelude..) maybe'mapEntry
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance Data.ProtoLens.Field "maybe'mapEntry" MessageOptions
     = Prelude.Maybe Prelude.Bool

instance Data.ProtoLens.HasField "maybe'mapEntry" MessageOptions
         MessageOptions where
        field _
          = Lens.Family2.Unchecked.lens _MessageOptions'mapEntry
              (\ x__ y__ -> x__{_MessageOptions'mapEntry = y__})

type instance
     Data.ProtoLens.Field "uninterpretedOption" MessageOptions =
     [UninterpretedOption]

instance Data.ProtoLens.HasField "uninterpretedOption"
         MessageOptions MessageOptions where
        field _
          = Lens.Family2.Unchecked.lens _MessageOptions'uninterpretedOption
              (\ x__ y__ -> x__{_MessageOptions'uninterpretedOption = y__})

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
                noStandardDescriptorAccessor__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "no_standard_descriptor_accessor"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'noStandardDescriptorAccessor)
                deprecated__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "deprecated"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'deprecated)
                mapEntry__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "map_entry"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'mapEntry)
                uninterpretedOption__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "uninterpreted_option"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor UninterpretedOption)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         uninterpretedOption)
              in
              Data.ProtoLens.MessageDescriptor
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
                                                   :: Prelude.Maybe Data.Text.Text,
                                                   _MethodDescriptorProto'inputType ::
                                                   Prelude.Maybe Data.Text.Text,
                                                   _MethodDescriptorProto'outputType ::
                                                   Prelude.Maybe Data.Text.Text,
                                                   _MethodDescriptorProto'options ::
                                                   Prelude.Maybe MethodOptions,
                                                   _MethodDescriptorProto'clientStreaming ::
                                                   Prelude.Maybe Prelude.Bool,
                                                   _MethodDescriptorProto'serverStreaming ::
                                                   Prelude.Maybe Prelude.Bool}
                           deriving (Prelude.Show, Prelude.Eq)

type instance Data.ProtoLens.Field "name" MethodDescriptorProto =
     Data.Text.Text

instance Data.ProtoLens.HasField "name" MethodDescriptorProto
         MethodDescriptorProto where
        field _
          = (Prelude..) maybe'name
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'name" MethodDescriptorProto =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'name" MethodDescriptorProto
         MethodDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _MethodDescriptorProto'name
              (\ x__ y__ -> x__{_MethodDescriptorProto'name = y__})

type instance
     Data.ProtoLens.Field "inputType" MethodDescriptorProto =
     Data.Text.Text

instance Data.ProtoLens.HasField "inputType" MethodDescriptorProto
         MethodDescriptorProto where
        field _
          = (Prelude..) maybe'inputType
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'inputType" MethodDescriptorProto =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'inputType"
         MethodDescriptorProto MethodDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _MethodDescriptorProto'inputType
              (\ x__ y__ -> x__{_MethodDescriptorProto'inputType = y__})

type instance
     Data.ProtoLens.Field "outputType" MethodDescriptorProto =
     Data.Text.Text

instance Data.ProtoLens.HasField "outputType" MethodDescriptorProto
         MethodDescriptorProto where
        field _
          = (Prelude..) maybe'outputType
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'outputType" MethodDescriptorProto =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'outputType"
         MethodDescriptorProto MethodDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _MethodDescriptorProto'outputType
              (\ x__ y__ -> x__{_MethodDescriptorProto'outputType = y__})

type instance Data.ProtoLens.Field "options" MethodDescriptorProto
     = MethodOptions

instance Data.ProtoLens.HasField "options" MethodDescriptorProto
         MethodDescriptorProto where
        field _
          = (Prelude..) maybe'options
              (Data.ProtoLens.maybeLens Data.Default.Class.def)

type instance
     Data.ProtoLens.Field "maybe'options" MethodDescriptorProto =
     Prelude.Maybe MethodOptions

instance Data.ProtoLens.HasField "maybe'options"
         MethodDescriptorProto MethodDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _MethodDescriptorProto'options
              (\ x__ y__ -> x__{_MethodDescriptorProto'options = y__})

type instance
     Data.ProtoLens.Field "clientStreaming" MethodDescriptorProto =
     Prelude.Bool

instance Data.ProtoLens.HasField "clientStreaming"
         MethodDescriptorProto MethodDescriptorProto where
        field _
          = (Prelude..) maybe'clientStreaming
              (Data.ProtoLens.maybeLens Prelude.False)

type instance
     Data.ProtoLens.Field "maybe'clientStreaming" MethodDescriptorProto
     = Prelude.Maybe Prelude.Bool

instance Data.ProtoLens.HasField "maybe'clientStreaming"
         MethodDescriptorProto MethodDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens
              _MethodDescriptorProto'clientStreaming
              (\ x__ y__ -> x__{_MethodDescriptorProto'clientStreaming = y__})

type instance
     Data.ProtoLens.Field "serverStreaming" MethodDescriptorProto =
     Prelude.Bool

instance Data.ProtoLens.HasField "serverStreaming"
         MethodDescriptorProto MethodDescriptorProto where
        field _
          = (Prelude..) maybe'serverStreaming
              (Data.ProtoLens.maybeLens Prelude.False)

type instance
     Data.ProtoLens.Field "maybe'serverStreaming" MethodDescriptorProto
     = Prelude.Maybe Prelude.Bool

instance Data.ProtoLens.HasField "maybe'serverStreaming"
         MethodDescriptorProto MethodDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens
              _MethodDescriptorProto'serverStreaming
              (\ x__ y__ -> x__{_MethodDescriptorProto'serverStreaming = y__})

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
                inputType__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "input_type"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'inputType)
                outputType__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "output_type"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'outputType)
                options__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "options"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor MethodOptions)
                      (Data.ProtoLens.OptionalField maybe'options)
                clientStreaming__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "client_streaming"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'clientStreaming)
                serverStreaming__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "server_streaming"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.OptionalField maybe'serverStreaming)
              in
              Data.ProtoLens.MessageDescriptor
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
                                   Prelude.Maybe Prelude.Bool,
                                   _MethodOptions'uninterpretedOption :: [UninterpretedOption]}
                   deriving (Prelude.Show, Prelude.Eq)

type instance Data.ProtoLens.Field "deprecated" MethodOptions =
     Prelude.Bool

instance Data.ProtoLens.HasField "deprecated" MethodOptions
         MethodOptions where
        field _
          = (Prelude..) maybe'deprecated
              (Data.ProtoLens.maybeLens Prelude.False)

type instance Data.ProtoLens.Field "maybe'deprecated" MethodOptions
     = Prelude.Maybe Prelude.Bool

instance Data.ProtoLens.HasField "maybe'deprecated" MethodOptions
         MethodOptions where
        field _
          = Lens.Family2.Unchecked.lens _MethodOptions'deprecated
              (\ x__ y__ -> x__{_MethodOptions'deprecated = y__})

type instance
     Data.ProtoLens.Field "uninterpretedOption" MethodOptions =
     [UninterpretedOption]

instance Data.ProtoLens.HasField "uninterpretedOption"
         MethodOptions MethodOptions where
        field _
          = Lens.Family2.Unchecked.lens _MethodOptions'uninterpretedOption
              (\ x__ y__ -> x__{_MethodOptions'uninterpretedOption = y__})

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
                uninterpretedOption__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "uninterpreted_option"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor UninterpretedOption)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         uninterpretedOption)
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 33, deprecated__field_descriptor),
                    (Data.ProtoLens.Tag 999, uninterpretedOption__field_descriptor)])
                (Data.Map.fromList
                   [("deprecated", deprecated__field_descriptor),
                    ("uninterpreted_option", uninterpretedOption__field_descriptor)])

data OneofDescriptorProto = OneofDescriptorProto{_OneofDescriptorProto'name
                                                 :: Prelude.Maybe Data.Text.Text}
                          deriving (Prelude.Show, Prelude.Eq)

type instance Data.ProtoLens.Field "name" OneofDescriptorProto =
     Data.Text.Text

instance Data.ProtoLens.HasField "name" OneofDescriptorProto
         OneofDescriptorProto where
        field _
          = (Prelude..) maybe'name
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'name" OneofDescriptorProto =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'name" OneofDescriptorProto
         OneofDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _OneofDescriptorProto'name
              (\ x__ y__ -> x__{_OneofDescriptorProto'name = y__})

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
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, name__field_descriptor)])
                (Data.Map.fromList [("name", name__field_descriptor)])

data ServiceDescriptorProto = ServiceDescriptorProto{_ServiceDescriptorProto'name
                                                     :: Prelude.Maybe Data.Text.Text,
                                                     _ServiceDescriptorProto'method ::
                                                     [MethodDescriptorProto],
                                                     _ServiceDescriptorProto'options ::
                                                     Prelude.Maybe ServiceOptions}
                            deriving (Prelude.Show, Prelude.Eq)

type instance Data.ProtoLens.Field "name" ServiceDescriptorProto =
     Data.Text.Text

instance Data.ProtoLens.HasField "name" ServiceDescriptorProto
         ServiceDescriptorProto where
        field _
          = (Prelude..) maybe'name
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'name" ServiceDescriptorProto =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'name"
         ServiceDescriptorProto ServiceDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _ServiceDescriptorProto'name
              (\ x__ y__ -> x__{_ServiceDescriptorProto'name = y__})

type instance Data.ProtoLens.Field "method" ServiceDescriptorProto
     = [MethodDescriptorProto]

instance Data.ProtoLens.HasField "method" ServiceDescriptorProto
         ServiceDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _ServiceDescriptorProto'method
              (\ x__ y__ -> x__{_ServiceDescriptorProto'method = y__})

type instance Data.ProtoLens.Field "options" ServiceDescriptorProto
     = ServiceOptions

instance Data.ProtoLens.HasField "options" ServiceDescriptorProto
         ServiceDescriptorProto where
        field _
          = (Prelude..) maybe'options
              (Data.ProtoLens.maybeLens Data.Default.Class.def)

type instance
     Data.ProtoLens.Field "maybe'options" ServiceDescriptorProto =
     Prelude.Maybe ServiceOptions

instance Data.ProtoLens.HasField "maybe'options"
         ServiceDescriptorProto ServiceDescriptorProto where
        field _
          = Lens.Family2.Unchecked.lens _ServiceDescriptorProto'options
              (\ x__ y__ -> x__{_ServiceDescriptorProto'options = y__})

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
                method__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "method"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor MethodDescriptorProto)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked method)
                options__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "options"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor ServiceOptions)
                      (Data.ProtoLens.OptionalField maybe'options)
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, name__field_descriptor),
                    (Data.ProtoLens.Tag 2, method__field_descriptor),
                    (Data.ProtoLens.Tag 3, options__field_descriptor)])
                (Data.Map.fromList
                   [("name", name__field_descriptor),
                    ("method", method__field_descriptor),
                    ("options", options__field_descriptor)])

data ServiceOptions = ServiceOptions{_ServiceOptions'deprecated ::
                                     Prelude.Maybe Prelude.Bool,
                                     _ServiceOptions'uninterpretedOption :: [UninterpretedOption]}
                    deriving (Prelude.Show, Prelude.Eq)

type instance Data.ProtoLens.Field "deprecated" ServiceOptions =
     Prelude.Bool

instance Data.ProtoLens.HasField "deprecated" ServiceOptions
         ServiceOptions where
        field _
          = (Prelude..) maybe'deprecated
              (Data.ProtoLens.maybeLens Prelude.False)

type instance
     Data.ProtoLens.Field "maybe'deprecated" ServiceOptions =
     Prelude.Maybe Prelude.Bool

instance Data.ProtoLens.HasField "maybe'deprecated" ServiceOptions
         ServiceOptions where
        field _
          = Lens.Family2.Unchecked.lens _ServiceOptions'deprecated
              (\ x__ y__ -> x__{_ServiceOptions'deprecated = y__})

type instance
     Data.ProtoLens.Field "uninterpretedOption" ServiceOptions =
     [UninterpretedOption]

instance Data.ProtoLens.HasField "uninterpretedOption"
         ServiceOptions ServiceOptions where
        field _
          = Lens.Family2.Unchecked.lens _ServiceOptions'uninterpretedOption
              (\ x__ y__ -> x__{_ServiceOptions'uninterpretedOption = y__})

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
                uninterpretedOption__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "uninterpreted_option"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor UninterpretedOption)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         uninterpretedOption)
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 33, deprecated__field_descriptor),
                    (Data.ProtoLens.Tag 999, uninterpretedOption__field_descriptor)])
                (Data.Map.fromList
                   [("deprecated", deprecated__field_descriptor),
                    ("uninterpreted_option", uninterpretedOption__field_descriptor)])

data SourceCodeInfo = SourceCodeInfo{_SourceCodeInfo'location ::
                                     [SourceCodeInfo'Location]}
                    deriving (Prelude.Show, Prelude.Eq)

type instance Data.ProtoLens.Field "location" SourceCodeInfo =
     [SourceCodeInfo'Location]

instance Data.ProtoLens.HasField "location" SourceCodeInfo
         SourceCodeInfo where
        field _
          = Lens.Family2.Unchecked.lens _SourceCodeInfo'location
              (\ x__ y__ -> x__{_SourceCodeInfo'location = y__})

instance Data.Default.Class.Default SourceCodeInfo where
        def = SourceCodeInfo{_SourceCodeInfo'location = []}

instance Data.ProtoLens.Message SourceCodeInfo where
        descriptor
          = let location__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "location"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor SourceCodeInfo'Location)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked location)
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, location__field_descriptor)])
                (Data.Map.fromList [("location", location__field_descriptor)])

data SourceCodeInfo'Location = SourceCodeInfo'Location{_SourceCodeInfo'Location'path
                                                       :: [Data.Int.Int32],
                                                       _SourceCodeInfo'Location'span ::
                                                       [Data.Int.Int32],
                                                       _SourceCodeInfo'Location'leadingComments ::
                                                       Prelude.Maybe Data.Text.Text,
                                                       _SourceCodeInfo'Location'trailingComments ::
                                                       Prelude.Maybe Data.Text.Text,
                                                       _SourceCodeInfo'Location'leadingDetachedComments
                                                       :: [Data.Text.Text]}
                             deriving (Prelude.Show, Prelude.Eq)

type instance Data.ProtoLens.Field "path" SourceCodeInfo'Location =
     [Data.Int.Int32]

instance Data.ProtoLens.HasField "path" SourceCodeInfo'Location
         SourceCodeInfo'Location where
        field _
          = Lens.Family2.Unchecked.lens _SourceCodeInfo'Location'path
              (\ x__ y__ -> x__{_SourceCodeInfo'Location'path = y__})

type instance Data.ProtoLens.Field "span" SourceCodeInfo'Location =
     [Data.Int.Int32]

instance Data.ProtoLens.HasField "span" SourceCodeInfo'Location
         SourceCodeInfo'Location where
        field _
          = Lens.Family2.Unchecked.lens _SourceCodeInfo'Location'span
              (\ x__ y__ -> x__{_SourceCodeInfo'Location'span = y__})

type instance
     Data.ProtoLens.Field "leadingComments" SourceCodeInfo'Location =
     Data.Text.Text

instance Data.ProtoLens.HasField "leadingComments"
         SourceCodeInfo'Location SourceCodeInfo'Location where
        field _
          = (Prelude..) maybe'leadingComments
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'leadingComments"
       SourceCodeInfo'Location
     = Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'leadingComments"
         SourceCodeInfo'Location SourceCodeInfo'Location where
        field _
          = Lens.Family2.Unchecked.lens
              _SourceCodeInfo'Location'leadingComments
              (\ x__ y__ -> x__{_SourceCodeInfo'Location'leadingComments = y__})

type instance
     Data.ProtoLens.Field "trailingComments" SourceCodeInfo'Location =
     Data.Text.Text

instance Data.ProtoLens.HasField "trailingComments"
         SourceCodeInfo'Location SourceCodeInfo'Location where
        field _
          = (Prelude..) maybe'trailingComments
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'trailingComments"
       SourceCodeInfo'Location
     = Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'trailingComments"
         SourceCodeInfo'Location SourceCodeInfo'Location where
        field _
          = Lens.Family2.Unchecked.lens
              _SourceCodeInfo'Location'trailingComments
              (\ x__ y__ -> x__{_SourceCodeInfo'Location'trailingComments = y__})

type instance
     Data.ProtoLens.Field "leadingDetachedComments"
       SourceCodeInfo'Location
     = [Data.Text.Text]

instance Data.ProtoLens.HasField "leadingDetachedComments"
         SourceCodeInfo'Location SourceCodeInfo'Location where
        field _
          = Lens.Family2.Unchecked.lens
              _SourceCodeInfo'Location'leadingDetachedComments
              (\ x__ y__ ->
                 x__{_SourceCodeInfo'Location'leadingDetachedComments = y__})

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
                span__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "span"
                      (Data.ProtoLens.Int32Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Packed span)
                leadingComments__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "leading_comments"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'leadingComments)
                trailingComments__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "trailing_comments"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'trailingComments)
                leadingDetachedComments__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "leading_detached_comments"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         leadingDetachedComments)
              in
              Data.ProtoLens.MessageDescriptor
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
                                               :: [UninterpretedOption'NamePart],
                                               _UninterpretedOption'identifierValue ::
                                               Prelude.Maybe Data.Text.Text,
                                               _UninterpretedOption'positiveIntValue ::
                                               Prelude.Maybe Data.Word.Word64,
                                               _UninterpretedOption'negativeIntValue ::
                                               Prelude.Maybe Data.Int.Int64,
                                               _UninterpretedOption'doubleValue ::
                                               Prelude.Maybe Prelude.Double,
                                               _UninterpretedOption'stringValue ::
                                               Prelude.Maybe Data.ByteString.ByteString,
                                               _UninterpretedOption'aggregateValue ::
                                               Prelude.Maybe Data.Text.Text}
                         deriving (Prelude.Show, Prelude.Eq)

type instance Data.ProtoLens.Field "name" UninterpretedOption =
     [UninterpretedOption'NamePart]

instance Data.ProtoLens.HasField "name" UninterpretedOption
         UninterpretedOption where
        field _
          = Lens.Family2.Unchecked.lens _UninterpretedOption'name
              (\ x__ y__ -> x__{_UninterpretedOption'name = y__})

type instance
     Data.ProtoLens.Field "identifierValue" UninterpretedOption =
     Data.Text.Text

instance Data.ProtoLens.HasField "identifierValue"
         UninterpretedOption UninterpretedOption where
        field _
          = (Prelude..) maybe'identifierValue
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'identifierValue" UninterpretedOption =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'identifierValue"
         UninterpretedOption UninterpretedOption where
        field _
          = Lens.Family2.Unchecked.lens _UninterpretedOption'identifierValue
              (\ x__ y__ -> x__{_UninterpretedOption'identifierValue = y__})

type instance
     Data.ProtoLens.Field "positiveIntValue" UninterpretedOption =
     Data.Word.Word64

instance Data.ProtoLens.HasField "positiveIntValue"
         UninterpretedOption UninterpretedOption where
        field _
          = (Prelude..) maybe'positiveIntValue
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'positiveIntValue" UninterpretedOption =
     Prelude.Maybe Data.Word.Word64

instance Data.ProtoLens.HasField "maybe'positiveIntValue"
         UninterpretedOption UninterpretedOption where
        field _
          = Lens.Family2.Unchecked.lens _UninterpretedOption'positiveIntValue
              (\ x__ y__ -> x__{_UninterpretedOption'positiveIntValue = y__})

type instance
     Data.ProtoLens.Field "negativeIntValue" UninterpretedOption =
     Data.Int.Int64

instance Data.ProtoLens.HasField "negativeIntValue"
         UninterpretedOption UninterpretedOption where
        field _
          = (Prelude..) maybe'negativeIntValue
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'negativeIntValue" UninterpretedOption =
     Prelude.Maybe Data.Int.Int64

instance Data.ProtoLens.HasField "maybe'negativeIntValue"
         UninterpretedOption UninterpretedOption where
        field _
          = Lens.Family2.Unchecked.lens _UninterpretedOption'negativeIntValue
              (\ x__ y__ -> x__{_UninterpretedOption'negativeIntValue = y__})

type instance
     Data.ProtoLens.Field "doubleValue" UninterpretedOption =
     Prelude.Double

instance Data.ProtoLens.HasField "doubleValue" UninterpretedOption
         UninterpretedOption where
        field _
          = (Prelude..) maybe'doubleValue
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'doubleValue" UninterpretedOption =
     Prelude.Maybe Prelude.Double

instance Data.ProtoLens.HasField "maybe'doubleValue"
         UninterpretedOption UninterpretedOption where
        field _
          = Lens.Family2.Unchecked.lens _UninterpretedOption'doubleValue
              (\ x__ y__ -> x__{_UninterpretedOption'doubleValue = y__})

type instance
     Data.ProtoLens.Field "stringValue" UninterpretedOption =
     Data.ByteString.ByteString

instance Data.ProtoLens.HasField "stringValue" UninterpretedOption
         UninterpretedOption where
        field _
          = (Prelude..) maybe'stringValue
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'stringValue" UninterpretedOption =
     Prelude.Maybe Data.ByteString.ByteString

instance Data.ProtoLens.HasField "maybe'stringValue"
         UninterpretedOption UninterpretedOption where
        field _
          = Lens.Family2.Unchecked.lens _UninterpretedOption'stringValue
              (\ x__ y__ -> x__{_UninterpretedOption'stringValue = y__})

type instance
     Data.ProtoLens.Field "aggregateValue" UninterpretedOption =
     Data.Text.Text

instance Data.ProtoLens.HasField "aggregateValue"
         UninterpretedOption UninterpretedOption where
        field _
          = (Prelude..) maybe'aggregateValue
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'aggregateValue" UninterpretedOption =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'aggregateValue"
         UninterpretedOption UninterpretedOption where
        field _
          = Lens.Family2.Unchecked.lens _UninterpretedOption'aggregateValue
              (\ x__ y__ -> x__{_UninterpretedOption'aggregateValue = y__})

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
                identifierValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "identifier_value"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'identifierValue)
                positiveIntValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "positive_int_value"
                      (Data.ProtoLens.UInt64Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Word.Word64)
                      (Data.ProtoLens.OptionalField maybe'positiveIntValue)
                negativeIntValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "negative_int_value"
                      (Data.ProtoLens.Int64Field ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
                      (Data.ProtoLens.OptionalField maybe'negativeIntValue)
                doubleValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "double_value"
                      (Data.ProtoLens.DoubleField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Double)
                      (Data.ProtoLens.OptionalField maybe'doubleValue)
                stringValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "string_value"
                      (Data.ProtoLens.BytesField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
                      (Data.ProtoLens.OptionalField maybe'stringValue)
                aggregateValue__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "aggregate_value"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'aggregateValue)
              in
              Data.ProtoLens.MessageDescriptor
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
                                                                 :: Data.Text.Text,
                                                                 _UninterpretedOption'NamePart'isExtension
                                                                 :: Prelude.Bool}
                                  deriving (Prelude.Show, Prelude.Eq)

type instance
     Data.ProtoLens.Field "namePart" UninterpretedOption'NamePart =
     Data.Text.Text

instance Data.ProtoLens.HasField "namePart"
         UninterpretedOption'NamePart UninterpretedOption'NamePart where
        field _
          = Lens.Family2.Unchecked.lens
              _UninterpretedOption'NamePart'namePart
              (\ x__ y__ -> x__{_UninterpretedOption'NamePart'namePart = y__})

type instance
     Data.ProtoLens.Field "isExtension" UninterpretedOption'NamePart =
     Prelude.Bool

instance Data.ProtoLens.HasField "isExtension"
         UninterpretedOption'NamePart UninterpretedOption'NamePart where
        field _
          = Lens.Family2.Unchecked.lens
              _UninterpretedOption'NamePart'isExtension
              (\ x__ y__ -> x__{_UninterpretedOption'NamePart'isExtension = y__})

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
                isExtension__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "is_extension"
                      (Data.ProtoLens.BoolField ::
                         Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
                      (Data.ProtoLens.PlainField Data.ProtoLens.Required isExtension)
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, namePart__field_descriptor),
                    (Data.ProtoLens.Tag 2, isExtension__field_descriptor)])
                (Data.Map.fromList
                   [("name_part", namePart__field_descriptor),
                    ("is_extension", isExtension__field_descriptor)])

aggregateValue ::
               forall msg msg' .
                 Data.ProtoLens.HasField "aggregateValue" msg msg' =>
                 Lens.Family2.Lens msg msg'
                   (Data.ProtoLens.Field "aggregateValue" msg)
                   (Data.ProtoLens.Field "aggregateValue" msg')
aggregateValue
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "aggregateValue")

allowAlias ::
           forall msg msg' . Data.ProtoLens.HasField "allowAlias" msg msg' =>
             Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "allowAlias" msg)
               (Data.ProtoLens.Field "allowAlias" msg')
allowAlias
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "allowAlias")

annotation ::
           forall msg msg' . Data.ProtoLens.HasField "annotation" msg msg' =>
             Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "annotation" msg)
               (Data.ProtoLens.Field "annotation" msg')
annotation
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "annotation")

begin ::
      forall msg msg' . Data.ProtoLens.HasField "begin" msg msg' =>
        Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "begin" msg)
          (Data.ProtoLens.Field "begin" msg')
begin
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "begin")

ccEnableArenas ::
               forall msg msg' .
                 Data.ProtoLens.HasField "ccEnableArenas" msg msg' =>
                 Lens.Family2.Lens msg msg'
                   (Data.ProtoLens.Field "ccEnableArenas" msg)
                   (Data.ProtoLens.Field "ccEnableArenas" msg')
ccEnableArenas
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "ccEnableArenas")

ccGenericServices ::
                  forall msg msg' .
                    Data.ProtoLens.HasField "ccGenericServices" msg msg' =>
                    Lens.Family2.Lens msg msg'
                      (Data.ProtoLens.Field "ccGenericServices" msg)
                      (Data.ProtoLens.Field "ccGenericServices" msg')
ccGenericServices
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "ccGenericServices")

clientStreaming ::
                forall msg msg' .
                  Data.ProtoLens.HasField "clientStreaming" msg msg' =>
                  Lens.Family2.Lens msg msg'
                    (Data.ProtoLens.Field "clientStreaming" msg)
                    (Data.ProtoLens.Field "clientStreaming" msg')
clientStreaming
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "clientStreaming")

csharpNamespace ::
                forall msg msg' .
                  Data.ProtoLens.HasField "csharpNamespace" msg msg' =>
                  Lens.Family2.Lens msg msg'
                    (Data.ProtoLens.Field "csharpNamespace" msg)
                    (Data.ProtoLens.Field "csharpNamespace" msg')
csharpNamespace
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "csharpNamespace")

ctype ::
      forall msg msg' . Data.ProtoLens.HasField "ctype" msg msg' =>
        Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "ctype" msg)
          (Data.ProtoLens.Field "ctype" msg')
ctype
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "ctype")

defaultValue ::
             forall msg msg' .
               Data.ProtoLens.HasField "defaultValue" msg msg' =>
               Lens.Family2.Lens msg msg'
                 (Data.ProtoLens.Field "defaultValue" msg)
                 (Data.ProtoLens.Field "defaultValue" msg')
defaultValue
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "defaultValue")

dependency ::
           forall msg msg' . Data.ProtoLens.HasField "dependency" msg msg' =>
             Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "dependency" msg)
               (Data.ProtoLens.Field "dependency" msg')
dependency
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "dependency")

deprecated ::
           forall msg msg' . Data.ProtoLens.HasField "deprecated" msg msg' =>
             Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "deprecated" msg)
               (Data.ProtoLens.Field "deprecated" msg')
deprecated
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "deprecated")

doubleValue ::
            forall msg msg' . Data.ProtoLens.HasField "doubleValue" msg msg' =>
              Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "doubleValue" msg)
                (Data.ProtoLens.Field "doubleValue" msg')
doubleValue
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "doubleValue")

end ::
    forall msg msg' . Data.ProtoLens.HasField "end" msg msg' =>
      Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "end" msg)
        (Data.ProtoLens.Field "end" msg')
end
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "end")

enumType ::
         forall msg msg' . Data.ProtoLens.HasField "enumType" msg msg' =>
           Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "enumType" msg)
             (Data.ProtoLens.Field "enumType" msg')
enumType
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "enumType")

extendee ::
         forall msg msg' . Data.ProtoLens.HasField "extendee" msg msg' =>
           Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "extendee" msg)
             (Data.ProtoLens.Field "extendee" msg')
extendee
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "extendee")

extension ::
          forall msg msg' . Data.ProtoLens.HasField "extension" msg msg' =>
            Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "extension" msg)
              (Data.ProtoLens.Field "extension" msg')
extension
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "extension")

extensionRange ::
               forall msg msg' .
                 Data.ProtoLens.HasField "extensionRange" msg msg' =>
                 Lens.Family2.Lens msg msg'
                   (Data.ProtoLens.Field "extensionRange" msg)
                   (Data.ProtoLens.Field "extensionRange" msg')
extensionRange
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "extensionRange")

field ::
      forall msg msg' . Data.ProtoLens.HasField "field" msg msg' =>
        Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "field" msg)
          (Data.ProtoLens.Field "field" msg')
field
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "field")

file ::
     forall msg msg' . Data.ProtoLens.HasField "file" msg msg' =>
       Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "file" msg)
         (Data.ProtoLens.Field "file" msg')
file
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "file")

goPackage ::
          forall msg msg' . Data.ProtoLens.HasField "goPackage" msg msg' =>
            Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "goPackage" msg)
              (Data.ProtoLens.Field "goPackage" msg')
goPackage
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "goPackage")

identifierValue ::
                forall msg msg' .
                  Data.ProtoLens.HasField "identifierValue" msg msg' =>
                  Lens.Family2.Lens msg msg'
                    (Data.ProtoLens.Field "identifierValue" msg)
                    (Data.ProtoLens.Field "identifierValue" msg')
identifierValue
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "identifierValue")

inputType ::
          forall msg msg' . Data.ProtoLens.HasField "inputType" msg msg' =>
            Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "inputType" msg)
              (Data.ProtoLens.Field "inputType" msg')
inputType
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "inputType")

isExtension ::
            forall msg msg' . Data.ProtoLens.HasField "isExtension" msg msg' =>
              Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "isExtension" msg)
                (Data.ProtoLens.Field "isExtension" msg')
isExtension
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "isExtension")

javaGenerateEqualsAndHash ::
                          forall msg msg' .
                            Data.ProtoLens.HasField "javaGenerateEqualsAndHash" msg msg' =>
                            Lens.Family2.Lens msg msg'
                              (Data.ProtoLens.Field "javaGenerateEqualsAndHash" msg)
                              (Data.ProtoLens.Field "javaGenerateEqualsAndHash" msg')
javaGenerateEqualsAndHash
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "javaGenerateEqualsAndHash")

javaGenericServices ::
                    forall msg msg' .
                      Data.ProtoLens.HasField "javaGenericServices" msg msg' =>
                      Lens.Family2.Lens msg msg'
                        (Data.ProtoLens.Field "javaGenericServices" msg)
                        (Data.ProtoLens.Field "javaGenericServices" msg')
javaGenericServices
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "javaGenericServices")

javaMultipleFiles ::
                  forall msg msg' .
                    Data.ProtoLens.HasField "javaMultipleFiles" msg msg' =>
                    Lens.Family2.Lens msg msg'
                      (Data.ProtoLens.Field "javaMultipleFiles" msg)
                      (Data.ProtoLens.Field "javaMultipleFiles" msg')
javaMultipleFiles
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "javaMultipleFiles")

javaOuterClassname ::
                   forall msg msg' .
                     Data.ProtoLens.HasField "javaOuterClassname" msg msg' =>
                     Lens.Family2.Lens msg msg'
                       (Data.ProtoLens.Field "javaOuterClassname" msg)
                       (Data.ProtoLens.Field "javaOuterClassname" msg')
javaOuterClassname
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "javaOuterClassname")

javaPackage ::
            forall msg msg' . Data.ProtoLens.HasField "javaPackage" msg msg' =>
              Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "javaPackage" msg)
                (Data.ProtoLens.Field "javaPackage" msg')
javaPackage
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "javaPackage")

javaStringCheckUtf8 ::
                    forall msg msg' .
                      Data.ProtoLens.HasField "javaStringCheckUtf8" msg msg' =>
                      Lens.Family2.Lens msg msg'
                        (Data.ProtoLens.Field "javaStringCheckUtf8" msg)
                        (Data.ProtoLens.Field "javaStringCheckUtf8" msg')
javaStringCheckUtf8
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "javaStringCheckUtf8")

jsonName ::
         forall msg msg' . Data.ProtoLens.HasField "jsonName" msg msg' =>
           Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "jsonName" msg)
             (Data.ProtoLens.Field "jsonName" msg')
jsonName
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "jsonName")

jstype ::
       forall msg msg' . Data.ProtoLens.HasField "jstype" msg msg' =>
         Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "jstype" msg)
           (Data.ProtoLens.Field "jstype" msg')
jstype
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "jstype")

label ::
      forall msg msg' . Data.ProtoLens.HasField "label" msg msg' =>
        Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "label" msg)
          (Data.ProtoLens.Field "label" msg')
label
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "label")

lazy ::
     forall msg msg' . Data.ProtoLens.HasField "lazy" msg msg' =>
       Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "lazy" msg)
         (Data.ProtoLens.Field "lazy" msg')
lazy
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "lazy")

leadingComments ::
                forall msg msg' .
                  Data.ProtoLens.HasField "leadingComments" msg msg' =>
                  Lens.Family2.Lens msg msg'
                    (Data.ProtoLens.Field "leadingComments" msg)
                    (Data.ProtoLens.Field "leadingComments" msg')
leadingComments
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "leadingComments")

leadingDetachedComments ::
                        forall msg msg' .
                          Data.ProtoLens.HasField "leadingDetachedComments" msg msg' =>
                          Lens.Family2.Lens msg msg'
                            (Data.ProtoLens.Field "leadingDetachedComments" msg)
                            (Data.ProtoLens.Field "leadingDetachedComments" msg')
leadingDetachedComments
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "leadingDetachedComments")

location ::
         forall msg msg' . Data.ProtoLens.HasField "location" msg msg' =>
           Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "location" msg)
             (Data.ProtoLens.Field "location" msg')
location
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "location")

mapEntry ::
         forall msg msg' . Data.ProtoLens.HasField "mapEntry" msg msg' =>
           Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "mapEntry" msg)
             (Data.ProtoLens.Field "mapEntry" msg')
mapEntry
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "mapEntry")

maybe'aggregateValue ::
                     forall msg msg' .
                       Data.ProtoLens.HasField "maybe'aggregateValue" msg msg' =>
                       Lens.Family2.Lens msg msg'
                         (Data.ProtoLens.Field "maybe'aggregateValue" msg)
                         (Data.ProtoLens.Field "maybe'aggregateValue" msg')
maybe'aggregateValue
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'aggregateValue")

maybe'allowAlias ::
                 forall msg msg' .
                   Data.ProtoLens.HasField "maybe'allowAlias" msg msg' =>
                   Lens.Family2.Lens msg msg'
                     (Data.ProtoLens.Field "maybe'allowAlias" msg)
                     (Data.ProtoLens.Field "maybe'allowAlias" msg')
maybe'allowAlias
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'allowAlias")

maybe'begin ::
            forall msg msg' . Data.ProtoLens.HasField "maybe'begin" msg msg' =>
              Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "maybe'begin" msg)
                (Data.ProtoLens.Field "maybe'begin" msg')
maybe'begin
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "maybe'begin")

maybe'ccEnableArenas ::
                     forall msg msg' .
                       Data.ProtoLens.HasField "maybe'ccEnableArenas" msg msg' =>
                       Lens.Family2.Lens msg msg'
                         (Data.ProtoLens.Field "maybe'ccEnableArenas" msg)
                         (Data.ProtoLens.Field "maybe'ccEnableArenas" msg')
maybe'ccEnableArenas
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'ccEnableArenas")

maybe'ccGenericServices ::
                        forall msg msg' .
                          Data.ProtoLens.HasField "maybe'ccGenericServices" msg msg' =>
                          Lens.Family2.Lens msg msg'
                            (Data.ProtoLens.Field "maybe'ccGenericServices" msg)
                            (Data.ProtoLens.Field "maybe'ccGenericServices" msg')
maybe'ccGenericServices
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'ccGenericServices")

maybe'clientStreaming ::
                      forall msg msg' .
                        Data.ProtoLens.HasField "maybe'clientStreaming" msg msg' =>
                        Lens.Family2.Lens msg msg'
                          (Data.ProtoLens.Field "maybe'clientStreaming" msg)
                          (Data.ProtoLens.Field "maybe'clientStreaming" msg')
maybe'clientStreaming
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'clientStreaming")

maybe'csharpNamespace ::
                      forall msg msg' .
                        Data.ProtoLens.HasField "maybe'csharpNamespace" msg msg' =>
                        Lens.Family2.Lens msg msg'
                          (Data.ProtoLens.Field "maybe'csharpNamespace" msg)
                          (Data.ProtoLens.Field "maybe'csharpNamespace" msg')
maybe'csharpNamespace
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'csharpNamespace")

maybe'ctype ::
            forall msg msg' . Data.ProtoLens.HasField "maybe'ctype" msg msg' =>
              Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "maybe'ctype" msg)
                (Data.ProtoLens.Field "maybe'ctype" msg')
maybe'ctype
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "maybe'ctype")

maybe'defaultValue ::
                   forall msg msg' .
                     Data.ProtoLens.HasField "maybe'defaultValue" msg msg' =>
                     Lens.Family2.Lens msg msg'
                       (Data.ProtoLens.Field "maybe'defaultValue" msg)
                       (Data.ProtoLens.Field "maybe'defaultValue" msg')
maybe'defaultValue
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'defaultValue")

maybe'deprecated ::
                 forall msg msg' .
                   Data.ProtoLens.HasField "maybe'deprecated" msg msg' =>
                   Lens.Family2.Lens msg msg'
                     (Data.ProtoLens.Field "maybe'deprecated" msg)
                     (Data.ProtoLens.Field "maybe'deprecated" msg')
maybe'deprecated
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'deprecated")

maybe'doubleValue ::
                  forall msg msg' .
                    Data.ProtoLens.HasField "maybe'doubleValue" msg msg' =>
                    Lens.Family2.Lens msg msg'
                      (Data.ProtoLens.Field "maybe'doubleValue" msg)
                      (Data.ProtoLens.Field "maybe'doubleValue" msg')
maybe'doubleValue
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'doubleValue")

maybe'end ::
          forall msg msg' . Data.ProtoLens.HasField "maybe'end" msg msg' =>
            Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "maybe'end" msg)
              (Data.ProtoLens.Field "maybe'end" msg')
maybe'end
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "maybe'end")

maybe'extendee ::
               forall msg msg' .
                 Data.ProtoLens.HasField "maybe'extendee" msg msg' =>
                 Lens.Family2.Lens msg msg'
                   (Data.ProtoLens.Field "maybe'extendee" msg)
                   (Data.ProtoLens.Field "maybe'extendee" msg')
maybe'extendee
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'extendee")

maybe'goPackage ::
                forall msg msg' .
                  Data.ProtoLens.HasField "maybe'goPackage" msg msg' =>
                  Lens.Family2.Lens msg msg'
                    (Data.ProtoLens.Field "maybe'goPackage" msg)
                    (Data.ProtoLens.Field "maybe'goPackage" msg')
maybe'goPackage
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'goPackage")

maybe'identifierValue ::
                      forall msg msg' .
                        Data.ProtoLens.HasField "maybe'identifierValue" msg msg' =>
                        Lens.Family2.Lens msg msg'
                          (Data.ProtoLens.Field "maybe'identifierValue" msg)
                          (Data.ProtoLens.Field "maybe'identifierValue" msg')
maybe'identifierValue
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'identifierValue")

maybe'inputType ::
                forall msg msg' .
                  Data.ProtoLens.HasField "maybe'inputType" msg msg' =>
                  Lens.Family2.Lens msg msg'
                    (Data.ProtoLens.Field "maybe'inputType" msg)
                    (Data.ProtoLens.Field "maybe'inputType" msg')
maybe'inputType
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'inputType")

maybe'javaGenerateEqualsAndHash ::
                                forall msg msg' .
                                  Data.ProtoLens.HasField "maybe'javaGenerateEqualsAndHash" msg
                                    msg' =>
                                  Lens.Family2.Lens msg msg'
                                    (Data.ProtoLens.Field "maybe'javaGenerateEqualsAndHash" msg)
                                    (Data.ProtoLens.Field "maybe'javaGenerateEqualsAndHash" msg')
maybe'javaGenerateEqualsAndHash
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'javaGenerateEqualsAndHash")

maybe'javaGenericServices ::
                          forall msg msg' .
                            Data.ProtoLens.HasField "maybe'javaGenericServices" msg msg' =>
                            Lens.Family2.Lens msg msg'
                              (Data.ProtoLens.Field "maybe'javaGenericServices" msg)
                              (Data.ProtoLens.Field "maybe'javaGenericServices" msg')
maybe'javaGenericServices
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'javaGenericServices")

maybe'javaMultipleFiles ::
                        forall msg msg' .
                          Data.ProtoLens.HasField "maybe'javaMultipleFiles" msg msg' =>
                          Lens.Family2.Lens msg msg'
                            (Data.ProtoLens.Field "maybe'javaMultipleFiles" msg)
                            (Data.ProtoLens.Field "maybe'javaMultipleFiles" msg')
maybe'javaMultipleFiles
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'javaMultipleFiles")

maybe'javaOuterClassname ::
                         forall msg msg' .
                           Data.ProtoLens.HasField "maybe'javaOuterClassname" msg msg' =>
                           Lens.Family2.Lens msg msg'
                             (Data.ProtoLens.Field "maybe'javaOuterClassname" msg)
                             (Data.ProtoLens.Field "maybe'javaOuterClassname" msg')
maybe'javaOuterClassname
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'javaOuterClassname")

maybe'javaPackage ::
                  forall msg msg' .
                    Data.ProtoLens.HasField "maybe'javaPackage" msg msg' =>
                    Lens.Family2.Lens msg msg'
                      (Data.ProtoLens.Field "maybe'javaPackage" msg)
                      (Data.ProtoLens.Field "maybe'javaPackage" msg')
maybe'javaPackage
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'javaPackage")

maybe'javaStringCheckUtf8 ::
                          forall msg msg' .
                            Data.ProtoLens.HasField "maybe'javaStringCheckUtf8" msg msg' =>
                            Lens.Family2.Lens msg msg'
                              (Data.ProtoLens.Field "maybe'javaStringCheckUtf8" msg)
                              (Data.ProtoLens.Field "maybe'javaStringCheckUtf8" msg')
maybe'javaStringCheckUtf8
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'javaStringCheckUtf8")

maybe'jsonName ::
               forall msg msg' .
                 Data.ProtoLens.HasField "maybe'jsonName" msg msg' =>
                 Lens.Family2.Lens msg msg'
                   (Data.ProtoLens.Field "maybe'jsonName" msg)
                   (Data.ProtoLens.Field "maybe'jsonName" msg')
maybe'jsonName
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'jsonName")

maybe'jstype ::
             forall msg msg' .
               Data.ProtoLens.HasField "maybe'jstype" msg msg' =>
               Lens.Family2.Lens msg msg'
                 (Data.ProtoLens.Field "maybe'jstype" msg)
                 (Data.ProtoLens.Field "maybe'jstype" msg')
maybe'jstype
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "maybe'jstype")

maybe'label ::
            forall msg msg' . Data.ProtoLens.HasField "maybe'label" msg msg' =>
              Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "maybe'label" msg)
                (Data.ProtoLens.Field "maybe'label" msg')
maybe'label
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "maybe'label")

maybe'lazy ::
           forall msg msg' . Data.ProtoLens.HasField "maybe'lazy" msg msg' =>
             Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "maybe'lazy" msg)
               (Data.ProtoLens.Field "maybe'lazy" msg')
maybe'lazy
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "maybe'lazy")

maybe'leadingComments ::
                      forall msg msg' .
                        Data.ProtoLens.HasField "maybe'leadingComments" msg msg' =>
                        Lens.Family2.Lens msg msg'
                          (Data.ProtoLens.Field "maybe'leadingComments" msg)
                          (Data.ProtoLens.Field "maybe'leadingComments" msg')
maybe'leadingComments
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'leadingComments")

maybe'mapEntry ::
               forall msg msg' .
                 Data.ProtoLens.HasField "maybe'mapEntry" msg msg' =>
                 Lens.Family2.Lens msg msg'
                   (Data.ProtoLens.Field "maybe'mapEntry" msg)
                   (Data.ProtoLens.Field "maybe'mapEntry" msg')
maybe'mapEntry
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'mapEntry")

maybe'messageSetWireFormat ::
                           forall msg msg' .
                             Data.ProtoLens.HasField "maybe'messageSetWireFormat" msg msg' =>
                             Lens.Family2.Lens msg msg'
                               (Data.ProtoLens.Field "maybe'messageSetWireFormat" msg)
                               (Data.ProtoLens.Field "maybe'messageSetWireFormat" msg')
maybe'messageSetWireFormat
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'messageSetWireFormat")

maybe'name ::
           forall msg msg' . Data.ProtoLens.HasField "maybe'name" msg msg' =>
             Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "maybe'name" msg)
               (Data.ProtoLens.Field "maybe'name" msg')
maybe'name
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "maybe'name")

maybe'negativeIntValue ::
                       forall msg msg' .
                         Data.ProtoLens.HasField "maybe'negativeIntValue" msg msg' =>
                         Lens.Family2.Lens msg msg'
                           (Data.ProtoLens.Field "maybe'negativeIntValue" msg)
                           (Data.ProtoLens.Field "maybe'negativeIntValue" msg')
maybe'negativeIntValue
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'negativeIntValue")

maybe'noStandardDescriptorAccessor ::
                                   forall msg msg' .
                                     Data.ProtoLens.HasField "maybe'noStandardDescriptorAccessor"
                                       msg msg' =>
                                     Lens.Family2.Lens msg msg'
                                       (Data.ProtoLens.Field "maybe'noStandardDescriptorAccessor"
                                          msg)
                                       (Data.ProtoLens.Field "maybe'noStandardDescriptorAccessor"
                                          msg')
maybe'noStandardDescriptorAccessor
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'noStandardDescriptorAccessor")

maybe'number ::
             forall msg msg' .
               Data.ProtoLens.HasField "maybe'number" msg msg' =>
               Lens.Family2.Lens msg msg'
                 (Data.ProtoLens.Field "maybe'number" msg)
                 (Data.ProtoLens.Field "maybe'number" msg')
maybe'number
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "maybe'number")

maybe'objcClassPrefix ::
                      forall msg msg' .
                        Data.ProtoLens.HasField "maybe'objcClassPrefix" msg msg' =>
                        Lens.Family2.Lens msg msg'
                          (Data.ProtoLens.Field "maybe'objcClassPrefix" msg)
                          (Data.ProtoLens.Field "maybe'objcClassPrefix" msg')
maybe'objcClassPrefix
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'objcClassPrefix")

maybe'oneofIndex ::
                 forall msg msg' .
                   Data.ProtoLens.HasField "maybe'oneofIndex" msg msg' =>
                   Lens.Family2.Lens msg msg'
                     (Data.ProtoLens.Field "maybe'oneofIndex" msg)
                     (Data.ProtoLens.Field "maybe'oneofIndex" msg')
maybe'oneofIndex
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'oneofIndex")

maybe'optimizeFor ::
                  forall msg msg' .
                    Data.ProtoLens.HasField "maybe'optimizeFor" msg msg' =>
                    Lens.Family2.Lens msg msg'
                      (Data.ProtoLens.Field "maybe'optimizeFor" msg)
                      (Data.ProtoLens.Field "maybe'optimizeFor" msg')
maybe'optimizeFor
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'optimizeFor")

maybe'options ::
              forall msg msg' .
                Data.ProtoLens.HasField "maybe'options" msg msg' =>
                Lens.Family2.Lens msg msg'
                  (Data.ProtoLens.Field "maybe'options" msg)
                  (Data.ProtoLens.Field "maybe'options" msg')
maybe'options
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'options")

maybe'outputType ::
                 forall msg msg' .
                   Data.ProtoLens.HasField "maybe'outputType" msg msg' =>
                   Lens.Family2.Lens msg msg'
                     (Data.ProtoLens.Field "maybe'outputType" msg)
                     (Data.ProtoLens.Field "maybe'outputType" msg')
maybe'outputType
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'outputType")

maybe'package ::
              forall msg msg' .
                Data.ProtoLens.HasField "maybe'package" msg msg' =>
                Lens.Family2.Lens msg msg'
                  (Data.ProtoLens.Field "maybe'package" msg)
                  (Data.ProtoLens.Field "maybe'package" msg')
maybe'package
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'package")

maybe'packed ::
             forall msg msg' .
               Data.ProtoLens.HasField "maybe'packed" msg msg' =>
               Lens.Family2.Lens msg msg'
                 (Data.ProtoLens.Field "maybe'packed" msg)
                 (Data.ProtoLens.Field "maybe'packed" msg')
maybe'packed
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "maybe'packed")

maybe'positiveIntValue ::
                       forall msg msg' .
                         Data.ProtoLens.HasField "maybe'positiveIntValue" msg msg' =>
                         Lens.Family2.Lens msg msg'
                           (Data.ProtoLens.Field "maybe'positiveIntValue" msg)
                           (Data.ProtoLens.Field "maybe'positiveIntValue" msg')
maybe'positiveIntValue
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'positiveIntValue")

maybe'pyGenericServices ::
                        forall msg msg' .
                          Data.ProtoLens.HasField "maybe'pyGenericServices" msg msg' =>
                          Lens.Family2.Lens msg msg'
                            (Data.ProtoLens.Field "maybe'pyGenericServices" msg)
                            (Data.ProtoLens.Field "maybe'pyGenericServices" msg')
maybe'pyGenericServices
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'pyGenericServices")

maybe'serverStreaming ::
                      forall msg msg' .
                        Data.ProtoLens.HasField "maybe'serverStreaming" msg msg' =>
                        Lens.Family2.Lens msg msg'
                          (Data.ProtoLens.Field "maybe'serverStreaming" msg)
                          (Data.ProtoLens.Field "maybe'serverStreaming" msg')
maybe'serverStreaming
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'serverStreaming")

maybe'sourceCodeInfo ::
                     forall msg msg' .
                       Data.ProtoLens.HasField "maybe'sourceCodeInfo" msg msg' =>
                       Lens.Family2.Lens msg msg'
                         (Data.ProtoLens.Field "maybe'sourceCodeInfo" msg)
                         (Data.ProtoLens.Field "maybe'sourceCodeInfo" msg')
maybe'sourceCodeInfo
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'sourceCodeInfo")

maybe'sourceFile ::
                 forall msg msg' .
                   Data.ProtoLens.HasField "maybe'sourceFile" msg msg' =>
                   Lens.Family2.Lens msg msg'
                     (Data.ProtoLens.Field "maybe'sourceFile" msg)
                     (Data.ProtoLens.Field "maybe'sourceFile" msg')
maybe'sourceFile
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'sourceFile")

maybe'start ::
            forall msg msg' . Data.ProtoLens.HasField "maybe'start" msg msg' =>
              Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "maybe'start" msg)
                (Data.ProtoLens.Field "maybe'start" msg')
maybe'start
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "maybe'start")

maybe'stringValue ::
                  forall msg msg' .
                    Data.ProtoLens.HasField "maybe'stringValue" msg msg' =>
                    Lens.Family2.Lens msg msg'
                      (Data.ProtoLens.Field "maybe'stringValue" msg)
                      (Data.ProtoLens.Field "maybe'stringValue" msg')
maybe'stringValue
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'stringValue")

maybe'syntax ::
             forall msg msg' .
               Data.ProtoLens.HasField "maybe'syntax" msg msg' =>
               Lens.Family2.Lens msg msg'
                 (Data.ProtoLens.Field "maybe'syntax" msg)
                 (Data.ProtoLens.Field "maybe'syntax" msg')
maybe'syntax
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "maybe'syntax")

maybe'trailingComments ::
                       forall msg msg' .
                         Data.ProtoLens.HasField "maybe'trailingComments" msg msg' =>
                         Lens.Family2.Lens msg msg'
                           (Data.ProtoLens.Field "maybe'trailingComments" msg)
                           (Data.ProtoLens.Field "maybe'trailingComments" msg')
maybe'trailingComments
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'trailingComments")

maybe'type' ::
            forall msg msg' . Data.ProtoLens.HasField "maybe'type'" msg msg' =>
              Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "maybe'type'" msg)
                (Data.ProtoLens.Field "maybe'type'" msg')
maybe'type'
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "maybe'type'")

maybe'typeName ::
               forall msg msg' .
                 Data.ProtoLens.HasField "maybe'typeName" msg msg' =>
                 Lens.Family2.Lens msg msg'
                   (Data.ProtoLens.Field "maybe'typeName" msg)
                   (Data.ProtoLens.Field "maybe'typeName" msg')
maybe'typeName
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'typeName")

maybe'weak ::
           forall msg msg' . Data.ProtoLens.HasField "maybe'weak" msg msg' =>
             Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "maybe'weak" msg)
               (Data.ProtoLens.Field "maybe'weak" msg')
maybe'weak
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "maybe'weak")

messageSetWireFormat ::
                     forall msg msg' .
                       Data.ProtoLens.HasField "messageSetWireFormat" msg msg' =>
                       Lens.Family2.Lens msg msg'
                         (Data.ProtoLens.Field "messageSetWireFormat" msg)
                         (Data.ProtoLens.Field "messageSetWireFormat" msg')
messageSetWireFormat
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "messageSetWireFormat")

messageType ::
            forall msg msg' . Data.ProtoLens.HasField "messageType" msg msg' =>
              Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "messageType" msg)
                (Data.ProtoLens.Field "messageType" msg')
messageType
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "messageType")

method ::
       forall msg msg' . Data.ProtoLens.HasField "method" msg msg' =>
         Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "method" msg)
           (Data.ProtoLens.Field "method" msg')
method
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "method")

name ::
     forall msg msg' . Data.ProtoLens.HasField "name" msg msg' =>
       Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "name" msg)
         (Data.ProtoLens.Field "name" msg')
name
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "name")

namePart ::
         forall msg msg' . Data.ProtoLens.HasField "namePart" msg msg' =>
           Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "namePart" msg)
             (Data.ProtoLens.Field "namePart" msg')
namePart
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "namePart")

negativeIntValue ::
                 forall msg msg' .
                   Data.ProtoLens.HasField "negativeIntValue" msg msg' =>
                   Lens.Family2.Lens msg msg'
                     (Data.ProtoLens.Field "negativeIntValue" msg)
                     (Data.ProtoLens.Field "negativeIntValue" msg')
negativeIntValue
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "negativeIntValue")

nestedType ::
           forall msg msg' . Data.ProtoLens.HasField "nestedType" msg msg' =>
             Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "nestedType" msg)
               (Data.ProtoLens.Field "nestedType" msg')
nestedType
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "nestedType")

noStandardDescriptorAccessor ::
                             forall msg msg' .
                               Data.ProtoLens.HasField "noStandardDescriptorAccessor" msg msg' =>
                               Lens.Family2.Lens msg msg'
                                 (Data.ProtoLens.Field "noStandardDescriptorAccessor" msg)
                                 (Data.ProtoLens.Field "noStandardDescriptorAccessor" msg')
noStandardDescriptorAccessor
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "noStandardDescriptorAccessor")

number ::
       forall msg msg' . Data.ProtoLens.HasField "number" msg msg' =>
         Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "number" msg)
           (Data.ProtoLens.Field "number" msg')
number
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "number")

objcClassPrefix ::
                forall msg msg' .
                  Data.ProtoLens.HasField "objcClassPrefix" msg msg' =>
                  Lens.Family2.Lens msg msg'
                    (Data.ProtoLens.Field "objcClassPrefix" msg)
                    (Data.ProtoLens.Field "objcClassPrefix" msg')
objcClassPrefix
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "objcClassPrefix")

oneofDecl ::
          forall msg msg' . Data.ProtoLens.HasField "oneofDecl" msg msg' =>
            Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "oneofDecl" msg)
              (Data.ProtoLens.Field "oneofDecl" msg')
oneofDecl
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "oneofDecl")

oneofIndex ::
           forall msg msg' . Data.ProtoLens.HasField "oneofIndex" msg msg' =>
             Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "oneofIndex" msg)
               (Data.ProtoLens.Field "oneofIndex" msg')
oneofIndex
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "oneofIndex")

optimizeFor ::
            forall msg msg' . Data.ProtoLens.HasField "optimizeFor" msg msg' =>
              Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "optimizeFor" msg)
                (Data.ProtoLens.Field "optimizeFor" msg')
optimizeFor
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "optimizeFor")

options ::
        forall msg msg' . Data.ProtoLens.HasField "options" msg msg' =>
          Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "options" msg)
            (Data.ProtoLens.Field "options" msg')
options
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "options")

outputType ::
           forall msg msg' . Data.ProtoLens.HasField "outputType" msg msg' =>
             Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "outputType" msg)
               (Data.ProtoLens.Field "outputType" msg')
outputType
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "outputType")

package ::
        forall msg msg' . Data.ProtoLens.HasField "package" msg msg' =>
          Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "package" msg)
            (Data.ProtoLens.Field "package" msg')
package
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "package")

packed ::
       forall msg msg' . Data.ProtoLens.HasField "packed" msg msg' =>
         Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "packed" msg)
           (Data.ProtoLens.Field "packed" msg')
packed
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "packed")

path ::
     forall msg msg' . Data.ProtoLens.HasField "path" msg msg' =>
       Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "path" msg)
         (Data.ProtoLens.Field "path" msg')
path
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "path")

positiveIntValue ::
                 forall msg msg' .
                   Data.ProtoLens.HasField "positiveIntValue" msg msg' =>
                   Lens.Family2.Lens msg msg'
                     (Data.ProtoLens.Field "positiveIntValue" msg)
                     (Data.ProtoLens.Field "positiveIntValue" msg')
positiveIntValue
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "positiveIntValue")

publicDependency ::
                 forall msg msg' .
                   Data.ProtoLens.HasField "publicDependency" msg msg' =>
                   Lens.Family2.Lens msg msg'
                     (Data.ProtoLens.Field "publicDependency" msg)
                     (Data.ProtoLens.Field "publicDependency" msg')
publicDependency
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "publicDependency")

pyGenericServices ::
                  forall msg msg' .
                    Data.ProtoLens.HasField "pyGenericServices" msg msg' =>
                    Lens.Family2.Lens msg msg'
                      (Data.ProtoLens.Field "pyGenericServices" msg)
                      (Data.ProtoLens.Field "pyGenericServices" msg')
pyGenericServices
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "pyGenericServices")

reservedName ::
             forall msg msg' .
               Data.ProtoLens.HasField "reservedName" msg msg' =>
               Lens.Family2.Lens msg msg'
                 (Data.ProtoLens.Field "reservedName" msg)
                 (Data.ProtoLens.Field "reservedName" msg')
reservedName
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "reservedName")

reservedRange ::
              forall msg msg' .
                Data.ProtoLens.HasField "reservedRange" msg msg' =>
                Lens.Family2.Lens msg msg'
                  (Data.ProtoLens.Field "reservedRange" msg)
                  (Data.ProtoLens.Field "reservedRange" msg')
reservedRange
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "reservedRange")

serverStreaming ::
                forall msg msg' .
                  Data.ProtoLens.HasField "serverStreaming" msg msg' =>
                  Lens.Family2.Lens msg msg'
                    (Data.ProtoLens.Field "serverStreaming" msg)
                    (Data.ProtoLens.Field "serverStreaming" msg')
serverStreaming
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "serverStreaming")

service ::
        forall msg msg' . Data.ProtoLens.HasField "service" msg msg' =>
          Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "service" msg)
            (Data.ProtoLens.Field "service" msg')
service
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "service")

sourceCodeInfo ::
               forall msg msg' .
                 Data.ProtoLens.HasField "sourceCodeInfo" msg msg' =>
                 Lens.Family2.Lens msg msg'
                   (Data.ProtoLens.Field "sourceCodeInfo" msg)
                   (Data.ProtoLens.Field "sourceCodeInfo" msg')
sourceCodeInfo
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "sourceCodeInfo")

sourceFile ::
           forall msg msg' . Data.ProtoLens.HasField "sourceFile" msg msg' =>
             Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "sourceFile" msg)
               (Data.ProtoLens.Field "sourceFile" msg')
sourceFile
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "sourceFile")

span ::
     forall msg msg' . Data.ProtoLens.HasField "span" msg msg' =>
       Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "span" msg)
         (Data.ProtoLens.Field "span" msg')
span
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "span")

start ::
      forall msg msg' . Data.ProtoLens.HasField "start" msg msg' =>
        Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "start" msg)
          (Data.ProtoLens.Field "start" msg')
start
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "start")

stringValue ::
            forall msg msg' . Data.ProtoLens.HasField "stringValue" msg msg' =>
              Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "stringValue" msg)
                (Data.ProtoLens.Field "stringValue" msg')
stringValue
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "stringValue")

syntax ::
       forall msg msg' . Data.ProtoLens.HasField "syntax" msg msg' =>
         Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "syntax" msg)
           (Data.ProtoLens.Field "syntax" msg')
syntax
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "syntax")

trailingComments ::
                 forall msg msg' .
                   Data.ProtoLens.HasField "trailingComments" msg msg' =>
                   Lens.Family2.Lens msg msg'
                     (Data.ProtoLens.Field "trailingComments" msg)
                     (Data.ProtoLens.Field "trailingComments" msg')
trailingComments
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "trailingComments")

type' ::
      forall msg msg' . Data.ProtoLens.HasField "type'" msg msg' =>
        Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "type'" msg)
          (Data.ProtoLens.Field "type'" msg')
type'
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "type'")

typeName ::
         forall msg msg' . Data.ProtoLens.HasField "typeName" msg msg' =>
           Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "typeName" msg)
             (Data.ProtoLens.Field "typeName" msg')
typeName
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "typeName")

uninterpretedOption ::
                    forall msg msg' .
                      Data.ProtoLens.HasField "uninterpretedOption" msg msg' =>
                      Lens.Family2.Lens msg msg'
                        (Data.ProtoLens.Field "uninterpretedOption" msg)
                        (Data.ProtoLens.Field "uninterpretedOption" msg')
uninterpretedOption
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "uninterpretedOption")

value ::
      forall msg msg' . Data.ProtoLens.HasField "value" msg msg' =>
        Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "value" msg)
          (Data.ProtoLens.Field "value" msg')
value
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "value")

weak ::
     forall msg msg' . Data.ProtoLens.HasField "weak" msg msg' =>
       Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "weak" msg)
         (Data.ProtoLens.Field "weak" msg')
weak
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "weak")

weakDependency ::
               forall msg msg' .
                 Data.ProtoLens.HasField "weakDependency" msg msg' =>
                 Lens.Family2.Lens msg msg'
                   (Data.ProtoLens.Field "weakDependency" msg)
                   (Data.ProtoLens.Field "weakDependency" msg')
weakDependency
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "weakDependency")