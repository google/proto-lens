{- This file was auto-generated from google/protobuf/source_context.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Google.Protobuf.SourceContext (
        SourceContext()
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
     
         * 'Proto.Google.Protobuf.SourceContext_Fields.fileName' @:: Lens' SourceContext Data.Text.Text@ -}
data SourceContext
  = SourceContext'_constructor {_SourceContext'fileName :: !Data.Text.Text,
                                _SourceContext'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show SourceContext where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField SourceContext "fileName" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SourceContext'fileName
           (\ x__ y__ -> x__ {_SourceContext'fileName = y__}))
        Prelude.id
instance Data.ProtoLens.Message SourceContext where
  messageName _ = Data.Text.pack "google.protobuf.SourceContext"
  packedMessageDescriptor _
    = "\n\
      \\rSourceContext\DC2\ESC\n\
      \\tfile_name\CAN\SOH \SOH(\tR\bfileName"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        fileName__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "file_name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"fileName")) ::
              Data.ProtoLens.FieldDescriptor SourceContext
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, fileName__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SourceContext'_unknownFields
        (\ x__ y__ -> x__ {_SourceContext'_unknownFields = y__})
  defMessage
    = SourceContext'_constructor
        {_SourceContext'fileName = Data.ProtoLens.fieldDefault,
         _SourceContext'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SourceContext -> Data.ProtoLens.Encoding.Bytes.Parser SourceContext
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
                                       "file_name"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"fileName") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "SourceContext"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"fileName") _x
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
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData SourceContext where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SourceContext'_unknownFields x__)
             (Control.DeepSeq.deepseq (_SourceContext'fileName x__) ())
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \$google/protobuf/source_context.proto\DC2\SIgoogle.protobuf\",\n\
    \\rSourceContext\DC2\ESC\n\
    \\tfile_name\CAN\SOH \SOH(\tR\bfileNameB\138\SOH\n\
    \\DC3com.google.protobufB\DC2SourceContextProtoP\SOHZ6google.golang.org/protobuf/types/known/sourcecontextpb\162\STX\ETXGPB\170\STX\RSGoogle.Protobuf.WellKnownTypesJ\193\DLE\n\
    \\ACK\DC2\EOT\RS\NUL/\SOH\n\
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
    \\SOH\b\DC2\ETX#\NUL3\n\
    \\t\n\
    \\STX\b\b\DC2\ETX#\NUL3\n\
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
    \\SOH\b\DC2\ETX'\NULM\n\
    \\t\n\
    \\STX\b\v\DC2\ETX'\NULM\n\
    \\131\SOH\n\
    \\STX\EOT\NUL\DC2\EOT+\NUL/\SOH\SUBw `SourceContext` represents information about the source of a\n\
    \ protobuf element, like the file in which it is defined.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX+\b\NAK\n\
    \\163\SOH\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX.\STX\ETB\SUB\149\SOH The path-qualified name of the .proto file that contained the associated\n\
    \ protobuf element.  For example: `\"google/protobuf/source_context.proto\"`.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ENQ\DC2\ETX.\STX\b\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX.\t\DC2\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX.\NAK\SYNb\ACKproto3"