{- This file was auto-generated from google/protobuf/compiler/plugin.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies,
  UndecidableInstances, MultiParamTypeClasses, FlexibleContexts,
  FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude
  #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Proto.Google.Protobuf.Compiler.Plugin where
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
import qualified Proto.Google.Protobuf.Descriptor

data CodeGeneratorRequest = CodeGeneratorRequest{_CodeGeneratorRequest'fileToGenerate
                                                 :: ![Data.Text.Text],
                                                 _CodeGeneratorRequest'parameter ::
                                                 !(Prelude.Maybe Data.Text.Text),
                                                 _CodeGeneratorRequest'protoFile ::
                                                 ![Proto.Google.Protobuf.Descriptor.FileDescriptorProto]}
                          deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (a ~ [Data.Text.Text], b ~ [Data.Text.Text],
          Prelude.Functor f) =>
         Lens.Labels.HasLens "fileToGenerate" f CodeGeneratorRequest
         CodeGeneratorRequest a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _CodeGeneratorRequest'fileToGenerate
                 (\ x__ y__ -> x__{_CodeGeneratorRequest'fileToGenerate = y__}))
              Prelude.id

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "parameter" f CodeGeneratorRequest
         CodeGeneratorRequest a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _CodeGeneratorRequest'parameter
                 (\ x__ y__ -> x__{_CodeGeneratorRequest'parameter = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'parameter" f CodeGeneratorRequest
         CodeGeneratorRequest a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _CodeGeneratorRequest'parameter
                 (\ x__ y__ -> x__{_CodeGeneratorRequest'parameter = y__}))
              Prelude.id

instance (a ~
            [Proto.Google.Protobuf.Descriptor.FileDescriptorProto],
          b ~ [Proto.Google.Protobuf.Descriptor.FileDescriptorProto],
          Prelude.Functor f) =>
         Lens.Labels.HasLens "protoFile" f CodeGeneratorRequest
         CodeGeneratorRequest a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _CodeGeneratorRequest'protoFile
                 (\ x__ y__ -> x__{_CodeGeneratorRequest'protoFile = y__}))
              Prelude.id

instance Data.Default.Class.Default CodeGeneratorRequest where
        def
          = CodeGeneratorRequest{_CodeGeneratorRequest'fileToGenerate = [],
                                 _CodeGeneratorRequest'parameter = Prelude.Nothing,
                                 _CodeGeneratorRequest'protoFile = []}

instance Data.ProtoLens.Message CodeGeneratorRequest where
        descriptor
          = let fileToGenerate__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "file_to_generate"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "fileToGenerate")))
                      :: Data.ProtoLens.FieldDescriptor CodeGeneratorRequest
                parameter__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "parameter"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'parameter")))
                      :: Data.ProtoLens.FieldDescriptor CodeGeneratorRequest
                protoFile__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "proto_file"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor
                           Proto.Google.Protobuf.Descriptor.FileDescriptorProto)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "protoFile")))
                      :: Data.ProtoLens.FieldDescriptor CodeGeneratorRequest
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Text.pack "google.protobuf.compiler.CodeGeneratorRequest")
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, fileToGenerate__field_descriptor),
                    (Data.ProtoLens.Tag 2, parameter__field_descriptor),
                    (Data.ProtoLens.Tag 15, protoFile__field_descriptor)])
                (Data.Map.fromList
                   [("file_to_generate", fileToGenerate__field_descriptor),
                    ("parameter", parameter__field_descriptor),
                    ("proto_file", protoFile__field_descriptor)])

