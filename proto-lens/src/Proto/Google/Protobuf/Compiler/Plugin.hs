{- This file was auto-generated from google/protobuf/compiler/plugin.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies,
  UndecidableInstances, GeneralizedNewtypeDeriving,
  MultiParamTypeClasses, FlexibleContexts, FlexibleInstances,
  PatternSynonyms, MagicHash, NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}
module Proto.Google.Protobuf.Compiler.Plugin
       (CodeGeneratorRequest(..), CodeGeneratorResponse(..),
        CodeGeneratorResponse'File(..))
       where
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
                                                 ![Proto.Google.Protobuf.Descriptor.FileDescriptorProto],
                                                 _CodeGeneratorRequest'_unknownFields ::
                                                 !Data.ProtoLens.FieldSet}
                          deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (Lens.Labels.HasLens' f CodeGeneratorRequest x a,
          a ~ b) =>
         Lens.Labels.HasLens f CodeGeneratorRequest CodeGeneratorRequest x a
         b where
        lensOf = Lens.Labels.lensOf'

instance Prelude.Functor f => Lens.Labels.HasLens' f
         CodeGeneratorRequest "fileToGenerate" ([Data.Text.Text]) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _CodeGeneratorRequest'fileToGenerate
                 (\ x__ y__ -> x__{_CodeGeneratorRequest'fileToGenerate = y__}))
              Prelude.id

instance Prelude.Functor f => Lens.Labels.HasLens' f
         CodeGeneratorRequest "parameter" (Data.Text.Text) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _CodeGeneratorRequest'parameter
                 (\ x__ y__ -> x__{_CodeGeneratorRequest'parameter = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance Prelude.Functor f => Lens.Labels.HasLens' f
         CodeGeneratorRequest "maybe'parameter"
         (Prelude.Maybe Data.Text.Text) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _CodeGeneratorRequest'parameter
                 (\ x__ y__ -> x__{_CodeGeneratorRequest'parameter = y__}))
              Prelude.id

instance Prelude.Functor f => Lens.Labels.HasLens' f
         CodeGeneratorRequest "protoFile"
         ([Proto.Google.Protobuf.Descriptor.FileDescriptorProto]) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _CodeGeneratorRequest'protoFile
                 (\ x__ y__ -> x__{_CodeGeneratorRequest'protoFile = y__}))
              Prelude.id

instance Data.Default.Class.Default CodeGeneratorRequest where
        def
          = CodeGeneratorRequest{_CodeGeneratorRequest'fileToGenerate = [],
                                 _CodeGeneratorRequest'parameter = Prelude.Nothing,
                                 _CodeGeneratorRequest'protoFile = [],
                                 _CodeGeneratorRequest'_unknownFields = ([])}

instance Data.ProtoLens.Message CodeGeneratorRequest where
        messageName _
          = Data.Text.pack "google.protobuf.compiler.CodeGeneratorRequest"
        fieldsByTag
          = let fileToGenerate__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "file_to_generate"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "fileToGenerate")))
                      :: Data.ProtoLens.FieldDescriptor CodeGeneratorRequest
                parameter__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "parameter"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'parameter")))
                      :: Data.ProtoLens.FieldDescriptor CodeGeneratorRequest
                protoFile__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "proto_file"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor
                           Proto.Google.Protobuf.Descriptor.FileDescriptorProto)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "protoFile")))
                      :: Data.ProtoLens.FieldDescriptor CodeGeneratorRequest
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, fileToGenerate__field_descriptor),
                 (Data.ProtoLens.Tag 2, parameter__field_descriptor),
                 (Data.ProtoLens.Tag 15, protoFile__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _CodeGeneratorRequest'_unknownFields
              (\ x__ y__ -> x__{_CodeGeneratorRequest'_unknownFields = y__})

data CodeGeneratorResponse = CodeGeneratorResponse{_CodeGeneratorResponse'error
                                                   :: !(Prelude.Maybe Data.Text.Text),
                                                   _CodeGeneratorResponse'file ::
                                                   ![CodeGeneratorResponse'File],
                                                   _CodeGeneratorResponse'_unknownFields ::
                                                   !Data.ProtoLens.FieldSet}
                           deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (Lens.Labels.HasLens' f CodeGeneratorResponse x a,
          a ~ b) =>
         Lens.Labels.HasLens f CodeGeneratorResponse CodeGeneratorResponse x
         a b where
        lensOf = Lens.Labels.lensOf'

instance Prelude.Functor f => Lens.Labels.HasLens' f
         CodeGeneratorResponse "error" (Data.Text.Text) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _CodeGeneratorResponse'error
                 (\ x__ y__ -> x__{_CodeGeneratorResponse'error = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance Prelude.Functor f => Lens.Labels.HasLens' f
         CodeGeneratorResponse "maybe'error" (Prelude.Maybe Data.Text.Text)
         where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _CodeGeneratorResponse'error
                 (\ x__ y__ -> x__{_CodeGeneratorResponse'error = y__}))
              Prelude.id

instance Prelude.Functor f => Lens.Labels.HasLens' f
         CodeGeneratorResponse "file" ([CodeGeneratorResponse'File]) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _CodeGeneratorResponse'file
                 (\ x__ y__ -> x__{_CodeGeneratorResponse'file = y__}))
              Prelude.id

instance Data.Default.Class.Default CodeGeneratorResponse where
        def
          = CodeGeneratorResponse{_CodeGeneratorResponse'error =
                                    Prelude.Nothing,
                                  _CodeGeneratorResponse'file = [],
                                  _CodeGeneratorResponse'_unknownFields = ([])}

instance Data.ProtoLens.Message CodeGeneratorResponse where
        messageName _
          = Data.Text.pack "google.protobuf.compiler.CodeGeneratorResponse"
        fieldsByTag
          = let error__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "error"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'error")))
                      :: Data.ProtoLens.FieldDescriptor CodeGeneratorResponse
                file__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "file"
                      (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                         Data.ProtoLens.FieldTypeDescriptor CodeGeneratorResponse'File)
                      (Data.ProtoLens.RepeatedField Data.ProtoLens.Unpacked
                         (Lens.Labels.lensOf
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "file")))
                      :: Data.ProtoLens.FieldDescriptor CodeGeneratorResponse
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, error__field_descriptor),
                 (Data.ProtoLens.Tag 15, file__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens _CodeGeneratorResponse'_unknownFields
              (\ x__ y__ -> x__{_CodeGeneratorResponse'_unknownFields = y__})

data CodeGeneratorResponse'File = CodeGeneratorResponse'File{_CodeGeneratorResponse'File'name
                                                             :: !(Prelude.Maybe Data.Text.Text),
                                                             _CodeGeneratorResponse'File'insertionPoint
                                                             :: !(Prelude.Maybe Data.Text.Text),
                                                             _CodeGeneratorResponse'File'content ::
                                                             !(Prelude.Maybe Data.Text.Text),
                                                             _CodeGeneratorResponse'File'_unknownFields
                                                             :: !Data.ProtoLens.FieldSet}
                                deriving (Prelude.Show, Prelude.Eq, Prelude.Ord)

instance (Lens.Labels.HasLens' f CodeGeneratorResponse'File x a,
          a ~ b) =>
         Lens.Labels.HasLens f CodeGeneratorResponse'File
         CodeGeneratorResponse'File x a b where
        lensOf = Lens.Labels.lensOf'

instance Prelude.Functor f => Lens.Labels.HasLens' f
         CodeGeneratorResponse'File "name" (Data.Text.Text) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _CodeGeneratorResponse'File'name
                 (\ x__ y__ -> x__{_CodeGeneratorResponse'File'name = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance Prelude.Functor f => Lens.Labels.HasLens' f
         CodeGeneratorResponse'File "maybe'name"
         (Prelude.Maybe Data.Text.Text) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _CodeGeneratorResponse'File'name
                 (\ x__ y__ -> x__{_CodeGeneratorResponse'File'name = y__}))
              Prelude.id

instance Prelude.Functor f => Lens.Labels.HasLens' f
         CodeGeneratorResponse'File "insertionPoint" (Data.Text.Text) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens
                 _CodeGeneratorResponse'File'insertionPoint
                 (\ x__ y__ ->
                    x__{_CodeGeneratorResponse'File'insertionPoint = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance Prelude.Functor f => Lens.Labels.HasLens' f
         CodeGeneratorResponse'File "maybe'insertionPoint"
         (Prelude.Maybe Data.Text.Text) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens
                 _CodeGeneratorResponse'File'insertionPoint
                 (\ x__ y__ ->
                    x__{_CodeGeneratorResponse'File'insertionPoint = y__}))
              Prelude.id

instance Prelude.Functor f => Lens.Labels.HasLens' f
         CodeGeneratorResponse'File "content" (Data.Text.Text) where
        lensOf' _
          = (Prelude..)
              (Lens.Family2.Unchecked.lens _CodeGeneratorResponse'File'content
                 (\ x__ y__ -> x__{_CodeGeneratorResponse'File'content = y__}))
              (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)

instance Prelude.Functor f => Lens.Labels.HasLens' f
         CodeGeneratorResponse'File "maybe'content"
         (Prelude.Maybe Data.Text.Text) where
        lensOf' _
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
                                       _CodeGeneratorResponse'File'content = Prelude.Nothing,
                                       _CodeGeneratorResponse'File'_unknownFields = ([])}

instance Data.ProtoLens.Message CodeGeneratorResponse'File where
        messageName _
          = Data.Text.pack
              "google.protobuf.compiler.CodeGeneratorResponse.File"
        fieldsByTag
          = let name__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "name"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'name")))
                      :: Data.ProtoLens.FieldDescriptor CodeGeneratorResponse'File
                insertionPoint__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "insertion_point"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf
                            ((Lens.Labels.proxy#) ::
                               (Lens.Labels.Proxy#) "maybe'insertionPoint")))
                      :: Data.ProtoLens.FieldDescriptor CodeGeneratorResponse'File
                content__field_descriptor
                  = Data.ProtoLens.FieldDescriptor "content"
                      (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                         Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
                      (Data.ProtoLens.OptionalField
                         (Lens.Labels.lensOf
                            ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'content")))
                      :: Data.ProtoLens.FieldDescriptor CodeGeneratorResponse'File
              in
              Data.Map.fromList
                [(Data.ProtoLens.Tag 1, name__field_descriptor),
                 (Data.ProtoLens.Tag 2, insertionPoint__field_descriptor),
                 (Data.ProtoLens.Tag 15, content__field_descriptor)]
        unknownFields
          = Lens.Family2.Unchecked.lens
              _CodeGeneratorResponse'File'_unknownFields
              (\ x__ y__ ->
                 x__{_CodeGeneratorResponse'File'_unknownFields = y__})