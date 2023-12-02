{- This file was auto-generated from google/protobuf/type.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Google.Protobuf.Type (
        Enum(), EnumValue(), Field(), Field'Cardinality(..),
        Field'Cardinality(), Field'Cardinality'UnrecognizedValue,
        Field'Kind(..), Field'Kind(), Field'Kind'UnrecognizedValue,
        Option(), Syntax(..), Syntax(), Syntax'UnrecognizedValue, Type()
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
import qualified Proto.Google.Protobuf.Any
import qualified Proto.Google.Protobuf.SourceContext
{- | Fields :
     
         * 'Proto.Google.Protobuf.Type_Fields.name' @:: Lens' Enum Data.Text.Text@
         * 'Proto.Google.Protobuf.Type_Fields.enumvalue' @:: Lens' Enum [EnumValue]@
         * 'Proto.Google.Protobuf.Type_Fields.vec'enumvalue' @:: Lens' Enum (Data.Vector.Vector EnumValue)@
         * 'Proto.Google.Protobuf.Type_Fields.options' @:: Lens' Enum [Option]@
         * 'Proto.Google.Protobuf.Type_Fields.vec'options' @:: Lens' Enum (Data.Vector.Vector Option)@
         * 'Proto.Google.Protobuf.Type_Fields.sourceContext' @:: Lens' Enum Proto.Google.Protobuf.SourceContext.SourceContext@
         * 'Proto.Google.Protobuf.Type_Fields.maybe'sourceContext' @:: Lens' Enum (Prelude.Maybe Proto.Google.Protobuf.SourceContext.SourceContext)@
         * 'Proto.Google.Protobuf.Type_Fields.syntax' @:: Lens' Enum Syntax@
         * 'Proto.Google.Protobuf.Type_Fields.edition' @:: Lens' Enum Data.Text.Text@ -}
data Enum
  = Enum'_constructor {_Enum'name :: !Data.Text.Text,
                       _Enum'enumvalue :: !(Data.Vector.Vector EnumValue),
                       _Enum'options :: !(Data.Vector.Vector Option),
                       _Enum'sourceContext :: !(Prelude.Maybe Proto.Google.Protobuf.SourceContext.SourceContext),
                       _Enum'syntax :: !Syntax,
                       _Enum'edition :: !Data.Text.Text,
                       _Enum'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Enum where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Enum "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Enum'name (\ x__ y__ -> x__ {_Enum'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Enum "enumvalue" [EnumValue] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Enum'enumvalue (\ x__ y__ -> x__ {_Enum'enumvalue = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Enum "vec'enumvalue" (Data.Vector.Vector EnumValue) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Enum'enumvalue (\ x__ y__ -> x__ {_Enum'enumvalue = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Enum "options" [Option] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Enum'options (\ x__ y__ -> x__ {_Enum'options = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Enum "vec'options" (Data.Vector.Vector Option) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Enum'options (\ x__ y__ -> x__ {_Enum'options = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Enum "sourceContext" Proto.Google.Protobuf.SourceContext.SourceContext where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Enum'sourceContext (\ x__ y__ -> x__ {_Enum'sourceContext = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Enum "maybe'sourceContext" (Prelude.Maybe Proto.Google.Protobuf.SourceContext.SourceContext) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Enum'sourceContext (\ x__ y__ -> x__ {_Enum'sourceContext = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Enum "syntax" Syntax where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Enum'syntax (\ x__ y__ -> x__ {_Enum'syntax = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Enum "edition" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Enum'edition (\ x__ y__ -> x__ {_Enum'edition = y__}))
        Prelude.id
instance Data.ProtoLens.Message Enum where
  messageName _ = Data.Text.pack "google.protobuf.Enum"
  packedMessageDescriptor _
    = "\n\
      \\EOTEnum\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC28\n\
      \\tenumvalue\CAN\STX \ETX(\v2\SUB.google.protobuf.EnumValueR\tenumvalue\DC21\n\
      \\aoptions\CAN\ETX \ETX(\v2\ETB.google.protobuf.OptionR\aoptions\DC2E\n\
      \\SOsource_context\CAN\EOT \SOH(\v2\RS.google.protobuf.SourceContextR\rsourceContext\DC2/\n\
      \\ACKsyntax\CAN\ENQ \SOH(\SO2\ETB.google.protobuf.SyntaxR\ACKsyntax\DC2\CAN\n\
      \\aedition\CAN\ACK \SOH(\tR\aedition"
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
              Data.ProtoLens.FieldDescriptor Enum
        enumvalue__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "enumvalue"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor EnumValue)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"enumvalue")) ::
              Data.ProtoLens.FieldDescriptor Enum
        options__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "options"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Option)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"options")) ::
              Data.ProtoLens.FieldDescriptor Enum
        sourceContext__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "source_context"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Google.Protobuf.SourceContext.SourceContext)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'sourceContext")) ::
              Data.ProtoLens.FieldDescriptor Enum
        syntax__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "syntax"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Syntax)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"syntax")) ::
              Data.ProtoLens.FieldDescriptor Enum
        edition__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "edition"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"edition")) ::
              Data.ProtoLens.FieldDescriptor Enum
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, name__field_descriptor),
           (Data.ProtoLens.Tag 2, enumvalue__field_descriptor),
           (Data.ProtoLens.Tag 3, options__field_descriptor),
           (Data.ProtoLens.Tag 4, sourceContext__field_descriptor),
           (Data.ProtoLens.Tag 5, syntax__field_descriptor),
           (Data.ProtoLens.Tag 6, edition__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Enum'_unknownFields
        (\ x__ y__ -> x__ {_Enum'_unknownFields = y__})
  defMessage
    = Enum'_constructor
        {_Enum'name = Data.ProtoLens.fieldDefault,
         _Enum'enumvalue = Data.Vector.Generic.empty,
         _Enum'options = Data.Vector.Generic.empty,
         _Enum'sourceContext = Prelude.Nothing,
         _Enum'syntax = Data.ProtoLens.fieldDefault,
         _Enum'edition = Data.ProtoLens.fieldDefault,
         _Enum'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Enum
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld EnumValue
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Option
                -> Data.ProtoLens.Encoding.Bytes.Parser Enum
        loop x mutable'enumvalue mutable'options
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'enumvalue <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                            (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                               mutable'enumvalue)
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
                              (Data.ProtoLens.Field.field @"vec'enumvalue") frozen'enumvalue
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'options") frozen'options x)))
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
                                  mutable'enumvalue mutable'options
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "enumvalue"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'enumvalue y)
                                loop x v mutable'options
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "options"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'options y)
                                loop x mutable'enumvalue v
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "source_context"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"sourceContext") y x)
                                  mutable'enumvalue mutable'options
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "syntax"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"syntax") y x)
                                  mutable'enumvalue mutable'options
                        50
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "edition"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"edition") y x)
                                  mutable'enumvalue mutable'options
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'enumvalue mutable'options
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'enumvalue <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                     Data.ProtoLens.Encoding.Growing.new
              mutable'options <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                   Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'enumvalue mutable'options)
          "Enum"
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
                   (Lens.Family2.view
                      (Data.ProtoLens.Field.field @"vec'enumvalue") _x))
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
                      (case
                           Lens.Family2.view
                             (Data.ProtoLens.Field.field @"maybe'sourceContext") _x
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
                                   Data.ProtoLens.encodeMessage _v))
                      ((Data.Monoid.<>)
                         (let
                            _v = Lens.Family2.view (Data.ProtoLens.Field.field @"syntax") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                  ((Prelude..)
                                     ((Prelude..)
                                        Data.ProtoLens.Encoding.Bytes.putVarInt
                                        Prelude.fromIntegral)
                                     Prelude.fromEnum _v))
                         ((Data.Monoid.<>)
                            (let
                               _v = Lens.Family2.view (Data.ProtoLens.Field.field @"edition") _x
                             in
                               if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                   Data.Monoid.mempty
                               else
                                   (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt 50)
                                     ((Prelude..)
                                        (\ bs
                                           -> (Data.Monoid.<>)
                                                (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                   (Prelude.fromIntegral
                                                      (Data.ByteString.length bs)))
                                                (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                        Data.Text.Encoding.encodeUtf8 _v))
                            (Data.ProtoLens.Encoding.Wire.buildFieldSet
                               (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))))
instance Control.DeepSeq.NFData Enum where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Enum'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Enum'name x__)
                (Control.DeepSeq.deepseq
                   (_Enum'enumvalue x__)
                   (Control.DeepSeq.deepseq
                      (_Enum'options x__)
                      (Control.DeepSeq.deepseq
                         (_Enum'sourceContext x__)
                         (Control.DeepSeq.deepseq
                            (_Enum'syntax x__)
                            (Control.DeepSeq.deepseq (_Enum'edition x__) ()))))))
{- | Fields :
     
         * 'Proto.Google.Protobuf.Type_Fields.name' @:: Lens' EnumValue Data.Text.Text@
         * 'Proto.Google.Protobuf.Type_Fields.number' @:: Lens' EnumValue Data.Int.Int32@
         * 'Proto.Google.Protobuf.Type_Fields.options' @:: Lens' EnumValue [Option]@
         * 'Proto.Google.Protobuf.Type_Fields.vec'options' @:: Lens' EnumValue (Data.Vector.Vector Option)@ -}
data EnumValue
  = EnumValue'_constructor {_EnumValue'name :: !Data.Text.Text,
                            _EnumValue'number :: !Data.Int.Int32,
                            _EnumValue'options :: !(Data.Vector.Vector Option),
                            _EnumValue'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show EnumValue where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField EnumValue "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumValue'name (\ x__ y__ -> x__ {_EnumValue'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField EnumValue "number" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumValue'number (\ x__ y__ -> x__ {_EnumValue'number = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField EnumValue "options" [Option] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumValue'options (\ x__ y__ -> x__ {_EnumValue'options = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField EnumValue "vec'options" (Data.Vector.Vector Option) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _EnumValue'options (\ x__ y__ -> x__ {_EnumValue'options = y__}))
        Prelude.id
instance Data.ProtoLens.Message EnumValue where
  messageName _ = Data.Text.pack "google.protobuf.EnumValue"
  packedMessageDescriptor _
    = "\n\
      \\tEnumValue\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2\SYN\n\
      \\ACKnumber\CAN\STX \SOH(\ENQR\ACKnumber\DC21\n\
      \\aoptions\CAN\ETX \ETX(\v2\ETB.google.protobuf.OptionR\aoptions"
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
              Data.ProtoLens.FieldDescriptor EnumValue
        number__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "number"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"number")) ::
              Data.ProtoLens.FieldDescriptor EnumValue
        options__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "options"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Option)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"options")) ::
              Data.ProtoLens.FieldDescriptor EnumValue
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, name__field_descriptor),
           (Data.ProtoLens.Tag 2, number__field_descriptor),
           (Data.ProtoLens.Tag 3, options__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _EnumValue'_unknownFields
        (\ x__ y__ -> x__ {_EnumValue'_unknownFields = y__})
  defMessage
    = EnumValue'_constructor
        {_EnumValue'name = Data.ProtoLens.fieldDefault,
         _EnumValue'number = Data.ProtoLens.fieldDefault,
         _EnumValue'options = Data.Vector.Generic.empty,
         _EnumValue'_unknownFields = []}
  parseMessage
    = let
        loop ::
          EnumValue
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Option
             -> Data.ProtoLens.Encoding.Bytes.Parser EnumValue
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
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "number"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"number") y x)
                                  mutable'options
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "options"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'options y)
                                loop x v
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
          "EnumValue"
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
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"number") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
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
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData EnumValue where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_EnumValue'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_EnumValue'name x__)
                (Control.DeepSeq.deepseq
                   (_EnumValue'number x__)
                   (Control.DeepSeq.deepseq (_EnumValue'options x__) ())))
{- | Fields :
     
         * 'Proto.Google.Protobuf.Type_Fields.kind' @:: Lens' Field Field'Kind@
         * 'Proto.Google.Protobuf.Type_Fields.cardinality' @:: Lens' Field Field'Cardinality@
         * 'Proto.Google.Protobuf.Type_Fields.number' @:: Lens' Field Data.Int.Int32@
         * 'Proto.Google.Protobuf.Type_Fields.name' @:: Lens' Field Data.Text.Text@
         * 'Proto.Google.Protobuf.Type_Fields.typeUrl' @:: Lens' Field Data.Text.Text@
         * 'Proto.Google.Protobuf.Type_Fields.oneofIndex' @:: Lens' Field Data.Int.Int32@
         * 'Proto.Google.Protobuf.Type_Fields.packed' @:: Lens' Field Prelude.Bool@
         * 'Proto.Google.Protobuf.Type_Fields.options' @:: Lens' Field [Option]@
         * 'Proto.Google.Protobuf.Type_Fields.vec'options' @:: Lens' Field (Data.Vector.Vector Option)@
         * 'Proto.Google.Protobuf.Type_Fields.jsonName' @:: Lens' Field Data.Text.Text@
         * 'Proto.Google.Protobuf.Type_Fields.defaultValue' @:: Lens' Field Data.Text.Text@ -}
data Field
  = Field'_constructor {_Field'kind :: !Field'Kind,
                        _Field'cardinality :: !Field'Cardinality,
                        _Field'number :: !Data.Int.Int32,
                        _Field'name :: !Data.Text.Text,
                        _Field'typeUrl :: !Data.Text.Text,
                        _Field'oneofIndex :: !Data.Int.Int32,
                        _Field'packed :: !Prelude.Bool,
                        _Field'options :: !(Data.Vector.Vector Option),
                        _Field'jsonName :: !Data.Text.Text,
                        _Field'defaultValue :: !Data.Text.Text,
                        _Field'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Field where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Field "kind" Field'Kind where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Field'kind (\ x__ y__ -> x__ {_Field'kind = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Field "cardinality" Field'Cardinality where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Field'cardinality (\ x__ y__ -> x__ {_Field'cardinality = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Field "number" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Field'number (\ x__ y__ -> x__ {_Field'number = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Field "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Field'name (\ x__ y__ -> x__ {_Field'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Field "typeUrl" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Field'typeUrl (\ x__ y__ -> x__ {_Field'typeUrl = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Field "oneofIndex" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Field'oneofIndex (\ x__ y__ -> x__ {_Field'oneofIndex = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Field "packed" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Field'packed (\ x__ y__ -> x__ {_Field'packed = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Field "options" [Option] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Field'options (\ x__ y__ -> x__ {_Field'options = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Field "vec'options" (Data.Vector.Vector Option) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Field'options (\ x__ y__ -> x__ {_Field'options = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Field "jsonName" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Field'jsonName (\ x__ y__ -> x__ {_Field'jsonName = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Field "defaultValue" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Field'defaultValue (\ x__ y__ -> x__ {_Field'defaultValue = y__}))
        Prelude.id
instance Data.ProtoLens.Message Field where
  messageName _ = Data.Text.pack "google.protobuf.Field"
  packedMessageDescriptor _
    = "\n\
      \\ENQField\DC2/\n\
      \\EOTkind\CAN\SOH \SOH(\SO2\ESC.google.protobuf.Field.KindR\EOTkind\DC2D\n\
      \\vcardinality\CAN\STX \SOH(\SO2\".google.protobuf.Field.CardinalityR\vcardinality\DC2\SYN\n\
      \\ACKnumber\CAN\ETX \SOH(\ENQR\ACKnumber\DC2\DC2\n\
      \\EOTname\CAN\EOT \SOH(\tR\EOTname\DC2\EM\n\
      \\btype_url\CAN\ACK \SOH(\tR\atypeUrl\DC2\US\n\
      \\voneof_index\CAN\a \SOH(\ENQR\n\
      \oneofIndex\DC2\SYN\n\
      \\ACKpacked\CAN\b \SOH(\bR\ACKpacked\DC21\n\
      \\aoptions\CAN\t \ETX(\v2\ETB.google.protobuf.OptionR\aoptions\DC2\ESC\n\
      \\tjson_name\CAN\n\
      \ \SOH(\tR\bjsonName\DC2#\n\
      \\rdefault_value\CAN\v \SOH(\tR\fdefaultValue\"\200\STX\n\
      \\EOTKind\DC2\DLE\n\
      \\fTYPE_UNKNOWN\DLE\NUL\DC2\SI\n\
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
      \\vTYPE_SINT64\DLE\DC2\"t\n\
      \\vCardinality\DC2\ETB\n\
      \\DC3CARDINALITY_UNKNOWN\DLE\NUL\DC2\CAN\n\
      \\DC4CARDINALITY_OPTIONAL\DLE\SOH\DC2\CAN\n\
      \\DC4CARDINALITY_REQUIRED\DLE\STX\DC2\CAN\n\
      \\DC4CARDINALITY_REPEATED\DLE\ETX"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        kind__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "kind"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Field'Kind)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"kind")) ::
              Data.ProtoLens.FieldDescriptor Field
        cardinality__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "cardinality"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Field'Cardinality)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"cardinality")) ::
              Data.ProtoLens.FieldDescriptor Field
        number__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "number"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"number")) ::
              Data.ProtoLens.FieldDescriptor Field
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"name")) ::
              Data.ProtoLens.FieldDescriptor Field
        typeUrl__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "type_url"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"typeUrl")) ::
              Data.ProtoLens.FieldDescriptor Field
        oneofIndex__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "oneof_index"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"oneofIndex")) ::
              Data.ProtoLens.FieldDescriptor Field
        packed__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "packed"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"packed")) ::
              Data.ProtoLens.FieldDescriptor Field
        options__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "options"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Option)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"options")) ::
              Data.ProtoLens.FieldDescriptor Field
        jsonName__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "json_name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"jsonName")) ::
              Data.ProtoLens.FieldDescriptor Field
        defaultValue__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "default_value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"defaultValue")) ::
              Data.ProtoLens.FieldDescriptor Field
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, kind__field_descriptor),
           (Data.ProtoLens.Tag 2, cardinality__field_descriptor),
           (Data.ProtoLens.Tag 3, number__field_descriptor),
           (Data.ProtoLens.Tag 4, name__field_descriptor),
           (Data.ProtoLens.Tag 6, typeUrl__field_descriptor),
           (Data.ProtoLens.Tag 7, oneofIndex__field_descriptor),
           (Data.ProtoLens.Tag 8, packed__field_descriptor),
           (Data.ProtoLens.Tag 9, options__field_descriptor),
           (Data.ProtoLens.Tag 10, jsonName__field_descriptor),
           (Data.ProtoLens.Tag 11, defaultValue__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Field'_unknownFields
        (\ x__ y__ -> x__ {_Field'_unknownFields = y__})
  defMessage
    = Field'_constructor
        {_Field'kind = Data.ProtoLens.fieldDefault,
         _Field'cardinality = Data.ProtoLens.fieldDefault,
         _Field'number = Data.ProtoLens.fieldDefault,
         _Field'name = Data.ProtoLens.fieldDefault,
         _Field'typeUrl = Data.ProtoLens.fieldDefault,
         _Field'oneofIndex = Data.ProtoLens.fieldDefault,
         _Field'packed = Data.ProtoLens.fieldDefault,
         _Field'options = Data.Vector.Generic.empty,
         _Field'jsonName = Data.ProtoLens.fieldDefault,
         _Field'defaultValue = Data.ProtoLens.fieldDefault,
         _Field'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Field
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Option
             -> Data.ProtoLens.Encoding.Bytes.Parser Field
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
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "kind"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"kind") y x)
                                  mutable'options
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "cardinality"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"cardinality") y x)
                                  mutable'options
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "number"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"number") y x)
                                  mutable'options
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "name"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"name") y x)
                                  mutable'options
                        50
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "type_url"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"typeUrl") y x)
                                  mutable'options
                        56
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "oneof_index"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"oneofIndex") y x)
                                  mutable'options
                        64
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "packed"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"packed") y x)
                                  mutable'options
                        74
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "options"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'options y)
                                loop x v
                        82
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "json_name"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"jsonName") y x)
                                  mutable'options
                        90
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "default_value"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"defaultValue") y x)
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
          "Field"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"kind") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                         Prelude.fromEnum _v))
             ((Data.Monoid.<>)
                (let
                   _v
                     = Lens.Family2.view (Data.ProtoLens.Field.field @"cardinality") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                            Prelude.fromEnum _v))
                ((Data.Monoid.<>)
                   (let
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"number") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                   ((Data.Monoid.<>)
                      (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"name") _x
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
                            _v = Lens.Family2.view (Data.ProtoLens.Field.field @"typeUrl") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 50)
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
                                 = Lens.Family2.view (Data.ProtoLens.Field.field @"oneofIndex") _x
                             in
                               if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                   Data.Monoid.mempty
                               else
                                   (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt 56)
                                     ((Prelude..)
                                        Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral
                                        _v))
                            ((Data.Monoid.<>)
                               (let
                                  _v = Lens.Family2.view (Data.ProtoLens.Field.field @"packed") _x
                                in
                                  if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                      Data.Monoid.mempty
                                  else
                                      (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt 64)
                                        ((Prelude..)
                                           Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (\ b -> if b then 1 else 0) _v))
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
                                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                                Data.ProtoLens.encodeMessage _v))
                                     (Lens.Family2.view
                                        (Data.ProtoLens.Field.field @"vec'options") _x))
                                  ((Data.Monoid.<>)
                                     (let
                                        _v
                                          = Lens.Family2.view
                                              (Data.ProtoLens.Field.field @"jsonName") _x
                                      in
                                        if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                            Data.Monoid.mempty
                                        else
                                            (Data.Monoid.<>)
                                              (Data.ProtoLens.Encoding.Bytes.putVarInt 82)
                                              ((Prelude..)
                                                 (\ bs
                                                    -> (Data.Monoid.<>)
                                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                            (Prelude.fromIntegral
                                                               (Data.ByteString.length bs)))
                                                         (Data.ProtoLens.Encoding.Bytes.putBytes
                                                            bs))
                                                 Data.Text.Encoding.encodeUtf8 _v))
                                     ((Data.Monoid.<>)
                                        (let
                                           _v
                                             = Lens.Family2.view
                                                 (Data.ProtoLens.Field.field @"defaultValue") _x
                                         in
                                           if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                               Data.Monoid.mempty
                                           else
                                               (Data.Monoid.<>)
                                                 (Data.ProtoLens.Encoding.Bytes.putVarInt 90)
                                                 ((Prelude..)
                                                    (\ bs
                                                       -> (Data.Monoid.<>)
                                                            (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                               (Prelude.fromIntegral
                                                                  (Data.ByteString.length bs)))
                                                            (Data.ProtoLens.Encoding.Bytes.putBytes
                                                               bs))
                                                    Data.Text.Encoding.encodeUtf8 _v))
                                        (Data.ProtoLens.Encoding.Wire.buildFieldSet
                                           (Lens.Family2.view
                                              Data.ProtoLens.unknownFields _x)))))))))))
