module HaskellProgramming.Chapter15.NonEmptySpec where

import HaskellProgramming.Chapter15.Examples
import Test.Hspec
import Test.Hspec.Checkers
import Test.QuickCheck.Classes

testNonEmpty :: Spec
testNonEmpty = fcontext "Monoid for `NonEmpty`" $
    testBatch $ semigroup (undefined :: (NonEmpty String, Int))

spec :: Spec
spec = testNonEmpty
