module HaskellProgramming.Chapter17.Exercises.ConstantSpec where

import           HaskellProgramming.Chapter17.Exercises.Constant
import           Test.Hspec
import           Test.QuickCheck
import           Test.QuickCheck.Classes
import           Test.Hspec.Checkers


testConstant :: Spec
testConstant = do
    testBatch $ monoid (undefined :: Constant String String)
    testBatch $ applicative (undefined :: Constant (String, String, [Int]) (String, String, [Int]))

spec :: Spec
spec = testConstant
