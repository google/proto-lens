{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeApplications #-}
module LibUtil (makeMessage) where

import Data.ProtoLens (defMessage)
import Proto.Lib

makeMessage :: LibMessage
makeMessage = defMessage
