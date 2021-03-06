module HaskellProgramming.Chapter17.Exercises.ValidationSpec where

import           HaskellProgramming.Chapter17.Exercises.Validation
import           Test.Hspec
import           Test.QuickCheck.Classes
import           Test.Hspec.Checkers

testValidation :: Spec
testValidation =
    testBatch $ applicative (undefined :: Validation [String] (String, String, Int))

spec :: Spec
spec = testValidation
