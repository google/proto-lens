{- This file was auto-generated from google/protobuf/compiler/plugin.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies,
  MultiParamTypeClasses, FlexibleContexts, FlexibleInstances #-}
{-# OPTIONS_GHC -fno-warn-unused-imports#-}
module Bootstrap.Proto.Google.Protobuf.Compiler.Plugin where
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
import qualified Bootstrap.Proto.Google.Protobuf.Descriptor

data CodeGeneratorRequest = CodeGeneratorRequest{_CodeGeneratorRequest'fileToGenerate
                                                 :: [Data.Text.Text],
                                                 _CodeGeneratorRequest'parameter ::
                                                 Prelude.Maybe Data.Text.Text,
                                                 _CodeGeneratorRequest'protoFile ::
                                                 [Bootstrap.Proto.Google.Protobuf.Descriptor.FileDescriptorProto]}
                          deriving (Prelude.Show, Prelude.Eq)

type instance
     Data.ProtoLens.Field "fileToGenerate" CodeGeneratorRequest =
     [Data.Text.Text]

instance Data.ProtoLens.HasField "fileToGenerate"
         CodeGeneratorRequest CodeGeneratorRequest where
        field _
          = Lens.Family2.Unchecked.lens _CodeGeneratorRequest'fileToGenerate
              (\ x__ y__ -> x__{_CodeGeneratorRequest'fileToGenerate = y__})

type instance Data.ProtoLens.Field "parameter" CodeGeneratorRequest
     = Data.Text.Text

instance Data.ProtoLens.HasField "parameter" CodeGeneratorRequest
         CodeGeneratorRequest where
        field _
          = (Prelude..) maybe'parameter
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'parameter" CodeGeneratorRequest =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'parameter"
         CodeGeneratorRequest CodeGeneratorRequest where
        field _
          = Lens.Family2.Unchecked.lens _CodeGeneratorRequest'parameter
              (\ x__ y__ -> x__{_CodeGeneratorRequest'parameter = y__})

type instance Data.ProtoLens.Field "protoFile" CodeGeneratorRequest
     = [Bootstrap.Proto.Google.Protobuf.Descriptor.FileDescriptorProto]

instance Data.ProtoLens.HasField "protoFile" CodeGeneratorRequest
         CodeGeneratorRequest where
        field _
          = Lens.Family2.Unchecked.lens _CodeGeneratorRequest'protoFile
              (\ x__ y__ -> x__{_CodeGeneratorRequest'protoFile = y__})

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
                         fileToGenerate)
                parameter__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "parameter"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'parameter)
                protoFile__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "proto_file"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor
                           Bootstrap.Proto.Google.Protobuf.Descriptor.FileDescriptorProto)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked protoFile)
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, fileToGenerate__field_descriptor),
                    (Data.ProtoLens.Tag 2, parameter__field_descriptor),
                    (Data.ProtoLens.Tag 15, protoFile__field_descriptor)])
                (Data.Map.fromList
                   [("file_to_generate", fileToGenerate__field_descriptor),
                    ("parameter", parameter__field_descriptor),
                    ("proto_file", protoFile__field_descriptor)])

data CodeGeneratorResponse = CodeGeneratorResponse{_CodeGeneratorResponse'error
                                                   :: Prelude.Maybe Data.Text.Text,
                                                   _CodeGeneratorResponse'file ::
                                                   [CodeGeneratorResponse'File]}
                           deriving (Prelude.Show, Prelude.Eq)

type instance Data.ProtoLens.Field "error" CodeGeneratorResponse =
     Data.Text.Text

instance Data.ProtoLens.HasField "error" CodeGeneratorResponse
         CodeGeneratorResponse where
        field _
          = (Prelude..) maybe'error
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'error" CodeGeneratorResponse =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'error"
         CodeGeneratorResponse CodeGeneratorResponse where
        field _
          = Lens.Family2.Unchecked.lens _CodeGeneratorResponse'error
              (\ x__ y__ -> x__{_CodeGeneratorResponse'error = y__})

type instance Data.ProtoLens.Field "file" CodeGeneratorResponse =
     [CodeGeneratorResponse'File]

instance Data.ProtoLens.HasField "file" CodeGeneratorResponse
         CodeGeneratorResponse where
        field _
          = Lens.Family2.Unchecked.lens _CodeGeneratorResponse'file
              (\ x__ y__ -> x__{_CodeGeneratorResponse'file = y__})

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
                      (Data.ProtoLens.OptionalField maybe'error)
                file__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "file"
                      (Data.ProtoLens.MessageField ::
                         Data.ProtoLens.FieldTypeDescriptor CodeGeneratorResponse'File)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked file)
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, error__field_descriptor),
                    (Data.ProtoLens.Tag 15, file__field_descriptor)])
                (Data.Map.fromList
                   [("error", error__field_descriptor),
                    ("file", file__field_descriptor)])

data CodeGeneratorResponse'File = CodeGeneratorResponse'File{_CodeGeneratorResponse'File'name
                                                             :: Prelude.Maybe Data.Text.Text,
                                                             _CodeGeneratorResponse'File'insertionPoint
                                                             :: Prelude.Maybe Data.Text.Text,
                                                             _CodeGeneratorResponse'File'content ::
                                                             Prelude.Maybe Data.Text.Text}
                                deriving (Prelude.Show, Prelude.Eq)

type instance
     Data.ProtoLens.Field "name" CodeGeneratorResponse'File =
     Data.Text.Text

instance Data.ProtoLens.HasField "name" CodeGeneratorResponse'File
         CodeGeneratorResponse'File where
        field _
          = (Prelude..) maybe'name
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'name" CodeGeneratorResponse'File =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'name"
         CodeGeneratorResponse'File CodeGeneratorResponse'File where
        field _
          = Lens.Family2.Unchecked.lens _CodeGeneratorResponse'File'name
              (\ x__ y__ -> x__{_CodeGeneratorResponse'File'name = y__})

type instance
     Data.ProtoLens.Field "insertionPoint" CodeGeneratorResponse'File =
     Data.Text.Text

instance Data.ProtoLens.HasField "insertionPoint"
         CodeGeneratorResponse'File CodeGeneratorResponse'File where
        field _
          = (Prelude..) maybe'insertionPoint
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'insertionPoint"
       CodeGeneratorResponse'File
     = Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'insertionPoint"
         CodeGeneratorResponse'File CodeGeneratorResponse'File where
        field _
          = Lens.Family2.Unchecked.lens
              _CodeGeneratorResponse'File'insertionPoint
              (\ x__ y__ ->
                 x__{_CodeGeneratorResponse'File'insertionPoint = y__})

type instance
     Data.ProtoLens.Field "content" CodeGeneratorResponse'File =
     Data.Text.Text

instance Data.ProtoLens.HasField "content"
         CodeGeneratorResponse'File CodeGeneratorResponse'File where
        field _
          = (Prelude..) maybe'content
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

type instance
     Data.ProtoLens.Field "maybe'content" CodeGeneratorResponse'File =
     Prelude.Maybe Data.Text.Text

instance Data.ProtoLens.HasField "maybe'content"
         CodeGeneratorResponse'File CodeGeneratorResponse'File where
        field _
          = Lens.Family2.Unchecked.lens _CodeGeneratorResponse'File'content
              (\ x__ y__ -> x__{_CodeGeneratorResponse'File'content = y__})

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
                      (Data.ProtoLens.OptionalField maybe'name)
                insertionPoint__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "insertion_point"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'insertionPoint)
                content__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "content"
                      (Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField maybe'content)
              in
              Data.ProtoLens.MessageDescriptor
                (Data.Map.fromList
                   [(Data.ProtoLens.Tag 1, name__field_descriptor),
                    (Data.ProtoLens.Tag 2, insertionPoint__field_descriptor),
                    (Data.ProtoLens.Tag 15, content__field_descriptor)])
                (Data.Map.fromList
                   [("name", name__field_descriptor),
                    ("insertion_point", insertionPoint__field_descriptor),
                    ("content", content__field_descriptor)])

content ::
        forall msg msg' . Data.ProtoLens.HasField "content" msg msg' =>
          Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "content" msg)
            (Data.ProtoLens.Field "content" msg')
content
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "content")

error ::
      forall msg msg' . Data.ProtoLens.HasField "error" msg msg' =>
        Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "error" msg)
          (Data.ProtoLens.Field "error" msg')
error
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "error")

file ::
     forall msg msg' . Data.ProtoLens.HasField "file" msg msg' =>
       Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "file" msg)
         (Data.ProtoLens.Field "file" msg')
file
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "file")

fileToGenerate ::
               forall msg msg' .
                 Data.ProtoLens.HasField "fileToGenerate" msg msg' =>
                 Lens.Family2.Lens msg msg'
                   (Data.ProtoLens.Field "fileToGenerate" msg)
                   (Data.ProtoLens.Field "fileToGenerate" msg')
fileToGenerate
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "fileToGenerate")

insertionPoint ::
               forall msg msg' .
                 Data.ProtoLens.HasField "insertionPoint" msg msg' =>
                 Lens.Family2.Lens msg msg'
                   (Data.ProtoLens.Field "insertionPoint" msg)
                   (Data.ProtoLens.Field "insertionPoint" msg')
insertionPoint
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "insertionPoint")

maybe'content ::
              forall msg msg' .
                Data.ProtoLens.HasField "maybe'content" msg msg' =>
                Lens.Family2.Lens msg msg'
                  (Data.ProtoLens.Field "maybe'content" msg)
                  (Data.ProtoLens.Field "maybe'content" msg')
maybe'content
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'content")

maybe'error ::
            forall msg msg' . Data.ProtoLens.HasField "maybe'error" msg msg' =>
              Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "maybe'error" msg)
                (Data.ProtoLens.Field "maybe'error" msg')
maybe'error
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "maybe'error")

maybe'insertionPoint ::
                     forall msg msg' .
                       Data.ProtoLens.HasField "maybe'insertionPoint" msg msg' =>
                       Lens.Family2.Lens msg msg'
                         (Data.ProtoLens.Field "maybe'insertionPoint" msg)
                         (Data.ProtoLens.Field "maybe'insertionPoint" msg')
maybe'insertionPoint
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'insertionPoint")

maybe'name ::
           forall msg msg' . Data.ProtoLens.HasField "maybe'name" msg msg' =>
             Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "maybe'name" msg)
               (Data.ProtoLens.Field "maybe'name" msg')
maybe'name
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "maybe'name")

maybe'parameter ::
                forall msg msg' .
                  Data.ProtoLens.HasField "maybe'parameter" msg msg' =>
                  Lens.Family2.Lens msg msg'
                    (Data.ProtoLens.Field "maybe'parameter" msg)
                    (Data.ProtoLens.Field "maybe'parameter" msg')
maybe'parameter
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym ::
         Data.ProtoLens.ProxySym "maybe'parameter")

name ::
     forall msg msg' . Data.ProtoLens.HasField "name" msg msg' =>
       Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "name" msg)
         (Data.ProtoLens.Field "name" msg')
name
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "name")

parameter ::
          forall msg msg' . Data.ProtoLens.HasField "parameter" msg msg' =>
            Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "parameter" msg)
              (Data.ProtoLens.Field "parameter" msg')
parameter
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "parameter")

protoFile ::
          forall msg msg' . Data.ProtoLens.HasField "protoFile" msg msg' =>
            Lens.Family2.Lens msg msg' (Data.ProtoLens.Field "protoFile" msg)
              (Data.ProtoLens.Field "protoFile" msg')
protoFile
  = Data.ProtoLens.field
      (Data.ProtoLens.ProxySym :: Data.ProtoLens.ProxySym "protoFile")