module HaskellProgramming.Chapter17.Exercises.ZipListSpec where

import           HaskellProgramming.Chapter17.Exercises.ZipList
import           Test.Hspec
import           Test.QuickCheck
import           Test.QuickCheck.Classes
import           Test.Hspec.Checkers


testZipList :: Spec
testZipList = do
    testBatch $ applicative (undefined :: ZipList' (String, String, Int))

spec :: Spec
spec = testZipList
