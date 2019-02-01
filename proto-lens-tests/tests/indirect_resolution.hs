{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeApplications #-}
module Main (main) where

import Data.ProtoLens (defMessage)
import Lens.Family ((.~), (&))
import LibUtil (makeMessage)
import Proto.Lib_Fields (value)
-- The following line lets the build succeed, even though the module is already
-- imported transitively.
-- import Proto.Lib ()

main :: IO ()
main = print $ makeMessage /= x
  where
    x = defMessage & value .~ 42
