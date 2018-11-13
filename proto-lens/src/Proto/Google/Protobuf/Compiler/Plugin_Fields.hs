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
import qualified Data.Monoid
import qualified Data.Word
import qualified Data.ProtoLens
import qualified Data.ProtoLens.Message.Enum
import qualified Data.ProtoLens.Service.Types
import qualified Lens.Family2
import qualified Lens.Family2.Unchecked
import qualified Data.Text
import qualified Data.Map
import qualified Data.ByteString
import qualified Data.ByteString.Char8
import qualified Lens.Labels
import qualified Text.Read
import qualified Proto.Google.Protobuf.Descriptor

compilerVersion ::
                forall f s a .
                  (Prelude.Functor f, Lens.Labels.HasLens' s "compilerVersion" a) =>
                  Lens.Family2.LensLike' f s a
compilerVersion
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "compilerVersion")
content ::
        forall f s a .
          (Prelude.Functor f, Lens.Labels.HasLens' s "content" a) =>
          Lens.Family2.LensLike' f s a
content
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "content")
error ::
      forall f s a .
        (Prelude.Functor f, Lens.Labels.HasLens' s "error" a) =>
        Lens.Family2.LensLike' f s a
error
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "error")
file ::
     forall f s a .
       (Prelude.Functor f, Lens.Labels.HasLens' s "file" a) =>
       Lens.Family2.LensLike' f s a
file
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "file")
fileToGenerate ::
               forall f s a .
                 (Prelude.Functor f, Lens.Labels.HasLens' s "fileToGenerate" a) =>
                 Lens.Family2.LensLike' f s a
fileToGenerate
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "fileToGenerate")
insertionPoint ::
               forall f s a .
                 (Prelude.Functor f, Lens.Labels.HasLens' s "insertionPoint" a) =>
                 Lens.Family2.LensLike' f s a
insertionPoint
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "insertionPoint")
major ::
      forall f s a .
        (Prelude.Functor f, Lens.Labels.HasLens' s "major" a) =>
        Lens.Family2.LensLike' f s a
major
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "major")
maybe'compilerVersion ::
                      forall f s a .
                        (Prelude.Functor f,
                         Lens.Labels.HasLens' s "maybe'compilerVersion" a) =>
                        Lens.Family2.LensLike' f s a
maybe'compilerVersion
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'compilerVersion")
maybe'content ::
              forall f s a .
                (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'content" a) =>
                Lens.Family2.LensLike' f s a
maybe'content
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'content")
maybe'error ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'error" a) =>
              Lens.Family2.LensLike' f s a
maybe'error
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'error")
maybe'insertionPoint ::
                     forall f s a .
                       (Prelude.Functor f,
                        Lens.Labels.HasLens' s "maybe'insertionPoint" a) =>
                       Lens.Family2.LensLike' f s a
maybe'insertionPoint
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) ::
         (Lens.Labels.Proxy#) "maybe'insertionPoint")
maybe'major ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'major" a) =>
              Lens.Family2.LensLike' f s a
maybe'major
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'major")
maybe'minor ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'minor" a) =>
              Lens.Family2.LensLike' f s a
maybe'minor
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'minor")
maybe'name ::
           forall f s a .
             (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'name" a) =>
             Lens.Family2.LensLike' f s a
maybe'name
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'name")
maybe'parameter ::
                forall f s a .
                  (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'parameter" a) =>
                  Lens.Family2.LensLike' f s a
maybe'parameter
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'parameter")
maybe'patch ::
            forall f s a .
              (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'patch" a) =>
              Lens.Family2.LensLike' f s a
maybe'patch
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'patch")
maybe'suffix ::
             forall f s a .
               (Prelude.Functor f, Lens.Labels.HasLens' s "maybe'suffix" a) =>
               Lens.Family2.LensLike' f s a
maybe'suffix
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "maybe'suffix")
minor ::
      forall f s a .
        (Prelude.Functor f, Lens.Labels.HasLens' s "minor" a) =>
        Lens.Family2.LensLike' f s a
minor
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "minor")
name ::
     forall f s a .
       (Prelude.Functor f, Lens.Labels.HasLens' s "name" a) =>
       Lens.Family2.LensLike' f s a
name
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "name")
parameter ::
          forall f s a .
            (Prelude.Functor f, Lens.Labels.HasLens' s "parameter" a) =>
            Lens.Family2.LensLike' f s a
parameter
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "parameter")
patch ::
      forall f s a .
        (Prelude.Functor f, Lens.Labels.HasLens' s "patch" a) =>
        Lens.Family2.LensLike' f s a
patch
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "patch")
protoFile ::
          forall f s a .
            (Prelude.Functor f, Lens.Labels.HasLens' s "protoFile" a) =>
            Lens.Family2.LensLike' f s a
protoFile
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "protoFile")
suffix ::
       forall f s a .
         (Prelude.Functor f, Lens.Labels.HasLens' s "suffix" a) =>
         Lens.Family2.LensLike' f s a
suffix
  = Lens.Labels.lensOf'
      ((Lens.Labels.proxy#) :: (Lens.Labels.Proxy#) "suffix")