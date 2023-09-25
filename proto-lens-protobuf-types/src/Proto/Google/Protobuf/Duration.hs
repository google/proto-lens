{- This file was auto-generated from google/protobuf/duration.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Google.Protobuf.Duration (
        Duration()
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
     
         * 'Proto.Google.Protobuf.Duration_Fields.seconds' @:: Lens' Duration Data.Int.Int64@
         * 'Proto.Google.Protobuf.Duration_Fields.nanos' @:: Lens' Duration Data.Int.Int32@ -}
data Duration
  = Duration'_constructor {_Duration'seconds :: !Data.Int.Int64,
                           _Duration'nanos :: !Data.Int.Int32,
                           _Duration'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Duration where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Duration "seconds" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Duration'seconds (\ x__ y__ -> x__ {_Duration'seconds = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Duration "nanos" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Duration'nanos (\ x__ y__ -> x__ {_Duration'nanos = y__}))
        Prelude.id
instance Data.ProtoLens.Message Duration where
  messageName _ = Data.Text.pack "google.protobuf.Duration"
  packedMessageDescriptor _
    = "\n\
      \\bDuration\DC2\CAN\n\
      \\aseconds\CAN\SOH \SOH(\ETXR\aseconds\DC2\DC4\n\
      \\ENQnanos\CAN\STX \SOH(\ENQR\ENQnanos"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        seconds__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "seconds"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"seconds")) ::
              Data.ProtoLens.FieldDescriptor Duration
        nanos__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "nanos"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"nanos")) ::
              Data.ProtoLens.FieldDescriptor Duration
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, seconds__field_descriptor),
           (Data.ProtoLens.Tag 2, nanos__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Duration'_unknownFields
        (\ x__ y__ -> x__ {_Duration'_unknownFields = y__})
  defMessage
    = Duration'_constructor
        {_Duration'seconds = Data.ProtoLens.fieldDefault,
         _Duration'nanos = Data.ProtoLens.fieldDefault,
         _Duration'_unknownFields = []}
  parseMessage
    = let
        loop :: Duration -> Data.ProtoLens.Encoding.Bytes.Parser Duration
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
                                       "seconds"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"seconds") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "nanos"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"nanos") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Duration"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"seconds") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"nanos") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData Duration where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Duration'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Duration'seconds x__)
                (Control.DeepSeq.deepseq (_Duration'nanos x__) ()))
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\RSgoogle/protobuf/duration.proto\DC2\SIgoogle.protobuf\":\n\
    \\bDuration\DC2\CAN\n\
    \\aseconds\CAN\SOH \SOH(\ETXR\aseconds\DC2\DC4\n\
    \\ENQnanos\CAN\STX \SOH(\ENQR\ENQnanosB\131\SOH\n\
    \\DC3com.google.protobufB\rDurationProtoP\SOHZ1google.golang.org/protobuf/types/known/durationpb\248\SOH\SOH\162\STX\ETXGPB\170\STX\RSGoogle.Protobuf.WellKnownTypesJ\217#\n\
    \\ACK\DC2\EOT\RS\NULr\SOH\n\
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
    \\SOH\b\DC2\ETX#\NULH\n\
    \\t\n\
    \\STX\b\v\DC2\ETX#\NULH\n\
    \\b\n\
    \\SOH\b\DC2\ETX$\NUL,\n\
    \\t\n\
    \\STX\b\SOH\DC2\ETX$\NUL,\n\
    \\b\n\
    \\SOH\b\DC2\ETX%\NUL.\n\
    \\t\n\
    \\STX\b\b\DC2\ETX%\NUL.\n\
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
    \\157\DLE\n\
    \\STX\EOT\NUL\DC2\EOTe\NULr\SOH\SUB\144\DLE A Duration represents a signed, fixed-length span of time represented\n\
    \ as a count of seconds and fractions of seconds at nanosecond\n\
    \ resolution. It is independent of any calendar and concepts like \"day\"\n\
    \ or \"month\". It is related to Timestamp in that the difference between\n\
    \ two Timestamp values is a Duration and it can be added or subtracted\n\
    \ from a Timestamp. Range is approximately +-10,000 years.\n\
    \\n\
    \ # Examples\n\
    \\n\
    \ Example 1: Compute Duration from two Timestamps in pseudo code.\n\
    \\n\
    \     Timestamp start = ...;\n\
    \     Timestamp end = ...;\n\
    \     Duration duration = ...;\n\
    \\n\
    \     duration.seconds = end.seconds - start.seconds;\n\
    \     duration.nanos = end.nanos - start.nanos;\n\
    \\n\
    \     if (duration.seconds < 0 && duration.nanos > 0) {\n\
    \       duration.seconds += 1;\n\
    \       duration.nanos -= 1000000000;\n\
    \     } else if (duration.seconds > 0 && duration.nanos < 0) {\n\
    \       duration.seconds -= 1;\n\
    \       duration.nanos += 1000000000;\n\
    \     }\n\
    \\n\
    \ Example 2: Compute Timestamp from Timestamp + Duration in pseudo code.\n\
    \\n\
    \     Timestamp start = ...;\n\
    \     Duration duration = ...;\n\
    \     Timestamp end = ...;\n\
    \\n\
    \     end.seconds = start.seconds + duration.seconds;\n\
    \     end.nanos = start.nanos + duration.nanos;\n\
    \\n\
    \     if (end.nanos < 0) {\n\
    \       end.seconds -= 1;\n\
    \       end.nanos += 1000000000;\n\
    \     } else if (end.nanos >= 1000000000) {\n\
    \       end.seconds += 1;\n\
    \       end.nanos -= 1000000000;\n\
    \     }\n\
    \\n\
    \ Example 3: Compute Duration from datetime.timedelta in Python.\n\
    \\n\
    \     td = datetime.timedelta(days=3, minutes=10)\n\
    \     duration = Duration()\n\
    \     duration.FromTimedelta(td)\n\
    \\n\
    \ # JSON Mapping\n\
    \\n\
    \ In JSON format, the Duration type is encoded as a string rather than an\n\
    \ object, where the string ends in the suffix \"s\" (indicating seconds) and\n\
    \ is preceded by the number of seconds, with nanoseconds expressed as\n\
    \ fractional seconds. For example, 3 seconds with 0 nanoseconds should be\n\
    \ encoded in JSON format as \"3s\", while 3 seconds and 1 nanosecond should\n\
    \ be expressed in JSON format as \"3.000000001s\", and 3 seconds and 1\n\
    \ microsecond should be expressed in JSON format as \"3.000001s\".\n\
    \\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETXe\b\DLE\n\
    \\220\SOH\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETXi\STX\DC4\SUB\206\SOH Signed seconds of the span of time. Must be from -315,576,000,000\n\
    \ to +315,576,000,000 inclusive. Note: these bounds are computed from:\n\
    \ 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ENQ\DC2\ETXi\STX\a\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETXi\b\SI\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETXi\DC2\DC3\n\
    \\131\ETX\n\
    \\EOT\EOT\NUL\STX\SOH\DC2\ETXq\STX\DC2\SUB\245\STX Signed fractions of a second at nanosecond resolution of the span\n\
    \ of time. Durations less than one second are represented with a 0\n\
    \ `seconds` field and a positive or negative `nanos` field. For durations\n\
    \ of one second or more, a non-zero value for the `nanos` field must be\n\
    \ of the same sign as the `seconds` field. Must be from -999,999,999\n\
    \ to +999,999,999 inclusive.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ENQ\DC2\ETXq\STX\a\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\SOH\DC2\ETXq\b\r\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ETX\DC2\ETXq\DLE\DC1b\ACKproto3"