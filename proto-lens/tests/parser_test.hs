-- | Unit and property tests for our custom parsing monad.
module Main (main) where

import qualified Data.ByteString as B
import Data.Either (isLeft)

import Test.QuickCheck
import Test.Tasty (defaultMain, testGroup, TestTree)
import Test.Tasty.QuickCheck (testProperty)

import Data.ProtoLens.Encoding.Bytes
import Data.ProtoLens.Encoding.Parser

main :: IO ()
main = defaultMain $ testGroup "tests"
    [ testGroup "Parser" testParser
    , testGroup "getWord8" testGetWord8
    , testGroup "getBytes" testGetBytes
    , testGroup "getWord32le" testGetWord32le
    , testGroup "failure" testFailure
    , testGroup "isolate" testIsolate
    ]

testParser :: [TestTree]
testParser =
    -- Test out the Applicative instance by using "traverse" to read the same number of bytes
    -- as in the input.
    -- "traverse (const f) g" runs f once for every element of g.
    [ testProperty "traverse" $ \ws -> runParser (traverse (const getWord8) ws)
                                        (B.pack ws)
                                    === Right ws
    ]

testGetWord8 :: [TestTree]
testGetWord8 =
    [ testProperty "atEnd" $ \ws -> runParser atEnd (B.pack ws) === Right (null ws)
    , testProperty "manyTillEnd"
            $ \ws -> runParser (manyTillEnd getWord8) (B.pack ws) === Right ws
    ]

testGetBytes :: [TestTree]
testGetBytes =
    [ testProperty "many"
            $ \ws -> let
                packed = map B.pack ws
                in runParser (mapM (getBytes . B.length) packed) (B.concat packed)
                    === Right packed
    , testProperty "negative length"
        $ \n ws -> n < 0 ==> counterexampleF isLeft
                                (runParser (getBytes n) $ B.pack ws)
    ]

testGetWord32le :: [TestTree]
testGetWord32le =
    [ testProperty "align"
        $ \ws -> length ws `mod` 4 /= 0 ==>
                    counterexampleF isLeft (runParser (manyTillEnd getWord32le) (B.pack ws))
    , testProperty "manyTillEnd" $ \ws ->
            runParser (manyTillEnd getWord32le) (runBuilder $ foldMap putFixed32 ws)
                === Right ws
    ]

testFailure :: [TestTree]
testFailure =
    [ testProperty "fail-fast" $ \bs ->
        runParser (fail "abcde") (B.pack bs)
            === (Left "abcde" :: Either String ())
    , testProperty "<?>" $ \bs ->
        runParser (fail "abcde" <?> "fghij") (B.pack bs)
            === (Left "fghij: abcde" :: Either String ())
    ]

testIsolate :: [TestTree]
testIsolate =
    [ testProperty "many" $ \bs bs' ->
        runParser ((,) <$> (isolate (length bs) $ manyTillEnd getWord8) <*>
                        (manyTillEnd getWord8))
            (B.pack (bs ++ bs'))
            == Right (bs, bs')
    , testProperty "negative length" $ \n ws ->
        n < 0 ==> counterexampleF isLeft $ runParser (isolate n getWord8) $ B.pack ws
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
