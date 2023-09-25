{- This file was auto-generated from google/protobuf/any.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Google.Protobuf.Any (
        Any()
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
     
         * 'Proto.Google.Protobuf.Any_Fields.typeUrl' @:: Lens' Any Data.Text.Text@
         * 'Proto.Google.Protobuf.Any_Fields.value' @:: Lens' Any Data.ByteString.ByteString@ -}
data Any
  = Any'_constructor {_Any'typeUrl :: !Data.Text.Text,
                      _Any'value :: !Data.ByteString.ByteString,
                      _Any'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Any where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Any "typeUrl" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Any'typeUrl (\ x__ y__ -> x__ {_Any'typeUrl = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Any "value" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Any'value (\ x__ y__ -> x__ {_Any'value = y__}))
        Prelude.id
instance Data.ProtoLens.Message Any where
  messageName _ = Data.Text.pack "google.protobuf.Any"
  packedMessageDescriptor _
    = "\n\
      \\ETXAny\DC2\EM\n\
      \\btype_url\CAN\SOH \SOH(\tR\atypeUrl\DC2\DC4\n\
      \\ENQvalue\CAN\STX \SOH(\fR\ENQvalue"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        typeUrl__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "type_url"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"typeUrl")) ::
              Data.ProtoLens.FieldDescriptor Any
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor Any
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, typeUrl__field_descriptor),
           (Data.ProtoLens.Tag 2, value__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Any'_unknownFields (\ x__ y__ -> x__ {_Any'_unknownFields = y__})
  defMessage
    = Any'_constructor
        {_Any'typeUrl = Data.ProtoLens.fieldDefault,
         _Any'value = Data.ProtoLens.fieldDefault, _Any'_unknownFields = []}
  parseMessage
    = let
        loop :: Any -> Data.ProtoLens.Encoding.Bytes.Parser Any
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
                                       "type_url"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"typeUrl") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
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
          (do loop Data.ProtoLens.defMessage) "Any"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"typeUrl") _x
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
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData Any where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Any'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Any'typeUrl x__) (Control.DeepSeq.deepseq (_Any'value x__) ()))
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\EMgoogle/protobuf/any.proto\DC2\SIgoogle.protobuf\"6\n\
    \\ETXAny\DC2\EM\n\
    \\btype_url\CAN\SOH \SOH(\tR\atypeUrl\DC2\DC4\n\
    \\ENQvalue\CAN\STX \SOH(\fR\ENQvalueBv\n\
    \\DC3com.google.protobufB\bAnyProtoP\SOHZ,google.golang.org/protobuf/types/known/anypb\162\STX\ETXGPB\170\STX\RSGoogle.Protobuf.WellKnownTypesJ\249*\n\
    \\a\DC2\ENQ\RS\NUL\157\SOH\SOH\n\
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
    \\SOH\b\DC2\ETX\"\NUL;\n\
    \\t\n\
    \\STX\b%\DC2\ETX\"\NUL;\n\
    \\b\n\
    \\SOH\b\DC2\ETX#\NULC\n\
    \\t\n\
    \\STX\b\v\DC2\ETX#\NULC\n\
    \\b\n\
    \\SOH\b\DC2\ETX$\NUL,\n\
    \\t\n\
    \\STX\b\SOH\DC2\ETX$\NUL,\n\
    \\b\n\
    \\SOH\b\DC2\ETX%\NUL)\n\
    \\t\n\
    \\STX\b\b\DC2\ETX%\NUL)\n\
    \\b\n\
    \\SOH\b\DC2\ETX&\NUL\"\n\
    \\t\n\
    \\STX\b\n\
    \\DC2\ETX&\NUL\"\n\
    \\b\n\
    \\SOH\b\DC2\ETX'\NUL!\n\
    \\t\n\
    \\STX\b$\DC2\ETX'\NUL!\n\
    \\253\DLE\n\
    \\STX\EOT\NUL\DC2\ENQ|\NUL\157\SOH\SOH\SUB\239\DLE `Any` contains an arbitrary serialized protocol buffer message along with a\n\
    \ URL that describes the type of the serialized message.\n\
    \\n\
    \ Protobuf library provides support to pack/unpack Any values in the form\n\
    \ of utility functions or additional generated methods of the Any type.\n\
    \\n\
    \ Example 1: Pack and unpack a message in C++.\n\
    \\n\
    \     Foo foo = ...;\n\
    \     Any any;\n\
    \     any.PackFrom(foo);\n\
    \     ...\n\
    \     if (any.UnpackTo(&foo)) {\n\
    \       ...\n\
    \     }\n\
    \\n\
    \ Example 2: Pack and unpack a message in Java.\n\
    \\n\
    \     Foo foo = ...;\n\
    \     Any any = Any.pack(foo);\n\
    \     ...\n\
    \     if (any.is(Foo.class)) {\n\
    \       foo = any.unpack(Foo.class);\n\
    \     }\n\
    \\n\
    \  Example 3: Pack and unpack a message in Python.\n\
    \\n\
    \     foo = Foo(...)\n\
    \     any = Any()\n\
    \     any.Pack(foo)\n\
    \     ...\n\
    \     if any.Is(Foo.DESCRIPTOR):\n\
    \       any.Unpack(foo)\n\
    \       ...\n\
    \\n\
    \  Example 4: Pack and unpack a message in Go\n\
    \\n\
    \      foo := &pb.Foo{...}\n\
    \      any, err := anypb.New(foo)\n\
    \      if err != nil {\n\
    \        ...\n\
    \      }\n\
    \      ...\n\
    \      foo := &pb.Foo{}\n\
    \      if err := any.UnmarshalTo(foo); err != nil {\n\
    \        ...\n\
    \      }\n\
    \\n\
    \ The pack methods provided by protobuf library will by default use\n\
    \ 'type.googleapis.com/full.type.name' as the type URL and the unpack\n\
    \ methods only use the fully qualified type name after the last '/'\n\
    \ in the type URL, for example \"foo.bar.com/x/y.z\" will yield type\n\
    \ name \"y.z\".\n\
    \\n\
    \\n\
    \ JSON\n\
    \ ====\n\
    \ The JSON representation of an `Any` value uses the regular\n\
    \ representation of the deserialized, embedded message, with an\n\
    \ additional field `@type` which contains the type URL. Example:\n\
    \\n\
    \     package google.profile;\n\
    \     message Person {\n\
    \       string first_name = 1;\n\
    \       string last_name = 2;\n\
    \     }\n\
    \\n\
    \     {\n\
    \       \"@type\": \"type.googleapis.com/google.profile.Person\",\n\
    \       \"firstName\": <string>,\n\
    \       \"lastName\": <string>\n\
    \     }\n\
    \\n\
    \ If the embedded message type is well-known and has a custom JSON\n\
    \ representation, that representation will be embedded adding a field\n\
    \ `value` which holds the custom JSON in addition to the `@type`\n\
    \ field. Example (for message [google.protobuf.Duration][]):\n\
    \\n\
    \     {\n\
    \       \"@type\": \"type.googleapis.com/google.protobuf.Duration\",\n\
    \       \"value\": \"1.212s\"\n\
    \     }\n\
    \\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX|\b\v\n\
    \\215\n\
    \\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\EOT\153\SOH\STX\SYN\SUB\200\n\
    \ A URL/resource name that uniquely identifies the type of the serialized\n\
    \ protocol buffer message. This string must contain at least\n\
    \ one \"/\" character. The last segment of the URL's path must represent\n\
    \ the fully qualified name of the type (as in\n\
    \ `path/google.protobuf.Duration`). The name should be in a canonical form\n\
    \ (e.g., leading \".\" is not accepted).\n\
    \\n\
    \ In practice, teams usually precompile into the binary all types that they\n\
    \ expect it to use in the context of Any. However, for URLs which use the\n\
    \ scheme `http`, `https`, or no scheme, one can optionally set up a type\n\
    \ server that maps type URLs to message definitions as follows:\n\
    \\n\
    \ * If no scheme is provided, `https` is assumed.\n\
    \ * An HTTP GET on the URL must yield a [google.protobuf.Type][]\n\
    \   value in binary format, or produce an error.\n\
    \ * Applications are allowed to cache lookup results based on the\n\
    \   URL, or have them precompiled into a binary to avoid any\n\
    \   lookup. Therefore, binary compatibility needs to be preserved\n\
    \   on changes to types. (Use versioned type names to manage\n\
    \   breaking changes.)\n\
    \\n\
    \ Note: this functionality is not currently available in the official\n\
    \ protobuf release, and it is not used for type URLs beginning with\n\
    \ type.googleapis.com.\n\
    \\n\
    \ Schemes other than `http`, `https` (or the empty scheme) might be\n\
    \ used with implementation specific semantics.\n\
    \\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\NUL\ENQ\DC2\EOT\153\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\EOT\153\SOH\t\DC1\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\EOT\153\SOH\DC4\NAK\n\
    \W\n\
    \\EOT\EOT\NUL\STX\SOH\DC2\EOT\156\SOH\STX\DC2\SUBI Must be a valid serialized protocol buffer of the above specified type.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\SOH\ENQ\DC2\EOT\156\SOH\STX\a\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\SOH\SOH\DC2\EOT\156\SOH\b\r\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\SOH\ETX\DC2\EOT\156\SOH\DLE\DC1b\ACKproto3"