data CodeGeneratorResponse = CodeGeneratorResponse{_CodeGeneratorResponse'error
                                                   :: !(Prelude.Maybe Data.Text.Text),
                                                   _CodeGeneratorResponse'file ::
                                                   ![CodeGeneratorResponse'File]}
                           deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "error" f CodeGeneratorResponse
         CodeGeneratorResponse a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _CodeGeneratorResponse'error
                 (\ x__ y__ -> x__{_CodeGeneratorResponse'error = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'error" f CodeGeneratorResponse
         CodeGeneratorResponse a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _CodeGeneratorResponse'error
                 (\ x__ y__ -> x__{_CodeGeneratorResponse'error = y__}))
              Prelude.id

instance (a ~ [CodeGeneratorResponse'File],
          b ~ [CodeGeneratorResponse'File], Prelude.Functor f) =>
         Lens.Labels.HasLens "file" f CodeGeneratorResponse
         CodeGeneratorResponse a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _CodeGeneratorResponse'file
                 (\ x__ y__ -> x__{_CodeGeneratorResponse'file = y__}))
              Prelude.id

instance Data.Default.Class.Default CodeGeneratorResponse where
        def
          = CodeGeneratorResponse{_CodeGeneratorResponse'error =
                                    Prelude.Nothing,
                                  _CodeGeneratorResponse'file = []}

instance Data.ProtoLens.Message CodeGeneratorResponse where
        descriptor
          = let error__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "error"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'error")))
                      :: Data.ProtoLens.FieldDescriptor CodeGeneratorResponse
                file__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "file"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor CodeGeneratorResponse'File)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "file")))
                      :: Data.ProtoLens.FieldDescriptor CodeGeneratorResponse
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Text.pack "google.protobuf.compiler.CodeGeneratorResponse")
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, error__field_descriptor),
                    (Data.ProtoLens.Tag 15, file__field_descriptor)])
                (Data.Map.fromList
                   [("error", error__field_descriptor),
                    ("file", file__field_descriptor)])

data CodeGeneratorResponse'File = CodeGeneratorResponse'File{_CodeGeneratorResponse'File'name
                                                             :: !(Prelude.Maybe Data.Text.Text),
                                                             _CodeGeneratorResponse'File'insertionPoint
                                                             :: !(Prelude.Maybe Data.Text.Text),
                                                             _CodeGeneratorResponse'File'content ::
                                                             !(Prelude.Maybe Data.Text.Text)}
                                deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "name" f CodeGeneratorResponse'File
         CodeGeneratorResponse'File a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _CodeGeneratorResponse'File'name
                 (\ x__ y__ -> x__{_CodeGeneratorResponse'File'name = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'name" f CodeGeneratorResponse'File
         CodeGeneratorResponse'File a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _CodeGeneratorResponse'File'name
                 (\ x__ y__ -> x__{_CodeGeneratorResponse'File'name = y__}))
              Prelude.id

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "insertionPoint" f CodeGeneratorResponse'File
         CodeGeneratorResponse'File a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens
                 _CodeGeneratorResponse'File'insertionPoint
                 (\ x__ y__ ->
                    x__{_CodeGeneratorResponse'File'insertionPoint = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'insertionPoint" f
         CodeGeneratorResponse'File CodeGeneratorResponse'File a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens
                 _CodeGeneratorResponse'File'insertionPoint
                 (\ x__ y__ ->
                    x__{_CodeGeneratorResponse'File'insertionPoint = y__}))
              Prelude.id

instance (a ~ Data.Text.Text, b ~ Data.Text.Text,
          Prelude.Functor f) =>
         Lens.Labels.HasLens "content" f CodeGeneratorResponse'File
         CodeGeneratorResponse'File a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _CodeGeneratorResponse'File'content
                 (\ x__ y__ -> x__{_CodeGeneratorResponse'File'content = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance (a ~ Prelude.Maybe Data.Text.Text,
          b ~ Prelude.Maybe Data.Text.Text, Prelude.Functor f) =>
         Lens.Labels.HasLens "maybe'content" f CodeGeneratorResponse'File
         CodeGeneratorResponse'File a b where
        lensOf _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _CodeGeneratorResponse'File'content
                 (\ x__ y__ -> x__{_CodeGeneratorResponse'File'content = y__}))
              Prelude.id

instance Data.Default.Class.Default CodeGeneratorResponse'File
         where
        def
          = CodeGeneratorResponse'File{_CodeGeneratorResponse'File'name =
                                         Prelude.Nothing,
                                       _CodeGeneratorResponse'File'insertionPoint = Prelude.Nothing,
                                       _CodeGeneratorResponse'File'content = Prelude.Nothing}

instance Data.ProtoLens.Message CodeGeneratorResponse'File where
        descriptor
          = let name__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "name"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'name")))
                      :: Data.ProtoLens.FieldDescriptor CodeGeneratorResponse'File
                insertionPoint__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "insertion_point"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'insertionPoint")))
                      :: Data.ProtoLens.FieldDescriptor CodeGeneratorResponse'File
                content__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "content"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'content")))
                      :: Data.ProtoLens.FieldDescriptor CodeGeneratorResponse'File
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Text.pack
                   "google.protobuf.compiler.CodeGeneratorResponse.File")
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, name__field_descriptor),
                    (Data.ProtoLens.Tag 2, insertionPoint__field_descriptor),
                    (Data.ProtoLens.Tag 15, content__field_descriptor)])
                (Data.Map.fromList
                   [("name", name__field_descriptor),
                    ("insertion_point", insertionPoint__field_descriptor),
                    ("content", content__field_descriptor)])