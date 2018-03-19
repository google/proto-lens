{- This file was auto-generated from google/protobuf/compiler/plugin.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies,
  UndecidableInstances, GeneralizedNewtypeDeriving,
  MultiParamTypeClasses, FlexibleContexts, FlexibleInstances,
  PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports#-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports#-}
module Proto.Google.Protobuf.Compiler.Plugin_Fields where
import qualified Prelude
import qualified Data.Int
import qualified Data.Word
import qualified Data.ProtoLens
import qualified Data.ProtoLens.Message.Enum
import qualified Data.ProtoLens.Service.Types
import qualified Lens.Family2
import qualified Lens.Family2.Unchecked
import qualified Data.Default.Class
import qualified Data.Text
import qualified Data.Map
import qualified Data.ByteString
import qualified Data.ByteString.Char8
import qualified Lens.Labels
import qualified Text.Read
import qualified Proto.Google.Protobuf.Descriptor

content ::
        forall f s t a b . (Lens.Labels.HasLens f s t "content" a b) =>
          Lens.Family2.LensLike f s t a b
content
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "content")
error ::
      forall f s t a b . (Lens.Labels.HasLens f s t "error" a b) =>
        Lens.Family2.LensLike f s t a b
error
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "error")
file ::
     forall f s t a b . (Lens.Labels.HasLens f s t "file" a b) =>
       Lens.Family2.LensLike f s t a b
file
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "file")
fileToGenerate ::
               forall f s t a b .
                 (Lens.Labels.HasLens f s t "fileToGenerate" a b) =>
                 Lens.Family2.LensLike f s t a b
fileToGenerate
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "fileToGenerate")
insertionPoint ::
               forall f s t a b .
                 (Lens.Labels.HasLens f s t "insertionPoint" a b) =>
                 Lens.Family2.LensLike f s t a b
insertionPoint
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "insertionPoint")
maybe'content ::
              forall f s t a b .
                (Lens.Labels.HasLens f s t "maybe'content" a b) =>
                Lens.Family2.LensLike f s t a b
maybe'content
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'content")
maybe'error ::
            forall f s t a b . (Lens.Labels.HasLens f s t "maybe'error" a b) =>
              Lens.Family2.LensLike f s t a b
maybe'error
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'error")
maybe'insertionPoint ::
                     forall f s t a b .
                       (Lens.Labels.HasLens f s t "maybe'insertionPoint" a b) =>
                       Lens.Family2.LensLike f s t a b
maybe'insertionPoint
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'insertionPoint")
maybe'name ::
           forall f s t a b . (Lens.Labels.HasLens f s t "maybe'name" a b) =>
             Lens.Family2.LensLike f s t a b
maybe'name
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'name")
maybe'parameter ::
                forall f s t a b .
                  (Lens.Labels.HasLens f s t "maybe'parameter" a b) =>
                  Lens.Family2.LensLike f s t a b
maybe'parameter
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'parameter")
name ::
     forall f s t a b . (Lens.Labels.HasLens f s t "name" a b) =>
       Lens.Family2.LensLike f s t a b
name
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "name")
parameter ::
          forall f s t a b . (Lens.Labels.HasLens f s t "parameter" a b) =>
            Lens.Family2.LensLike f s t a b
parameter
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "parameter")
protoFile ::
          forall f s t a b . (Lens.Labels.HasLens f s t "protoFile" a b) =>
            Lens.Family2.LensLike f s t a b
protoFile
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "protoFile")