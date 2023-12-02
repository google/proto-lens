{- This file was auto-generated from google/protobuf/field_mask.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Google.Protobuf.FieldMask (
        FieldMask()
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
     
         * 'Proto.Google.Protobuf.FieldMask_Fields.paths' @:: Lens' FieldMask [Data.Text.Text]@
         * 'Proto.Google.Protobuf.FieldMask_Fields.vec'paths' @:: Lens' FieldMask (Data.Vector.Vector Data.Text.Text)@ -}
data FieldMask
  = FieldMask'_constructor {_FieldMask'paths :: !(Data.Vector.Vector Data.Text.Text),
                            _FieldMask'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show FieldMask where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField FieldMask "paths" [Data.Text.Text] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldMask'paths (\ x__ y__ -> x__ {_FieldMask'paths = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField FieldMask "vec'paths" (Data.Vector.Vector Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FieldMask'paths (\ x__ y__ -> x__ {_FieldMask'paths = y__}))
        Prelude.id
instance Data.ProtoLens.Message FieldMask where
  messageName _ = Data.Text.pack "google.protobuf.FieldMask"
  packedMessageDescriptor _
    = "\n\
      \\tFieldMask\DC2\DC4\n\
      \\ENQpaths\CAN\SOH \ETX(\tR\ENQpaths"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        paths__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "paths"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"paths")) ::
              Data.ProtoLens.FieldDescriptor FieldMask
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, paths__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _FieldMask'_unknownFields
        (\ x__ y__ -> x__ {_FieldMask'_unknownFields = y__})
  defMessage
    = FieldMask'_constructor
        {_FieldMask'paths = Data.Vector.Generic.empty,
         _FieldMask'_unknownFields = []}
  parseMessage
    = let
        loop ::
          FieldMask
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Text.Text
             -> Data.ProtoLens.Encoding.Bytes.Parser FieldMask
        loop x mutable'paths
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'paths <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'paths)
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
                              (Data.ProtoLens.Field.field @"vec'paths") frozen'paths x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.getText
                                              (Prelude.fromIntegral len))
                                        "paths"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'paths y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'paths
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'paths <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                 Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'paths)
          "FieldMask"
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
                           Data.Text.Encoding.encodeUtf8 _v))
                (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'paths") _x))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData FieldMask where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_FieldMask'_unknownFields x__)
             (Control.DeepSeq.deepseq (_FieldMask'paths x__) ())
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \ google/protobuf/field_mask.proto\DC2\SIgoogle.protobuf\"!\n\
    \\tFieldMask\DC2\DC4\n\
    \\ENQpaths\CAN\SOH \ETX(\tR\ENQpathsB\133\SOH\n\
    \\DC3com.google.protobufB\SOFieldMaskProtoP\SOHZ2google.golang.org/protobuf/types/known/fieldmaskpb\248\SOH\SOH\162\STX\ETXGPB\170\STX\RSGoogle.Protobuf.WellKnownTypesJ\161;\n\
    \\a\DC2\ENQ\RS\NUL\244\SOH\SOH\n\
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
    \\SOH\b\DC2\ETX\"\NUL,\n\
    \\t\n\
    \\STX\b\SOH\DC2\ETX\"\NUL,\n\
    \\b\n\
    \\SOH\b\DC2\ETX#\NUL/\n\
    \\t\n\
    \\STX\b\b\DC2\ETX#\NUL/\n\
    \\b\n\
    \\SOH\b\DC2\ETX$\NUL\"\n\
    \\t\n\
    \\STX\b\n\
    \\DC2\ETX$\NUL\"\n\
    \\b\n\
    \\SOH\b\DC2\ETX%\NUL!\n\
    \\t\n\
    \\STX\b$\DC2\ETX%\NUL!\n\
    \\b\n\
    \\SOH\b\DC2\ETX&\NUL;\n\
    \\t\n\
    \\STX\b%\DC2\ETX&\NUL;\n\
    \\b\n\
    \\SOH\b\DC2\ETX'\NULI\n\
    \\t\n\
    \\STX\b\v\DC2\ETX'\NULI\n\
    \\b\n\
    \\SOH\b\DC2\ETX(\NUL\US\n\
    \\t\n\
    \\STX\b\US\DC2\ETX(\NUL\US\n\
    \\178,\n\
    \\STX\EOT\NUL\DC2\ACK\241\SOH\NUL\244\SOH\SOH\SUB\163, `FieldMask` represents a set of symbolic field paths, for example:\n\
    \\n\
    \     paths: \"f.a\"\n\
    \     paths: \"f.b.d\"\n\
    \\n\
    \ Here `f` represents a field in some root message, `a` and `b`\n\
    \ fields in the message found in `f`, and `d` a field found in the\n\
    \ message in `f.b`.\n\
    \\n\
    \ Field masks are used to specify a subset of fields that should be\n\
    \ returned by a get operation or modified by an update operation.\n\
    \ Field masks also have a custom JSON encoding (see below).\n\
    \\n\
    \ # Field Masks in Projections\n\
    \\n\
    \ When used in the context of a projection, a response message or\n\
    \ sub-message is filtered by the API to only contain those fields as\n\
    \ specified in the mask. For example, if the mask in the previous\n\
    \ example is applied to a response message as follows:\n\
    \\n\
    \     f {\n\
    \       a : 22\n\
    \       b {\n\
    \         d : 1\n\
    \         x : 2\n\
    \       }\n\
    \       y : 13\n\
    \     }\n\
    \     z: 8\n\
    \\n\
    \ The result will not contain specific values for fields x,y and z\n\
    \ (their value will be set to the default, and omitted in proto text\n\
    \ output):\n\
    \\n\
    \\n\
    \     f {\n\
    \       a : 22\n\
    \       b {\n\
    \         d : 1\n\
    \       }\n\
    \     }\n\
    \\n\
    \ A repeated field is not allowed except at the last position of a\n\
    \ paths string.\n\
    \\n\
    \ If a FieldMask object is not present in a get operation, the\n\
    \ operation applies to all fields (as if a FieldMask of all fields\n\
    \ had been specified).\n\
    \\n\
    \ Note that a field mask does not necessarily apply to the\n\
    \ top-level response message. In case of a REST get operation, the\n\
    \ field mask applies directly to the response, but in case of a REST\n\
    \ list operation, the mask instead applies to each individual message\n\
    \ in the returned resource list. In case of a REST custom method,\n\
    \ other definitions may be used. Where the mask applies will be\n\
    \ clearly documented together with its declaration in the API.  In\n\
    \ any case, the effect on the returned resource/resources is required\n\
    \ behavior for APIs.\n\
    \\n\
    \ # Field Masks in Update Operations\n\
    \\n\
    \ A field mask in update operations specifies which fields of the\n\
    \ targeted resource are going to be updated. The API is required\n\
    \ to only change the values of the fields as specified in the mask\n\
    \ and leave the others untouched. If a resource is passed in to\n\
    \ describe the updated values, the API ignores the values of all\n\
    \ fields not covered by the mask.\n\
    \\n\
    \ If a repeated field is specified for an update operation, new values will\n\
    \ be appended to the existing repeated field in the target resource. Note that\n\
    \ a repeated field is only allowed in the last position of a `paths` string.\n\
    \\n\
    \ If a sub-message is specified in the last position of the field mask for an\n\
    \ update operation, then new value will be merged into the existing sub-message\n\
    \ in the target resource.\n\
    \\n\
    \ For example, given the target message:\n\
    \\n\
    \     f {\n\
    \       b {\n\
    \         d: 1\n\
    \         x: 2\n\
    \       }\n\
    \       c: [1]\n\
    \     }\n\
    \\n\
    \ And an update message:\n\
    \\n\
    \     f {\n\
    \       b {\n\
    \         d: 10\n\
    \       }\n\
    \       c: [2]\n\
    \     }\n\
    \\n\
    \ then if the field mask is:\n\
    \\n\
    \  paths: [\"f.b\", \"f.c\"]\n\
    \\n\
    \ then the result will be:\n\
    \\n\
    \     f {\n\
    \       b {\n\
    \         d: 10\n\
    \         x: 2\n\
    \       }\n\
    \       c: [1, 2]\n\
    \     }\n\
    \\n\
    \ An implementation may provide options to override this default behavior for\n\
    \ repeated and message fields.\n\
    \\n\
    \ In order to reset a field's value to the default, the field must\n\
    \ be in the mask and set to the default value in the provided resource.\n\
    \ Hence, in order to reset all fields of a resource, provide a default\n\
    \ instance of the resource and set all fields in the mask, or do\n\
    \ not provide a mask as described below.\n\
    \\n\
    \ If a field mask is not present on update, the operation applies to\n\
    \ all fields (as if a field mask of all fields has been specified).\n\
    \ Note that in the presence of schema evolution, this may mean that\n\
    \ fields the client does not know and has therefore not filled into\n\
    \ the request will be reset to their default. If this is unwanted\n\
    \ behavior, a specific service may require a client to always specify\n\
    \ a field mask, producing an error if not.\n\
    \\n\
    \ As with get operations, the location of the resource which\n\
    \ describes the updated values in the request message depends on the\n\
    \ operation kind. In any case, the effect of the field mask is\n\
    \ required to be honored by the API.\n\
    \\n\
    \ ## Considerations for HTTP REST\n\
    \\n\
    \ The HTTP kind of an update operation which uses a field mask must\n\
    \ be set to PATCH instead of PUT in order to satisfy HTTP semantics\n\
    \ (PUT must only be used for full updates).\n\
    \\n\
    \ # JSON Encoding of Field Masks\n\
    \\n\
    \ In JSON, a field mask is encoded as a single string where paths are\n\
    \ separated by a comma. Fields name in each path are converted\n\
    \ to/from lower-camel naming conventions.\n\
    \\n\
    \ As an example, consider the following message declarations:\n\
    \\n\
    \     message Profile {\n\
    \       User user = 1;\n\
    \       Photo photo = 2;\n\
    \     }\n\
    \     message User {\n\
    \       string display_name = 1;\n\
    \       string address = 2;\n\
    \     }\n\
    \\n\
    \ In proto a field mask for `Profile` may look as such:\n\
    \\n\
    \     mask {\n\
    \       paths: \"user.display_name\"\n\
    \       paths: \"photo\"\n\
    \     }\n\
    \\n\
    \ In JSON, the same mask is represented as below:\n\
    \\n\
    \     {\n\
    \       mask: \"user.displayName,photo\"\n\
    \     }\n\
    \\n\
    \ # Field Masks and Oneof Fields\n\
    \\n\
    \ Field masks treat fields in oneofs just as regular fields. Consider the\n\
    \ following message:\n\
    \\n\
    \     message SampleMessage {\n\
    \       oneof test_oneof {\n\
    \         string name = 4;\n\
    \         SubMessage sub_message = 9;\n\
    \       }\n\
    \     }\n\
    \\n\
    \ The field mask can be:\n\
    \\n\
    \     mask {\n\
    \       paths: \"name\"\n\
    \     }\n\
    \\n\
    \ Or:\n\
    \\n\
    \     mask {\n\
    \       paths: \"sub_message\"\n\
    \     }\n\
    \\n\
    \ Note that oneof type names (\"test_oneof\" in this case) cannot be used in\n\
    \ paths.\n\
    \\n\
    \ ## Field Mask Verification\n\
    \\n\
    \ The implementation of any API method which has a FieldMask type field in the\n\
    \ request should verify the included field paths, and return an\n\
    \ `INVALID_ARGUMENT` error if any path is unmappable.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\NUL\SOH\DC2\EOT\241\SOH\b\DC1\n\
    \,\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\EOT\243\SOH\STX\FS\SUB\RS The set of field mask paths.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\NUL\EOT\DC2\EOT\243\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\NUL\ENQ\DC2\EOT\243\SOH\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\EOT\243\SOH\DC2\ETB\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\EOT\243\SOH\SUB\ESCb\ACKproto3"