{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Prettyprinter.GHC where

-- base
import Data.Coerce
import Data.String (IsString)

-- prettyprinter
import Data.Text.Prettyprint.Doc

-- text
import Data.Text (Text)
import qualified Data.Text as Text
import Data.Maybe (fromMaybe)


type Doc' = Doc ()


newtype OccNameStr = OccNameStr Text
  deriving newtype (IsString, Show, Eq, Ord, Pretty)
newtype RdrNameStr = RdrNameStr Text
  deriving newtype (IsString, Show, Eq, Ord, Pretty)
newtype ModuleNameStr = ModuleNameStr Text
  deriving newtype (IsString, Show, Eq, Ord, Pretty)
type Pat' = Doc'
type HsExpr' = Doc'
type HsBind' = Doc'
type HsType' = Doc'
type Sig' = Doc'
type Stmt' = Doc'
type IE' = Doc'
type HsDecl' = Doc'
type ConDecl' = Doc'
type HsDerivingClause' = Doc'
type HsModule' = Doc'
type HsTyVarBndr' = Doc'
type HsLit' = Doc'
type HsOverLit' = Doc'
type Field = Doc'


data RawMatch = RawMatch [Pat'] HsExpr'


var :: RdrNameStr -> Doc'
var = pretty


bvar :: OccNameStr -> Doc'
bvar = pretty


match :: [Pat'] -> HsExpr' -> RawMatch
match = RawMatch


(@@) :: Doc' -> Doc' -> Doc'
lhs @@ rhs = parens lhs <+> parens rhs
infixl 2 @@


op :: Doc' -> RdrNameStr -> Doc' -> Doc'
op l o r = parens l <+> pretty o <+> parens r


par :: Doc' -> Doc'
par = parens


infixr 0 -->
(-->) :: HsType' -> HsType' -> HsType'
lhs --> rhs = lhs <+> "->" <+> rhs

infixr 0 ==>
(==>) :: [HsType'] -> HsType' -> HsType'
lhs ==> rhs = tupled lhs <+> "=>" <+> nest 2 rhs


infixl 1 <--
(<--) :: Pat' -> HsExpr' -> Stmt'
lhs <-- rhs = lhs <+> "<-" <+> rhs


data ImportDecl' = ImportDecl
  { ideclName :: ModuleNameStr
  , ideclAs :: Maybe ModuleNameStr
  , isSource :: Bool
  , isQualified :: Bool
  , exposed :: Maybe [IE']
  }


instance Pretty ImportDecl' where
  pretty ImportDecl{..} =
    hsep $
      ["import"]
      ++ (if isSource then ["{-# SOURCE #-}"] else [])
      ++ (if isQualified then ["qualified"] else [])
      ++ [pretty ideclName]
      ++ es
      ++ (maybe [] (\as -> ["as", pretty as]) ideclAs)
    where
      es = case exposed of
        Nothing -> []
        Just identifiers -> [unAnnotate $ tupled identifiers]


module' :: Maybe ModuleNameStr -> Maybe [IE'] -> [ImportDecl'] -> [HsDecl'] -> HsModule'
module' (Just nm) (mexports) imports decls =
  "module"
    <+> pretty nm
    <+> case mexports of
          Just exports -> nest 4 (parens (nest 4 (line <> fillSep (punctuate comma exports)) <> line))
          Nothing -> ""
    <+> "where"
    <> line
    <> vcat (fmap pretty imports)
    <> line
    <> vcat decls


import' :: ModuleNameStr -> ImportDecl'
import' modName = ImportDecl{ideclName = modName, isSource = False, isQualified = False, exposed = Nothing, ideclAs = Nothing}


source :: ImportDecl' -> ImportDecl'
source decl = decl{isSource = True}


qualified' :: ImportDecl' -> ImportDecl'
qualified' decl = decl{isQualified = True}


exposing :: ImportDecl' -> [IE'] -> ImportDecl'
exposing decl e = decl{exposed = Just e}


moduleNameStrToString :: ModuleNameStr -> String
moduleNameStrToString (ModuleNameStr txt) = Text.unpack txt

unModuleNameStr :: ModuleNameStr -> String
unModuleNameStr (ModuleNameStr txt) = Text.unpack txt
moduleNameString = unModuleNameStr
mkModuleName = ModuleNameStr . Text.pack


occNameStrToString :: OccNameStr -> String
occNameStrToString (OccNameStr txt) = Text.unpack txt


thingAll :: RdrNameStr -> IE'
thingAll a = pretty a <> "(..)"
thingWith :: RdrNameStr -> [OccNameStr] -> IE'
thingWith a b = pretty a <> tupled (fmap pretty b)


unqual :: OccNameStr -> RdrNameStr
unqual = coerce


data' :: OccNameStr -> [HsTyVarBndr'] -> [ConDecl'] -> [HsDerivingClause'] -> HsDecl'
data' name bndrs [] [] =
  "data"
    <+> pretty name
    <+> hsep bndrs
data' name bndrs cons derivings =
  "data"
    <+> pretty name
    <+> hsep bndrs
    <+> "="
    <> line
    <> nest 2 (encloseSep "    " "" "| " cons)
    <> line
    <+> hcat derivings


instance' :: HsType' -> [Doc'] -> HsDecl'
instance' x defs = "instance" <+> x <+> "where" <> nest 2 (line <> vsep defs)

tyFamInst :: RdrNameStr -> [HsType'] -> HsType' -> Doc'
tyFamInst name args r = "type" <+> pretty name <+> vsep args <+> equals <+> r

typeSig :: OccNameStr -> HsType' -> Doc'
typeSig nm typ = pretty nm <+> "::" <+> typ


tuple :: [Doc'] -> Doc'
tuple = tupled


lit :: HsLit' -> Doc'
lit = id


string :: String -> Doc'
-- TODO support multiline and escapes
string = nest 2 . vcat . punctuate "\\n\\". fmap pretty . Prelude.lines . show
stringTy = string
newtype' :: OccNameStr -> [HsTyVarBndr'] -> ConDecl' -> [HsDerivingClause'] -> HsDecl'
newtype' name bndrs con derivings =
  "newtype"
    <+> pretty name
    <+> hsep bndrs
    <+> "="
    <> line
    <+> hang 2 con
    <> line
    <+> hsep derivings
recordCon :: OccNameStr -> [(OccNameStr, Field)] -> ConDecl'
recordCon occ fields =
  pretty occ <+> braces (hang 2 . vsep . punctuate comma $ fmap (\(l, r) -> pretty l <+> "::" <+> r) fields)
recordConE :: RdrNameStr -> [(RdrNameStr, HsExpr')] -> HsExpr'
recordConE occ fields =
  pretty occ <+> braces (hang 2 . vsep . punctuate comma $ fmap (\(l, r) -> pretty l <+> "=" <+> r) fields)
recordUpd occ fields =
  occ <+> braces (hang 2 . vsep . punctuate comma $ fmap (\(l, r) -> pretty l <+> "=" <+> r) fields)
field :: HsType' -> Field
field = id
do' :: [Stmt'] -> HsExpr'
do' stmts = "do" <> line <> indent 2 (vsep stmts)
stmt :: HsExpr' -> Stmt'
stmt = id
listTy :: HsType' -> HsType'
listTy = brackets
listPromotedTy  :: [HsType'] -> HsType'
listPromotedTy x = "'" <> Data.Text.Prettyprint.Doc.list x
funBind :: OccNameStr -> RawMatch -> Doc'
funBind nm (RawMatch pats e) = pretty nm <+> hsep pats <+> "=" <+> e
funBinds :: OccNameStr -> [RawMatch] -> Doc'
funBinds nm xs = vsep $ fmap (funBind nm) xs
list :: [Doc'] -> Doc'
list = hang 2 . Data.Text.Prettyprint.Doc.list
prefixCon :: OccNameStr -> [Field] -> ConDecl'
prefixCon occ fields = pretty occ <+> hsep fields
lambdaCase :: [RawMatch] -> HsExpr'
lambdaCase matches = "\\case" <> line <> indent 2 (vsep $ fmap f matches)
  where
    f (RawMatch pats e) = hsep pats <+> "->" <+> e
conP :: RdrNameStr -> [Pat'] -> Pat'
conP nm pats = parens $ hsep $ pretty nm : pats
conP_ :: RdrNameStr -> Pat'
conP_ nm = pretty nm <> "{}"
wildP :: Pat'
wildP = "_"
case' :: HsExpr' -> [RawMatch] -> HsExpr'
case' e matches = "case" <+> e <+> "of" <> line <> indent 2 (vsep $ fmap f matches)
  where
    f (RawMatch pats e) = hsep pats <+> "->" <+> e
deriving' :: [HsType'] -> HsDerivingClause'
deriving' typs = "deriving" <+> nest 2 (tupled typs)
derivingStock :: [HsType'] -> HsDerivingClause'
derivingStock typs = "deriving stock" <+> nest 2 (tupled typs)

qual (ModuleNameStr modName) (OccNameStr occ) = RdrNameStr $ modName <> "." <> occ

int :: Integer -> Doc'
int = pretty

frac :: Rational -> Doc'
frac = undefined

char :: Char -> Doc'
char = squotes . pretty

lambda :: [Doc'] -> Doc' -> Doc'
lambda ps e = "\\" <> hsep ps <+> "->" <+> e

unit :: Doc'
unit = "()"

if' :: Doc' -> Doc' -> Doc' -> Doc'
if' c y n = "if" <+> c <+> "then" <+> (nest 2 (line <> y) <> line) <+> "else" <+> (nest 2 (line <> n))

strictP :: Doc' -> Doc'
strictP x = "!" <> x
strict :: Doc' -> Doc'
strict x = "!" <> parens x

tyApp lhs rhs = lhs <+> "@" <> (parens rhs)

let' :: [Doc'] -> Doc' -> HsExpr'
let' defs b = "let" <+> nest 2 (line <> vsep defs) <> line <+> "in" <+> nest 2 b

valBind :: OccNameStr -> Doc' -> Doc'
valBind l r = pretty l <+> "=" <+> r

(@::@) :: Doc' -> Doc' -> Doc'
(@::@) l r = l <+> "::" <+> r
sigP :: Doc' -> Doc' -> Doc'
sigP = (@::@)

cons :: Doc'
cons = "(:)"

forall' :: [Doc'] -> HsType' -> HsType'
forall' args r = "forall" <+> hsep args <+> "." <+> nest 2 r

tyPromotedVar :: RdrNameStr -> HsType'
tyPromotedVar x = "'" <> pretty x

guard l r = "|" <+> l <+> "=" <+> r

patSynSig :: OccNameStr -> Doc' -> HsDecl'
patSynSig occ t = "pattern" <+> pretty occ <+> "::" <+> t
patSynBind :: OccNameStr -> [OccNameStr] -> Pat' -> HsDecl'
patSynBind occ args p = "pattern" <+> pretty occ <+> hsep (fmap pretty args) <+> "=" <+> p
