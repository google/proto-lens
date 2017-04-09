{-# LANGUAGE ScopedTypeVariables #-}
-- | This internal module provides functions used to define the various
-- @enumFrom*@ functions of 'Enum'.
--
-- We expect 'fromEnum' to be an ordering homomorphism, that is:
--
-- @
-- forall a b. Enum a b
-- succ a == b => fromEnum a < fromEnum b
-- @
--
-- Note that this homomorphism is most likely not surjective.  Note further that
-- one cannot assume:
--
-- @
-- CANNOT BE ASSUMED !
-- succ a == b => fromEnum a + 1 == fromEnum b
-- @
--
-- The 'succ' essor of a given message enum value @A@ that's not 'maxBound' is
-- the enum value @B@ whose 'fromEnum' value is the one immediately after @A@'s
-- 'fromEnum' value.  That is, 'fromEnum' determines order, but not distance.
--
-- As an example, consider the enum in the test suite:
--
-- @
-- enum Baz {
--     BAZ1 = 1; BAZ2 = 2; BAZ3 = 4; BAZ4 = 6;
--     BAZ5 = 7; BAZ6 = 9; BAZ7 = 10; BAZ8 = 12;
-- }
-- @
--
-- In this case, @succ BAZ2@ is @BAZ3@ despite their fromEnum values differing
-- by 2.  Further, @[BAZ2, BAZ4 ..]@ or equivalently
-- @messageEnumFromThen BAZ2 BAZ4@ is every other enum (i.e. a distance of 2)
-- when taken as a list, i.e.  @[BAZ2, BAZ4, BAZ6, BAZ8]@ despite the
-- 'fromEnum' distances being @[4, 3, 3]@.
--
-- That said, it is highly unwise to use any of the @[a,b ..*]@ patterns or
-- @enumFromThen*@ functions since adding or removing enums values can cause
-- previously functioning code to fail.  I.e. removing @BAZ3@ in the above
-- example makes the result equivalent @fromEnum BAZ2@ and the sequence now
-- includes every enum value save @BAZ1@.  This is all despite the fact that
-- @BAZ3@ was never referenced.
module Data.ProtoLens.Message.Enum
    ( messageEnumFrom
    , messageEnumFromTo
    , messageEnumFromThen
    , messageEnumFromThenTo
    ) where

import Data.List (unfoldr)
import Data.Ord (comparing)

messageEnumFromTo :: Enum a => a -> a -> [a]
messageEnumFromTo start stop = case comparing fromEnum start stop of
    LT -> messageEnumFromThenTo start (succ start) stop
    -- The only time we can't call 'succ' on @start@ is if it's 'maxBound' which
    -- is >= all values by definition, so the below cases cover all possible
    -- cases where succ cannot be called.
    EQ -> [start]
    GT -> []

messageEnumFrom :: (Enum a, Bounded a) => a -> [a]
messageEnumFrom = flip messageEnumFromTo maxBound

messageEnumFromThen :: (Enum a, Bounded a) => a -> a -> [a]
messageEnumFromThen start step = case comparing fromEnum start step of
    LT -> messageEnumFromThenTo start step maxBound
    EQ -> repeat start
    GT -> messageEnumFromThenTo start step minBound

messageEnumFromThenTo :: forall a . Enum a => a -> a -> a -> [a]
messageEnumFromThenTo start step stop = case comparing fromEnum start step of
    LT -> helper succ GT
    EQ -> if stopInt >= stepInt then repeat start else []
    GT -> helper pred LT
  where
    stopInt = fromEnum stop
    stepInt = fromEnum step
    helper iter isAfter
        | comparing fromEnum start stop == isAfter = []
        | compare stepInt stopInt == isAfter = [start]
        | otherwise = start : unfoldr (fmap unfoldIter) (Just step)
      where
        -- This applies @iter@ (which is either succ or pred depending on our
        -- direction) @n@ times.  This returns @Just@ the result unless we've
        -- passed @stop@, in which case we return @Nothing@.
        jump 0 a = Just a
        jump n a
            | stopInt == fromEnum a = Nothing
            | otherwise = jump (n-1) $ iter a
        unfoldIter a = (a, jump skipCount a)
        countSkips :: Integer -> a -> Integer
        countSkips n start'
            | stepInt == fromEnum start' = n
            | otherwise = countSkips (n+1) $ iter start'
        -- This is the number of applications of @iter@ (again, either @succ@
        -- or @pred@) needed to get from @start@ to @step@.
        skipCount = countSkips 0 start

