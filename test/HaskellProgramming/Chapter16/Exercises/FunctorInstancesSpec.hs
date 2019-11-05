module HaskellProgramming.Chapter16.Exercises.FunctorInstancesSpec where

import           HaskellProgramming.Chapter16.Exercises.FunctorInstances
import           HaskellProgramming.Chapter16.FunctorLaws
import           Test.Hspec
import           Test.Hspec.Checkers
import           Test.QuickCheck
import           Test.QuickCheck.Classes


-- Question 2 - BoolAndSomethingElse

testBoolAndSomethingElse :: Spec
testBoolAndSomethingElse = context "BoolAndSomethingElse" $ do
    it "Obeys Functor identity law"
        $ property (functorIdentity :: FunctorIdentity BoolAndSomethingElse Int)
    it "Obeys Functor composition law" $ property
              (functorCompose :: FunctorCompose BoolAndSomethingElse Int String Int)

    -- This test uses `checkers` to reduce the amount of boilerplate
    testBatch
        $ functor (undefined :: BoolAndSomethingElse (Int, String, Double))

-- Question 3 - BoolAndMaybeSomethingElse

testBoolAndMaybeSomethingElse :: Spec
testBoolAndMaybeSomethingElse = context "BoolAndMaybeSomethingElse" $ do
    it "Obeys Functor identity law"
        $ property (functorIdentity :: FunctorIdentity BoolAndMaybeSomethingElse Int)
    it "Obeys Functor composition law" $ property
        (functorCompose :: FunctorCompose BoolAndMaybeSomethingElse Int String Int)

    -- This test uses `checkers` to reduce the amount of boilerplate
    testBatch $ functor (undefined :: BoolAndMaybeSomethingElse (Int, String, Double))


spec :: Spec
spec = do
    testBoolAndSomethingElse
    testBoolAndMaybeSomethingElse
