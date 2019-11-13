# Scalar Type Reference

This is the reference for mappings between scalar protobuf types and generated Haskell types.

| Protobuf type  | Haskell type               |
| -------------- | -------------              |
| double         | Prelude.Double             |
| float          | Prelude.Float              |
| int32          | Data.Int.Int32             |
| int64          | Data.Int.Int64             |
| uint32         | Data.Word.Word32           |
| uint64         | Data.Word.Word64           |
| sint32         | Data.Int.Int32             |
| sint64         | Data.Int.Int64             |
| fixed32        | Data.Word.Word32           |
| fixed64        | Data.Word.Word64           |
| sfixed32       | Data.Int.Int32             |
| sfixed64       | Data.Int.Int64             |
| bool           | Prelude.Bool               |
| string         | Data.Text.Text             |
| bytes          | Data.ByteString.ByteString |
