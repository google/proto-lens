{- This file was auto-generated from google/protobuf/timestamp.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Google.Protobuf.Timestamp (
        Timestamp()
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
     
         * 'Proto.Google.Protobuf.Timestamp_Fields.seconds' @:: Lens' Timestamp Data.Int.Int64@
         * 'Proto.Google.Protobuf.Timestamp_Fields.nanos' @:: Lens' Timestamp Data.Int.Int32@ -}
data Timestamp
  = Timestamp'_constructor {_Timestamp'seconds :: !Data.Int.Int64,
                            _Timestamp'nanos :: !Data.Int.Int32,
                            _Timestamp'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Timestamp where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Timestamp "seconds" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Timestamp'seconds (\ x__ y__ -> x__ {_Timestamp'seconds = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Timestamp "nanos" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Timestamp'nanos (\ x__ y__ -> x__ {_Timestamp'nanos = y__}))
        Prelude.id
instance Data.ProtoLens.Message Timestamp where
  messageName _ = Data.Text.pack "google.protobuf.Timestamp"
  packedMessageDescriptor _
    = "\n\
      \\tTimestamp\DC2\CAN\n\
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
              Data.ProtoLens.FieldDescriptor Timestamp
        nanos__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "nanos"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"nanos")) ::
              Data.ProtoLens.FieldDescriptor Timestamp
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, seconds__field_descriptor),
           (Data.ProtoLens.Tag 2, nanos__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Timestamp'_unknownFields
        (\ x__ y__ -> x__ {_Timestamp'_unknownFields = y__})
  defMessage
    = Timestamp'_constructor
        {_Timestamp'seconds = Data.ProtoLens.fieldDefault,
         _Timestamp'nanos = Data.ProtoLens.fieldDefault,
         _Timestamp'_unknownFields = []}
  parseMessage
    = let
        loop :: Timestamp -> Data.ProtoLens.Encoding.Bytes.Parser Timestamp
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
          (do loop Data.ProtoLens.defMessage) "Timestamp"
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
instance Control.DeepSeq.NFData Timestamp where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Timestamp'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Timestamp'seconds x__)
                (Control.DeepSeq.deepseq (_Timestamp'nanos x__) ()))
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\USgoogle/protobuf/timestamp.proto\DC2\SIgoogle.protobuf\";\n\
    \\tTimestamp\DC2\CAN\n\
    \\aseconds\CAN\SOH \SOH(\ETXR\aseconds\DC2\DC4\n\
    \\ENQnanos\CAN\STX \SOH(\ENQR\ENQnanosB\133\SOH\n\
    \\DC3com.google.protobufB\SOTimestampProtoP\SOHZ2google.golang.org/protobuf/types/known/timestamppb\248\SOH\SOH\162\STX\ETXGPB\170\STX\RSGoogle.Protobuf.WellKnownTypesJ\193/\n\
    \\a\DC2\ENQ\RS\NUL\143\SOH\SOH\n\
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
    \\SOH\b\DC2\ETX#\NULI\n\
    \\t\n\
    \\STX\b\v\DC2\ETX#\NULI\n\
    \\b\n\
    \\SOH\b\DC2\ETX$\NUL,\n\
    \\t\n\
    \\STX\b\SOH\DC2\ETX$\NUL,\n\
    \\b\n\
    \\SOH\b\DC2\ETX%\NUL/\n\
    \\t\n\
    \\STX\b\b\DC2\ETX%\NUL/\n\
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
    \\218\GS\n\
    \\STX\EOT\NUL\DC2\ACK\132\SOH\NUL\143\SOH\SOH\SUB\203\GS A Timestamp represents a point in time independent of any time zone or local\n\
    \ calendar, encoded as a count of seconds and fractions of seconds at\n\
    \ nanosecond resolution. The count is relative to an epoch at UTC midnight on\n\
    \ January 1, 1970, in the proleptic Gregorian calendar which extends the\n\
    \ Gregorian calendar backwards to year one.\n\
    \\n\
    \ All minutes are 60 seconds long. Leap seconds are \"smeared\" so that no leap\n\
    \ second table is needed for interpretation, using a [24-hour linear\n\
    \ smear](https://developers.google.com/time/smear).\n\
    \\n\
    \ The range is from 0001-01-01T00:00:00Z to 9999-12-31T23:59:59.999999999Z. By\n\
    \ restricting to that range, we ensure that we can convert to and from [RFC\n\
    \ 3339](https://www.ietf.org/rfc/rfc3339.txt) date strings.\n\
    \\n\
    \ # Examples\n\
    \\n\
    \ Example 1: Compute Timestamp from POSIX `time()`.\n\
    \\n\
    \     Timestamp timestamp;\n\
    \     timestamp.set_seconds(time(NULL));\n\
    \     timestamp.set_nanos(0);\n\
    \\n\
    \ Example 2: Compute Timestamp from POSIX `gettimeofday()`.\n\
    \\n\
    \     struct timeval tv;\n\
    \     gettimeofday(&tv, NULL);\n\
    \\n\
    \     Timestamp timestamp;\n\
    \     timestamp.set_seconds(tv.tv_sec);\n\
    \     timestamp.set_nanos(tv.tv_usec * 1000);\n\
    \\n\
    \ Example 3: Compute Timestamp from Win32 `GetSystemTimeAsFileTime()`.\n\
    \\n\
    \     FILETIME ft;\n\
    \     GetSystemTimeAsFileTime(&ft);\n\
    \     UINT64 ticks = (((UINT64)ft.dwHighDateTime) << 32) | ft.dwLowDateTime;\n\
    \\n\
    \     // A Windows tick is 100 nanoseconds. Windows epoch 1601-01-01T00:00:00Z\n\
    \     // is 11644473600 seconds before Unix epoch 1970-01-01T00:00:00Z.\n\
    \     Timestamp timestamp;\n\
    \     timestamp.set_seconds((INT64) ((ticks / 10000000) - 11644473600LL));\n\
    \     timestamp.set_nanos((INT32) ((ticks % 10000000) * 100));\n\
    \\n\
    \ Example 4: Compute Timestamp from Java `System.currentTimeMillis()`.\n\
    \\n\
    \     long millis = System.currentTimeMillis();\n\
    \\n\
    \     Timestamp timestamp = Timestamp.newBuilder().setSeconds(millis / 1000)\n\
    \         .setNanos((int) ((millis % 1000) * 1000000)).build();\n\
    \\n\
    \ Example 5: Compute Timestamp from Java `Instant.now()`.\n\
    \\n\
    \     Instant now = Instant.now();\n\
    \\n\
    \     Timestamp timestamp =\n\
    \         Timestamp.newBuilder().setSeconds(now.getEpochSecond())\n\
    \             .setNanos(now.getNano()).build();\n\
    \\n\
    \ Example 6: Compute Timestamp from current time in Python.\n\
    \\n\
    \     timestamp = Timestamp()\n\
    \     timestamp.GetCurrentTime()\n\
    \\n\
    \ # JSON Mapping\n\
    \\n\
    \ In JSON format, the Timestamp type is encoded as a string in the\n\
    \ [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format. That is, the\n\
    \ format is \"{year}-{month}-{day}T{hour}:{min}:{sec}[.{frac_sec}]Z\"\n\
    \ where {year} is always expressed using four digits while {month}, {day},\n\
    \ {hour}, {min}, and {sec} are zero-padded to two digits each. The fractional\n\
    \ seconds, which can go up to 9 digits (i.e. up to 1 nanosecond resolution),\n\
    \ are optional. The \"Z\" suffix indicates the timezone (\"UTC\"); the timezone\n\
    \ is required. A proto3 JSON serializer should always use UTC (as indicated by\n\
    \ \"Z\") when printing the Timestamp type and a proto3 JSON parser should be\n\
    \ able to accept both UTC and other timezones (as indicated by an offset).\n\
    \\n\
    \ For example, \"2017-01-15T01:30:15.01Z\" encodes 15.01 seconds past\n\
    \ 01:30 UTC on January 15, 2017.\n\
    \\n\
    \ In JavaScript, one can convert a Date object to this format using the\n\
    \ standard\n\
    \ [toISOString()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toISOString)\n\
    \ method. In Python, a standard `datetime.datetime` object can be converted\n\
    \ to this format using\n\
    \ [`strftime`](https://docs.python.org/2/library/time.html#time.strftime) with\n\
    \ the time format spec '%Y-%m-%dT%H:%M:%S.%fZ'. Likewise, in Java, one can use\n\
    \ the Joda Time's [`ISODateTimeFormat.dateTime()`](\n\
    \ http://joda-time.sourceforge.net/apidocs/org/joda/time/format/ISODateTimeFormat.html#dateTime()\n\
    \ ) to obtain a formatter capable of generating timestamps in this format.\n\
    \\n\
    \\n\
    \\v\n\
    \\ETX\EOT\NUL\SOH\DC2\EOT\132\SOH\b\DC1\n\
    \\157\SOH\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\EOT\136\SOH\STX\DC4\SUB\142\SOH Represents seconds of UTC time since Unix epoch\n\
    \ 1970-01-01T00:00:00Z. Must be from 0001-01-01T00:00:00Z to\n\
    \ 9999-12-31T23:59:59Z inclusive.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\NUL\ENQ\DC2\EOT\136\SOH\STX\a\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\EOT\136\SOH\b\SI\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\EOT\136\SOH\DC2\DC3\n\
    \\229\SOH\n\
    \\EOT\EOT\NUL\STX\SOH\DC2\EOT\142\SOH\STX\DC2\SUB\214\SOH Non-negative fractions of a second at nanosecond resolution. Negative\n\
    \ second values with fractions must still have non-negative nanos values\n\
    \ that count forward in time. Must be from 0 to 999,999,999\n\
    \ inclusive.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\SOH\ENQ\DC2\EOT\142\SOH\STX\a\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\SOH\SOH\DC2\EOT\142\SOH\b\r\n\
    \\r\n\
    \\ENQ\EOT\NUL\STX\SOH\ETX\DC2\EOT\142\SOH\DLE\DC1b\ACKproto3"