instance Control.DeepSeq.NFData Field where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Field'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Field'kind x__)
                (Control.DeepSeq.deepseq
                   (_Field'cardinality x__)
                   (Control.DeepSeq.deepseq
                      (_Field'number x__)
                      (Control.DeepSeq.deepseq
                         (_Field'name x__)
                         (Control.DeepSeq.deepseq
                            (_Field'typeUrl x__)
                            (Control.DeepSeq.deepseq
                               (_Field'oneofIndex x__)
                               (Control.DeepSeq.deepseq
                                  (_Field'packed x__)
                                  (Control.DeepSeq.deepseq
                                     (_Field'options x__)
                                     (Control.DeepSeq.deepseq
                                        (_Field'jsonName x__)
                                        (Control.DeepSeq.deepseq
                                           (_Field'defaultValue x__) ()))))))))))
newtype Field'Cardinality'UnrecognizedValue
  = Field'Cardinality'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data Field'Cardinality
  = Field'CARDINALITY_UNKNOWN |
    Field'CARDINALITY_OPTIONAL |
    Field'CARDINALITY_REQUIRED |
    Field'CARDINALITY_REPEATED |
    Field'Cardinality'Unrecognized !Field'Cardinality'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum Field'Cardinality where
  enumName _ = Data.Text.pack "Cardinality"
  maybeToEnum 0 = Prelude.Just Field'CARDINALITY_UNKNOWN
  maybeToEnum 1 = Prelude.Just Field'CARDINALITY_OPTIONAL
  maybeToEnum 2 = Prelude.Just Field'CARDINALITY_REQUIRED
  maybeToEnum 3 = Prelude.Just Field'CARDINALITY_REPEATED
  maybeToEnum k
    = Prelude.Just
        (Field'Cardinality'Unrecognized
           (Field'Cardinality'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum Field'CARDINALITY_UNKNOWN = "CARDINALITY_UNKNOWN"
  showEnum Field'CARDINALITY_OPTIONAL = "CARDINALITY_OPTIONAL"
  showEnum Field'CARDINALITY_REQUIRED = "CARDINALITY_REQUIRED"
  showEnum Field'CARDINALITY_REPEATED = "CARDINALITY_REPEATED"
  showEnum
    (Field'Cardinality'Unrecognized (Field'Cardinality'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "CARDINALITY_UNKNOWN"
    = Prelude.Just Field'CARDINALITY_UNKNOWN
    | (Prelude.==) k "CARDINALITY_OPTIONAL"
    = Prelude.Just Field'CARDINALITY_OPTIONAL
    | (Prelude.==) k "CARDINALITY_REQUIRED"
    = Prelude.Just Field'CARDINALITY_REQUIRED
    | (Prelude.==) k "CARDINALITY_REPEATED"
    = Prelude.Just Field'CARDINALITY_REPEATED
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded Field'Cardinality where
  minBound = Field'CARDINALITY_UNKNOWN
  maxBound = Field'CARDINALITY_REPEATED
instance Prelude.Enum Field'Cardinality where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum Cardinality: " (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum Field'CARDINALITY_UNKNOWN = 0
  fromEnum Field'CARDINALITY_OPTIONAL = 1
  fromEnum Field'CARDINALITY_REQUIRED = 2
  fromEnum Field'CARDINALITY_REPEATED = 3
  fromEnum
    (Field'Cardinality'Unrecognized (Field'Cardinality'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ Field'CARDINALITY_REPEATED
    = Prelude.error
        "Field'Cardinality.succ: bad argument Field'CARDINALITY_REPEATED. This value would be out of bounds."
  succ Field'CARDINALITY_UNKNOWN = Field'CARDINALITY_OPTIONAL
  succ Field'CARDINALITY_OPTIONAL = Field'CARDINALITY_REQUIRED
  succ Field'CARDINALITY_REQUIRED = Field'CARDINALITY_REPEATED
  succ (Field'Cardinality'Unrecognized _)
    = Prelude.error
        "Field'Cardinality.succ: bad argument: unrecognized value"
  pred Field'CARDINALITY_UNKNOWN
    = Prelude.error
        "Field'Cardinality.pred: bad argument Field'CARDINALITY_UNKNOWN. This value would be out of bounds."
  pred Field'CARDINALITY_OPTIONAL = Field'CARDINALITY_UNKNOWN
  pred Field'CARDINALITY_REQUIRED = Field'CARDINALITY_OPTIONAL
  pred Field'CARDINALITY_REPEATED = Field'CARDINALITY_REQUIRED
  pred (Field'Cardinality'Unrecognized _)
    = Prelude.error
        "Field'Cardinality.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault Field'Cardinality where
  fieldDefault = Field'CARDINALITY_UNKNOWN
instance Control.DeepSeq.NFData Field'Cardinality where
  rnf x__ = Prelude.seq x__ ()
newtype Field'Kind'UnrecognizedValue
  = Field'Kind'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data Field'Kind
  = Field'TYPE_UNKNOWN |
    Field'TYPE_DOUBLE |
    Field'TYPE_FLOAT |
    Field'TYPE_INT64 |
    Field'TYPE_UINT64 |
    Field'TYPE_INT32 |
    Field'TYPE_FIXED64 |
    Field'TYPE_FIXED32 |
    Field'TYPE_BOOL |
    Field'TYPE_STRING |
    Field'TYPE_GROUP |
    Field'TYPE_MESSAGE |
    Field'TYPE_BYTES |
    Field'TYPE_UINT32 |
    Field'TYPE_ENUM |
    Field'TYPE_SFIXED32 |
    Field'TYPE_SFIXED64 |
    Field'TYPE_SINT32 |
    Field'TYPE_SINT64 |
    Field'Kind'Unrecognized !Field'Kind'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum Field'Kind where
  enumName _ = Data.Text.pack "Kind"
  maybeToEnum 0 = Prelude.Just Field'TYPE_UNKNOWN
  maybeToEnum 1 = Prelude.Just Field'TYPE_DOUBLE
  maybeToEnum 2 = Prelude.Just Field'TYPE_FLOAT
  maybeToEnum 3 = Prelude.Just Field'TYPE_INT64
  maybeToEnum 4 = Prelude.Just Field'TYPE_UINT64
  maybeToEnum 5 = Prelude.Just Field'TYPE_INT32
  maybeToEnum 6 = Prelude.Just Field'TYPE_FIXED64
  maybeToEnum 7 = Prelude.Just Field'TYPE_FIXED32
  maybeToEnum 8 = Prelude.Just Field'TYPE_BOOL
  maybeToEnum 9 = Prelude.Just Field'TYPE_STRING
  maybeToEnum 10 = Prelude.Just Field'TYPE_GROUP
  maybeToEnum 11 = Prelude.Just Field'TYPE_MESSAGE
  maybeToEnum 12 = Prelude.Just Field'TYPE_BYTES
  maybeToEnum 13 = Prelude.Just Field'TYPE_UINT32
  maybeToEnum 14 = Prelude.Just Field'TYPE_ENUM
  maybeToEnum 15 = Prelude.Just Field'TYPE_SFIXED32
  maybeToEnum 16 = Prelude.Just Field'TYPE_SFIXED64
  maybeToEnum 17 = Prelude.Just Field'TYPE_SINT32
  maybeToEnum 18 = Prelude.Just Field'TYPE_SINT64
  maybeToEnum k
    = Prelude.Just
        (Field'Kind'Unrecognized
           (Field'Kind'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum Field'TYPE_UNKNOWN = "TYPE_UNKNOWN"
  showEnum Field'TYPE_DOUBLE = "TYPE_DOUBLE"
  showEnum Field'TYPE_FLOAT = "TYPE_FLOAT"
  showEnum Field'TYPE_INT64 = "TYPE_INT64"
  showEnum Field'TYPE_UINT64 = "TYPE_UINT64"
  showEnum Field'TYPE_INT32 = "TYPE_INT32"
  showEnum Field'TYPE_FIXED64 = "TYPE_FIXED64"
  showEnum Field'TYPE_FIXED32 = "TYPE_FIXED32"
  showEnum Field'TYPE_BOOL = "TYPE_BOOL"
  showEnum Field'TYPE_STRING = "TYPE_STRING"
  showEnum Field'TYPE_GROUP = "TYPE_GROUP"
  showEnum Field'TYPE_MESSAGE = "TYPE_MESSAGE"
  showEnum Field'TYPE_BYTES = "TYPE_BYTES"
  showEnum Field'TYPE_UINT32 = "TYPE_UINT32"
  showEnum Field'TYPE_ENUM = "TYPE_ENUM"
  showEnum Field'TYPE_SFIXED32 = "TYPE_SFIXED32"
  showEnum Field'TYPE_SFIXED64 = "TYPE_SFIXED64"
  showEnum Field'TYPE_SINT32 = "TYPE_SINT32"
  showEnum Field'TYPE_SINT64 = "TYPE_SINT64"
  showEnum (Field'Kind'Unrecognized (Field'Kind'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "TYPE_UNKNOWN" = Prelude.Just Field'TYPE_UNKNOWN
    | (Prelude.==) k "TYPE_DOUBLE" = Prelude.Just Field'TYPE_DOUBLE
    | (Prelude.==) k "TYPE_FLOAT" = Prelude.Just Field'TYPE_FLOAT
    | (Prelude.==) k "TYPE_INT64" = Prelude.Just Field'TYPE_INT64
    | (Prelude.==) k "TYPE_UINT64" = Prelude.Just Field'TYPE_UINT64
    | (Prelude.==) k "TYPE_INT32" = Prelude.Just Field'TYPE_INT32
    | (Prelude.==) k "TYPE_FIXED64" = Prelude.Just Field'TYPE_FIXED64
    | (Prelude.==) k "TYPE_FIXED32" = Prelude.Just Field'TYPE_FIXED32
    | (Prelude.==) k "TYPE_BOOL" = Prelude.Just Field'TYPE_BOOL
    | (Prelude.==) k "TYPE_STRING" = Prelude.Just Field'TYPE_STRING
    | (Prelude.==) k "TYPE_GROUP" = Prelude.Just Field'TYPE_GROUP
    | (Prelude.==) k "TYPE_MESSAGE" = Prelude.Just Field'TYPE_MESSAGE
    | (Prelude.==) k "TYPE_BYTES" = Prelude.Just Field'TYPE_BYTES
    | (Prelude.==) k "TYPE_UINT32" = Prelude.Just Field'TYPE_UINT32
    | (Prelude.==) k "TYPE_ENUM" = Prelude.Just Field'TYPE_ENUM
    | (Prelude.==) k "TYPE_SFIXED32" = Prelude.Just Field'TYPE_SFIXED32
    | (Prelude.==) k "TYPE_SFIXED64" = Prelude.Just Field'TYPE_SFIXED64
    | (Prelude.==) k "TYPE_SINT32" = Prelude.Just Field'TYPE_SINT32
    | (Prelude.==) k "TYPE_SINT64" = Prelude.Just Field'TYPE_SINT64
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded Field'Kind where
  minBound = Field'TYPE_UNKNOWN
  maxBound = Field'TYPE_SINT64
instance Prelude.Enum Field'Kind where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum Kind: " (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum Field'TYPE_UNKNOWN = 0
  fromEnum Field'TYPE_DOUBLE = 1
  fromEnum Field'TYPE_FLOAT = 2
  fromEnum Field'TYPE_INT64 = 3
  fromEnum Field'TYPE_UINT64 = 4
  fromEnum Field'TYPE_INT32 = 5
  fromEnum Field'TYPE_FIXED64 = 6
  fromEnum Field'TYPE_FIXED32 = 7
  fromEnum Field'TYPE_BOOL = 8
  fromEnum Field'TYPE_STRING = 9
  fromEnum Field'TYPE_GROUP = 10
  fromEnum Field'TYPE_MESSAGE = 11
  fromEnum Field'TYPE_BYTES = 12
  fromEnum Field'TYPE_UINT32 = 13
  fromEnum Field'TYPE_ENUM = 14
  fromEnum Field'TYPE_SFIXED32 = 15
  fromEnum Field'TYPE_SFIXED64 = 16
  fromEnum Field'TYPE_SINT32 = 17
  fromEnum Field'TYPE_SINT64 = 18
  fromEnum (Field'Kind'Unrecognized (Field'Kind'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ Field'TYPE_SINT64
    = Prelude.error
        "Field'Kind.succ: bad argument Field'TYPE_SINT64. This value would be out of bounds."
  succ Field'TYPE_UNKNOWN = Field'TYPE_DOUBLE
  succ Field'TYPE_DOUBLE = Field'TYPE_FLOAT
  succ Field'TYPE_FLOAT = Field'TYPE_INT64
  succ Field'TYPE_INT64 = Field'TYPE_UINT64
  succ Field'TYPE_UINT64 = Field'TYPE_INT32
  succ Field'TYPE_INT32 = Field'TYPE_FIXED64
  succ Field'TYPE_FIXED64 = Field'TYPE_FIXED32
  succ Field'TYPE_FIXED32 = Field'TYPE_BOOL
  succ Field'TYPE_BOOL = Field'TYPE_STRING
  succ Field'TYPE_STRING = Field'TYPE_GROUP
  succ Field'TYPE_GROUP = Field'TYPE_MESSAGE
  succ Field'TYPE_MESSAGE = Field'TYPE_BYTES
  succ Field'TYPE_BYTES = Field'TYPE_UINT32
  succ Field'TYPE_UINT32 = Field'TYPE_ENUM
  succ Field'TYPE_ENUM = Field'TYPE_SFIXED32
  succ Field'TYPE_SFIXED32 = Field'TYPE_SFIXED64
  succ Field'TYPE_SFIXED64 = Field'TYPE_SINT32
  succ Field'TYPE_SINT32 = Field'TYPE_SINT64
  succ (Field'Kind'Unrecognized _)
    = Prelude.error "Field'Kind.succ: bad argument: unrecognized value"
  pred Field'TYPE_UNKNOWN
    = Prelude.error
        "Field'Kind.pred: bad argument Field'TYPE_UNKNOWN. This value would be out of bounds."
  pred Field'TYPE_DOUBLE = Field'TYPE_UNKNOWN
  pred Field'TYPE_FLOAT = Field'TYPE_DOUBLE
  pred Field'TYPE_INT64 = Field'TYPE_FLOAT
  pred Field'TYPE_UINT64 = Field'TYPE_INT64
  pred Field'TYPE_INT32 = Field'TYPE_UINT64
  pred Field'TYPE_FIXED64 = Field'TYPE_INT32
  pred Field'TYPE_FIXED32 = Field'TYPE_FIXED64
  pred Field'TYPE_BOOL = Field'TYPE_FIXED32
  pred Field'TYPE_STRING = Field'TYPE_BOOL
  pred Field'TYPE_GROUP = Field'TYPE_STRING
  pred Field'TYPE_MESSAGE = Field'TYPE_GROUP
  pred Field'TYPE_BYTES = Field'TYPE_MESSAGE
  pred Field'TYPE_UINT32 = Field'TYPE_BYTES
  pred Field'TYPE_ENUM = Field'TYPE_UINT32
  pred Field'TYPE_SFIXED32 = Field'TYPE_ENUM
  pred Field'TYPE_SFIXED64 = Field'TYPE_SFIXED32
  pred Field'TYPE_SINT32 = Field'TYPE_SFIXED64
  pred Field'TYPE_SINT64 = Field'TYPE_SINT32
  pred (Field'Kind'Unrecognized _)
    = Prelude.error "Field'Kind.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault Field'Kind where
  fieldDefault = Field'TYPE_UNKNOWN
instance Control.DeepSeq.NFData Field'Kind where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.Google.Protobuf.Type_Fields.name' @:: Lens' Option Data.Text.Text@
         * 'Proto.Google.Protobuf.Type_Fields.value' @:: Lens' Option Proto.Google.Protobuf.Any.Any@
         * 'Proto.Google.Protobuf.Type_Fields.maybe'value' @:: Lens' Option (Prelude.Maybe Proto.Google.Protobuf.Any.Any)@ -}
data Option
  = Option'_constructor {_Option'name :: !Data.Text.Text,
                         _Option'value :: !(Prelude.Maybe Proto.Google.Protobuf.Any.Any),
                         _Option'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Option where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Option "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Option'name (\ x__ y__ -> x__ {_Option'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Option "value" Proto.Google.Protobuf.Any.Any where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Option'value (\ x__ y__ -> x__ {_Option'value = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Option "maybe'value" (Prelude.Maybe Proto.Google.Protobuf.Any.Any) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Option'value (\ x__ y__ -> x__ {_Option'value = y__}))
        Prelude.id
instance Data.ProtoLens.Message Option where
  messageName _ = Data.Text.pack "google.protobuf.Option"
  packedMessageDescriptor _
    = "\n\
      \\ACKOption\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2*\n\
      \\ENQvalue\CAN\STX \SOH(\v2\DC4.google.protobuf.AnyR\ENQvalue"
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
              Data.ProtoLens.FieldDescriptor Option
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Google.Protobuf.Any.Any)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'value")) ::
              Data.ProtoLens.FieldDescriptor Option
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, name__field_descriptor),
           (Data.ProtoLens.Tag 2, value__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Option'_unknownFields
        (\ x__ y__ -> x__ {_Option'_unknownFields = y__})
  defMessage
    = Option'_constructor
        {_Option'name = Data.ProtoLens.fieldDefault,
         _Option'value = Prelude.Nothing, _Option'_unknownFields = []}
  parseMessage
    = let
        loop :: Option -> Data.ProtoLens.Encoding.Bytes.Parser Option
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
          (do loop Data.ProtoLens.defMessage) "Option"
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
                             Data.ProtoLens.encodeMessage _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData Option where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Option'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Option'name x__)
                (Control.DeepSeq.deepseq (_Option'value x__) ()))
newtype Syntax'UnrecognizedValue
  = Syntax'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data Syntax
  = SYNTAX_PROTO2 |
    SYNTAX_PROTO3 |
    SYNTAX_EDITIONS |
    Syntax'Unrecognized !Syntax'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum Syntax where
  enumName _ = Data.Text.pack "Syntax"
  maybeToEnum 0 = Prelude.Just SYNTAX_PROTO2
  maybeToEnum 1 = Prelude.Just SYNTAX_PROTO3
  maybeToEnum 2 = Prelude.Just SYNTAX_EDITIONS
  maybeToEnum k
    = Prelude.Just
        (Syntax'Unrecognized
           (Syntax'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum SYNTAX_PROTO2 = "SYNTAX_PROTO2"
  showEnum SYNTAX_PROTO3 = "SYNTAX_PROTO3"
  showEnum SYNTAX_EDITIONS = "SYNTAX_EDITIONS"
  showEnum (Syntax'Unrecognized (Syntax'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "SYNTAX_PROTO2" = Prelude.Just SYNTAX_PROTO2
    | (Prelude.==) k "SYNTAX_PROTO3" = Prelude.Just SYNTAX_PROTO3
    | (Prelude.==) k "SYNTAX_EDITIONS" = Prelude.Just SYNTAX_EDITIONS
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded Syntax where
  minBound = SYNTAX_PROTO2
  maxBound = SYNTAX_EDITIONS
instance Prelude.Enum Syntax where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum Syntax: " (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum SYNTAX_PROTO2 = 0
  fromEnum SYNTAX_PROTO3 = 1
  fromEnum SYNTAX_EDITIONS = 2
  fromEnum (Syntax'Unrecognized (Syntax'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ SYNTAX_EDITIONS
    = Prelude.error
        "Syntax.succ: bad argument SYNTAX_EDITIONS. This value would be out of bounds."
  succ SYNTAX_PROTO2 = SYNTAX_PROTO3
  succ SYNTAX_PROTO3 = SYNTAX_EDITIONS
  succ (Syntax'Unrecognized _)
    = Prelude.error "Syntax.succ: bad argument: unrecognized value"
  pred SYNTAX_PROTO2
    = Prelude.error
        "Syntax.pred: bad argument SYNTAX_PROTO2. This value would be out of bounds."
  pred SYNTAX_PROTO3 = SYNTAX_PROTO2
  pred SYNTAX_EDITIONS = SYNTAX_PROTO3
  pred (Syntax'Unrecognized _)
    = Prelude.error "Syntax.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault Syntax where
  fieldDefault = SYNTAX_PROTO2
instance Control.DeepSeq.NFData Syntax where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.Google.Protobuf.Type_Fields.name' @:: Lens' Type Data.Text.Text@
         * 'Proto.Google.Protobuf.Type_Fields.fields' @:: Lens' Type [Field]@
         * 'Proto.Google.Protobuf.Type_Fields.vec'fields' @:: Lens' Type (Data.Vector.Vector Field)@
         * 'Proto.Google.Protobuf.Type_Fields.oneofs' @:: Lens' Type [Data.Text.Text]@
         * 'Proto.Google.Protobuf.Type_Fields.vec'oneofs' @:: Lens' Type (Data.Vector.Vector Data.Text.Text)@
         * 'Proto.Google.Protobuf.Type_Fields.options' @:: Lens' Type [Option]@
         * 'Proto.Google.Protobuf.Type_Fields.vec'options' @:: Lens' Type (Data.Vector.Vector Option)@
         * 'Proto.Google.Protobuf.Type_Fields.sourceContext' @:: Lens' Type Proto.Google.Protobuf.SourceContext.SourceContext@
         * 'Proto.Google.Protobuf.Type_Fields.maybe'sourceContext' @:: Lens' Type (Prelude.Maybe Proto.Google.Protobuf.SourceContext.SourceContext)@
         * 'Proto.Google.Protobuf.Type_Fields.syntax' @:: Lens' Type Syntax@
         * 'Proto.Google.Protobuf.Type_Fields.edition' @:: Lens' Type Data.Text.Text@ -}
data Type
  = Type'_constructor {_Type'name :: !Data.Text.Text,
                       _Type'fields :: !(Data.Vector.Vector Field),
                       _Type'oneofs :: !(Data.Vector.Vector Data.Text.Text),
                       _Type'options :: !(Data.Vector.Vector Option),
                       _Type'sourceContext :: !(Prelude.Maybe Proto.Google.Protobuf.SourceContext.SourceContext),
                       _Type'syntax :: !Syntax,
                       _Type'edition :: !Data.Text.Text,
                       _Type'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Type where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Type "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'name (\ x__ y__ -> x__ {_Type'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Type "fields" [Field] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'fields (\ x__ y__ -> x__ {_Type'fields = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Type "vec'fields" (Data.Vector.Vector Field) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'fields (\ x__ y__ -> x__ {_Type'fields = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Type "oneofs" [Data.Text.Text] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'oneofs (\ x__ y__ -> x__ {_Type'oneofs = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Type "vec'oneofs" (Data.Vector.Vector Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'oneofs (\ x__ y__ -> x__ {_Type'oneofs = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Type "options" [Option] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'options (\ x__ y__ -> x__ {_Type'options = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Type "vec'options" (Data.Vector.Vector Option) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'options (\ x__ y__ -> x__ {_Type'options = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Type "sourceContext" Proto.Google.Protobuf.SourceContext.SourceContext where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sourceContext (\ x__ y__ -> x__ {_Type'sourceContext = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Type "maybe'sourceContext" (Prelude.Maybe Proto.Google.Protobuf.SourceContext.SourceContext) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sourceContext (\ x__ y__ -> x__ {_Type'sourceContext = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Type "syntax" Syntax where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'syntax (\ x__ y__ -> x__ {_Type'syntax = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Type "edition" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'edition (\ x__ y__ -> x__ {_Type'edition = y__}))
        Prelude.id
instance Data.ProtoLens.Message Type where
  messageName _ = Data.Text.pack "google.protobuf.Type"
  packedMessageDescriptor _
    = "\n\
      \\EOTType\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2.\n\
      \\ACKfields\CAN\STX \ETX(\v2\SYN.google.protobuf.FieldR\ACKfields\DC2\SYN\n\
      \\ACKoneofs\CAN\ETX \ETX(\tR\ACKoneofs\DC21\n\
      \\aoptions\CAN\EOT \ETX(\v2\ETB.google.protobuf.OptionR\aoptions\DC2E\n\
      \\SOsource_context\CAN\ENQ \SOH(\v2\RS.google.protobuf.SourceContextR\rsourceContext\DC2/\n\
      \\ACKsyntax\CAN\ACK \SOH(\SO2\ETB.google.protobuf.SyntaxR\ACKsyntax\DC2\CAN\n\
      \\aedition\CAN\a \SOH(\tR\aedition"
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
              Data.ProtoLens.FieldDescriptor Type
        fields__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "fields"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Field)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"fields")) ::
              Data.ProtoLens.FieldDescriptor Type
        oneofs__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "oneofs"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"oneofs")) ::
              Data.ProtoLens.FieldDescriptor Type
        options__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "options"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Option)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"options")) ::
              Data.ProtoLens.FieldDescriptor Type
        sourceContext__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "source_context"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Google.Protobuf.SourceContext.SourceContext)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'sourceContext")) ::
              Data.ProtoLens.FieldDescriptor Type
        syntax__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "syntax"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Syntax)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"syntax")) ::
              Data.ProtoLens.FieldDescriptor Type
        edition__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "edition"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"edition")) ::
              Data.ProtoLens.FieldDescriptor Type
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, name__field_descriptor),
           (Data.ProtoLens.Tag 2, fields__field_descriptor),
           (Data.ProtoLens.Tag 3, oneofs__field_descriptor),
           (Data.ProtoLens.Tag 4, options__field_descriptor),
           (Data.ProtoLens.Tag 5, sourceContext__field_descriptor),
           (Data.ProtoLens.Tag 6, syntax__field_descriptor),
           (Data.ProtoLens.Tag 7, edition__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Type'_unknownFields
        (\ x__ y__ -> x__ {_Type'_unknownFields = y__})
  defMessage
    = Type'_constructor
        {_Type'name = Data.ProtoLens.fieldDefault,
         _Type'fields = Data.Vector.Generic.empty,
         _Type'oneofs = Data.Vector.Generic.empty,
         _Type'options = Data.Vector.Generic.empty,
         _Type'sourceContext = Prelude.Nothing,
         _Type'syntax = Data.ProtoLens.fieldDefault,
         _Type'edition = Data.ProtoLens.fieldDefault,
         _Type'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Type
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Field
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Text.Text
                -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Option
                   -> Data.ProtoLens.Encoding.Bytes.Parser Type
        loop x mutable'fields mutable'oneofs mutable'options
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'fields <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                         (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                            mutable'fields)
                      frozen'oneofs <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                         (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                            mutable'oneofs)
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
                              (Data.ProtoLens.Field.field @"vec'fields") frozen'fields
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'oneofs") frozen'oneofs
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
                                  mutable'fields mutable'oneofs mutable'options
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "fields"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'fields y)
                                loop x v mutable'oneofs mutable'options
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.getText
                                              (Prelude.fromIntegral len))
                                        "oneofs"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'oneofs y)
                                loop x mutable'fields v mutable'options
                        34
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "options"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'options y)
                                loop x mutable'fields mutable'oneofs v
                        42
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "source_context"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"sourceContext") y x)
                                  mutable'fields mutable'oneofs mutable'options
                        48
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "syntax"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"syntax") y x)
                                  mutable'fields mutable'oneofs mutable'options
                        58
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "edition"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"edition") y x)
                                  mutable'fields mutable'oneofs mutable'options
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'fields mutable'oneofs mutable'options
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'fields <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                  Data.ProtoLens.Encoding.Growing.new
              mutable'oneofs <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                  Data.ProtoLens.Encoding.Growing.new
              mutable'options <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                   Data.ProtoLens.Encoding.Growing.new
              loop
                Data.ProtoLens.defMessage mutable'fields mutable'oneofs
                mutable'options)
          "Type"
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
                   (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'fields") _x))
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
                                 Data.Text.Encoding.encodeUtf8 _v))
                      (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'oneofs") _x))
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
                                    Data.ProtoLens.encodeMessage _v))
                         (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'options") _x))
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
                            (let
                               _v = Lens.Family2.view (Data.ProtoLens.Field.field @"syntax") _x
                             in
                               if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                   Data.Monoid.mempty
                               else
                                   (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt 48)
                                     ((Prelude..)
                                        ((Prelude..)
                                           Data.ProtoLens.Encoding.Bytes.putVarInt
                                           Prelude.fromIntegral)
                                        Prelude.fromEnum _v))
                            ((Data.Monoid.<>)
                               (let
                                  _v = Lens.Family2.view (Data.ProtoLens.Field.field @"edition") _x
                                in
                                  if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                      Data.Monoid.mempty
                                  else
                                      (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt 58)
                                        ((Prelude..)
                                           (\ bs
                                              -> (Data.Monoid.<>)
                                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                      (Prelude.fromIntegral
                                                         (Data.ByteString.length bs)))
                                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                           Data.Text.Encoding.encodeUtf8 _v))
                               (Data.ProtoLens.Encoding.Wire.buildFieldSet
                                  (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))))
instance Control.DeepSeq.NFData Type where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Type'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Type'name x__)
                (Control.DeepSeq.deepseq
                   (_Type'fields x__)
                   (Control.DeepSeq.deepseq
                      (_Type'oneofs x__)
                      (Control.DeepSeq.deepseq
                         (_Type'options x__)
                         (Control.DeepSeq.deepseq
                            (_Type'sourceContext x__)
                            (Control.DeepSeq.deepseq
                               (_Type'syntax x__)
                               (Control.DeepSeq.deepseq (_Type'edition x__) ())))))))
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\SUBgoogle/protobuf/type.proto\DC2\SIgoogle.protobuf\SUB\EMgoogle/protobuf/any.proto\SUB$google/protobuf/source_context.proto\"\167\STX\n\
    \\EOTType\DC2\DC2\n\
    \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2.\n\
    \\ACKfields\CAN\STX \ETX(\v2\SYN.google.protobuf.FieldR\ACKfields\DC2\SYN\n\
    \\ACKoneofs\CAN\ETX \ETX(\tR\ACKoneofs\DC21\n\
    \\aoptions\CAN\EOT \ETX(\v2\ETB.google.protobuf.OptionR\aoptions\DC2E\n\
    \\SOsource_context\CAN\ENQ \SOH(\v2\RS.google.protobuf.SourceContextR\rsourceContext\DC2/\n\
    \\ACKsyntax\CAN\ACK \SOH(\SO2\ETB.google.protobuf.SyntaxR\ACKsyntax\DC2\CAN\n\
    \\aedition\CAN\a \SOH(\tR\aedition\"\180\ACK\n\
    \\ENQField\DC2/\n\
    \\EOTkind\CAN\SOH \SOH(\SO2\ESC.google.protobuf.Field.KindR\EOTkind\DC2D\n\
    \\vcardinality\CAN\STX \SOH(\SO2\".google.protobuf.Field.CardinalityR\vcardinality\DC2\SYN\n\
    \\ACKnumber\CAN\ETX \SOH(\ENQR\ACKnumber\DC2\DC2\n\
    \\EOTname\CAN\EOT \SOH(\tR\EOTname\DC2\EM\n\
    \\btype_url\CAN\ACK \SOH(\tR\atypeUrl\DC2\US\n\
    \\voneof_index\CAN\a \SOH(\ENQR\n\
    \oneofIndex\DC2\SYN\n\
    \\ACKpacked\CAN\b \SOH(\bR\ACKpacked\DC21\n\
    \\aoptions\CAN\t \ETX(\v2\ETB.google.protobuf.OptionR\aoptions\DC2\ESC\n\
    \\tjson_name\CAN\n\
    \ \SOH(\tR\bjsonName\DC2#\n\
    \\rdefault_value\CAN\v \SOH(\tR\fdefaultValue\"\200\STX\n\
    \\EOTKind\DC2\DLE\n\
    \\fTYPE_UNKNOWN\DLE\NUL\DC2\SI\n\
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
    \\vTYPE_SINT64\DLE\DC2\"t\n\
    \\vCardinality\DC2\ETB\n\
    \\DC3CARDINALITY_UNKNOWN\DLE\NUL\DC2\CAN\n\
    \\DC4CARDINALITY_OPTIONAL\DLE\SOH\DC2\CAN\n\
    \\DC4CARDINALITY_REQUIRED\DLE\STX\DC2\CAN\n\
    \\DC4CARDINALITY_REPEATED\DLE\ETX\"\153\STX\n\
    \\EOTEnum\DC2\DC2\n\
    \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC28\n\
    \\tenumvalue\CAN\STX \ETX(\v2\SUB.google.protobuf.EnumValueR\tenumvalue\DC21\n\
    \\aoptions\CAN\ETX \ETX(\v2\ETB.google.protobuf.OptionR\aoptions\DC2E\n\
    \\SOsource_context\CAN\EOT \SOH(\v2\RS.google.protobuf.SourceContextR\rsourceContext\DC2/\n\
    \\ACKsyntax\CAN\ENQ \SOH(\SO2\ETB.google.protobuf.SyntaxR\ACKsyntax\DC2\CAN\n\
    \\aedition\CAN\ACK \SOH(\tR\aedition\"j\n\
    \\tEnumValue\DC2\DC2\n\
    \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2\SYN\n\
    \\ACKnumber\CAN\STX \SOH(\ENQR\ACKnumber\DC21\n\
    \\aoptions\CAN\ETX \ETX(\v2\ETB.google.protobuf.OptionR\aoptions\"H\n\
    \\ACKOption\DC2\DC2\n\
    \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2*\n\
    \\ENQvalue\CAN\STX \SOH(\v2\DC4.google.protobuf.AnyR\ENQvalue*C\n\
    \\ACKSyntax\DC2\DC1\n\
    \\rSYNTAX_PROTO2\DLE\NUL\DC2\DC1\n\
    \\rSYNTAX_PROTO3\DLE\SOH\DC2\DC3\n\
    \\SISYNTAX_EDITIONS\DLE\STXB{\n\
    \\DC3com.google.protobufB\tTypeProtoP\SOHZ-google.golang.org/protobuf/types/known/typepb\248\SOH\SOH\162\STX\ETXGPB\170\STX\RSGoogle.Protobuf.WellKnownTypesJ\141;\n\
    \\a\DC2\ENQ\RS\NUL\192\SOH\SOH\n\
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
    \\STX\ETX\NUL\DC2\ETX\"\NUL#\n\
    \\t\n\
    \\STX\ETX\SOH\DC2\ETX#\NUL.\n\
    \\b\n\
    \\SOH\b\DC2\ETX%\NUL\US\n\
    \\t\n\
    \\STX\b\US\DC2\ETX%\NUL\US\n\
    \\b\n\
    \\SOH\b\DC2\ETX&\NUL,\n\
    \\t\n\
    \\STX\b\SOH\DC2\ETX&\NUL,\n\
    \\b\n\
    \\SOH\b\DC2\ETX'\NUL*\n\
    \\t\n\
    \\STX\b\b\DC2\ETX'\NUL*\n\
    \\b\n\
    \\SOH\b\DC2\ETX(\NUL\"\n\
    \\t\n\
    \\STX\b\n\
    \\DC2\ETX(\NUL\"\n\
    \\b\n\
    \\SOH\b\DC2\ETX)\NUL!\n\
    \\t\n\
    \\STX\b$\DC2\ETX)\NUL!\n\
    \\b\n\
    \\SOH\b\DC2\ETX*\NUL;\n\
    \\t\n\
    \\STX\b%\DC2\ETX*\NUL;\n\
    \\b\n\
    \\SOH\b\DC2\ETX+\NULD\n\
    \\t\n\
    \\STX\b\v\DC2\ETX+\NULD\n\
    \-\n\
    \\STX\EOT\NUL\DC2\EOT.\NUL=\SOH\SUB! A protocol buffer message type.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX.\b\f\n\
    \0\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX0\STX\DC2\SUB# The fully qualified message name.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ENQ\DC2\ETX0\STX\b\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX0\t\r\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX0\DLE\DC1\n\
    \\"\n\
    \\EOT\EOT\NUL\STX\SOH\DC2\ETX2\STX\FS\SUB\NAK The list of fields.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\EOT\DC2\ETX2\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ACK\DC2\ETX2\v\DLE\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\SOH\DC2\ETX2\DC1\ETB\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ETX\DC2\ETX2\SUB\ESC\n\
    \O\n\
    \\EOT\EOT\NUL\STX\STX\DC2\ETX4\STX\GS\SUBB The list of types appearing in `oneof` definitions in this type.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\EOT\DC2\ETX4\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\ENQ\DC2\ETX4\v\DC1\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\SOH\DC2\ETX4\DC2\CAN\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\ETX\DC2\ETX4\ESC\FS\n\
    \+\n\
    \\EOT\EOT\NUL\STX\ETX\DC2\ETX6\STX\RS\SUB\RS The protocol buffer options.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ETX\EOT\DC2\ETX6\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ETX\ACK\DC2\ETX6\v\DC1\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ETX\SOH\DC2\ETX6\DC2\EM\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ETX\ETX\DC2\ETX6\FS\GS\n\
    \\"\n\
    \\EOT\EOT\NUL\STX\EOT\DC2\ETX8\STX#\SUB\NAK The source context.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\EOT\ACK\DC2\ETX8\STX\SI\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\EOT\SOH\DC2\ETX8\DLE\RS\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\EOT\ETX\DC2\ETX8!\"\n\
    \!\n\
    \\EOT\EOT\NUL\STX\ENQ\DC2\ETX:\STX\DC4\SUB\DC4 The source syntax.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ENQ\ACK\DC2\ETX:\STX\b\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ENQ\SOH\DC2\ETX:\t\SI\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ENQ\ETX\DC2\ETX:\DC2\DC3\n\
    \T\n\
    \\EOT\EOT\NUL\STX\ACK\DC2\ETX<\STX\NAK\SUBG The source edition string, only valid when syntax is SYNTAX_EDITIONS.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ACK\ENQ\DC2\ETX<\STX\b\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ACK\SOH\DC2\ETX<\t\DLE\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\ACK\ETX\DC2\ETX<\DC3\DC4\n\
    \0\n\
    \\STX\EOT\SOH\DC2\ENQ@\NUL\141\SOH\SOH\SUB# A single field of a message type.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETX@\b\r\n\
    \\"\n\
    \\EOT\EOT\SOH\EOT\NUL\DC2\EOTB\STXi\ETX\SUB\DC4 Basic field types.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\EOT\NUL\SOH\DC2\ETXB\a\v\n\
    \$\n\
    \\ACK\EOT\SOH\EOT\NUL\STX\NUL\DC2\ETXD\EOT\NAK\SUB\NAK Field type unknown.\n\
    \\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\NUL\SOH\DC2\ETXD\EOT\DLE\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\NUL\STX\DC2\ETXD\DC3\DC4\n\
    \#\n\
    \\ACK\EOT\SOH\EOT\NUL\STX\SOH\DC2\ETXF\EOT\DC4\SUB\DC4 Field type double.\n\
    \\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\SOH\SOH\DC2\ETXF\EOT\SI\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\SOH\STX\DC2\ETXF\DC2\DC3\n\
    \\"\n\
    \\ACK\EOT\SOH\EOT\NUL\STX\STX\DC2\ETXH\EOT\DC3\SUB\DC3 Field type float.\n\
    \\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\STX\SOH\DC2\ETXH\EOT\SO\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\STX\STX\DC2\ETXH\DC1\DC2\n\
    \\"\n\
    \\ACK\EOT\SOH\EOT\NUL\STX\ETX\DC2\ETXJ\EOT\DC3\SUB\DC3 Field type int64.\n\
    \\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\ETX\SOH\DC2\ETXJ\EOT\SO\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\ETX\STX\DC2\ETXJ\DC1\DC2\n\
    \#\n\
    \\ACK\EOT\SOH\EOT\NUL\STX\EOT\DC2\ETXL\EOT\DC4\SUB\DC4 Field type uint64.\n\
    \\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\EOT\SOH\DC2\ETXL\EOT\SI\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\EOT\STX\DC2\ETXL\DC2\DC3\n\
    \\"\n\
    \\ACK\EOT\SOH\EOT\NUL\STX\ENQ\DC2\ETXN\EOT\DC3\SUB\DC3 Field type int32.\n\
    \\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\ENQ\SOH\DC2\ETXN\EOT\SO\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\ENQ\STX\DC2\ETXN\DC1\DC2\n\
    \$\n\
    \\ACK\EOT\SOH\EOT\NUL\STX\ACK\DC2\ETXP\EOT\NAK\SUB\NAK Field type fixed64.\n\
    \\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\ACK\SOH\DC2\ETXP\EOT\DLE\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\ACK\STX\DC2\ETXP\DC3\DC4\n\
    \$\n\
    \\ACK\EOT\SOH\EOT\NUL\STX\a\DC2\ETXR\EOT\NAK\SUB\NAK Field type fixed32.\n\
    \\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\a\SOH\DC2\ETXR\EOT\DLE\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\a\STX\DC2\ETXR\DC3\DC4\n\
    \!\n\
    \\ACK\EOT\SOH\EOT\NUL\STX\b\DC2\ETXT\EOT\DC2\SUB\DC2 Field type bool.\n\
    \\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\b\SOH\DC2\ETXT\EOT\r\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\b\STX\DC2\ETXT\DLE\DC1\n\
    \#\n\
    \\ACK\EOT\SOH\EOT\NUL\STX\t\DC2\ETXV\EOT\DC4\SUB\DC4 Field type string.\n\
    \\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\t\SOH\DC2\ETXV\EOT\SI\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\t\STX\DC2\ETXV\DC2\DC3\n\
    \F\n\
    \\ACK\EOT\SOH\EOT\NUL\STX\n\
    \\DC2\ETXX\EOT\DC4\SUB7 Field type group. Proto2 syntax only, and deprecated.\n\
    \\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\n\
    \\SOH\DC2\ETXX\EOT\SO\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\n\
    \\STX\DC2\ETXX\DC1\DC3\n\
    \$\n\
    \\ACK\EOT\SOH\EOT\NUL\STX\v\DC2\ETXZ\EOT\SYN\SUB\NAK Field type message.\n\
    \\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\v\SOH\DC2\ETXZ\EOT\DLE\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\v\STX\DC2\ETXZ\DC3\NAK\n\
    \\"\n\
    \\ACK\EOT\SOH\EOT\NUL\STX\f\DC2\ETX\\\EOT\DC4\SUB\DC3 Field type bytes.\n\
    \\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\f\SOH\DC2\ETX\\\EOT\SO\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\f\STX\DC2\ETX\\\DC1\DC3\n\
    \#\n\
    \\ACK\EOT\SOH\EOT\NUL\STX\r\DC2\ETX^\EOT\NAK\SUB\DC4 Field type uint32.\n\
    \\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\r\SOH\DC2\ETX^\EOT\SI\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\r\STX\DC2\ETX^\DC2\DC4\n\
    \!\n\
    \\ACK\EOT\SOH\EOT\NUL\STX\SO\DC2\ETX`\EOT\DC3\SUB\DC2 Field type enum.\n\
    \\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\SO\SOH\DC2\ETX`\EOT\r\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\SO\STX\DC2\ETX`\DLE\DC2\n\
    \%\n\
    \\ACK\EOT\SOH\EOT\NUL\STX\SI\DC2\ETXb\EOT\ETB\SUB\SYN Field type sfixed32.\n\
    \\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\SI\SOH\DC2\ETXb\EOT\DC1\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\SI\STX\DC2\ETXb\DC4\SYN\n\
    \%\n\
    \\ACK\EOT\SOH\EOT\NUL\STX\DLE\DC2\ETXd\EOT\ETB\SUB\SYN Field type sfixed64.\n\
    \\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\DLE\SOH\DC2\ETXd\EOT\DC1\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\DLE\STX\DC2\ETXd\DC4\SYN\n\
    \#\n\
    \\ACK\EOT\SOH\EOT\NUL\STX\DC1\DC2\ETXf\EOT\NAK\SUB\DC4 Field type sint32.\n\
    \\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\DC1\SOH\DC2\ETXf\EOT\SI\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\DC1\STX\DC2\ETXf\DC2\DC4\n\
    \#\n\
    \\ACK\EOT\SOH\EOT\NUL\STX\DC2\DC2\ETXh\EOT\NAK\SUB\DC4 Field type sint64.\n\
    \\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\DC2\SOH\DC2\ETXh\EOT\SI\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\NUL\STX\DC2\STX\DC2\ETXh\DC2\DC4\n\
    \C\n\
    \\EOT\EOT\SOH\EOT\SOH\DC2\EOTl\STXu\ETX\SUB5 Whether a field is optional, required, or repeated.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\EOT\SOH\SOH\DC2\ETXl\a\DC2\n\
    \5\n\
    \\ACK\EOT\SOH\EOT\SOH\STX\NUL\DC2\ETXn\EOT\FS\SUB& For fields with unknown cardinality.\n\
    \\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\SOH\STX\NUL\SOH\DC2\ETXn\EOT\ETB\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\SOH\STX\NUL\STX\DC2\ETXn\SUB\ESC\n\
    \%\n\
    \\ACK\EOT\SOH\EOT\SOH\STX\SOH\DC2\ETXp\EOT\GS\SUB\SYN For optional fields.\n\
    \\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\SOH\STX\SOH\SOH\DC2\ETXp\EOT\CAN\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\SOH\STX\SOH\STX\DC2\ETXp\ESC\FS\n\
    \9\n\
    \\ACK\EOT\SOH\EOT\SOH\STX\STX\DC2\ETXr\EOT\GS\SUB* For required fields. Proto2 syntax only.\n\
    \\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\SOH\STX\STX\SOH\DC2\ETXr\EOT\CAN\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\SOH\STX\STX\STX\DC2\ETXr\ESC\FS\n\
    \%\n\
    \\ACK\EOT\SOH\EOT\SOH\STX\ETX\DC2\ETXt\EOT\GS\SUB\SYN For repeated fields.\n\
    \\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\SOH\STX\ETX\SOH\DC2\ETXt\EOT\CAN\n\
    \\SO\n\
    \\a\EOT\SOH\EOT\SOH\STX\ETX\STX\DC2\ETXt\ESC\FS\n\
    \\RS\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\ETXx\STX\DLE\SUB\DC1 The field type.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ACK\DC2\ETXx\STX\ACK\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\ETXx\a\v\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\ETXx\SO\SI\n\
    \%\n\
    \\EOT\EOT\SOH\STX\SOH\DC2\ETXz\STX\RS\SUB\CAN The field cardinality.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ACK\DC2\ETXz\STX\r\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\SOH\DC2\ETXz\SO\EM\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ETX\DC2\ETXz\FS\GS\n\
    \ \n\
    \\EOT\EOT\SOH\STX\STX\DC2\ETX|\STX\DC3\SUB\DC3 The field number.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ENQ\DC2\ETX|\STX\a\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\SOH\DC2\ETX|\b\SO\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ETX\DC2\ETX|\DC1\DC2\n\
    \\RS\n\
    \\EOT\EOT\SOH\STX\ETX\DC2\ETX~\STX\DC2\SUB\DC1 The field name.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\ENQ\DC2\ETX~\STX\b\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\SOH\DC2\ETX~\t\r\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\ETX\DC2\ETX~\DLE\DC1\n\
    \\151\SOH\n\
    \\EOT\EOT\SOH\STX\EOT\DC2\EOT\129\SOH\STX\SYN\SUB\136\SOH The field type URL, without the scheme, for message or enumeration\n\
    \ types. Example: `\"type.googleapis.com/google.protobuf.Timestamp\"`.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\EOT\ENQ\DC2\EOT\129\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\EOT\SOH\DC2\EOT\129\SOH\t\DC1\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\EOT\ETX\DC2\EOT\129\SOH\DC4\NAK\n\
    \\165\SOH\n\
    \\EOT\EOT\SOH\STX\ENQ\DC2\EOT\132\SOH\STX\CAN\SUB\150\SOH The index of the field type in `Type.oneofs`, for message or enumeration\n\
    \ types. The first type has index 1; zero means the type is not in the list.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\ENQ\ENQ\DC2\EOT\132\SOH\STX\a\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\ENQ\SOH\DC2\EOT\132\SOH\b\DC3\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\ENQ\ETX\DC2\EOT\132\SOH\SYN\ETB\n\
    \F\n\
    \\EOT\EOT\SOH\STX\ACK\DC2\EOT\134\SOH\STX\DC2\SUB8 Whether to use alternative packed wire representation.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\ACK\ENQ\DC2\EOT\134\SOH\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\ACK\SOH\DC2\EOT\134\SOH\a\r\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\ACK\ETX\DC2\EOT\134\SOH\DLE\DC1\n\
    \,\n\
    \\EOT\EOT\SOH\STX\a\DC2\EOT\136\SOH\STX\RS\SUB\RS The protocol buffer options.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\a\EOT\DC2\EOT\136\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\a\ACK\DC2\EOT\136\SOH\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\a\SOH\DC2\EOT\136\SOH\DC2\EM\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\a\ETX\DC2\EOT\136\SOH\FS\GS\n\
    \$\n\
    \\EOT\EOT\SOH\STX\b\DC2\EOT\138\SOH\STX\CAN\SUB\SYN The field JSON name.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\b\ENQ\DC2\EOT\138\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\b\SOH\DC2\EOT\138\SOH\t\DC2\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\b\ETX\DC2\EOT\138\SOH\NAK\ETB\n\
    \X\n\
    \\EOT\EOT\SOH\STX\t\DC2\EOT\140\SOH\STX\FS\SUBJ The string value of the default value of this field. Proto2 syntax only.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\t\ENQ\DC2\EOT\140\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\t\SOH\DC2\EOT\140\SOH\t\SYN\n\
    \\r\n\
    \\ENQ\EOT\SOH\STX\t\ETX\DC2\EOT\140\SOH\EM\ESC\n\
    \%\n\
    \\STX\EOT\STX\DC2\ACK\144\SOH\NUL\157\SOH\SOH\SUB\ETB Enum type definition.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\STX\SOH\DC2\EOT\144\SOH\b\f\n\
    \\US\n\
    \\EOT\EOT\STX\STX\NUL\DC2\EOT\146\SOH\STX\DC2\SUB\DC1 Enum type name.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\NUL\ENQ\DC2\EOT\146\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\NUL\SOH\DC2\EOT\146\SOH\t\r\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\NUL\ETX\DC2\EOT\146\SOH\DLE\DC1\n\
    \'\n\
    \\EOT\EOT\STX\STX\SOH\DC2\EOT\148\SOH\STX#\SUB\EM Enum value definitions.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\SOH\EOT\DC2\EOT\148\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\SOH\ACK\DC2\EOT\148\SOH\v\DC4\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\SOH\SOH\DC2\EOT\148\SOH\NAK\RS\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\SOH\ETX\DC2\EOT\148\SOH!\"\n\
    \(\n\
    \\EOT\EOT\STX\STX\STX\DC2\EOT\150\SOH\STX\RS\SUB\SUB Protocol buffer options.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\STX\EOT\DC2\EOT\150\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\STX\ACK\DC2\EOT\150\SOH\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\STX\SOH\DC2\EOT\150\SOH\DC2\EM\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\STX\ETX\DC2\EOT\150\SOH\FS\GS\n\
    \#\n\
    \\EOT\EOT\STX\STX\ETX\DC2\EOT\152\SOH\STX#\SUB\NAK The source context.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\ETX\ACK\DC2\EOT\152\SOH\STX\SI\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\ETX\SOH\DC2\EOT\152\SOH\DLE\RS\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\ETX\ETX\DC2\EOT\152\SOH!\"\n\
    \\"\n\
    \\EOT\EOT\STX\STX\EOT\DC2\EOT\154\SOH\STX\DC4\SUB\DC4 The source syntax.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\EOT\ACK\DC2\EOT\154\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\EOT\SOH\DC2\EOT\154\SOH\t\SI\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\EOT\ETX\DC2\EOT\154\SOH\DC2\DC3\n\
    \U\n\
    \\EOT\EOT\STX\STX\ENQ\DC2\EOT\156\SOH\STX\NAK\SUBG The source edition string, only valid when syntax is SYNTAX_EDITIONS.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\ENQ\ENQ\DC2\EOT\156\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\ENQ\SOH\DC2\EOT\156\SOH\t\DLE\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\ENQ\ETX\DC2\EOT\156\SOH\DC3\DC4\n\
    \&\n\
    \\STX\EOT\ETX\DC2\ACK\160\SOH\NUL\167\SOH\SOH\SUB\CAN Enum value definition.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\ETX\SOH\DC2\EOT\160\SOH\b\DC1\n\
    \ \n\
    \\EOT\EOT\ETX\STX\NUL\DC2\EOT\162\SOH\STX\DC2\SUB\DC2 Enum value name.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\NUL\ENQ\DC2\EOT\162\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\NUL\SOH\DC2\EOT\162\SOH\t\r\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\NUL\ETX\DC2\EOT\162\SOH\DLE\DC1\n\
    \\"\n\
    \\EOT\EOT\ETX\STX\SOH\DC2\EOT\164\SOH\STX\DC3\SUB\DC4 Enum value number.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\SOH\ENQ\DC2\EOT\164\SOH\STX\a\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\SOH\SOH\DC2\EOT\164\SOH\b\SO\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\SOH\ETX\DC2\EOT\164\SOH\DC1\DC2\n\
    \(\n\
    \\EOT\EOT\ETX\STX\STX\DC2\EOT\166\SOH\STX\RS\SUB\SUB Protocol buffer options.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\STX\EOT\DC2\EOT\166\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\STX\ACK\DC2\EOT\166\SOH\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\STX\SOH\DC2\EOT\166\SOH\DC2\EM\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\STX\ETX\DC2\EOT\166\SOH\FS\GS\n\
    \g\n\
    \\STX\EOT\EOT\DC2\ACK\171\SOH\NUL\182\SOH\SOH\SUBY A protocol buffer option, which can be attached to a message, field,\n\
    \ enumeration, etc.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\EOT\SOH\DC2\EOT\171\SOH\b\SO\n\
    \\252\SOH\n\
    \\EOT\EOT\EOT\STX\NUL\DC2\EOT\176\SOH\STX\DC2\SUB\237\SOH The option's name. For protobuf built-in options (options defined in\n\
    \ descriptor.proto), this is the short name. For example, `\"map_entry\"`.\n\
    \ For custom options, it should be the fully-qualified name. For example,\n\
    \ `\"google.api.http\"`.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\NUL\ENQ\DC2\EOT\176\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\NUL\SOH\DC2\EOT\176\SOH\t\r\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\NUL\ETX\DC2\EOT\176\SOH\DLE\DC1\n\
    \\160\STX\n\
    \\EOT\EOT\EOT\STX\SOH\DC2\EOT\181\SOH\STX\DLE\SUB\145\STX The option's value packed in an Any message. If the value is a primitive,\n\
    \ the corresponding wrapper type defined in google/protobuf/wrappers.proto\n\
    \ should be used. If the value is an enum, it should be stored as an int32\n\
    \ value using the google.protobuf.Int32Value type.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\SOH\ACK\DC2\EOT\181\SOH\STX\ENQ\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\SOH\SOH\DC2\EOT\181\SOH\ACK\v\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\SOH\ETX\DC2\EOT\181\SOH\SO\SI\n\
    \I\n\
    \\STX\ENQ\NUL\DC2\ACK\185\SOH\NUL\192\SOH\SOH\SUB; The syntax in which a protocol buffer element is defined.\n\
    \\n\
    \\v\n\
    \\ETX\ENQ\NUL\SOH\DC2\EOT\185\SOH\ENQ\v\n\
    \ \n\
    \\EOT\ENQ\NUL\STX\NUL\DC2\EOT\187\SOH\STX\DC4\SUB\DC2 Syntax `proto2`.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\NUL\SOH\DC2\EOT\187\SOH\STX\SI\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\NUL\STX\DC2\EOT\187\SOH\DC2\DC3\n\
    \ \n\
    \\EOT\ENQ\NUL\STX\SOH\DC2\EOT\189\SOH\STX\DC4\SUB\DC2 Syntax `proto3`.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\SOH\SOH\DC2\EOT\189\SOH\STX\SI\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\SOH\STX\DC2\EOT\189\SOH\DC2\DC3\n\
    \\"\n\
    \\EOT\ENQ\NUL\STX\STX\DC2\EOT\191\SOH\STX\SYN\SUB\DC4 Syntax `editions`.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\STX\SOH\DC2\EOT\191\SOH\STX\DC1\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\STX\STX\DC2\EOT\191\SOH\DC4\NAKb\ACKproto3"