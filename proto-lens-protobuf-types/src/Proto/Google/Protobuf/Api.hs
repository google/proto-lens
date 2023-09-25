{- This file was auto-generated from google/protobuf/api.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Google.Protobuf.Api (
        Api(), Method(), Mixin()
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
import qualified Proto.Google.Protobuf.SourceContext
import qualified Proto.Google.Protobuf.Type
{- | Fields :
     
         * 'Proto.Google.Protobuf.Api_Fields.name' @:: Lens' Api Data.Text.Text@
         * 'Proto.Google.Protobuf.Api_Fields.methods' @:: Lens' Api [Method]@
         * 'Proto.Google.Protobuf.Api_Fields.vec'methods' @:: Lens' Api (Data.Vector.Vector Method)@
         * 'Proto.Google.Protobuf.Api_Fields.options' @:: Lens' Api [Proto.Google.Protobuf.Type.Option]@
         * 'Proto.Google.Protobuf.Api_Fields.vec'options' @:: Lens' Api (Data.Vector.Vector Proto.Google.Protobuf.Type.Option)@
         * 'Proto.Google.Protobuf.Api_Fields.version' @:: Lens' Api Data.Text.Text@
         * 'Proto.Google.Protobuf.Api_Fields.sourceContext' @:: Lens' Api Proto.Google.Protobuf.SourceContext.SourceContext@
         * 'Proto.Google.Protobuf.Api_Fields.maybe'sourceContext' @:: Lens' Api (Prelude.Maybe Proto.Google.Protobuf.SourceContext.SourceContext)@
         * 'Proto.Google.Protobuf.Api_Fields.mixins' @:: Lens' Api [Mixin]@
         * 'Proto.Google.Protobuf.Api_Fields.vec'mixins' @:: Lens' Api (Data.Vector.Vector Mixin)@
         * 'Proto.Google.Protobuf.Api_Fields.syntax' @:: Lens' Api Proto.Google.Protobuf.Type.Syntax@ -}
data Api
  = Api'_constructor {_Api'name :: !Data.Text.Text,
                      _Api'methods :: !(Data.Vector.Vector Method),
                      _Api'options :: !(Data.Vector.Vector Proto.Google.Protobuf.Type.Option),
                      _Api'version :: !Data.Text.Text,
                      _Api'sourceContext :: !(Prelude.Maybe Proto.Google.Protobuf.SourceContext.SourceContext),
                      _Api'mixins :: !(Data.Vector.Vector Mixin),
                      _Api'syntax :: !Proto.Google.Protobuf.Type.Syntax,
                      _Api'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Api where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Api "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Api'name (\ x__ y__ -> x__ {_Api'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Api "methods" [Method] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Api'methods (\ x__ y__ -> x__ {_Api'methods = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Api "vec'methods" (Data.Vector.Vector Method) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Api'methods (\ x__ y__ -> x__ {_Api'methods = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Api "options" [Proto.Google.Protobuf.Type.Option] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Api'options (\ x__ y__ -> x__ {_Api'options = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Api "vec'options" (Data.Vector.Vector Proto.Google.Protobuf.Type.Option) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Api'options (\ x__ y__ -> x__ {_Api'options = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Api "version" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Api'version (\ x__ y__ -> x__ {_Api'version = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Api "sourceContext" Proto.Google.Protobuf.SourceContext.SourceContext where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Api'sourceContext (\ x__ y__ -> x__ {_Api'sourceContext = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Api "maybe'sourceContext" (Prelude.Maybe Proto.Google.Protobuf.SourceContext.SourceContext) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Api'sourceContext (\ x__ y__ -> x__ {_Api'sourceContext = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Api "mixins" [Mixin] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Api'mixins (\ x__ y__ -> x__ {_Api'mixins = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Api "vec'mixins" (Data.Vector.Vector Mixin) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Api'mixins (\ x__ y__ -> x__ {_Api'mixins = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Api "syntax" Proto.Google.Protobuf.Type.Syntax where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Api'syntax (\ x__ y__ -> x__ {_Api'syntax = y__}))
        Prelude.id
instance Data.ProtoLens.Message Api where
  messageName _ = Data.Text.pack "google.protobuf.Api"
  packedMessageDescriptor _
    = "\n\
      \\ETXApi\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC21\n\
      \\amethods\CAN\STX \ETX(\v2\ETB.google.protobuf.MethodR\amethods\DC21\n\
      \\aoptions\CAN\ETX \ETX(\v2\ETB.google.protobuf.OptionR\aoptions\DC2\CAN\n\
      \\aversion\CAN\EOT \SOH(\tR\aversion\DC2E\n\
      \\SOsource_context\CAN\ENQ \SOH(\v2\RS.google.protobuf.SourceContextR\rsourceContext\DC2.\n\
      \\ACKmixins\CAN\ACK \ETX(\v2\SYN.google.protobuf.MixinR\ACKmixins\DC2/\n\
      \\ACKsyntax\CAN\a \SOH(\SO2\ETB.google.protobuf.SyntaxR\ACKsyntax"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"name")) ::
              Data.ProtoLens.FieldDescriptor Api
        methods__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "methods"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Method)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"methods")) ::
              Data.ProtoLens.FieldDescriptor Api
        options__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "options"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Google.Protobuf.Type.Option)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"options")) ::
              Data.ProtoLens.FieldDescriptor Api
        version__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "version"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"version")) ::
              Data.ProtoLens.FieldDescriptor Api
        sourceContext__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "source_context"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Google.Protobuf.SourceContext.SourceContext)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'sourceContext")) ::
              Data.ProtoLens.FieldDescriptor Api
        mixins__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "mixins"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Mixin)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"mixins")) ::
              Data.ProtoLens.FieldDescriptor Api
        syntax__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "syntax"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Google.Protobuf.Type.Syntax)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"syntax")) ::
              Data.ProtoLens.FieldDescriptor Api
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, name__field_descriptor),
           (Data.ProtoLens.Tag 2, methods__field_descriptor),
           (Data.ProtoLens.Tag 3, options__field_descriptor),
           (Data.ProtoLens.Tag 4, version__field_descriptor),
           (Data.ProtoLens.Tag 5, sourceContext__field_descriptor),
           (Data.ProtoLens.Tag 6, mixins__field_descriptor),
           (Data.ProtoLens.Tag 7, syntax__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Api'_unknownFields (\ x__ y__ -> x__ {_Api'_unknownFields = y__})
  defMessage
    = Api'_constructor
        {_Api'name = Data.ProtoLens.fieldDefault,
         _Api'methods = Data.Vector.Generic.empty,
         _Api'options = Data.Vector.Generic.empty,
         _Api'version = Data.ProtoLens.fieldDefault,
         _Api'sourceContext = Prelude.Nothing,
         _Api'mixins = Data.Vector.Generic.empty,
         _Api'syntax = Data.ProtoLens.fieldDefault,
         _Api'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Api
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Method
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Mixin
                -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Proto.Google.Protobuf.Type.Option
                   -> Data.ProtoLens.Encoding.Bytes.Parser Api
        loop x mutable'methods mutable'mixins mutable'options
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'methods <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                          (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                             mutable'methods)
                      frozen'mixins <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                         (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                            mutable'mixins)
                      frozen'options <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                          (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                             mutable'options)
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
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'methods") frozen'methods
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'mixins") frozen'mixins
                                 (Lens.Family2.set
                                    (Data.ProtoLens.Field.field @"vec'options") frozen'options x))))
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
                                  mutable'methods mutable'mixins mutable'options
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "methods"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'methods y)
                                loop x v mutable'mixins mutable'options
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "options"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'options y)
                                loop x mutable'methods mutable'mixins v
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "version"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"version") y x)
                                  mutable'methods mutable'mixins mutable'options
                        42
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "source_context"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"sourceContext") y x)
                                  mutable'methods mutable'mixins mutable'options
                        50
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "mixins"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'mixins y)
                                loop x mutable'methods v mutable'options
                        56
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "syntax"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"syntax") y x)
                                  mutable'methods mutable'mixins mutable'options
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'methods mutable'mixins mutable'options
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'methods <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                   Data.ProtoLens.Encoding.Growing.new
              mutable'mixins <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                  Data.ProtoLens.Encoding.Growing.new
              mutable'options <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                   Data.ProtoLens.Encoding.Growing.new
              loop
                Data.ProtoLens.defMessage mutable'methods mutable'mixins
                mutable'options)
          "Api"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"name") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8 _v))
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
                              Data.ProtoLens.encodeMessage _v))
                   (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'methods") _x))
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
                                 Data.ProtoLens.encodeMessage _v))
                      (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'options") _x))
                   ((Data.Monoid.<>)
                      (let
                         _v = Lens.Family2.view (Data.ProtoLens.Field.field @"version") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                               ((Prelude..)
                                  (\ bs
                                     -> (Data.Monoid.<>)
                                          (Data.ProtoLens.Encoding.Bytes.putVarInt
                                             (Prelude.fromIntegral (Data.ByteString.length bs)))
                                          (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                  Data.Text.Encoding.encodeUtf8 _v))
                      ((Data.Monoid.<>)
                         (case
                              Lens.Family2.view
                                (Data.ProtoLens.Field.field @"maybe'sourceContext") _x
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
                                      Data.ProtoLens.encodeMessage _v))
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
                                          Data.ProtoLens.encodeMessage _v))
                               (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'mixins") _x))
                            ((Data.Monoid.<>)
                               (let
                                  _v = Lens.Family2.view (Data.ProtoLens.Field.field @"syntax") _x
                                in
                                  if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                      Data.Monoid.mempty
                                  else
                                      (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt 56)
                                        ((Prelude..)
                                           ((Prelude..)
                                              Data.ProtoLens.Encoding.Bytes.putVarInt
                                              Prelude.fromIntegral)
                                           Prelude.fromEnum _v))
                               (Data.ProtoLens.Encoding.Wire.buildFieldSet
                                  (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))))
instance Control.DeepSeq.NFData Api where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Api'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Api'name x__)
                (Control.DeepSeq.deepseq
                   (_Api'methods x__)
                   (Control.DeepSeq.deepseq
                      (_Api'options x__)
                      (Control.DeepSeq.deepseq
                         (_Api'version x__)
                         (Control.DeepSeq.deepseq
                            (_Api'sourceContext x__)
                            (Control.DeepSeq.deepseq
                               (_Api'mixins x__)
                               (Control.DeepSeq.deepseq (_Api'syntax x__) ())))))))
{- | Fields :
     
         * 'Proto.Google.Protobuf.Api_Fields.name' @:: Lens' Method Data.Text.Text@
         * 'Proto.Google.Protobuf.Api_Fields.requestTypeUrl' @:: Lens' Method Data.Text.Text@
         * 'Proto.Google.Protobuf.Api_Fields.requestStreaming' @:: Lens' Method Prelude.Bool@
         * 'Proto.Google.Protobuf.Api_Fields.responseTypeUrl' @:: Lens' Method Data.Text.Text@
         * 'Proto.Google.Protobuf.Api_Fields.responseStreaming' @:: Lens' Method Prelude.Bool@
         * 'Proto.Google.Protobuf.Api_Fields.options' @:: Lens' Method [Proto.Google.Protobuf.Type.Option]@
         * 'Proto.Google.Protobuf.Api_Fields.vec'options' @:: Lens' Method (Data.Vector.Vector Proto.Google.Protobuf.Type.Option)@
         * 'Proto.Google.Protobuf.Api_Fields.syntax' @:: Lens' Method Proto.Google.Protobuf.Type.Syntax@ -}
data Method
  = Method'_constructor {_Method'name :: !Data.Text.Text,
                         _Method'requestTypeUrl :: !Data.Text.Text,
                         _Method'requestStreaming :: !Prelude.Bool,
                         _Method'responseTypeUrl :: !Data.Text.Text,
                         _Method'responseStreaming :: !Prelude.Bool,
                         _Method'options :: !(Data.Vector.Vector Proto.Google.Protobuf.Type.Option),
                         _Method'syntax :: !Proto.Google.Protobuf.Type.Syntax,
                         _Method'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Method where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Method "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Method'name (\ x__ y__ -> x__ {_Method'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Method "requestTypeUrl" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Method'requestTypeUrl
           (\ x__ y__ -> x__ {_Method'requestTypeUrl = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Method "requestStreaming" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Method'requestStreaming
           (\ x__ y__ -> x__ {_Method'requestStreaming = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Method "responseTypeUrl" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Method'responseTypeUrl
           (\ x__ y__ -> x__ {_Method'responseTypeUrl = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Method "responseStreaming" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Method'responseStreaming
           (\ x__ y__ -> x__ {_Method'responseStreaming = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Method "options" [Proto.Google.Protobuf.Type.Option] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Method'options (\ x__ y__ -> x__ {_Method'options = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Method "vec'options" (Data.Vector.Vector Proto.Google.Protobuf.Type.Option) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Method'options (\ x__ y__ -> x__ {_Method'options = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Method "syntax" Proto.Google.Protobuf.Type.Syntax where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Method'syntax (\ x__ y__ -> x__ {_Method'syntax = y__}))
        Prelude.id
instance Data.ProtoLens.Message Method where
  messageName _ = Data.Text.pack "google.protobuf.Method"
  packedMessageDescriptor _
    = "\n\
      \\ACKMethod\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2(\n\
      \\DLErequest_type_url\CAN\STX \SOH(\tR\SOrequestTypeUrl\DC2+\n\
      \\DC1request_streaming\CAN\ETX \SOH(\bR\DLErequestStreaming\DC2*\n\
      \\DC1response_type_url\CAN\EOT \SOH(\tR\SIresponseTypeUrl\DC2-\n\
      \\DC2response_streaming\CAN\ENQ \SOH(\bR\DC1responseStreaming\DC21\n\
      \\aoptions\CAN\ACK \ETX(\v2\ETB.google.protobuf.OptionR\aoptions\DC2/\n\
      \\ACKsyntax\CAN\a \SOH(\SO2\ETB.google.protobuf.SyntaxR\ACKsyntax"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"name")) ::
              Data.ProtoLens.FieldDescriptor Method
        requestTypeUrl__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "request_type_url"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"requestTypeUrl")) ::
              Data.ProtoLens.FieldDescriptor Method
        requestStreaming__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "request_streaming"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"requestStreaming")) ::
              Data.ProtoLens.FieldDescriptor Method
        responseTypeUrl__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "response_type_url"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"responseTypeUrl")) ::
              Data.ProtoLens.FieldDescriptor Method
        responseStreaming__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "response_streaming"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"responseStreaming")) ::
              Data.ProtoLens.FieldDescriptor Method
        options__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "options"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Google.Protobuf.Type.Option)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"options")) ::
              Data.ProtoLens.FieldDescriptor Method
        syntax__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "syntax"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Google.Protobuf.Type.Syntax)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"syntax")) ::
              Data.ProtoLens.FieldDescriptor Method
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, name__field_descriptor),
           (Data.ProtoLens.Tag 2, requestTypeUrl__field_descriptor),
           (Data.ProtoLens.Tag 3, requestStreaming__field_descriptor),
           (Data.ProtoLens.Tag 4, responseTypeUrl__field_descriptor),
           (Data.ProtoLens.Tag 5, responseStreaming__field_descriptor),
           (Data.ProtoLens.Tag 6, options__field_descriptor),
           (Data.ProtoLens.Tag 7, syntax__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Method'_unknownFields
        (\ x__ y__ -> x__ {_Method'_unknownFields = y__})
  defMessage
    = Method'_constructor
        {_Method'name = Data.ProtoLens.fieldDefault,
         _Method'requestTypeUrl = Data.ProtoLens.fieldDefault,
         _Method'requestStreaming = Data.ProtoLens.fieldDefault,
         _Method'responseTypeUrl = Data.ProtoLens.fieldDefault,
         _Method'responseStreaming = Data.ProtoLens.fieldDefault,
         _Method'options = Data.Vector.Generic.empty,
         _Method'syntax = Data.ProtoLens.fieldDefault,
         _Method'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Method
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Proto.Google.Protobuf.Type.Option
             -> Data.ProtoLens.Encoding.Bytes.Parser Method
        loop x mutable'options
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'options <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                          (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                             mutable'options)
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
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'options") frozen'options x))
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
                                  mutable'options
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "request_type_url"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"requestTypeUrl") y x)
                                  mutable'options
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "request_streaming"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"requestStreaming") y x)
                                  mutable'options
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "response_type_url"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"responseTypeUrl") y x)
                                  mutable'options
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "response_streaming"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"responseStreaming") y x)
                                  mutable'options
                        50
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "options"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'options y)
                                loop x v
                        56
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "syntax"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"syntax") y x)
                                  mutable'options
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'options
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'options <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                   Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'options)
          "Method"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"name") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8 _v))
             ((Data.Monoid.<>)
                (let
                   _v
                     = Lens.Family2.view
                         (Data.ProtoLens.Field.field @"requestTypeUrl") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((Prelude..)
                            (\ bs
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                       (Prelude.fromIntegral (Data.ByteString.length bs)))
                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            Data.Text.Encoding.encodeUtf8 _v))
                ((Data.Monoid.<>)
                   (let
                      _v
                        = Lens.Family2.view
                            (Data.ProtoLens.Field.field @"requestStreaming") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                               _v))
                   ((Data.Monoid.<>)
                      (let
                         _v
                           = Lens.Family2.view
                               (Data.ProtoLens.Field.field @"responseTypeUrl") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                               ((Prelude..)
                                  (\ bs
                                     -> (Data.Monoid.<>)
                                          (Data.ProtoLens.Encoding.Bytes.putVarInt
                                             (Prelude.fromIntegral (Data.ByteString.length bs)))
                                          (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                  Data.Text.Encoding.encodeUtf8 _v))
                      ((Data.Monoid.<>)
                         (let
                            _v
                              = Lens.Family2.view
                                  (Data.ProtoLens.Field.field @"responseStreaming") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                  ((Prelude..)
                                     Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (\ b -> if b then 1 else 0) _v))
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
                                          Data.ProtoLens.encodeMessage _v))
                               (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'options") _x))
                            ((Data.Monoid.<>)
                               (let
                                  _v = Lens.Family2.view (Data.ProtoLens.Field.field @"syntax") _x
                                in
                                  if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                      Data.Monoid.mempty
                                  else
                                      (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt 56)
                                        ((Prelude..)
                                           ((Prelude..)
                                              Data.ProtoLens.Encoding.Bytes.putVarInt
                                              Prelude.fromIntegral)
                                           Prelude.fromEnum _v))
                               (Data.ProtoLens.Encoding.Wire.buildFieldSet
                                  (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))))
instance Control.DeepSeq.NFData Method where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Method'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Method'name x__)
                (Control.DeepSeq.deepseq
                   (_Method'requestTypeUrl x__)
                   (Control.DeepSeq.deepseq
                      (_Method'requestStreaming x__)
                      (Control.DeepSeq.deepseq
                         (_Method'responseTypeUrl x__)
                         (Control.DeepSeq.deepseq
                            (_Method'responseStreaming x__)
                            (Control.DeepSeq.deepseq
                               (_Method'options x__)
                               (Control.DeepSeq.deepseq (_Method'syntax x__) ())))))))
{- | Fields :
     
         * 'Proto.Google.Protobuf.Api_Fields.name' @:: Lens' Mixin Data.Text.Text@
         * 'Proto.Google.Protobuf.Api_Fields.root' @:: Lens' Mixin Data.Text.Text@ -}
data Mixin
  = Mixin'_constructor {_Mixin'name :: !Data.Text.Text,
                        _Mixin'root :: !Data.Text.Text,
                        _Mixin'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Mixin where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Mixin "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Mixin'name (\ x__ y__ -> x__ {_Mixin'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Mixin "root" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Mixin'root (\ x__ y__ -> x__ {_Mixin'root = y__}))
        Prelude.id
instance Data.ProtoLens.Message Mixin where
  messageName _ = Data.Text.pack "google.protobuf.Mixin"
  packedMessageDescriptor _
    = "\n\
      \\ENQMixin\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2\DC2\n\
      \\EOTroot\CAN\STX \SOH(\tR\EOTroot"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"name")) ::
              Data.ProtoLens.FieldDescriptor Mixin
        root__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "root"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"root")) ::
              Data.ProtoLens.FieldDescriptor Mixin
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, name__field_descriptor),
           (Data.ProtoLens.Tag 2, root__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Mixin'_unknownFields
        (\ x__ y__ -> x__ {_Mixin'_unknownFields = y__})
  defMessage
    = Mixin'_constructor
        {_Mixin'name = Data.ProtoLens.fieldDefault,
         _Mixin'root = Data.ProtoLens.fieldDefault,
         _Mixin'_unknownFields = []}
  parseMessage
    = let
        loop :: Mixin -> Data.ProtoLens.Encoding.Bytes.Parser Mixin
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
                                       "root"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"root") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Mixin"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"name") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8 _v))
             ((Data.Monoid.<>)
                (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"root") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((Prelude..)
                            (\ bs
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                       (Prelude.fromIntegral (Data.ByteString.length bs)))
                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            Data.Text.Encoding.encodeUtf8 _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData Mixin where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Mixin'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Mixin'name x__) (Control.DeepSeq.deepseq (_Mixin'root x__) ()))
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\EMgoogle/protobuf/api.proto\DC2\SIgoogle.protobuf\SUB$google/protobuf/source_context.proto\SUB\SUBgoogle/protobuf/type.proto\"\193\STX\n\
    \\ETXApi\DC2\DC2\n\
    \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC21\n\
    \\amethods\CAN\STX \ETX(\v2\ETB.google.protobuf.MethodR\amethods\DC21\n\
    \\aoptions\CAN\ETX \ETX(\v2\ETB.google.protobuf.OptionR\aoptions\DC2\CAN\n\
    \\aversion\CAN\EOT \SOH(\tR\aversion\DC2E\n\
    \\SOsource_context\CAN\ENQ \SOH(\v2\RS.google.protobuf.SourceContextR\rsourceContext\DC2.\n\
    \\ACKmixins\CAN\ACK \ETX(\v2\SYN.google.protobuf.MixinR\ACKmixins\DC2/\n\
    \\ACKsyntax\CAN\a \SOH(\SO2\ETB.google.protobuf.SyntaxR\ACKsyntax\"\178\STX\n\
    \\ACKMethod\DC2\DC2\n\
    \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2(\n\
    \\DLErequest_type_url\CAN\STX \SOH(\tR\SOrequestTypeUrl\DC2+\n\
    \\DC1request_streaming\CAN\ETX \SOH(\bR\DLErequestStreaming\DC2*\n\
    \\DC1response_type_url\CAN\EOT \SOH(\tR\SIresponseTypeUrl\DC2-\n\
    \\DC2response_streaming\CAN\ENQ \SOH(\bR\DC1responseStreaming\DC21\n\
    \\aoptions\CAN\ACK \ETX(\v2\ETB.google.protobuf.OptionR\aoptions\DC2/\n\
    \\ACKsyntax\CAN\a \SOH(\SO2\ETB.google.protobuf.SyntaxR\ACKsyntax\"/\n\
    \\ENQMixin\DC2\DC2\n\
    \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2\DC2\n\
    \\EOTroot\CAN\STX \SOH(\tR\EOTrootBv\n\
    \\DC3com.google.protobufB\bApiProtoP\SOHZ,google.golang.org/protobuf/types/known/apipb\162\STX\ETXGPB\170\STX\RSGoogle.Protobuf.WellKnownTypesJ\255;\n\
    \\a\DC2\ENQ\RS\NUL\206\SOH\SOH\n\
    \\204\f\n\
    \\SOH\f\DC2\ETX\RS\NUL\DC22\193\f Protocol Buffers - Google's data interchange format\n\
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
    \\n\
    \\b\n\
    \\SOH\STX\DC2\ETX \NUL\CAN\n\
    \\t\n\
    \\STX\ETX\NUL\DC2\ETX\"\NUL.\n\
    \\t\n\
    \\STX\ETX\SOH\DC2\ETX#\NUL$\n\
    \\b\n\
    \\SOH\b\DC2\ETX%\NUL,\n\
    \\t\n\
    \\STX\b\SOH\DC2\ETX%\NUL,\n\
    \\b\n\
    \\SOH\b\DC2\ETX&\NUL)\n\
    \\t\n\
    \\STX\b\b\DC2\ETX&\NUL)\n\
    \\b\n\
    \\SOH\b\DC2\ETX'\NUL\"\n\
    \\t\n\
    \\STX\b\n\
    \\DC2\ETX'\NUL\"\n\
    \\b\n\
    \\SOH\b\DC2\ETX(\NUL!\n\
    \\t\n\
    \\STX\b$\DC2\ETX(\NUL!\n\
    \\b\n\
    \\SOH\b\DC2\ETX)\NUL;\n\
    \\t\n\
    \\STX\b%\DC2\ETX)\NUL;\n\
    \\b\n\
    \\SOH\b\DC2\ETX*\NULC\n\
    \\t\n\
    \\STX\b\v\DC2\ETX*\NULC\n\
    \\171\EOT\n\
    \\STX\EOT\NUL\DC2\EOT5\NUL_\SOH\SUB\158\EOT Api is a light-weight descriptor for an API Interface.\n\
    \\n\
    \ Interfaces are also described as \"protocol buffer services\" in some contexts,\n\
    \ such as by the \"service\" keyword in a .proto file, but they are different\n\
    \ from API Services, which represent a concrete implementation of an interface\n\
    \ as opposed to simply a description of methods and bindings. They are also\n\
    \ sometimes simply referred to as \"APIs\" in other contexts, such as the name of\n\
    \ this message itself. See https://cloud.google.com/apis/design/glossary for\n\
    \ detailed terminology.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX5\b\v\n\
    \{\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX8\STX\DC2\SUBn The fully qualified name of this interface, including package name\n\
    \ followed by the interface's simple name.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ENQ\DC2\ETX8\STX\b\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX8\t\r\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX8\DLE\DC1\n\
    \C\n\
    \\EOT\EOT\NUL\STX\SOH\DC2\ETX;\STX\RS\SUB6 The methods of this interface, in unspecified order.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\EOT\DC2\ETX;\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ACK\DC2\ETX;\v\DC1\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\SOH\DC2\ETX;\DC2\EM\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ETX\DC2\ETX;\FS\GS\n\
    \6\n\
    \\EOT\EOT\NUL\STX\STX\DC2\ETX>\STX\RS\SUB) Any metadata attached to the interface.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\EOT\DC2\ETX>\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\ACK\DC2\ETX>\v\DC1\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\SOH\DC2\ETX>\DC2\EM\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\ETX\DC2\ETX>\FS\GS\n\
    \\129\b\n\
    \\EOT\EOT\NUL\STX\ETX\DC2\ETXT\STX\NAK\SUB\243\a A version string for this interface. If specified, must have the form\n\
    \ `major-version.minor-version`, as in `1.10`. If the minor version is\n\
    \ omitted, it defaults to zero. If the entire version field is empty, the\n\
    \ major version is derived from the package name, as outlined below. If the\n\
    \ field is not empty, the version in the package name will be verified to be\n\
    \ consistent with what is provided here.\n\
    \\n\
    \ The versioning schema uses [semantic\n\
    \ versioning](http://semver.org) where the major version number\n\
    \ indicates a breaking change and the minor version an additive,\n\
    \ non-breaking change. Both version numbers are signals to users\n\
    \ what to expect from different versions, and should be carefully\n\
    \ chosen based on the product plan.\n\
    \\n\
    \ The major version is also reflected in the package name of the\n\
    \ interface, which must end in `v<major-version>`, as in\n\
    \ `google.feature.v1`. For major versions 0 and 1, the suffix can\n\
    \ be omitted. Zero major versions must only be used for\n\
    \ experimental, non-GA interfaces.\n\
    \\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ETX\ENQ\DC2\ETXT\STX\b\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ETX\SOH\DC2\ETXT\t\DLE\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ETX\ETX\DC2\ETXT\DC3\DC4\n\
    \[\n\
    \\EOT\EOT\NUL\STX\EOT\DC2\ETXX\STX#\SUBN Source context for the protocol buffer service represented by this\n\
    \ message.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\EOT\ACK\DC2\ETXX\STX\SI\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\EOT\SOH\DC2\ETXX\DLE\RS\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\EOT\ETX\DC2\ETXX!\"\n\
    \2\n\
    \\EOT\EOT\NUL\STX\ENQ\DC2\ETX[\STX\FS\SUB% Included interfaces. See [Mixin][].\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ENQ\EOT\DC2\ETX[\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ENQ\ACK\DC2\ETX[\v\DLE\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ENQ\SOH\DC2\ETX[\DC1\ETB\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ENQ\ETX\DC2\ETX[\SUB\ESC\n\
    \0\n\
    \\EOT\EOT\NUL\STX\ACK\DC2\ETX^\STX\DC4\SUB# The source syntax of the service.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ACK\ACK\DC2\ETX^\STX\b\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ACK\SOH\DC2\ETX^\t\SI\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ACK\ETX\DC2\ETX^\DC2\DC3\n\
    \=\n\
    \\STX\EOT\SOH\DC2\EOTb\NULw\SOH\SUB1 Method represents a method of an API interface.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETXb\b\SO\n\
    \.\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\ETXd\STX\DC2\SUB! The simple name of this method.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ENQ\DC2\ETXd\STX\b\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\ETXd\t\r\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\ETXd\DLE\DC1\n\
    \/\n\
    \\EOT\EOT\SOH\STX\SOH\DC2\ETXg\STX\RS\SUB\" A URL of the input message type.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ENQ\DC2\ETXg\STX\b\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\SOH\DC2\ETXg\t\EM\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ETX\DC2\ETXg\FS\GS\n\
    \0\n\
    \\EOT\EOT\SOH\STX\STX\DC2\ETXj\STX\GS\SUB# If true, the request is streamed.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ENQ\DC2\ETXj\STX\ACK\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\SOH\DC2\ETXj\a\CAN\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ETX\DC2\ETXj\ESC\FS\n\
    \2\n\
    \\EOT\EOT\SOH\STX\ETX\DC2\ETXm\STX\US\SUB% The URL of the output message type.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\ENQ\DC2\ETXm\STX\b\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\SOH\DC2\ETXm\t\SUB\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\ETX\DC2\ETXm\GS\RS\n\
    \1\n\
    \\EOT\EOT\SOH\STX\EOT\DC2\ETXp\STX\RS\SUB$ If true, the response is streamed.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\EOT\ENQ\DC2\ETXp\STX\ACK\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\EOT\SOH\DC2\ETXp\a\EM\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\EOT\ETX\DC2\ETXp\FS\GS\n\
    \3\n\
    \\EOT\EOT\SOH\STX\ENQ\DC2\ETXs\STX\RS\SUB& Any metadata attached to the method.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ENQ\EOT\DC2\ETXs\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ENQ\ACK\DC2\ETXs\v\DC1\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ENQ\SOH\DC2\ETXs\DC2\EM\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ENQ\ETX\DC2\ETXs\FS\GS\n\
    \0\n\
    \\EOT\EOT\SOH\STX\ACK\DC2\ETXv\STX\DC4\SUB# The source syntax of this method.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ACK\ACK\DC2\ETXv\STX\b\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ACK\SOH\DC2\ETXv\t\SI\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ACK\ETX\DC2\ETXv\DC2\DC3\n\
    \\201\DC3\n\
    \\STX\EOT\STX\DC2\ACK\199\SOH\NUL\206\SOH\SOH\SUB\186\DC3 Declares an API Interface to be included in this interface. The including\n\
    \ interface must redeclare all the methods from the included interface, but\n\
    \ documentation and options are inherited as follows:\n\
    \\n\
    \ - If after comment and whitespace stripping, the documentation\n\
    \   string of the redeclared method is empty, it will be inherited\n\
    \   from the original method.\n\
    \\n\
    \ - Each annotation belonging to the service config (http,\n\
    \   visibility) which is not set in the redeclared method will be\n\
    \   inherited.\n\
    \\n\
    \ - If an http annotation is inherited, the path pattern will be\n\
    \   modified as follows. Any version prefix will be replaced by the\n\
    \   version of the including interface plus the [root][] path if\n\
    \   specified.\n\
    \\n\
    \ Example of a simple mixin:\n\
    \\n\
    \     package google.acl.v1;\n\
    \     service AccessControl {\n\
    \       // Get the underlying ACL object.\n\
    \       rpc GetAcl(GetAclRequest) returns (Acl) {\n\
    \         option (google.api.http).get = \"/v1/{resource=**}:getAcl\";\n\
    \       }\n\
    \     }\n\
    \\n\
    \     package google.storage.v2;\n\
    \     service Storage {\n\
    \       rpc GetAcl(GetAclRequest) returns (Acl);\n\
    \\n\
    \       // Get a data record.\n\
    \       rpc GetData(GetDataRequest) returns (Data) {\n\
    \         option (google.api.http).get = \"/v2/{resource=**}\";\n\
    \       }\n\
    \     }\n\
    \\n\
    \ Example of a mixin configuration:\n\
    \\n\
    \     apis:\n\
    \     - name: google.storage.v2.Storage\n\
    \       mixins:\n\
    \       - name: google.acl.v1.AccessControl\n\
    \\n\
    \ The mixin construct implies that all methods in `AccessControl` are\n\
    \ also declared with same name and request/response types in\n\
    \ `Storage`. A documentation generator or annotation processor will\n\
    \ see the effective `Storage.GetAcl` method after inherting\n\
    \ documentation and annotations as follows:\n\
    \\n\
    \     service Storage {\n\
    \       // Get the underlying ACL object.\n\
    \       rpc GetAcl(GetAclRequest) returns (Acl) {\n\
    \         option (google.api.http).get = \"/v2/{resource=**}:getAcl\";\n\
    \       }\n\
    \       ...\n\
    \     }\n\
    \\n\
    \ Note how the version in the path pattern changed from `v1` to `v2`.\n\
    \\n\
    \ If the `root` field in the mixin is specified, it should be a\n\
    \ relative path under which inherited HTTP paths are placed. Example:\n\
    \\n\
    \     apis:\n\
    \     - name: google.storage.v2.Storage\n\
    \       mixins:\n\
    \       - name: google.acl.v1.AccessControl\n\
    \         root: acls\n\
    \\n\
    \ This implies the following inherited HTTP annotation:\n\
    \\n\
    \     service Storage {\n\
    \       // Get the underlying ACL object.\n\
    \       rpc GetAcl(GetAclRequest) returns (Acl) {\n\
    \         option (google.api.http).get = \"/v2/acls/{resource=**}:getAcl\";\n\
    \       }\n\
    \       ...\n\
    \     }\n\
    \\n\
    \\v\n\
    \\ETX\EOT\STX\SOH\DC2\EOT\199\SOH\b\r\n\
    \L\n\
    \\EOT\EOT\STX\STX\NUL\DC2\EOT\201\SOH\STX\DC2\SUB> The fully qualified name of the interface which is included.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\NUL\ENQ\DC2\EOT\201\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\NUL\SOH\DC2\EOT\201\SOH\t\r\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\NUL\ETX\DC2\EOT\201\SOH\DLE\DC1\n\
    \[\n\
    \\EOT\EOT\STX\STX\SOH\DC2\EOT\205\SOH\STX\DC2\SUBM If non-empty specifies a path under which inherited HTTP paths\n\
    \ are rooted.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\SOH\ENQ\DC2\EOT\205\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\SOH\SOH\DC2\EOT\205\SOH\t\r\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\SOH\ETX\DC2\EOT\205\SOH\DLE\DC1b\ACKproto3"