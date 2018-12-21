-- | Unit and property tests for of our custom parsing monad.
module Main (main) where

import qualified Data.ByteString as B
import Data.Either (isLeft)

import Test.QuickCheck
import Test.Framework (defaultMain, testGroup, Test)
import Test.Framework.Providers.QuickCheck2 (testProperty)

import Data.ProtoLens.Encoding.Bytes
import Data.ProtoLens.Encoding.Parser

main :: IO ()
main = defaultMain
    [ testGroup "getWord8" testGetWord8
    , testGroup "getBytes" testGetBytes
    , testGroup "getWord32le" testGetWord32le
    , testGroup "failure" testFailure
    ]

testGetWord8 :: [Test]
testGetWord8 =
    [ testProperty "atEnd" $ \ws -> runParser atEnd (B.pack ws) === Right (null ws)
    , testProperty "manyTillEnd"
            $ \ws -> runParser (manyTillEnd getWord8) (B.pack ws) === Right ws
    , testProperty "idem" $ \x -> x ==> x
    ]

testGetBytes :: [Test]
testGetBytes =
    [ testProperty "many"
            $ \ws -> let
                packed = map B.pack ws
                in runParser (mapM (getBytes . B.length) packed) (B.concat packed)
                    === Right packed
    ]

testGetWord32le :: [Test]
testGetWord32le =
    [ testProperty "align"
        $ \ws -> length ws `mod` 4 /= 0 ==>
                    counterexampleF isLeft (runParser (manyTillEnd getWord32le) (B.pack ws))
    , testProperty "manyTillEnd" $ \ws ->
            runParser (manyTillEnd getWord32le) (runBuilder $ foldMap putFixed32 ws)
                === Right ws
    ]

testFailure :: [Test]
testFailure =
    [ testProperty "fail-fast" $ \bs ->
        runParser (fail "abcde") (B.pack bs)
            === (Left "abcde" :: Either String ())
    , testProperty "<?>" $ \bs ->
        runParser (fail "abcde" <?> "fghij") (B.pack bs)
            === (Left "fghij: abcde" :: Either String ())
    ]

-- Since this is a test, just implement the slow stack-heavy way.
manyTillEnd :: Parser a -> Parser [a]
manyTillEnd p = do
    end <- atEnd
    if end
        then return []
        else do
            x <- p
            xs <- manyTillEnd p
            return $ x : xs

counterexampleF :: (Testable prop, Show a) => (a -> prop) -> a -> Property
counterexampleF f x = counterexample (show x) $ f x
