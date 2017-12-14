{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedLabels           #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE TypeApplications           #-}

module Main where

import           Data.Default
import           Lens.Labels.Unwrapped ()
import           Lens.Micro
import           Lens.Micro.Extras (view)
import qualified Proto.Coffee.Order as P

-- | An error representing something going wrong during our transaction
--   * 'NotEnoughMoney' represents when a payment cannot fund a 'Coffee' order
--   * 'InvalidPin' a 'CardPayment' contained the wrong PIN
--   * 'NotPreparedForThisPayment' a payment type could not be match with
data TransactionError
  = NotEnoughMoney
  | InvalidPin
  | NotPreparedForThisPayment
  deriving Eq

instance Show TransactionError where
  show = showError
    where
      showError :: TransactionError -> String
      showError NotEnoughMoney =
        "Sorry, you don't have enough money."
      showError InvalidPin =
        "Sorry, you entered your PIN wrong."
      showError NotPreparedForThisPayment =
        "I'm just an intern!"

-- | Smart constructor for making an 'Americano'
--   with a price of €2.70
americano :: P.Coffee
americano =
  def & #cost      .~ 2.70
      & #americano .~ def

-- | Smart constructor for making an 'Latte'
--   with a price of €3.20
latte :: P.Coffee
latte =
  def & #cost  .~ 3.20
      & #latte .~ def

-- | Smart constructor for making an 'FlatWhite'
--   with a price of €3.30
flatWhite :: P.Coffee
flatWhite =
  def & #cost      .~ 3.30
      & #flatWhite .~ def

-- | Smart constructor for making an 'Americano'
--   with a price of €3.00
cappuccino :: P.Coffee
cappuccino =
  def & #cost       .~ 3.00
      & #cappuccino .~ def

-- | Smart constructor for making an 'Americano'
--   with a price of €3.50
mocha :: P.Coffee
mocha =
  def & #cost  .~ 3.50
      & #mocha .~ def

-- | A silly function showing that you can add milk to an Americano
--   but not the other coffees because they already have milk in them.
addMilkToAmericano :: P.Coffee -> P.Coffee
addMilkToAmericano coffee =
    coffee & #maybe'coffeeType . _Just . P._Coffee'Americano %~ id

-- | Process a 'CashPayment' for the total cost of an order
--   It validates that the amount given was sufficient
processCashPayment :: Float
                   -> P.CashPayment
                   -> Either TransactionError ()
processCashPayment amount payment
  | amount <= pay = pure ()
  | otherwise     = Left NotEnoughMoney
  where
    pay = payment ^. #amount

-- | Process a 'CardPayment' for the total cost of an order
--   It validates the PIN the customer entered and whether
--   their account contains enough funds
processCardPayment :: Float
                   -> P.CardPayment
                   -> Either TransactionError ()
processCardPayment amount payment =
  pinCheck *> balanceCheck
  where
    account = payment ^. #account
    pinCheck
      | account ^. #pinValidation == payment ^. #pin = pure ()
      | otherwise = Left InvalidPin

    balanceCheck
      | account ^. #currentBalance >= amount = pure ()
      | otherwise = Left NotEnoughMoney

-- | Calculate the total cost for a list of coffees
totalCost :: [P.Coffee] -> Float
totalCost = foldr ((+) . view #cost) 0

-- | Process an 'Order' depending on its payment type
--   Since the 'paymentMethod' is partial due to Protocol Buffers
--   being optional, we must account for the case of not finding
--   a correct payment method
takeOrder :: Float
          -> P.Order
          -> Either TransactionError ()
takeOrder amount order =
    maybe (Left NotPreparedForThisPayment) processPayment $
        order ^. #maybe'paymentMethod
    where
        processPayment (P.Order'Card card) =
            processCardPayment amount card
        processPayment (P.Order'Cash cash) =
            processCashPayment amount cash

main :: IO ()
main = do
  putStrLn "How can I help you?"
  putStrLn "Two americanos and a flat white please :)"

  let order1Coffees = [americano, americano, flatWhite]
      totalCost1    = totalCost order1Coffees

  putStrLn $ "That's €" ++ show totalCost1 ++ ". Will that be cash or card?"
  putStrLn "Cash, please"

  let order1 :: P.Order
      order1 =
        def & #coffees .~ [americano, americano, flatWhite]
            & #cash    .~ (def & #amount .~ totalCost1)

  putStrLn $ case takeOrder totalCost1 order1 of
    Left err -> show err
    Right _  -> "Next, please!"
