module HaskellProgramming.Chapter17.ApplicativeQuickCheckSpec where

import           Test.Hspec
import           Test.QuickCheck
import           Test.QuickCheck.Classes
import           Test.Hspec.Checkers

testList :: Spec
testList = do
    testBatch $ monoid (undefined :: [Int])
    testBatch $ applicative (undefined :: [(Int, Int, Char)])

spec :: Spec
spec = testList
