-- Copyright 2016 Google Inc. All Rights Reserved.
--
-- Use of this source code is governed by a BSD-style
-- license that can be found in the LICENSE file or at
-- https://developers.google.com/open-source/licenses/bsd

-- | This module builds the actual, generated Haskell file
-- for a given input .proto file.
{-# LANGUAGE CPP #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE OverloadedStrings #-}
module Data.ProtoLens.Compiler.Generate(
    generateModule,
    ) where


import Control.Arrow (second)
import qualified Data.Foldable as F
import qualified Data.List as List
import qualified Data.Map as Map
import Data.Maybe (isJust)
#if !MIN_VERSION_base(4,11,0)
import Data.Semigroup ((<>))
#endif
import Data.Ord (comparing)
import qualified Data.Set as Set
import Data.String (fromString)
import Data.Text (unpack)
import qualified Data.Text as T
import Data.Tuple (swap)
import GHC.SourceGen
import HsSyn (ideclName, ideclAs)
import Module (moduleNameString, mkModuleName)
import qualified Outputable
import SrcLoc (unLoc, noLoc)
import Lens.Family2 ((^.))
import Text.Printf (printf)

import Proto.Google.Protobuf.Descriptor
    ( EnumValueDescriptorProto
    , FieldDescriptorProto
    , FieldDescriptorProto'Type(..)
    )

import Data.ProtoLens.Compiler.Definitions
import Data.ProtoLens.Compiler.Generate.Commented
import Data.ProtoLens.Compiler.Generate.Encoding
import Data.ProtoLens.Compiler.Generate.Field
    ( hsFieldType
    , hsFieldVectorType
    )

-- Whether to import the "Runtime" modules or the originals;
-- e.g., Data.ProtoLens.Runtime.Data.Map vs Data.Map.
data UseRuntime = UseRuntime | UseOriginal
    deriving (Eq, Read)

-- | Generate a Haskell module for the given input file(s).
-- input contains all defined names, incl. those in this module
generateModule :: ModuleNameStr
               -> [ModuleNameStr]  -- ^ The imported modules
               -> [ModuleNameStr]  -- ^ The publicly imported modules
               -> Env OccNameStr      -- ^ Definitions in this file
               -> Env RdrNameStr     -- ^ Definitions in the imported modules
               -> [ServiceInfo]
               -> [CommentedModule]
generateModule modName imports publicImports definitions importedEnv services
    = [ CommentedModule pragmas
            (module' (Just modName)
                (Just $ serviceExports
                        ++ concatMap generateExports (Map.elems definitions)
                        ++ map moduleContents publicImports)
                (mainImports ++ sharedImports
                    ++ map importQualified (imports List.\\ publicImports)
                    ++ map import' publicImports)
                [])
          $ (concatMap generateDecls $ Map.toList definitions)
         ++ map uncommented (concatMap (generateServiceDecls env) services)
      , CommentedModule pragmas
            (module' (Just fieldModName) Nothing
                (sharedImports ++ map importQualified imports) [])
          $ map uncommented
          $ concatMap generateFieldDecls allLensNames
      ]
  where
    fieldModName = fromString $ moduleNameString (unModuleNameStr modName) ++ "_Fields"
    pragmas =
          [ languagePragma $ List.intercalate ", " $ map fromString
              ["ScopedTypeVariables", "DataKinds", "TypeFamilies",
               "UndecidableInstances", "GeneralizedNewtypeDeriving",
               "MultiParamTypeClasses", "FlexibleContexts", "FlexibleInstances",
               "PatternSynonyms", "MagicHash", "NoImplicitPrelude",
               "DataKinds", "BangPatterns", "TypeApplications"]
              -- Allow unused imports in case we don't import anything from
              -- Data.Text, Data.Int, etc.
          , optionsGhcPragma "-Wno-unused-imports"
            -- haskell-src-exts doesn't support exporting `Foo(..., A, B)`
            -- in a single entry, so we use two: `Foo(..)` and `Foo(A, B)`.
          , optionsGhcPragma "-Wno-duplicate-exports"
            -- Don't warn if empty "import public" modules are reexported.
          , optionsGhcPragma "-Wno-dodgy-exports"
          ]
    mainImports = map (reexported . importQualified)
                    [ "Control.DeepSeq", "Data.ProtoLens.Prism" ]
    sharedImports = map (reexported . importQualified)
              [ "Prelude", "Data.Int", "Data.Monoid", "Data.Word"
              , "Data.ProtoLens"
              , "Data.ProtoLens.Encoding.Bytes"
              , "Data.ProtoLens.Encoding.Growing"
              , "Data.ProtoLens.Encoding.Parser.Unsafe"
              , "Data.ProtoLens.Encoding.Wire"
              , "Data.ProtoLens.Field"
              , "Data.ProtoLens.Message.Enum"
              , "Data.ProtoLens.Service.Types"
              , "Lens.Family2", "Lens.Family2.Unchecked"
              , "Data.Text",  "Data.Map", "Data.ByteString", "Data.ByteString.Char8"
              , "Data.Text.Encoding"
              , "Data.Vector"
              , "Data.Vector.Generic"
              , "Data.Vector.Unboxed"
              , "Text.Read"
              ]
    env = Map.union (unqualifyEnv definitions) importedEnv
    generateDecls (protoName, Message m)
        = generateMessageDecls fieldModName env (stripDotPrefix protoName) m
       ++ map uncommented (concatMap (generatePrisms env) (messageOneofFields m))
    generateDecls (_, Enum e) = map uncommented $ generateEnumDecls e
    generateExports (Message m) = generateMessageExports m
                               ++ concatMap generatePrismExports (messageOneofFields m)
    generateExports (Enum e) = generateEnumExports e
    serviceExports = fmap generateServiceExports services
    allLensNames = F.toList $ Set.fromList
        [ lensSymbol inst
        | Message m <- Map.elems definitions
        , info <- allMessageFields env m
        , inst <- recordFieldLenses info
        ]
    -- The Env uses the convention that Message names are prefixed with '.'
    -- (since that's how the FileDescriptorProto refers to them).
    -- Strip that off when defining MessageDescriptor.messageName.
    stripDotPrefix s
        | Just ('.', s') <- T.uncons s = s'
        | otherwise = s

allMessageFields :: Env RdrNameStr -> MessageInfo OccNameStr -> [RecordField]
allMessageFields env info =
    map (plainRecordField env) (messageFields info)
        ++ map (oneofRecordField env) (messageOneofFields info)

{- We import modules as follows:

1) Modules from proto-lens-runtime: import qualified, strip the prefix:
     import qualified Data.ProtoLens.Runtime.Data.Text as Data.Text

2) Modules from "import" declarations: import qualified:
     import qualified Proto.Foo.Bar

3) Modules from "import public" declarations: import unqualified:
     import Proto.Foo.Bar
   To reexport the imported declarations from the current module via
     module ... (module Proto.Foo.Bar)
   the module Proto.Foo.Bar needs to be unqualified.
   Alternately we could explicitly enumerate every definition being reexported, but
   that would lead to less readable Haddocks and also make codegen a little more
   complicated.
-}

importQualified :: ModuleNameStr -> ImportDecl'
importQualified = qualified' . import'

type ModifyImports = ImportDecl' -> ImportDecl'

reexported :: ModifyImports
reexported imp = imp { ideclName = noLoc m', ideclAs = Just m }
  where
    m' = mkModuleName $ "Data.ProtoLens.Runtime." ++ moduleNameString (unLoc m)
    m = ideclName imp

messageComment :: ModuleNameStr -> OccNameStr -> [RecordField] -> Outputable.SDoc
messageComment fieldModName n fields =
    Outputable.vcat
        $ [Outputable.text "Fields :", ""]
            ++ map item (concatMap recordFieldLenses fields)
  where
    item :: LensInstance -> Outputable.SDoc
    item l = Outputable.text (printf "    * '%s.%s' @:: "
                 (moduleNameStrToString fieldModName)
                 (occNameStrToString $ nameFromSymbol $ lensSymbol l))
             Outputable.<>
                 (Outputable.ppr $ var "Lens'" @@ t @@ (lensFieldType l))
             Outputable.<> Outputable.char '@'
    t = var (unqual n)

generateMessageExports :: MessageInfo OccNameStr -> [IE']
generateMessageExports m =
    -- Hide the message contructor, but expose "oneof" case constructors.
    thingWith (unqual $ messageName m) []
        : map (thingAll . unqual . oneofTypeName)
                (messageOneofFields m)

generateServiceDecls :: Env RdrNameStr -> ServiceInfo -> [HsDecl']
generateServiceDecls env si =
    -- data MyService = MyService
    [ data' serverDataName []
      [ recordCon serverDataName []
      ]
      []
    ] ++
    -- instance Data.ProtoLens.Service.Types.Service MyService where
    --     type ServiceName    MyService = "myService"
    --     type ServicePackage MyService = "some.package"
    --     type ServiceMethods MyService = '["normalMethod", "streamingMethod"]
    [ instance' (var "Data.ProtoLens.Service.Types.Service" @@ serverRecordType)
        [ tyFamInst "ServiceName" [serverRecordType]
                 . stringTy . T.unpack $ serviceName si
        , tyFamInst "ServicePackage" [serverRecordType]
                 . stringTy . T.unpack $ servicePackage si
        , tyFamInst "ServiceMethods" [serverRecordType]
                 $ listPromotedTy
                      [ stringTy . T.unpack $ methodIdent m
                      | m <- List.sortBy (comparing methodIdent) $ serviceMethods si
                      ]
        ]
    ] ++
    -- instance Data.ProtoLens.Service.Types.HasMethodImpl MyService "normalMethod" where
    --     type MethodInput       MyService "normalMethod" = Foo
    --     type MethodOutput      MyService "normalMethod" = Bar
    --     type IsClientStreaming MyService "normalMethod" = 'False
    --     type IsServerStreaming MyService "normalMethod" = 'False
    [ instance' (var "Data.ProtoLens.Service.Types.HasMethodImpl" @@ serverRecordType @@ instanceHead)
        [ tyFamInst "MethodName" [serverRecordType, instanceHead]
                 . stringTy . T.unpack $ methodName m
        , tyFamInst "MethodInput" [serverRecordType, instanceHead]
                 . lookupType $ methodInput m
        , tyFamInst "MethodOutput" [serverRecordType, instanceHead]
                 . lookupType $ methodOutput m
        , tyFamInst "MethodStreamingType" [serverRecordType, instanceHead]
                 . tyPromotedVar
                 $ case (methodClientStreaming m, methodServerStreaming m) of
                     (False, False) -> "Data.ProtoLens.Service.Types.NonStreaming"
                     (True,  False) -> "Data.ProtoLens.Service.Types.ClientStreaming"
                     (False, True)  -> "Data.ProtoLens.Service.Types.ServerStreaming"
                     (True,  True)  -> "Data.ProtoLens.Service.Types.BiDiStreaming"
        ]
    | m <- serviceMethods si
    , let instanceHead = stringTy (T.unpack $ methodIdent m)
    ]
  where
    serverDataName = fromString . T.unpack $ serviceName si
    serverRecordType = var $ unqual serverDataName

    lookupType t = case definedType t env of
                       Message msg -> var $ messageName msg
                       Enum _ -> error "Service must have a message type"


generateMessageDecls :: ModuleNameStr -> Env RdrNameStr -> T.Text -> MessageInfo OccNameStr -> [CommentedDecl]
generateMessageDecls fieldModName env protoName info =
    -- data Bar = Bar {
    --    foo :: Baz
    -- }
    [ commented (messageComment fieldModName (messageName info) allFields)
        $ data' dataName []
            [recordCon (messageConstructorName info) $
                [ (recordFieldName f, strict $ field $ recordFieldType f)
                | f <- allFields
                ]
                ++ [(messageUnknownFields info, strict $ field $ var "Data.ProtoLens.FieldSet")]
            ]
            [deriving' [var "Prelude.Eq", var "Prelude.Ord"]]
    -- instance Show Bar where
    --   showsPrec __x __s = showChar '{' (showString (showMessageShort __x) (showChar '}' s))
    , uncommented $
        instance' (var "Prelude.Show" @@ dataType)
            [funBind "showsPrec" $ match [bvar "_", bvar "__x", bvar "__s"]
                $ var "Prelude.showChar" @@ char '{'
                    @@ (var "Prelude.showString"
                            @@ (var "Data.ProtoLens.showMessageShort" @@ var "__x")
                        @@ (var "Prelude.showChar" @@ char '}' @@ var "__s"))]
    ] ++
    -- oneof field data type declarations
    -- proto: message Foo {
    --          oneof bar {
    --            float c = 1;
    --            Sub s = 2;
    --          }
    --        }
    -- haskell: data Foo'Bar = Foo'Bar'c !Prelude.Float
    --                       | Foo'Bar's !Sub
    [ uncommented $ data' (oneofTypeName oneofInfo) []
      [ prefixCon consName [strict $ field $ hsFieldType env f]
      | c <- oneofCases oneofInfo
      , let f = caseField c
      , let consName = caseConstructorName c
      ]
      [deriving' [var "Prelude.Show", var "Prelude.Eq", var "Prelude.Ord"]]
    | oneofInfo <- messageOneofFields info
    ] ++
    -- instance HasField Foo "foo" Bar
    --   fieldOf _ = ...
    -- Note: for optional fields, this generates an instance both for "foo" and
    -- for "maybe'foo" (see plainRecordField below).
    [ uncommented $ instance'
        (var "Data.ProtoLens.Field.HasField" @@ dataType @@ sym @@ t)
            [funBind "fieldOf" $ match [wildP] $
                var "Prelude.."
                    @@ rawFieldAccessor (unqual $ recordFieldName li)
                    @@ lensExp i]
    | li <- allFields
    , i <- recordFieldLenses li
    , let t = lensFieldType i
    , let sym = promoteSymbol $ lensSymbol i
    ]
    ++
    -- instance Message.Message Bar where
    [ uncommented $ instance' (var "Data.ProtoLens.Message" @@ dataType)
        $ messageInstance env protoName info
    -- instance NFData Bar where
    , uncommented $ instance' (var "Control.DeepSeq.NFData" @@ dataType)
        [valBind "rnf" $ messageRnfExpr info]
    ] ++
    -- instance NFData Foo'Bar where
    [ uncommented $
        instance' (var "Control.DeepSeq.NFData" @@
                        var (unqual $ oneofTypeName o))
        [funBinds "rnf" $ map oneofRnfMatch $ oneofCases o]
    | o <- messageOneofFields info
    ]
  where
    dataType = var $ unqual dataName
    dataName = messageName info
    allFields = allMessageFields env info

-- oneof Prism declarations
-- proto: message Foo {
--          oneof bar {
--            float c = 1;
--            Sub s = 2;
--          }
--        }
-- haskell: _Foo'C :: Prism' Bar'C Float
--          _Foo'S :: Prism' Bar'S Sub
--
--  example of the function definition for _Foo'C:
-- _Foo'C :: Prism' Bar'C Float
-- _Foo'C
--   = prism' Bar'C
--       (\ p__ ->
--          case p__ of
--              Bar'C p__val -> Prelude.Just p__val
--              _otherwise -> Prelude.Nothing)
generatePrisms :: Env RdrNameStr -> OneofInfo -> [HsDecl']
generatePrisms env oneofInfo =
    if length cases > 1
       then concatMap (generatePrism altOtherwise) cases
       else concatMap (generatePrism mempty) cases
    where
        cases = oneofCases oneofInfo
        altOtherwise = [match [bvar "_otherwise"] (var "Prelude.Nothing")]

        -- Generate type signature
        -- e.g. Prism' Bar'C Float
        generateTypeSig f funName =
            typeSig funName $ var "Data.ProtoLens.Prism.Prism'"
                                -- The oneof sum type name
                             @@ (var . unqual $ oneofTypeName oneofInfo)
                                -- The field contained in the sum
                             @@ (hsFieldType env f)
        -- Generate function definition
        -- Prism' is constructed with Constructor for building value
        -- and Deconstructor and wrapping in Just for getting value
        generateFunDef :: [RawMatch] -> OccNameStr -> HsExpr'
        generateFunDef otherwiseCase consName =
               var "Data.ProtoLens.Prism.prism'"
               -- Sum type constructor
            @@ var (unqual consName)
               -- Case deconstruction
            @@ (lambda [bvar "p__"] $
                    case' (var "p__") $
                       [ match [conP (unqual consName) [bvar "p__val"]]
                             $ var "Prelude.Just" @@ var "p__val"
                       ]
                       -- We want to generate the otherwise case
                       -- depending on the amount of sum type cases there are
                       ++ otherwiseCase
               )
        generatePrism :: [RawMatch] -> OneofCase -> [HsDecl']
        generatePrism otherwiseCase oneofCase =
            let consName = caseConstructorName oneofCase
                prismName = casePrismName oneofCase
            in [ generateTypeSig (caseField oneofCase) prismName
               , valBind prismName $ generateFunDef otherwiseCase consName
               ]

generatePrismExports :: OneofInfo -> [IE']
generatePrismExports = map (var . unqual . casePrismName) . oneofCases

generateEnumExports :: EnumInfo OccNameStr -> [IE']
generateEnumExports e = [thingAll n, thingWith n aliases] ++ proto3NewType
  where
    n = unqual $ enumName e
    aliases = [enumValueName v | v <- enumValues e, needsManualExport v]
    needsManualExport v = isJust (enumAliasOf v)
    proto3NewType = case enumUnrecognized e of
        Just u -> [var . unqual $ unrecognizedValueName u]
        Nothing -> []

generateServiceExports :: ServiceInfo -> IE'
generateServiceExports si = thingAll $ unqual $ fromString $ T.unpack $ serviceName si

generateEnumDecls :: EnumInfo OccNameStr -> [HsDecl']
generateEnumDecls info =
    -- Proto3-only:
    -- newtype FooEnum'UnrecognizedValue = FooEnum'UnrecognizedValue Data.Int.Int32
    --   deriving (Prelude.Eq, Prelude.Ord, Prelude.Show, Prelude.Read)
    [ newtype' (unrecognizedValueName u) []
       (prefixCon (unrecognizedValueName u) [field $ var "Data.Int.Int32"])
       [deriving' [var "Prelude.Eq", var "Prelude.Ord", var "Prelude.Show"]]
    | Just u <- [unrecognized]
    ]
    ++

    -- data FooEnum
    --     = Enum1
    --     | Enum2
    --     | FooEnum'Unrecognized !FooEnum'UnrecognizedValue
    --   deriving (Prelude.Show, Prelude.Eq, Prelude.Ord, Prelude.Read)
    [ data' dataName []
        (  (flip prefixCon [] <$> constructorNames)
        ++ [ prefixCon (unrecognizedName u)
                [strict $ field $ var $ unqual $ unrecognizedValueName u]
           | Just u <- [unrecognized]
           ]
        )
        [deriving' [var "Prelude.Show", var "Prelude.Eq", var "Prelude.Ord"]]

    -- instance Data.ProtoLens.MessageEnum FooEnum where
    --       maybeToEnum 0 = Prelude.Just Enum1
    --       maybeToEnum 3 = Prelude.Just Enum2
    --       maybeToEnum k
    --         -- Proto3:
    --         = Prelude.Just
    --             (FooEnum'Unrecognized
    --               (FooEnum'UnrecognizedValue (Prelude.fromIntegral k)))
    --         -- Proto2:
    --         = Nothing
    --
    --       showEnum Foo'Enum2 = "Enum2"
    --       showEnum Foo'Enum1 = "Enum1"
    --       showEnum (FooEnum'Unrecognized (FooEnum'UnrecognizedValue k))
    --         = Prelude.show k
    --
    --       readEnum k
    --           | k == "Enum2a" = Prelude.Just Enum2a -- alias
    --           | k == "Enum2" = Prelude.Just Enum2
    --           | k == "Enum1" = Prelude.Just Enum1
    --       readEnum k = Text.Read.readMaybe k >>= maybeToEnum
    , instance' (var "Data.ProtoLens.MessageEnum" @@ dataType)
        [ funBinds "maybeToEnum" $
            [ match [int k] $ var "Prelude.Just" @@ var (unqual c)
            | (c, k) <- constructorNumbers
            ]
            ++
            [ case enumUnrecognized info of
                Nothing -> match [wildP] $ var "Prelude.Nothing"
                Just u -> match [bvar "k"]
                            $ var "Prelude.Just" @@
                                (var (unqual $ unrecognizedName u)
                                @@ (var (unqual $ unrecognizedValueName u)
                                    @@ (var "Prelude.fromIntegral" @@ var "k")
                                    )
                                )
            ]
        , funBinds "showEnum" $
            [ match [conP_ (unqual n)] $ string pn
            | v <- filter (null . enumAliasOf) $ enumValues info
            , let n = enumValueName v
            , let pn = T.unpack $ enumValueDescriptor v ^. #name
            ] ++
            [ match [conP (unqual $ unrecognizedName u)
                        [conP (unqual $ unrecognizedValueName u) [bvar "k"]]
                    ]
                $ var "Prelude.show" @@ var "k"
            | Just u <- [unrecognized]
            ]
        , funBind "readEnum" $ matchGRHSs [bvar "k"] $ guardedRhs $
              [ guard (var "Prelude.==" @@ var "k" @@ string pn)
                    $ var "Prelude.Just" @@ var (unqual n)
              | v <- enumValues info
              , let n = enumValueName v
              , let pn = T.unpack $ enumValueDescriptor v ^. #name
              ]
              ++ [guard (var "Prelude.otherwise") $ var "Prelude.>>="
                                      @@ (var "Text.Read.readMaybe" @@ var "k")
                                      @@ var "Data.ProtoLens.maybeToEnum"]
        ]

      -- instance Bounded Foo where
      --    minBound = Foo1
      --    maxBound = FooN
      , instance' (var "Prelude.Bounded" @@ dataType)
          [ valBind "minBound" $ var $ unqual minBoundName
          , valBind "maxBound" $ var $ unqual maxBoundName
          ]

      -- instance Enum Foo where
      --    toEnum k = maybe (error ("Foo.toEnum: unknown argument for enum Foo: "
      --                                ++ show k))
      --                  id (maybeToEnum k)
      --    fromEnum Foo1 = 1
      --    fromEnum Foo2 = 2
      --    ..
      --    succ FooN = error "Foo.succ: bad argument FooN."
      --    succ Foo1 = Foo2
      --    succ Foo2 = Foo3
      --    ..
      --    pred Foo1 = error "Foo.succ: bad argument Foo1."
      --    pred Foo2 = Foo1
      --    pred Foo3 = Foo2
      --    ..
      --    enumFrom = messageEnumFrom
      --    enumFromTo = messageEnumFromTo
      --    enumFromThen = messageEnumFromThen
      --    enumFromThenTo = messageEnumFromThenTo
      , instance' (var "Prelude.Enum" @@ dataType)
        [funBind "toEnum" $ match [bvar "k__"]
                  $ var "Prelude.maybe" @@ errorMessageExpr @@ var "Prelude.id"
                        @@ (var "Data.ProtoLens.maybeToEnum" @@ var "k__")
        , funBinds "fromEnum" $
            [ match [conP_ (unqual c)] $ int k
            | (c, k) <- constructorNumbers
            ]
            ++
            [ match [conP (unqual $ unrecognizedName u)
                                [conP (unqual $ unrecognizedValueName u) [bvar "k"]]
                                ]
                    $ var "Prelude.fromIntegral" @@ var "k"
            | Just u <- [unrecognized]
            ]
        , succDecl "succ" maxBoundName succPairs
        , succDecl "pred" minBoundName $ map swap succPairs
        , valBind "enumFrom" $ var "Data.ProtoLens.Message.Enum.messageEnumFrom"
        , valBind "enumFromTo" $ var "Data.ProtoLens.Message.Enum.messageEnumFromTo"
        , valBind "enumFromThen" $ var "Data.ProtoLens.Message.Enum.messageEnumFromThen"
        , valBind "enumFromThenTo"
            $ var "Data.ProtoLens.Message.Enum.messageEnumFromThenTo"
        ]

    -- instance Data.ProtoLens.FieldDefault Foo where
    --   fieldDefault = FirstEnumValue
    , instance' (var "Data.ProtoLens.FieldDefault" @@ dataType)
        [valBind "fieldDefault" $ defaultCon]

    -- instance NFData Foo where
    --   rnf x__ = seq x__ ()
    -- (Trivial since enum types are already strict)
    , instance' (var "Control.DeepSeq.NFData" @@ dataType)
        [ funBind "rnf" $ match [bvar "x__"]
            $ var "Prelude.seq" @@ var "x__" @@ var "()" ]
    ] ++

    -- pattern Enum2a :: FooEnum
    -- pattern Enum2a = Enum2
    concat
        [ [ patSynSig aliasName dataType
          , patSynBind aliasName [] (bvar originalName)
          ]
        | EnumValueInfo
            { enumValueName = aliasName
            , enumAliasOf = Just originalName
            } <- enumValues info
        ]

  where
    EnumInfo { enumName = dataName
             , enumUnrecognized = unrecognized
             , enumDescriptor = ed
             } = info
    errorMessage = "toEnum: unknown value for enum " ++ unpack (ed ^. #name)
                      ++ ": "

    errorMessageExpr = var "Prelude.error"
                          @@ (var "Prelude.++" @@ string errorMessage
                              @@ (var "Prelude.show" @@ var "k__"))

    dataType = var $ unqual dataName

    constructors :: [(OccNameStr, EnumValueDescriptorProto)]
    constructors = List.sortBy (comparing ((^. #number) . snd))
                            [(n, d) | EnumValueInfo
                                { enumValueName = n
                                , enumValueDescriptor = d
                                , enumAliasOf = Nothing
                                } <- enumValues info
                            ]
    constructorNames = map fst constructors

    defaultCon = var $ unqual $ head constructorNames

    minBoundName = head constructorNames
    maxBoundName = last constructorNames

    constructorNumbers = map (second (fromIntegral . (^. #number))) constructors

    succPairs = zip constructorNames $ tail constructorNames

    succDecl :: OccNameStr -> OccNameStr -> [(OccNameStr, OccNameStr)] -> RawInstDecl
    succDecl funName boundName thePairs = funBinds funName $
        match [conP_ (unqual boundName)]
            (var "Prelude.error" @@ string (concat
                [ occNameStrToString dataName, "."
                , occNameStrToString funName, ": bad argument "
                , occNameStrToString boundName
                , ". This value would be out of bounds."
                ]))
        :
        [ match [conP_ (unqual from)] $ var $ unqual to
        | (from, to) <- thePairs
        ]
        ++
        [ match [conP (unqual $ unrecognizedName u) [wildP]]
            (var "Prelude.error" @@ string (concat
                [ occNameStrToString dataName, "."
                , occNameStrToString funName, ": bad argument: unrecognized value"

                ]))
        | Just u <- [unrecognized]
        ]

generateFieldDecls :: Symbol -> [HsDecl']
generateFieldDecls xStr =
    -- foo :: forall f s a
    --        . (Functor f, HasLens s x a) => LensLike' f s a
    -- foo = fieldOf @s
    [ typeSig x
          $ forall' [bvar "f", bvar "s", bvar "a"]
          $ [ var "Prelude.Functor" @@ var "f"
            , var "Data.ProtoLens.Field.HasField" @@ var "s" @@ xSym @@ var "a"
            ]
          ==> var "Lens.Family2.LensLike'" @@ var "f" @@ var "s" @@ var "a"
    , valBind x $ fieldOfExp xStr
    ]
  where
    x = nameFromSymbol xStr
    xSym = promoteSymbol xStr

------------------------------------------

-- | An individual field of the Haskell type corresponding to a proto message.
data RecordField = RecordField
    { recordFieldName :: OccNameStr  -- ^ The Haskell name of this field (unique
                               --   within the module).
    , recordFieldType :: HsType'  -- ^ Internal type in the record
    , recordFieldLenses :: [LensInstance]
        -- ^ All of the (overloaded) lenses accessing this record field.
    }

-- | An instance of HasLens' for a particular field.
data LensInstance = LensInstance
    { lensSymbol :: Symbol
          -- ^ The overloaded name for this lens.
    , lensFieldType :: HsType'
          -- ^ The type pointed to from this lens.
    , lensExp :: HsExpr'
        -- ^ A lens from the recordFieldType to the lensFieldType; i.e.,
        -- from how it's actually stored in the Haskell record to how the
        -- lens views it.
    }

-- | Compile information about the record field type and type/class instances
-- for this particular field.
--
-- Used for "plain" record fields that are not part of a oneof.
plainRecordField :: Env RdrNameStr -> PlainFieldInfo -> RecordField
plainRecordField env (PlainFieldInfo kind f) = case kind of
    -- data Foo = Foo { _Foo_bar :: Bar }
    -- type instance Field "bar" Foo = Bar
    RequiredField
        -> recordField baseType
                  [LensInstance
                      { lensSymbol = baseName
                      , lensFieldType = baseType
                      , lensExp = rawAccessor
                      }]
    OptionalValueField
              -> recordField baseType
                    [LensInstance
                      { lensSymbol = baseName
                      , lensFieldType = baseType
                      , lensExp = rawAccessor
                      }]
    -- data Foo = Foo { _Foo_bar :: Maybe Bar }
    -- type instance Field "bar" Foo = Bar
    -- type instance Field "maybe'bar" Foo = Maybe Bar
    OptionalMaybeField ->
              recordField maybeType
                  [LensInstance
                      { lensSymbol = baseName
                      , lensFieldType = baseType
                      , lensExp = maybeAccessor
                      }
                  , LensInstance
                      { lensSymbol = "maybe'" <> baseName
                      , lensFieldType = maybeType
                      , lensExp = rawAccessor
                      }
                  ]
        -- data Foo = Foo { _Foo_bar :: Map Bar Baz }
        -- type instance Field "foo" Foo = Map Bar Baz
    MapField entry ->
            let mapType = var "Data.Map.Map"
                            @@ hsFieldType env (keyField entry)
                            @@ hsFieldType env (valueField entry)
            in recordField mapType
                  [LensInstance
                       { lensSymbol = baseName
                       , lensFieldType = mapType
                       , lensExp = rawAccessor
                       }]
        -- data Foo = Foo { _Foo_bar :: [Bar] }
        -- type instance Field "bar" Foo = [Bar]
    RepeatedField {} ->
            recordField vectorType
                  [ LensInstance
                      { lensSymbol = baseName
                      , lensFieldType = listType
                      , lensExp = vectorAccessor
                      }
                  , LensInstance
                      { lensSymbol = "vec'" <> baseName
                      , lensFieldType = vectorType
                      , lensExp = rawAccessor
                      }
                  ]
  where
    recordField = RecordField (haskellRecordFieldName $ fieldName f)
    baseName = overloadedName $ fieldName f
    fd = fieldDescriptor f
    baseType = hsFieldType env f
    maybeType = var "Prelude.Maybe" @@ baseType
    listType = listTy baseType
    vectorType = hsFieldVectorType f @@ baseType
    rawAccessor = var "Prelude.id"
    maybeAccessor = var "Data.ProtoLens.maybeLens"
                          @@ hsFieldValueDefault env fd

vectorAccessor :: HsExpr'
vectorAccessor = var "Lens.Family2.Unchecked.lens" @@ getter @@ setter
  where
    getter = var "Data.Vector.Generic.toList"
    setter = lambda [wildP, bvar "y__"]
                $ var "Data.Vector.Generic.fromList" @@ var "y__"

oneofRecordField :: Env RdrNameStr -> OneofInfo -> RecordField
oneofRecordField env oneofInfo
    = RecordField
        { recordFieldName = haskellRecordFieldName $ oneofFieldName oneofInfo
        , recordFieldType =
              var "Prelude.Maybe" @@ var (unqual $ oneofTypeName oneofInfo)
        , recordFieldLenses = lenses
        }
  where
    lenses =
        -- Only generate a "maybe" version of this lens,
        -- since oneofs don't have a notion of a "default" case.
        -- data Foo = Foo { _Foo'bar = Maybe Foo'Bar }
        -- type instance Field "maybe'bar" Foo = Maybe Foo'Bar
        [LensInstance
          { lensSymbol = "maybe'" <> overloadedName
                                        (oneofFieldName oneofInfo)
          , lensFieldType =
                var "Prelude.Maybe" @@ var (unqual $ oneofTypeName oneofInfo)
          , lensExp = var "Prelude.id"
          }
         ]
         ++ concat
          -- Generate the same lenses for each sub-field of the oneof
          -- as if they were proto2 optional fields.
          -- type instance Field "bar" Foo = Bar
          -- type instance Field "maybe'bar" Foo = Maybe Bar
            [ [ LensInstance
                { lensSymbol = maybeName
                , lensFieldType = var "Prelude.Maybe" @@ baseType
                , lensExp = oneofFieldAccessor c
                }
              , LensInstance
                { lensSymbol = baseName
                , lensFieldType = baseType
                , lensExp = var "Prelude.."
                                @@ oneofFieldAccessor c
                                @@ (var "Data.ProtoLens.maybeLens"
                                              @@ hsFieldValueDefault env
                                                    (fieldDescriptor f))
                }
              ]
            | c <- oneofCases oneofInfo
            , let f = caseField c
            , let baseName = overloadedName $ fieldName f
            , let baseType = hsFieldType env f
            , let maybeName = "maybe'" <> baseName
            ]

hsFieldDefault :: Env RdrNameStr -> PlainFieldInfo -> HsExpr'
hsFieldDefault env f = case plainFieldKind f of
    RequiredField -> hsFieldValueDefault env fd
    OptionalValueField -> hsFieldValueDefault env fd
    OptionalMaybeField -> var "Prelude.Nothing"
    MapField {} -> var "Data.Map.empty"
    RepeatedField {} -> var "Data.Vector.Generic.empty"
  where
    fd = fieldDescriptor (plainFieldInfo f)

hsFieldValueDefault :: Env RdrNameStr -> FieldDescriptorProto -> HsExpr'
hsFieldValueDefault env fd = case fd ^. #type' of
    FieldDescriptorProto'TYPE_MESSAGE -> var "Data.ProtoLens.defMessage"
    FieldDescriptorProto'TYPE_GROUP -> var "Data.ProtoLens.defMessage"
    FieldDescriptorProto'TYPE_ENUM
        | T.null def -> var "Data.ProtoLens.fieldDefault"
        | Enum e <- definedFieldType fd env
        , Just v <- List.lookup def [ (enumValueDescriptor v ^. #name, enumValueName v)
                                    | v <- enumValues e
                                    ]
            -> var v
        | otherwise -> errorMessage "enum"
    -- The rest of the cases are for scalar fields that have a fieldDefault
    -- instance.
    _ | T.null def -> var "Data.ProtoLens.fieldDefault"
    FieldDescriptorProto'TYPE_BOOL
        | def == "true" -> var "Prelude.True"
        | def == "false" -> var "Prelude.False"
        | otherwise -> errorMessage "bool"
    FieldDescriptorProto'TYPE_STRING
        -> var "Data.Text.pack" @@ string (T.unpack def)
    FieldDescriptorProto'TYPE_BYTES
        -> var "Data.ByteString.pack"
                @@ list ((mkByte . fromEnum) <$> T.unpack def)
      where mkByte c
              | c > 0 && c < 255 = int $ fromIntegral c
              | otherwise = errorMessage "bytes"
    FieldDescriptorProto'TYPE_FLOAT -> defaultFrac $ T.unpack def
    FieldDescriptorProto'TYPE_DOUBLE -> defaultFrac $ T.unpack def
    -- Otherwise, assume it's an integral field:
    _ -> defaultInt $ T.unpack def
  where
    def = fd ^. #defaultValue
    errorMessage fieldType
        = error $ "Bad default value " ++ show (T.unpack def)
                    ++ " in default value for " ++ fieldType ++ " field "
                    ++ unpack (fd ^. #name)
    -- float/double fields can use nan, inf and -inf as default values.
    -- The Prelude doesn't provide names for them, so we implement
    -- them as division by zero.
    defaultFrac "nan" = var "Prelude./" @@ frac 0 @@ frac 0
    defaultFrac "inf" = var "Prelude./" @@ frac 1 @@ frac 0
    defaultFrac "-inf" = var "Prelude./" @@ frac (negate 1) @@ frac 0
    defaultFrac s = case reads s of
        [(x, "")] -> frac $ toRational (x :: Double)
        _ -> errorMessage "fractional"
    defaultInt s = case reads s of
        [(x, "")] -> int x
        _ -> errorMessage "integral"

-- | A lens to access an internal field.
--
--   lens _Foo_bar (\x__ y__ -> x__ { _Foo_bar = y__ })
rawFieldAccessor :: RdrNameStr -> HsExpr'
rawFieldAccessor f = var "Lens.Family2.Unchecked.lens" @@ getter @@ setter
  where
    getter = var f
    setter = lambda [bvar "x__", bvar "y__"]
                    $ recordUpd (var "x__") [(f, var "y__")]

-- | A lens that maps from a oneof sum type to one of its individual cases.
--
-- For example, with
--     data Foo = Bar Int32 | Baz Int64
--
-- this will generate a lens of type @Lens' (Maybe Foo) (Maybe Int32)@.
--
-- (Recall that oneofs are stored in a proto message as @Maybe Foo@, where
-- 'Nothing' means that it's either set to an unknown value or unset.)
--
-- lens
--   (\ x__ -> case x__ of
--       Prelude.Just (Foo'c x__val) -> Prelude.Just x__val
--       otherwise -> Prelude.Nothing)
--   (\ _ y__ -> fmap Foo'c y__
oneofFieldAccessor :: OneofCase -> HsExpr'
oneofFieldAccessor o
        = var "Lens.Family2.Unchecked.lens" @@ getter @@ setter
  where
    consName = caseConstructorName o
    getter = lambda [bvar "x__"] $
        case' (var "x__")
            [ match [conP "Prelude.Just" [conP (unqual consName) [bvar "x__val"]]]
                $ var "Prelude.Just" @@ var "x__val"
            , match [bvar "_otherwise"] $ var "Prelude.Nothing"
            ]
    setter = lambda [wildP, bvar "y__"]
                $ var "Prelude.fmap" @@ var (unqual consName) @@ var "y__"

messageInstance :: Env RdrNameStr -> T.Text -> MessageInfo OccNameStr -> [RawInstDecl]
messageInstance env protoName m =
    [ funBind "messageName" $ match [wildP] $
          var "Data.Text.pack" @@ string (T.unpack protoName)
    , valBind "fieldsByTag" $
          let' (map (fieldDescriptorVarBind $ messageName m) $ fields)
              $ var "Data.Map.fromList" @@ list fieldsByTag
    , valBind "unknownFields"
           $ rawFieldAccessor (unqual $ messageUnknownFields m)
    , valBind "defMessage"
           $ recordConE (unqual $ messageConstructorName m) $
                  [ (unqual $ haskellRecordFieldName
                                    $ fieldName $ plainFieldInfo f,
                        hsFieldDefault env f)
                  | f <- messageFields m
                  ] ++
                  [ (unqual $ haskellRecordFieldName $ oneofFieldName o,
                        var "Prelude.Nothing")
                  | o <- messageOneofFields m
                  ] ++
                  [ (unqual $ messageUnknownFields m, var "[]")]
    , valBind "parseMessage" $ generatedParser env m
    , valBind "buildMessage" $ generatedBuilder m
    ]
  where
    fieldsByTag =
        [tuple
              [ t, fieldDescriptorVar f ]
              | f <- fields
              , let t = var "Data.ProtoLens.Tag"
                          @@ int (fromIntegral
                                      $ fieldDescriptor (plainFieldInfo f) ^. #number)
              ]
    fieldDescriptorVar = var . unqual . fieldDescriptorName
    fieldDescriptorName f
        = nameFromSymbol $ overloadedName (fieldName . plainFieldInfo $ f)
                                <> "__field_descriptor"
    fieldDescriptorVarBind n f
        = valBind (fieldDescriptorName f)
            $ fieldDescriptorExpr env n f
    fields = messageFields m
                ++ (messageOneofFields m >>= fmap casePlainField . oneofCases)
    -- The cases of an optional are always treated like proto2 "maybe" fields.
    casePlainField = PlainFieldInfo OptionalMaybeField . caseField

-- | Get the name of the field when used in a text format proto. Groups are
-- special because their text format field name is the name of their type,
-- not the name of the field in the descriptor (e.g. "Foo", not "foo").
textFormatFieldName :: Env RdrNameStr -> FieldDescriptorProto -> T.Text
textFormatFieldName env descr = case descr ^. #type' of
    FieldDescriptorProto'TYPE_GROUP
        | Message msg <- definedFieldType descr env
              -> messageDescriptor msg ^. #name
        | otherwise -> error $ "expected TYPE_GROUP for type name"
                           ++ T.unpack (descr ^. #typeName)
    _ -> descr ^. #name

fieldDescriptorExpr :: Env RdrNameStr -> OccNameStr -> PlainFieldInfo
                    -> HsExpr'
fieldDescriptorExpr env n f =
    (var "Data.ProtoLens.FieldDescriptor"
        -- Record the original .proto name for text format
        @@ string (T.unpack $ textFormatFieldName env fd)
        -- Force the type signature since it can't be inferred for Map entry
        -- types.
        @@ (fieldTypeDescriptorExpr (fd ^. #type')
                @::@
                    (var "Data.ProtoLens.FieldTypeDescriptor"
                        @@ hsFieldType env (plainFieldInfo f)))
        @@ fieldAccessorExpr f)
    -- TODO: why is this type sig needed?
    @::@
    (var "Data.ProtoLens.FieldDescriptor" @@ var (unqual n))
  where
    fd = fieldDescriptor $ plainFieldInfo f

fieldAccessorExpr :: PlainFieldInfo -> HsExpr'
-- (PlainField Required foo), (OptionalField foo), etc...
fieldAccessorExpr (PlainFieldInfo kind f) = accessorCon @@ fieldOfExp hsFieldName

  where
    accessorCon = case kind of
          RequiredField
                -> var "Data.ProtoLens.PlainField" @@ var "Data.ProtoLens.Required"
          OptionalValueField
                -> var "Data.ProtoLens.PlainField" @@ var "Data.ProtoLens.Optional"
          OptionalMaybeField
                -> var "Data.ProtoLens.OptionalField"
          MapField entry
                  -> var "Data.ProtoLens.MapField"
                         @@ fieldOfExp (overloadedField $ keyField entry)
                         @@ fieldOfExp (overloadedField $ valueField entry)
          RepeatedField packed ->
                var "Data.ProtoLens.RepeatedField"
                  @@ if packed == Packed
                        then var "Data.ProtoLens.Packed"
                        else var "Data.ProtoLens.Unpacked"
    hsFieldName
        = case kind of
            OptionalMaybeField -> "maybe'" <> overloadedField f
            _ -> overloadedField f

fieldOfExp :: Symbol -> HsExpr'
fieldOfExp sym = var "Data.ProtoLens.Field.field" `tyApp` promoteSymbol sym

overloadedField :: FieldInfo -> Symbol
overloadedField = overloadedName . fieldName

fieldTypeDescriptorExpr :: FieldDescriptorProto'Type -> HsExpr'
fieldTypeDescriptorExpr = \case
    FieldDescriptorProto'TYPE_DOUBLE -> mk "ScalarField" "DoubleField"
    FieldDescriptorProto'TYPE_FLOAT -> mk "ScalarField" "FloatField"
    FieldDescriptorProto'TYPE_INT64 -> mk "ScalarField" "Int64Field"
    FieldDescriptorProto'TYPE_UINT64 -> mk "ScalarField" "UInt64Field"
    FieldDescriptorProto'TYPE_INT32 -> mk "ScalarField" "Int32Field"
    FieldDescriptorProto'TYPE_FIXED64 -> mk "ScalarField" "Fixed64Field"
    FieldDescriptorProto'TYPE_FIXED32 -> mk "ScalarField" "Fixed32Field"
    FieldDescriptorProto'TYPE_BOOL -> mk "ScalarField" "BoolField"
    FieldDescriptorProto'TYPE_STRING -> mk "ScalarField" "StringField"
    FieldDescriptorProto'TYPE_GROUP -> mk "MessageField" "GroupType"
    FieldDescriptorProto'TYPE_MESSAGE -> mk "MessageField" "MessageType"
    FieldDescriptorProto'TYPE_BYTES -> mk "ScalarField" "BytesField"
    FieldDescriptorProto'TYPE_UINT32 -> mk "ScalarField" "UInt32Field"
    FieldDescriptorProto'TYPE_ENUM -> mk "ScalarField" "EnumField"
    FieldDescriptorProto'TYPE_SFIXED32 -> mk "ScalarField" "SFixed32Field"
    FieldDescriptorProto'TYPE_SFIXED64 -> mk "ScalarField" "SFixed64Field"
    FieldDescriptorProto'TYPE_SINT32 -> mk "ScalarField" "SInt32Field"
    FieldDescriptorProto'TYPE_SINT64 -> mk "ScalarField" "SInt64Field"
  where
    mk x y = var (fromString ("Data.ProtoLens." ++ x))
              @@ var (fromString ("Data.ProtoLens." ++ y))

-- | Generate the implementation of NFData.rnf for the given message.
--
-- instance NFData Bar where
--    rnf = \x -> deepseq (_Bar'foo x) (deepseq (_Bar'bar x) ())
messageRnfExpr :: MessageInfo OccNameStr -> HsExpr'
messageRnfExpr msg = lambda [bvar "x__"] $ foldr (@@) unit (map seqField fieldNames)
  where
    fieldNames = messageUnknownFields msg
                : map (haskellRecordFieldName . fieldName . plainFieldInfo)
                       (messageFields msg)
                ++ map (haskellRecordFieldName . oneofFieldName)
                       (messageOneofFields msg)
    seqField :: OccNameStr -> HsExpr'
    seqField f = var "Control.DeepSeq.deepseq" @@ (var (unqual f) @@ var "x__")

--   rnf (Foo'a x__) = rnf x__
--   rnf (Bar'b x__) = rnf x__
oneofRnfMatch :: OneofCase -> RawMatch
oneofRnfMatch c = match [unqual (caseConstructorName c) `conP` [bvar "x__"]]
                    $ var "Control.DeepSeq.rnf" @@ var "x__"
