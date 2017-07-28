{- This file was auto-generated from google/protobuf/compiler/plugin.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies,
  UndecidableInstances, MultiParamTypeClasses, FlexibleContexts,
  FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude
  #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Proto.Google.Protobuf.Compiler.Plugin
       (module Proto.Google.Protobuf.Compiler.Plugin,
        module Proto.Google.Protobuf.Compiler.Plugin'Types)
       where
import Proto.Google.Protobuf.Compiler.Plugin'Types
import qualified Prelude
import qualified Data.Int
import qualified Data.Word
import qualified Data.ProtoLens
import qualified Data.ProtoLens.Message.Enum
import qualified Lens.Family2
import qualified Lens.Family2.Unchecked
import qualified Data.Default.Class
import qualified Data.Text
import qualified Data.Map
import qualified Data.ByteString
import qualified Lens.Labels
import qualified Proto.Google.Protobuf.Descriptor

content ::
        forall f s t a b . Lens.Labels.HasLens "content" f s t a b =>
          Lens.Family2.LensLike f s t a b
content
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "content")

error ::
      forall f s t a b . Lens.Labels.HasLens "error" f s t a b =>
        Lens.Family2.LensLike f s t a b
error
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "error")

file ::
     forall f s t a b . Lens.Labels.HasLens "file" f s t a b =>
       Lens.Family2.LensLike f s t a b
file
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "file")

fileToGenerate ::
               forall f s t a b .
                 Lens.Labels.HasLens "fileToGenerate" f s t a b =>
                 Lens.Family2.LensLike f s t a b
fileToGenerate
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "fileToGenerate")

insertionPoint ::
               forall f s t a b .
                 Lens.Labels.HasLens "insertionPoint" f s t a b =>
                 Lens.Family2.LensLike f s t a b
insertionPoint
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "insertionPoint")

maybe'content ::
              forall f s t a b . Lens.Labels.HasLens "maybe'content" f s t a b =>
                Lens.Family2.LensLike f s t a b
maybe'content
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'content")

maybe'error ::
            forall f s t a b . Lens.Labels.HasLens "maybe'error" f s t a b =>
              Lens.Family2.LensLike f s t a b
maybe'error
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'error")

maybe'insertionPoint ::
                     forall f s t a b .
                       Lens.Labels.HasLens "maybe'insertionPoint" f s t a b =>
                       Lens.Family2.LensLike f s t a b
maybe'insertionPoint
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'insertionPoint")

maybe'name ::
           forall f s t a b . Lens.Labels.HasLens "maybe'name" f s t a b =>
             Lens.Family2.LensLike f s t a b
maybe'name
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'name")

maybe'parameter ::
                forall f s t a b .
                  Lens.Labels.HasLens "maybe'parameter" f s t a b =>
                  Lens.Family2.LensLike f s t a b
maybe'parameter
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'parameter")

name ::
     forall f s t a b . Lens.Labels.HasLens "name" f s t a b =>
       Lens.Family2.LensLike f s t a b
name
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "name")

parameter ::
          forall f s t a b . Lens.Labels.HasLens "parameter" f s t a b =>
            Lens.Family2.LensLike f s t a b
parameter
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "parameter")

protoFile ::
          forall f s t a b . Lens.Labels.HasLens "protoFile" f s t a b =>
            Lens.Family2.LensLike f s t a b
protoFile
  = Lens.Labels.lensOf
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "protoFile")