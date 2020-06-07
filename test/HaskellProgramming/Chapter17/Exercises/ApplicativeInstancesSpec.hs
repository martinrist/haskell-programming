module HaskellProgramming.Chapter17.Exercises.ApplicativeInstancesSpec where

import           HaskellProgramming.Chapter17.Exercises.ApplicativeInstances
import           Data.Monoid
import           Test.Hspec
import           Test.QuickCheck.Classes
import           Test.Hspec.Checkers


type SSI = (String, String, Int)
type SSSumI = (String, String, Sum Int)

testPair :: Spec
testPair = context "Pair" $ do
    testBatch $ functor (undefined :: Pair SSI)
    testBatch $ applicative (undefined :: Pair SSI)

testTwo :: Spec
testTwo = context "Two" $ do
    testBatch $ functor (undefined :: Two SSI SSI)
    testBatch $ applicative (undefined :: Two SSSumI SSI)

testThree :: Spec
testThree = context "Three" $ do
    testBatch $ functor (undefined :: Three SSI SSI SSI)
    testBatch $ applicative (undefined :: Three SSSumI SSSumI SSI)

testThree' :: Spec
testThree' = context "Three'" $ do
    testBatch $ functor (undefined :: Three' SSI SSI )
    testBatch $ applicative (undefined :: Three' SSSumI SSI)

testFour :: Spec
testFour = context "Four" $ do
    testBatch $ functor (undefined :: Four SSI SSI SSI SSI)
    testBatch $ applicative (undefined :: Four SSSumI SSSumI SSSumI SSI)

testFour' :: Spec
testFour' = context "Four'" $ do
    testBatch $ functor (undefined :: Four' SSI SSI)
    testBatch $ applicative (undefined :: Four' SSSumI SSI)

spec :: Spec
spec = do
    testPair
    testTwo
    testThree
    testThree'
    testFour
    testFour'
