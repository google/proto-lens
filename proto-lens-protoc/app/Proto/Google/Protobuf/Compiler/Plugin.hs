{- This file was auto-generated from google/protobuf/compiler/plugin.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Google.Protobuf.Compiler.Plugin (
        CodeGeneratorRequest(), CodeGeneratorResponse(),
        CodeGeneratorResponse'File(), Version()
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
import qualified Proto.Google.Protobuf.Descriptor
{- | Fields :
     
         * 'Proto.Google.Protobuf.Compiler.Plugin_Fields.fileToGenerate' @:: Lens' CodeGeneratorRequest [Data.Text.Text]@
         * 'Proto.Google.Protobuf.Compiler.Plugin_Fields.vec'fileToGenerate' @:: Lens' CodeGeneratorRequest (Data.Vector.Vector Data.Text.Text)@
         * 'Proto.Google.Protobuf.Compiler.Plugin_Fields.parameter' @:: Lens' CodeGeneratorRequest Data.Text.Text@
         * 'Proto.Google.Protobuf.Compiler.Plugin_Fields.maybe'parameter' @:: Lens' CodeGeneratorRequest (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Compiler.Plugin_Fields.protoFile' @:: Lens' CodeGeneratorRequest [Proto.Google.Protobuf.Descriptor.FileDescriptorProto]@
         * 'Proto.Google.Protobuf.Compiler.Plugin_Fields.vec'protoFile' @:: Lens' CodeGeneratorRequest (Data.Vector.Vector Proto.Google.Protobuf.Descriptor.FileDescriptorProto)@
         * 'Proto.Google.Protobuf.Compiler.Plugin_Fields.compilerVersion' @:: Lens' CodeGeneratorRequest Version@
         * 'Proto.Google.Protobuf.Compiler.Plugin_Fields.maybe'compilerVersion' @:: Lens' CodeGeneratorRequest (Prelude.Maybe Version)@ -}
data CodeGeneratorRequest
  = CodeGeneratorRequest'_constructor {_CodeGeneratorRequest'fileToGenerate :: !(Data.Vector.Vector Data.Text.Text),
                                       _CodeGeneratorRequest'parameter :: !(Prelude.Maybe Data.Text.Text),
                                       _CodeGeneratorRequest'protoFile :: !(Data.Vector.Vector Proto.Google.Protobuf.Descriptor.FileDescriptorProto),
                                       _CodeGeneratorRequest'compilerVersion :: !(Prelude.Maybe Version),
                                       _CodeGeneratorRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show CodeGeneratorRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField CodeGeneratorRequest "fileToGenerate" [Data.Text.Text] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _CodeGeneratorRequest'fileToGenerate
           (\ x__ y__ -> x__ {_CodeGeneratorRequest'fileToGenerate = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField CodeGeneratorRequest "vec'fileToGenerate" (Data.Vector.Vector Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _CodeGeneratorRequest'fileToGenerate
           (\ x__ y__ -> x__ {_CodeGeneratorRequest'fileToGenerate = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField CodeGeneratorRequest "parameter" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _CodeGeneratorRequest'parameter
           (\ x__ y__ -> x__ {_CodeGeneratorRequest'parameter = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField CodeGeneratorRequest "maybe'parameter" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _CodeGeneratorRequest'parameter
           (\ x__ y__ -> x__ {_CodeGeneratorRequest'parameter = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField CodeGeneratorRequest "protoFile" [Proto.Google.Protobuf.Descriptor.FileDescriptorProto] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _CodeGeneratorRequest'protoFile
           (\ x__ y__ -> x__ {_CodeGeneratorRequest'protoFile = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField CodeGeneratorRequest "vec'protoFile" (Data.Vector.Vector Proto.Google.Protobuf.Descriptor.FileDescriptorProto) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _CodeGeneratorRequest'protoFile
           (\ x__ y__ -> x__ {_CodeGeneratorRequest'protoFile = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField CodeGeneratorRequest "compilerVersion" Version where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _CodeGeneratorRequest'compilerVersion
           (\ x__ y__ -> x__ {_CodeGeneratorRequest'compilerVersion = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField CodeGeneratorRequest "maybe'compilerVersion" (Prelude.Maybe Version) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _CodeGeneratorRequest'compilerVersion
           (\ x__ y__ -> x__ {_CodeGeneratorRequest'compilerVersion = y__}))
        Prelude.id
instance Data.ProtoLens.Message CodeGeneratorRequest where
  messageName _
    = Data.Text.pack "google.protobuf.compiler.CodeGeneratorRequest"
  packedMessageDescriptor _
    = "\n\
      \\DC4CodeGeneratorRequest\DC2(\n\
      \\DLEfile_to_generate\CAN\SOH \ETX(\tR\SOfileToGenerate\DC2\FS\n\
      \\tparameter\CAN\STX \SOH(\tR\tparameter\DC2C\n\
      \\n\
      \proto_file\CAN\SI \ETX(\v2$.google.protobuf.FileDescriptorProtoR\tprotoFile\DC2L\n\
      \\DLEcompiler_version\CAN\ETX \SOH(\v2!.google.protobuf.compiler.VersionR\SIcompilerVersion"
  fieldsByTag
    = let
        fileToGenerate__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "file_to_generate"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"fileToGenerate")) ::
              Data.ProtoLens.FieldDescriptor CodeGeneratorRequest
        parameter__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "parameter"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'parameter")) ::
              Data.ProtoLens.FieldDescriptor CodeGeneratorRequest
        protoFile__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "proto_file"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Google.Protobuf.Descriptor.FileDescriptorProto)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"protoFile")) ::
              Data.ProtoLens.FieldDescriptor CodeGeneratorRequest
        compilerVersion__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "compiler_version"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Version)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'compilerVersion")) ::
              Data.ProtoLens.FieldDescriptor CodeGeneratorRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, fileToGenerate__field_descriptor),
           (Data.ProtoLens.Tag 2, parameter__field_descriptor),
           (Data.ProtoLens.Tag 15, protoFile__field_descriptor),
           (Data.ProtoLens.Tag 3, compilerVersion__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _CodeGeneratorRequest'_unknownFields
        (\ x__ y__ -> x__ {_CodeGeneratorRequest'_unknownFields = y__})
  defMessage
    = CodeGeneratorRequest'_constructor
        {_CodeGeneratorRequest'fileToGenerate = Data.Vector.Generic.empty,
         _CodeGeneratorRequest'parameter = Prelude.Nothing,
         _CodeGeneratorRequest'protoFile = Data.Vector.Generic.empty,
         _CodeGeneratorRequest'compilerVersion = Prelude.Nothing,
         _CodeGeneratorRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          CodeGeneratorRequest
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Text.Text
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Proto.Google.Protobuf.Descriptor.FileDescriptorProto
                -> Data.ProtoLens.Encoding.Bytes.Parser CodeGeneratorRequest
        loop x mutable'fileToGenerate mutable'protoFile
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'fileToGenerate <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                 (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                    mutable'fileToGenerate)
                      frozen'protoFile <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                            (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                               mutable'protoFile)
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
                              (Data.ProtoLens.Field.field @"vec'fileToGenerate")
                              frozen'fileToGenerate
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'protoFile") frozen'protoFile x)))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                        Data.ProtoLens.Encoding.Bytes.getBytes
                                                          (Prelude.fromIntegral len)
                                            Data.ProtoLens.Encoding.Bytes.runEither
                                              (case Data.Text.Encoding.decodeUtf8' value of
                                                 (Prelude.Left err)
                                                   -> Prelude.Left (Prelude.show err)
                                                 (Prelude.Right r) -> Prelude.Right r))
                                        "file_to_generate"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'fileToGenerate y)
                                loop x v mutable'protoFile
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "parameter"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"parameter") y x)
                                  mutable'fileToGenerate
                                  mutable'protoFile
                        122
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "proto_file"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'protoFile y)
                                loop x mutable'fileToGenerate v
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "compiler_version"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"compilerVersion") y x)
                                  mutable'fileToGenerate
                                  mutable'protoFile
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'fileToGenerate
                                  mutable'protoFile
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'fileToGenerate <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                          Data.ProtoLens.Encoding.Growing.new
              mutable'protoFile <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                     Data.ProtoLens.Encoding.Growing.new
              loop
                Data.ProtoLens.defMessage mutable'fileToGenerate mutable'protoFile)
          "CodeGeneratorRequest"
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
                           Data.Text.Encoding.encodeUtf8
                           _v))
                (Lens.Family2.view
                   (Data.ProtoLens.Field.field @"vec'fileToGenerate") _x))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view
                       (Data.ProtoLens.Field.field @"maybe'parameter") _x
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
                              (Data.ProtoLens.Encoding.Bytes.putVarInt 122)
                              ((Prelude..)
                                 (\ bs
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                            (Prelude.fromIntegral (Data.ByteString.length bs)))
                                         (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                 Data.ProtoLens.encodeMessage
                                 _v))
                      (Lens.Family2.view
                         (Data.ProtoLens.Field.field @"vec'protoFile") _x))
                   ((Data.Monoid.<>)
                      (case
                           Lens.Family2.view
                             (Data.ProtoLens.Field.field @"maybe'compilerVersion") _x
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
                         (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))
instance Control.DeepSeq.NFData CodeGeneratorRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_CodeGeneratorRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_CodeGeneratorRequest'fileToGenerate x__)
                (Control.DeepSeq.deepseq
                   (_CodeGeneratorRequest'parameter x__)
                   (Control.DeepSeq.deepseq
                      (_CodeGeneratorRequest'protoFile x__)
                      (Control.DeepSeq.deepseq
                         (_CodeGeneratorRequest'compilerVersion x__) ()))))
{- | Fields :
     
         * 'Proto.Google.Protobuf.Compiler.Plugin_Fields.error' @:: Lens' CodeGeneratorResponse Data.Text.Text@
         * 'Proto.Google.Protobuf.Compiler.Plugin_Fields.maybe'error' @:: Lens' CodeGeneratorResponse (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Compiler.Plugin_Fields.file' @:: Lens' CodeGeneratorResponse [CodeGeneratorResponse'File]@
         * 'Proto.Google.Protobuf.Compiler.Plugin_Fields.vec'file' @:: Lens' CodeGeneratorResponse (Data.Vector.Vector CodeGeneratorResponse'File)@ -}
data CodeGeneratorResponse
  = CodeGeneratorResponse'_constructor {_CodeGeneratorResponse'error :: !(Prelude.Maybe Data.Text.Text),
                                        _CodeGeneratorResponse'file :: !(Data.Vector.Vector CodeGeneratorResponse'File),
                                        _CodeGeneratorResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show CodeGeneratorResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField CodeGeneratorResponse "error" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _CodeGeneratorResponse'error
           (\ x__ y__ -> x__ {_CodeGeneratorResponse'error = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField CodeGeneratorResponse "maybe'error" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _CodeGeneratorResponse'error
           (\ x__ y__ -> x__ {_CodeGeneratorResponse'error = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField CodeGeneratorResponse "file" [CodeGeneratorResponse'File] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _CodeGeneratorResponse'file
           (\ x__ y__ -> x__ {_CodeGeneratorResponse'file = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField CodeGeneratorResponse "vec'file" (Data.Vector.Vector CodeGeneratorResponse'File) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _CodeGeneratorResponse'file
           (\ x__ y__ -> x__ {_CodeGeneratorResponse'file = y__}))
        Prelude.id
instance Data.ProtoLens.Message CodeGeneratorResponse where
  messageName _
    = Data.Text.pack "google.protobuf.compiler.CodeGeneratorResponse"
  packedMessageDescriptor _
    = "\n\
      \\NAKCodeGeneratorResponse\DC2\DC4\n\
      \\ENQerror\CAN\SOH \SOH(\tR\ENQerror\DC2H\n\
      \\EOTfile\CAN\SI \ETX(\v24.google.protobuf.compiler.CodeGeneratorResponse.FileR\EOTfile\SUB]\n\
      \\EOTFile\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2'\n\
      \\SIinsertion_point\CAN\STX \SOH(\tR\SOinsertionPoint\DC2\CAN\n\
      \\acontent\CAN\SI \SOH(\tR\acontent"
  fieldsByTag
    = let
        error__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "error"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'error")) ::
              Data.ProtoLens.FieldDescriptor CodeGeneratorResponse
        file__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "file"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor CodeGeneratorResponse'File)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"file")) ::
              Data.ProtoLens.FieldDescriptor CodeGeneratorResponse
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, error__field_descriptor),
           (Data.ProtoLens.Tag 15, file__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _CodeGeneratorResponse'_unknownFields
        (\ x__ y__ -> x__ {_CodeGeneratorResponse'_unknownFields = y__})
  defMessage
    = CodeGeneratorResponse'_constructor
        {_CodeGeneratorResponse'error = Prelude.Nothing,
         _CodeGeneratorResponse'file = Data.Vector.Generic.empty,
         _CodeGeneratorResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          CodeGeneratorResponse
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld CodeGeneratorResponse'File
             -> Data.ProtoLens.Encoding.Bytes.Parser CodeGeneratorResponse
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
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "error"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"error") y x)
                                  mutable'file
                        122
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
          "CodeGeneratorResponse"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'error") _x
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
                           (Data.ProtoLens.Encoding.Bytes.putVarInt 122)
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
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData CodeGeneratorResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_CodeGeneratorResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_CodeGeneratorResponse'error x__)
                (Control.DeepSeq.deepseq (_CodeGeneratorResponse'file x__) ()))
{- | Fields :
     
         * 'Proto.Google.Protobuf.Compiler.Plugin_Fields.name' @:: Lens' CodeGeneratorResponse'File Data.Text.Text@
         * 'Proto.Google.Protobuf.Compiler.Plugin_Fields.maybe'name' @:: Lens' CodeGeneratorResponse'File (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Compiler.Plugin_Fields.insertionPoint' @:: Lens' CodeGeneratorResponse'File Data.Text.Text@
         * 'Proto.Google.Protobuf.Compiler.Plugin_Fields.maybe'insertionPoint' @:: Lens' CodeGeneratorResponse'File (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Compiler.Plugin_Fields.content' @:: Lens' CodeGeneratorResponse'File Data.Text.Text@
         * 'Proto.Google.Protobuf.Compiler.Plugin_Fields.maybe'content' @:: Lens' CodeGeneratorResponse'File (Prelude.Maybe Data.Text.Text)@ -}
data CodeGeneratorResponse'File
  = CodeGeneratorResponse'File'_constructor {_CodeGeneratorResponse'File'name :: !(Prelude.Maybe Data.Text.Text),
                                             _CodeGeneratorResponse'File'insertionPoint :: !(Prelude.Maybe Data.Text.Text),
                                             _CodeGeneratorResponse'File'content :: !(Prelude.Maybe Data.Text.Text),
                                             _CodeGeneratorResponse'File'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show CodeGeneratorResponse'File where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField CodeGeneratorResponse'File "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _CodeGeneratorResponse'File'name
           (\ x__ y__ -> x__ {_CodeGeneratorResponse'File'name = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField CodeGeneratorResponse'File "maybe'name" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _CodeGeneratorResponse'File'name
           (\ x__ y__ -> x__ {_CodeGeneratorResponse'File'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField CodeGeneratorResponse'File "insertionPoint" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _CodeGeneratorResponse'File'insertionPoint
           (\ x__ y__
              -> x__ {_CodeGeneratorResponse'File'insertionPoint = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField CodeGeneratorResponse'File "maybe'insertionPoint" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _CodeGeneratorResponse'File'insertionPoint
           (\ x__ y__
              -> x__ {_CodeGeneratorResponse'File'insertionPoint = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField CodeGeneratorResponse'File "content" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _CodeGeneratorResponse'File'content
           (\ x__ y__ -> x__ {_CodeGeneratorResponse'File'content = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField CodeGeneratorResponse'File "maybe'content" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _CodeGeneratorResponse'File'content
           (\ x__ y__ -> x__ {_CodeGeneratorResponse'File'content = y__}))
        Prelude.id
instance Data.ProtoLens.Message CodeGeneratorResponse'File where
  messageName _
    = Data.Text.pack
        "google.protobuf.compiler.CodeGeneratorResponse.File"
  packedMessageDescriptor _
    = "\n\
      \\EOTFile\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2'\n\
      \\SIinsertion_point\CAN\STX \SOH(\tR\SOinsertionPoint\DC2\CAN\n\
      \\acontent\CAN\SI \SOH(\tR\acontent"
  fieldsByTag
    = let
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'name")) ::
              Data.ProtoLens.FieldDescriptor CodeGeneratorResponse'File
        insertionPoint__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "insertion_point"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'insertionPoint")) ::
              Data.ProtoLens.FieldDescriptor CodeGeneratorResponse'File
        content__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "content"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'content")) ::
              Data.ProtoLens.FieldDescriptor CodeGeneratorResponse'File
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, name__field_descriptor),
           (Data.ProtoLens.Tag 2, insertionPoint__field_descriptor),
           (Data.ProtoLens.Tag 15, content__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _CodeGeneratorResponse'File'_unknownFields
        (\ x__ y__
           -> x__ {_CodeGeneratorResponse'File'_unknownFields = y__})
  defMessage
    = CodeGeneratorResponse'File'_constructor
        {_CodeGeneratorResponse'File'name = Prelude.Nothing,
         _CodeGeneratorResponse'File'insertionPoint = Prelude.Nothing,
         _CodeGeneratorResponse'File'content = Prelude.Nothing,
         _CodeGeneratorResponse'File'_unknownFields = []}
  parseMessage
    = let
        loop ::
          CodeGeneratorResponse'File
          -> Data.ProtoLens.Encoding.Bytes.Parser CodeGeneratorResponse'File
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
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "name"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"name") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "insertion_point"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"insertionPoint") y x)
                        122
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "content"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"content") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "File"
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
                       (Data.ProtoLens.Field.field @"maybe'insertionPoint") _x
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
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'content") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 122)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.Text.Encoding.encodeUtf8
                                _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData CodeGeneratorResponse'File where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_CodeGeneratorResponse'File'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_CodeGeneratorResponse'File'name x__)
                (Control.DeepSeq.deepseq
                   (_CodeGeneratorResponse'File'insertionPoint x__)
                   (Control.DeepSeq.deepseq
                      (_CodeGeneratorResponse'File'content x__) ())))
{- | Fields :
     
         * 'Proto.Google.Protobuf.Compiler.Plugin_Fields.major' @:: Lens' Version Data.Int.Int32@
         * 'Proto.Google.Protobuf.Compiler.Plugin_Fields.maybe'major' @:: Lens' Version (Prelude.Maybe Data.Int.Int32)@
         * 'Proto.Google.Protobuf.Compiler.Plugin_Fields.minor' @:: Lens' Version Data.Int.Int32@
         * 'Proto.Google.Protobuf.Compiler.Plugin_Fields.maybe'minor' @:: Lens' Version (Prelude.Maybe Data.Int.Int32)@
         * 'Proto.Google.Protobuf.Compiler.Plugin_Fields.patch' @:: Lens' Version Data.Int.Int32@
         * 'Proto.Google.Protobuf.Compiler.Plugin_Fields.maybe'patch' @:: Lens' Version (Prelude.Maybe Data.Int.Int32)@
         * 'Proto.Google.Protobuf.Compiler.Plugin_Fields.suffix' @:: Lens' Version Data.Text.Text@
         * 'Proto.Google.Protobuf.Compiler.Plugin_Fields.maybe'suffix' @:: Lens' Version (Prelude.Maybe Data.Text.Text)@ -}
data Version
  = Version'_constructor {_Version'major :: !(Prelude.Maybe Data.Int.Int32),
                          _Version'minor :: !(Prelude.Maybe Data.Int.Int32),
                          _Version'patch :: !(Prelude.Maybe Data.Int.Int32),
                          _Version'suffix :: !(Prelude.Maybe Data.Text.Text),
                          _Version'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Version where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Version "major" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Version'major (\ x__ y__ -> x__ {_Version'major = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField Version "maybe'major" (Prelude.Maybe Data.Int.Int32) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Version'major (\ x__ y__ -> x__ {_Version'major = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Version "minor" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Version'minor (\ x__ y__ -> x__ {_Version'minor = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField Version "maybe'minor" (Prelude.Maybe Data.Int.Int32) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Version'minor (\ x__ y__ -> x__ {_Version'minor = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Version "patch" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Version'patch (\ x__ y__ -> x__ {_Version'patch = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField Version "maybe'patch" (Prelude.Maybe Data.Int.Int32) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Version'patch (\ x__ y__ -> x__ {_Version'patch = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Version "suffix" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Version'suffix (\ x__ y__ -> x__ {_Version'suffix = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault)
instance Data.ProtoLens.Field.HasField Version "maybe'suffix" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Version'suffix (\ x__ y__ -> x__ {_Version'suffix = y__}))
        Prelude.id
instance Data.ProtoLens.Message Version where
  messageName _ = Data.Text.pack "google.protobuf.compiler.Version"
  packedMessageDescriptor _
    = "\n\
      \\aVersion\DC2\DC4\n\
      \\ENQmajor\CAN\SOH \SOH(\ENQR\ENQmajor\DC2\DC4\n\
      \\ENQminor\CAN\STX \SOH(\ENQR\ENQminor\DC2\DC4\n\
      \\ENQpatch\CAN\ETX \SOH(\ENQR\ENQpatch\DC2\SYN\n\
      \\ACKsuffix\CAN\EOT \SOH(\tR\ACKsuffix"
  fieldsByTag
    = let
        major__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "major"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'major")) ::
              Data.ProtoLens.FieldDescriptor Version
        minor__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "minor"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'minor")) ::
              Data.ProtoLens.FieldDescriptor Version
        patch__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "patch"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'patch")) ::
              Data.ProtoLens.FieldDescriptor Version
        suffix__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "suffix"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'suffix")) ::
              Data.ProtoLens.FieldDescriptor Version
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, major__field_descriptor),
           (Data.ProtoLens.Tag 2, minor__field_descriptor),
           (Data.ProtoLens.Tag 3, patch__field_descriptor),
           (Data.ProtoLens.Tag 4, suffix__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Version'_unknownFields
        (\ x__ y__ -> x__ {_Version'_unknownFields = y__})
  defMessage
    = Version'_constructor
        {_Version'major = Prelude.Nothing,
         _Version'minor = Prelude.Nothing, _Version'patch = Prelude.Nothing,
         _Version'suffix = Prelude.Nothing, _Version'_unknownFields = []}
  parseMessage
    = let
        loop :: Version -> Data.ProtoLens.Encoding.Bytes.Parser Version
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
                                       "major"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"major") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "minor"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"minor") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "patch"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"patch") y x)
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "suffix"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"suffix") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Version"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'major") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                       ((Prelude..)
                          Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'minor") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                          ((Prelude..)
                             Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'patch") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                             ((Prelude..)
                                Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                   ((Data.Monoid.<>)
                      (case
                           Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'suffix") _x
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
                      (Data.ProtoLens.Encoding.Wire.buildFieldSet
                         (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))
instance Control.DeepSeq.NFData Version where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Version'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Version'major x__)
                (Control.DeepSeq.deepseq
                   (_Version'minor x__)
                   (Control.DeepSeq.deepseq
                      (_Version'patch x__)
                      (Control.DeepSeq.deepseq (_Version'suffix x__) ()))))