{- This file was auto-generated from google/protobuf/struct.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Google.Protobuf.Struct (
        ListValue(), NullValue(..), NullValue(),
        NullValue'UnrecognizedValue, Struct(), Struct'FieldsEntry(),
        Value(), Value'Kind(..), _Value'NullValue, _Value'NumberValue,
        _Value'StringValue, _Value'BoolValue, _Value'StructValue,
        _Value'ListValue
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
     
         * 'Proto.Google.Protobuf.Struct_Fields.values' @:: Lens' ListValue [Value]@
         * 'Proto.Google.Protobuf.Struct_Fields.vec'values' @:: Lens' ListValue (Data.Vector.Vector Value)@ -}
data ListValue
  = ListValue'_constructor {_ListValue'values :: !(Data.Vector.Vector Value),
                            _ListValue'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ListValue where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ListValue "values" [Value] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ListValue'values (\ x__ y__ -> x__ {_ListValue'values = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField ListValue "vec'values" (Data.Vector.Vector Value) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ListValue'values (\ x__ y__ -> x__ {_ListValue'values = y__}))
        Prelude.id
instance Data.ProtoLens.Message ListValue where
  messageName _ = Data.Text.pack "google.protobuf.ListValue"
  packedMessageDescriptor _
    = "\n\
      \\tListValue\DC2.\n\
      \\ACKvalues\CAN\SOH \ETX(\v2\SYN.google.protobuf.ValueR\ACKvalues"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        values__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "values"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Value)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"values")) ::
              Data.ProtoLens.FieldDescriptor ListValue
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, values__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ListValue'_unknownFields
        (\ x__ y__ -> x__ {_ListValue'_unknownFields = y__})
  defMessage
    = ListValue'_constructor
        {_ListValue'values = Data.Vector.Generic.empty,
         _ListValue'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ListValue
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Value
             -> Data.ProtoLens.Encoding.Bytes.Parser ListValue
        loop x mutable'values
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'values <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                         (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                            mutable'values)
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
                              (Data.ProtoLens.Field.field @"vec'values") frozen'values x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "values"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'values y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'values
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'values <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                  Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'values)
          "ListValue"
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
                           Data.ProtoLens.encodeMessage _v))
                (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'values") _x))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData ListValue where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ListValue'_unknownFields x__)
             (Control.DeepSeq.deepseq (_ListValue'values x__) ())
newtype NullValue'UnrecognizedValue
  = NullValue'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data NullValue
  = NULL_VALUE | NullValue'Unrecognized !NullValue'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum NullValue where
  enumName _ = Data.Text.pack "NullValue"
  maybeToEnum 0 = Prelude.Just NULL_VALUE
  maybeToEnum k
    = Prelude.Just
        (NullValue'Unrecognized
           (NullValue'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum NULL_VALUE = "NULL_VALUE"
  showEnum (NullValue'Unrecognized (NullValue'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "NULL_VALUE" = Prelude.Just NULL_VALUE
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded NullValue where
  minBound = NULL_VALUE
  maxBound = NULL_VALUE
instance Prelude.Enum NullValue where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum NullValue: " (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum NULL_VALUE = 0
  fromEnum (NullValue'Unrecognized (NullValue'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ NULL_VALUE
    = Prelude.error
        "NullValue.succ: bad argument NULL_VALUE. This value would be out of bounds."
  succ (NullValue'Unrecognized _)
    = Prelude.error "NullValue.succ: bad argument: unrecognized value"
  pred NULL_VALUE
    = Prelude.error
        "NullValue.pred: bad argument NULL_VALUE. This value would be out of bounds."
  pred (NullValue'Unrecognized _)
    = Prelude.error "NullValue.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault NullValue where
  fieldDefault = NULL_VALUE
instance Control.DeepSeq.NFData NullValue where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.Google.Protobuf.Struct_Fields.fields' @:: Lens' Struct (Data.Map.Map Data.Text.Text Value)@ -}
data Struct
  = Struct'_constructor {_Struct'fields :: !(Data.Map.Map Data.Text.Text Value),
                         _Struct'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Struct where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Struct "fields" (Data.Map.Map Data.Text.Text Value) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Struct'fields (\ x__ y__ -> x__ {_Struct'fields = y__}))
        Prelude.id
instance Data.ProtoLens.Message Struct where
  messageName _ = Data.Text.pack "google.protobuf.Struct"
  packedMessageDescriptor _
    = "\n\
      \\ACKStruct\DC2;\n\
      \\ACKfields\CAN\SOH \ETX(\v2#.google.protobuf.Struct.FieldsEntryR\ACKfields\SUBQ\n\
      \\vFieldsEntry\DC2\DLE\n\
      \\ETXkey\CAN\SOH \SOH(\tR\ETXkey\DC2,\n\
      \\ENQvalue\CAN\STX \SOH(\v2\SYN.google.protobuf.ValueR\ENQvalue:\STX8\SOH"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        fields__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "fields"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Struct'FieldsEntry)
              (Data.ProtoLens.MapField
                 Data.ProtoLens.MapStringKey
                 (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                    Data.ProtoLens.FieldTypeDescriptor Value)
                 (Data.ProtoLens.Field.field @"key")
                 (Data.ProtoLens.Field.field @"value")
                 (Data.ProtoLens.Field.field @"fields")) ::
              Data.ProtoLens.FieldDescriptor Struct
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, fields__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Struct'_unknownFields
        (\ x__ y__ -> x__ {_Struct'_unknownFields = y__})
  defMessage
    = Struct'_constructor
        {_Struct'fields = Data.Map.empty, _Struct'_unknownFields = []}
  parseMessage
    = let
        loop :: Struct -> Data.ProtoLens.Encoding.Bytes.Parser Struct
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
                          -> do !(entry :: Struct'FieldsEntry) <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                                                    (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                                        Data.ProtoLens.Encoding.Bytes.isolate
                                                                          (Prelude.fromIntegral len)
                                                                          Data.ProtoLens.parseMessage)
                                                                    "fields"
                                (let
                                   key = Lens.Family2.view (Data.ProtoLens.Field.field @"key") entry
                                   value
                                     = Lens.Family2.view (Data.ProtoLens.Field.field @"value") entry
                                 in
                                   loop
                                     (Lens.Family2.over
                                        (Data.ProtoLens.Field.field @"fields")
                                        (\ !t -> Data.Map.insert key value t) x))
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Struct"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (Data.Monoid.mconcat
                (Prelude.map
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
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"key") (Prelude.fst _v)
                                 (Lens.Family2.set
                                    (Data.ProtoLens.Field.field @"value") (Prelude.snd _v)
                                    (Data.ProtoLens.defMessage :: Struct'FieldsEntry)))))
                   (Data.Map.toList
                      (Lens.Family2.view (Data.ProtoLens.Field.field @"fields") _x))))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData Struct where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Struct'_unknownFields x__)
             (Control.DeepSeq.deepseq (_Struct'fields x__) ())
{- | Fields :
     
         * 'Proto.Google.Protobuf.Struct_Fields.key' @:: Lens' Struct'FieldsEntry Data.Text.Text@
         * 'Proto.Google.Protobuf.Struct_Fields.value' @:: Lens' Struct'FieldsEntry Value@
         * 'Proto.Google.Protobuf.Struct_Fields.maybe'value' @:: Lens' Struct'FieldsEntry (Prelude.Maybe Value)@ -}
data Struct'FieldsEntry
  = Struct'FieldsEntry'_constructor {_Struct'FieldsEntry'key :: !Data.Text.Text,
                                     _Struct'FieldsEntry'value :: !(Prelude.Maybe Value),
                                     _Struct'FieldsEntry'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Struct'FieldsEntry where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Struct'FieldsEntry "key" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Struct'FieldsEntry'key
           (\ x__ y__ -> x__ {_Struct'FieldsEntry'key = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Struct'FieldsEntry "value" Value where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Struct'FieldsEntry'value
           (\ x__ y__ -> x__ {_Struct'FieldsEntry'value = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Struct'FieldsEntry "maybe'value" (Prelude.Maybe Value) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Struct'FieldsEntry'value
           (\ x__ y__ -> x__ {_Struct'FieldsEntry'value = y__}))
        Prelude.id
instance Data.ProtoLens.Message Struct'FieldsEntry where
  messageName _ = Data.Text.pack "google.protobuf.Struct.FieldsEntry"
  packedMessageDescriptor _
    = "\n\
      \\vFieldsEntry\DC2\DLE\n\
      \\ETXkey\CAN\SOH \SOH(\tR\ETXkey\DC2,\n\
      \\ENQvalue\CAN\STX \SOH(\v2\SYN.google.protobuf.ValueR\ENQvalue:\STX8\SOH"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        key__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "key"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"key")) ::
              Data.ProtoLens.FieldDescriptor Struct'FieldsEntry
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Value)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'value")) ::
              Data.ProtoLens.FieldDescriptor Struct'FieldsEntry
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, key__field_descriptor),
           (Data.ProtoLens.Tag 2, value__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Struct'FieldsEntry'_unknownFields
        (\ x__ y__ -> x__ {_Struct'FieldsEntry'_unknownFields = y__})
  defMessage
    = Struct'FieldsEntry'_constructor
        {_Struct'FieldsEntry'key = Data.ProtoLens.fieldDefault,
         _Struct'FieldsEntry'value = Prelude.Nothing,
         _Struct'FieldsEntry'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Struct'FieldsEntry
          -> Data.ProtoLens.Encoding.Bytes.Parser Struct'FieldsEntry
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
                                       "key"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"key") y x)
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
          (do loop Data.ProtoLens.defMessage) "FieldsEntry"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"key") _x
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
instance Control.DeepSeq.NFData Struct'FieldsEntry where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Struct'FieldsEntry'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Struct'FieldsEntry'key x__)
                (Control.DeepSeq.deepseq (_Struct'FieldsEntry'value x__) ()))
{- | Fields :
     
         * 'Proto.Google.Protobuf.Struct_Fields.maybe'kind' @:: Lens' Value (Prelude.Maybe Value'Kind)@
         * 'Proto.Google.Protobuf.Struct_Fields.maybe'nullValue' @:: Lens' Value (Prelude.Maybe NullValue)@
         * 'Proto.Google.Protobuf.Struct_Fields.nullValue' @:: Lens' Value NullValue@
         * 'Proto.Google.Protobuf.Struct_Fields.maybe'numberValue' @:: Lens' Value (Prelude.Maybe Prelude.Double)@
         * 'Proto.Google.Protobuf.Struct_Fields.numberValue' @:: Lens' Value Prelude.Double@
         * 'Proto.Google.Protobuf.Struct_Fields.maybe'stringValue' @:: Lens' Value (Prelude.Maybe Data.Text.Text)@
         * 'Proto.Google.Protobuf.Struct_Fields.stringValue' @:: Lens' Value Data.Text.Text@
         * 'Proto.Google.Protobuf.Struct_Fields.maybe'boolValue' @:: Lens' Value (Prelude.Maybe Prelude.Bool)@
         * 'Proto.Google.Protobuf.Struct_Fields.boolValue' @:: Lens' Value Prelude.Bool@
         * 'Proto.Google.Protobuf.Struct_Fields.maybe'structValue' @:: Lens' Value (Prelude.Maybe Struct)@
         * 'Proto.Google.Protobuf.Struct_Fields.structValue' @:: Lens' Value Struct@
         * 'Proto.Google.Protobuf.Struct_Fields.maybe'listValue' @:: Lens' Value (Prelude.Maybe ListValue)@
         * 'Proto.Google.Protobuf.Struct_Fields.listValue' @:: Lens' Value ListValue@ -}
data Value
  = Value'_constructor {_Value'kind :: !(Prelude.Maybe Value'Kind),
                        _Value'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Value where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
data Value'Kind
  = Value'NullValue !NullValue |
    Value'NumberValue !Prelude.Double |
    Value'StringValue !Data.Text.Text |
    Value'BoolValue !Prelude.Bool |
    Value'StructValue !Struct |
    Value'ListValue !ListValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.Field.HasField Value "maybe'kind" (Prelude.Maybe Value'Kind) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Value'kind (\ x__ y__ -> x__ {_Value'kind = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Value "maybe'nullValue" (Prelude.Maybe NullValue) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Value'kind (\ x__ y__ -> x__ {_Value'kind = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Value'NullValue x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Value'NullValue y__))
instance Data.ProtoLens.Field.HasField Value "nullValue" NullValue where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Value'kind (\ x__ y__ -> x__ {_Value'kind = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Value'NullValue x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Value'NullValue y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault))
instance Data.ProtoLens.Field.HasField Value "maybe'numberValue" (Prelude.Maybe Prelude.Double) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Value'kind (\ x__ y__ -> x__ {_Value'kind = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Value'NumberValue x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Value'NumberValue y__))
instance Data.ProtoLens.Field.HasField Value "numberValue" Prelude.Double where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Value'kind (\ x__ y__ -> x__ {_Value'kind = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Value'NumberValue x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Value'NumberValue y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault))
instance Data.ProtoLens.Field.HasField Value "maybe'stringValue" (Prelude.Maybe Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Value'kind (\ x__ y__ -> x__ {_Value'kind = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Value'StringValue x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Value'StringValue y__))
instance Data.ProtoLens.Field.HasField Value "stringValue" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Value'kind (\ x__ y__ -> x__ {_Value'kind = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Value'StringValue x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Value'StringValue y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault))
instance Data.ProtoLens.Field.HasField Value "maybe'boolValue" (Prelude.Maybe Prelude.Bool) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Value'kind (\ x__ y__ -> x__ {_Value'kind = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Value'BoolValue x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Value'BoolValue y__))
instance Data.ProtoLens.Field.HasField Value "boolValue" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Value'kind (\ x__ y__ -> x__ {_Value'kind = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Value'BoolValue x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Value'BoolValue y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.fieldDefault))
instance Data.ProtoLens.Field.HasField Value "maybe'structValue" (Prelude.Maybe Struct) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Value'kind (\ x__ y__ -> x__ {_Value'kind = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Value'StructValue x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Value'StructValue y__))
instance Data.ProtoLens.Field.HasField Value "structValue" Struct where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Value'kind (\ x__ y__ -> x__ {_Value'kind = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Value'StructValue x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Value'StructValue y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Value "maybe'listValue" (Prelude.Maybe ListValue) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Value'kind (\ x__ y__ -> x__ {_Value'kind = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Value'ListValue x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Value'ListValue y__))
instance Data.ProtoLens.Field.HasField Value "listValue" ListValue where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Value'kind (\ x__ y__ -> x__ {_Value'kind = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Value'ListValue x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Value'ListValue y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Message Value where
  messageName _ = Data.Text.pack "google.protobuf.Value"
  packedMessageDescriptor _
    = "\n\
      \\ENQValue\DC2;\n\
      \\n\
      \null_value\CAN\SOH \SOH(\SO2\SUB.google.protobuf.NullValueH\NULR\tnullValue\DC2#\n\
      \\fnumber_value\CAN\STX \SOH(\SOHH\NULR\vnumberValue\DC2#\n\
      \\fstring_value\CAN\ETX \SOH(\tH\NULR\vstringValue\DC2\US\n\
      \\n\
      \bool_value\CAN\EOT \SOH(\bH\NULR\tboolValue\DC2<\n\
      \\fstruct_value\CAN\ENQ \SOH(\v2\ETB.google.protobuf.StructH\NULR\vstructValue\DC2;\n\
      \\n\
      \list_value\CAN\ACK \SOH(\v2\SUB.google.protobuf.ListValueH\NULR\tlistValueB\ACK\n\
      \\EOTkind"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        nullValue__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "null_value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor NullValue)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'nullValue")) ::
              Data.ProtoLens.FieldDescriptor Value
        numberValue__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "number_value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.DoubleField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Double)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'numberValue")) ::
              Data.ProtoLens.FieldDescriptor Value
        stringValue__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "string_value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'stringValue")) ::
              Data.ProtoLens.FieldDescriptor Value
        boolValue__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "bool_value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'boolValue")) ::
              Data.ProtoLens.FieldDescriptor Value
        structValue__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "struct_value"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Struct)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'structValue")) ::
              Data.ProtoLens.FieldDescriptor Value
        listValue__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "list_value"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ListValue)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'listValue")) ::
              Data.ProtoLens.FieldDescriptor Value
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, nullValue__field_descriptor),
           (Data.ProtoLens.Tag 2, numberValue__field_descriptor),
           (Data.ProtoLens.Tag 3, stringValue__field_descriptor),
           (Data.ProtoLens.Tag 4, boolValue__field_descriptor),
           (Data.ProtoLens.Tag 5, structValue__field_descriptor),
           (Data.ProtoLens.Tag 6, listValue__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Value'_unknownFields
        (\ x__ y__ -> x__ {_Value'_unknownFields = y__})
  defMessage
    = Value'_constructor
        {_Value'kind = Prelude.Nothing, _Value'_unknownFields = []}
  parseMessage
    = let
        loop :: Value -> Data.ProtoLens.Encoding.Bytes.Parser Value
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
                                       "null_value"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"nullValue") y x)
                        17
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Data.ProtoLens.Encoding.Bytes.wordToDouble
                                          Data.ProtoLens.Encoding.Bytes.getFixed64)
                                       "number_value"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"numberValue") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getText
                                             (Prelude.fromIntegral len))
                                       "string_value"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"stringValue") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "bool_value"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"boolValue") y x)
                        42
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "struct_value"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"structValue") y x)
                        50
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "list_value"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"listValue") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Value"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'kind") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just (Value'NullValue v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                       ((Prelude..)
                          ((Prelude..)
                             Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                          Prelude.fromEnum v)
                (Prelude.Just (Value'NumberValue v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 17)
                       ((Prelude..)
                          Data.ProtoLens.Encoding.Bytes.putFixed64
                          Data.ProtoLens.Encoding.Bytes.doubleToWord v)
                (Prelude.Just (Value'StringValue v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.Text.Encoding.encodeUtf8 v)
                (Prelude.Just (Value'BoolValue v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                       ((Prelude..)
                          Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                          v)
                (Prelude.Just (Value'StructValue v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 42)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Value'ListValue v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 50)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData Value where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Value'_unknownFields x__)
             (Control.DeepSeq.deepseq (_Value'kind x__) ())
instance Control.DeepSeq.NFData Value'Kind where
  rnf (Value'NullValue x__) = Control.DeepSeq.rnf x__
  rnf (Value'NumberValue x__) = Control.DeepSeq.rnf x__
  rnf (Value'StringValue x__) = Control.DeepSeq.rnf x__
  rnf (Value'BoolValue x__) = Control.DeepSeq.rnf x__
  rnf (Value'StructValue x__) = Control.DeepSeq.rnf x__
  rnf (Value'ListValue x__) = Control.DeepSeq.rnf x__
_Value'NullValue ::
  Data.ProtoLens.Prism.Prism' Value'Kind NullValue
_Value'NullValue
  = Data.ProtoLens.Prism.prism'
      Value'NullValue
      (\ p__
         -> case p__ of
              (Value'NullValue p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Value'NumberValue ::
  Data.ProtoLens.Prism.Prism' Value'Kind Prelude.Double
_Value'NumberValue
  = Data.ProtoLens.Prism.prism'
      Value'NumberValue
      (\ p__
         -> case p__ of
              (Value'NumberValue p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Value'StringValue ::
  Data.ProtoLens.Prism.Prism' Value'Kind Data.Text.Text
_Value'StringValue
  = Data.ProtoLens.Prism.prism'
      Value'StringValue
      (\ p__
         -> case p__ of
              (Value'StringValue p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Value'BoolValue ::
  Data.ProtoLens.Prism.Prism' Value'Kind Prelude.Bool
_Value'BoolValue
  = Data.ProtoLens.Prism.prism'
      Value'BoolValue
      (\ p__
         -> case p__ of
              (Value'BoolValue p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Value'StructValue :: Data.ProtoLens.Prism.Prism' Value'Kind Struct
_Value'StructValue
  = Data.ProtoLens.Prism.prism'
      Value'StructValue
      (\ p__
         -> case p__ of
              (Value'StructValue p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Value'ListValue ::
  Data.ProtoLens.Prism.Prism' Value'Kind ListValue
_Value'ListValue
  = Data.ProtoLens.Prism.prism'
      Value'ListValue
      (\ p__
         -> case p__ of
              (Value'ListValue p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\FSgoogle/protobuf/struct.proto\DC2\SIgoogle.protobuf\"\152\SOH\n\
    \\ACKStruct\DC2;\n\
    \\ACKfields\CAN\SOH \ETX(\v2#.google.protobuf.Struct.FieldsEntryR\ACKfields\SUBQ\n\
    \\vFieldsEntry\DC2\DLE\n\
    \\ETXkey\CAN\SOH \SOH(\tR\ETXkey\DC2,\n\
    \\ENQvalue\CAN\STX \SOH(\v2\SYN.google.protobuf.ValueR\ENQvalue:\STX8\SOH\"\178\STX\n\
    \\ENQValue\DC2;\n\
    \\n\
    \null_value\CAN\SOH \SOH(\SO2\SUB.google.protobuf.NullValueH\NULR\tnullValue\DC2#\n\
    \\fnumber_value\CAN\STX \SOH(\SOHH\NULR\vnumberValue\DC2#\n\
    \\fstring_value\CAN\ETX \SOH(\tH\NULR\vstringValue\DC2\US\n\
    \\n\
    \bool_value\CAN\EOT \SOH(\bH\NULR\tboolValue\DC2<\n\
    \\fstruct_value\CAN\ENQ \SOH(\v2\ETB.google.protobuf.StructH\NULR\vstructValue\DC2;\n\
    \\n\
    \list_value\CAN\ACK \SOH(\v2\SUB.google.protobuf.ListValueH\NULR\tlistValueB\ACK\n\
    \\EOTkind\";\n\
    \\tListValue\DC2.\n\
    \\ACKvalues\CAN\SOH \ETX(\v2\SYN.google.protobuf.ValueR\ACKvalues*\ESC\n\
    \\tNullValue\DC2\SO\n\
    \\n\
    \NULL_VALUE\DLE\NULB\DEL\n\
    \\DC3com.google.protobufB\vStructProtoP\SOHZ/google.golang.org/protobuf/types/known/structpb\248\SOH\SOH\162\STX\ETXGPB\170\STX\RSGoogle.Protobuf.WellKnownTypesJ\153\GS\n\
    \\ACK\DC2\EOT\RS\NUL^\SOH\n\
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
    \\b\n\
    \\SOH\b\DC2\ETX\"\NUL\US\n\
    \\t\n\
    \\STX\b\US\DC2\ETX\"\NUL\US\n\
    \\b\n\
    \\SOH\b\DC2\ETX#\NULF\n\
    \\t\n\
    \\STX\b\v\DC2\ETX#\NULF\n\
    \\b\n\
    \\SOH\b\DC2\ETX$\NUL,\n\
    \\t\n\
    \\STX\b\SOH\DC2\ETX$\NUL,\n\
    \\b\n\
    \\SOH\b\DC2\ETX%\NUL,\n\
    \\t\n\
    \\STX\b\b\DC2\ETX%\NUL,\n\
    \\b\n\
    \\SOH\b\DC2\ETX&\NUL\"\n\
    \\t\n\
    \\STX\b\n\
    \\DC2\ETX&\NUL\"\n\
    \\b\n\
    \\SOH\b\DC2\ETX'\NUL!\n\
    \\t\n\
    \\STX\b$\DC2\ETX'\NUL!\n\
    \\b\n\
    \\SOH\b\DC2\ETX(\NUL;\n\
    \\t\n\
    \\STX\b%\DC2\ETX(\NUL;\n\
    \\179\ETX\n\
    \\STX\EOT\NUL\DC2\EOT2\NUL5\SOH\SUB\166\ETX `Struct` represents a structured data value, consisting of fields\n\
    \ which map to dynamically typed values. In some languages, `Struct`\n\
    \ might be supported by a native representation. For example, in\n\
    \ scripting languages like JS a struct is represented as an\n\
    \ object. The details of that representation are described together\n\
    \ with the proto support for the language.\n\
    \\n\
    \ The JSON representation for `Struct` is JSON object.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX2\b\SO\n\
    \9\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX4\STX \SUB, Unordered map of dynamically typed values.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ACK\DC2\ETX4\STX\DC4\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX4\NAK\ESC\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX4\RS\US\n\
    \\196\STX\n\
    \\STX\EOT\SOH\DC2\EOT=\NULM\SOH\SUB\183\STX `Value` represents a dynamically typed value which can be either\n\
    \ null, a number, a string, a boolean, a recursive struct value, or a\n\
    \ list of values. A producer of value is expected to set one of these\n\
    \ variants. Absence of any variant indicates an error.\n\
    \\n\
    \ The JSON representation for `Value` is JSON value.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETX=\b\r\n\
    \\"\n\
    \\EOT\EOT\SOH\b\NUL\DC2\EOT?\STXL\ETX\SUB\DC4 The kind of value.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\b\NUL\SOH\DC2\ETX?\b\f\n\
    \'\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\ETXA\EOT\GS\SUB\SUB Represents a null value.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ACK\DC2\ETXA\EOT\r\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\ETXA\SO\CAN\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\ETXA\ESC\FS\n\
    \)\n\
    \\EOT\EOT\SOH\STX\SOH\DC2\ETXC\EOT\FS\SUB\FS Represents a double value.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ENQ\DC2\ETXC\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\SOH\DC2\ETXC\v\ETB\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ETX\DC2\ETXC\SUB\ESC\n\
    \)\n\
    \\EOT\EOT\SOH\STX\STX\DC2\ETXE\EOT\FS\SUB\FS Represents a string value.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ENQ\DC2\ETXE\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\SOH\DC2\ETXE\v\ETB\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ETX\DC2\ETXE\SUB\ESC\n\
    \*\n\
    \\EOT\EOT\SOH\STX\ETX\DC2\ETXG\EOT\CAN\SUB\GS Represents a boolean value.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\ENQ\DC2\ETXG\EOT\b\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\SOH\DC2\ETXG\t\DC3\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\ETX\DC2\ETXG\SYN\ETB\n\
    \-\n\
    \\EOT\EOT\SOH\STX\EOT\DC2\ETXI\EOT\FS\SUB  Represents a structured value.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\EOT\ACK\DC2\ETXI\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\EOT\SOH\DC2\ETXI\v\ETB\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\EOT\ETX\DC2\ETXI\SUB\ESC\n\
    \-\n\
    \\EOT\EOT\SOH\STX\ENQ\DC2\ETXK\EOT\GS\SUB  Represents a repeated `Value`.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ENQ\ACK\DC2\ETXK\EOT\r\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ENQ\SOH\DC2\ETXK\SO\CAN\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ENQ\ETX\DC2\ETXK\ESC\FS\n\
    \\168\SOH\n\
    \\STX\ENQ\NUL\DC2\EOTS\NULV\SOH\SUB\155\SOH `NullValue` is a singleton enumeration to represent the null value for the\n\
    \ `Value` type union.\n\
    \\n\
    \ The JSON representation for `NullValue` is JSON `null`.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\ENQ\NUL\SOH\DC2\ETXS\ENQ\SO\n\
    \\SUB\n\
    \\EOT\ENQ\NUL\STX\NUL\DC2\ETXU\STX\DC1\SUB\r Null value.\n\
    \\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\NUL\SOH\DC2\ETXU\STX\f\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\NUL\STX\DC2\ETXU\SI\DLE\n\
    \\130\SOH\n\
    \\STX\EOT\STX\DC2\EOT[\NUL^\SOH\SUBv `ListValue` is a wrapper around a repeated field of values.\n\
    \\n\
    \ The JSON representation for `ListValue` is JSON array.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\STX\SOH\DC2\ETX[\b\DC1\n\
    \:\n\
    \\EOT\EOT\STX\STX\NUL\DC2\ETX]\STX\FS\SUB- Repeated field of dynamically typed values.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\EOT\DC2\ETX]\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ACK\DC2\ETX]\v\DLE\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\SOH\DC2\ETX]\DC1\ETB\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ETX\DC2\ETX]\SUB\ESCb\ACKproto3"