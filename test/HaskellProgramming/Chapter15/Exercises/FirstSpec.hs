module HaskellProgramming.Chapter15.Exercises.FirstSpec where

import Test.Hspec
import Test.Hspec.Checkers
import Data.Monoid
import Test.QuickCheck
import Test.QuickCheck.Classes
import HaskellProgramming.Chapter15.Exercises.First
import HaskellProgramming.Chapter15.MonoidLaws

type FirstMappend = First' String -> First' String -> First' String -> Bool
type FirstId = First' String -> Bool

testFirst :: Spec
testFirst = context "Monoid instance for First" $ do
    it "Satisfies associativity law" $
        property (monoidAssoc :: FirstMappend)
    it "Satisfies left identity law" $
        property (monoidLeftIdentity :: FirstId)
    it "Satisfies right identity law" $
        property (monoidRightIdentity :: FirstId)

testFirstUsingCheckers :: Spec
testFirstUsingCheckers = context "Monoid for First" $ do
    testBatch $ semigroup (undefined :: (First' String, Int))
    testBatch $ monoid (undefined :: First' String)


spec :: Spec
spec = do
    testFirst
    testFirstUsingCheckers
