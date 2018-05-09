{-# LANGUAGE OverloadedStrings #-}

module Main where

import Proto.Person as P
import Proto.Person_Fields as P
import Data.ProtoLens (def, showMessage)
import Lens.Micro

person :: P.Person
person =
  def & P.name      .~ "Fintan"
      & P.age       .~ 24
      & P.addresses .~ [address]
  where
    address :: P.Address
    address =
      def & P.street  .~ "Yolo street"
          & P.zipCode .~ "D8"


main :: IO ()
main = do
  putStrLn . showMessage $ person
