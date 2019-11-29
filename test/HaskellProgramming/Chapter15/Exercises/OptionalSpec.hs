module HaskellProgramming.Chapter15.Exercises.OptionalSpec where

import Test.Hspec
import Data.Monoid
import HaskellProgramming.Chapter15.Exercises.Optional
import Test.QuickCheck
import Test.QuickCheck.Classes
import Test.Hspec.Checkers

testOptional :: Spec
testOptional = context "Monoid instance for Optional" $ do
    it "Correctly `mappend`s two `Only Sum`s" $
        Only (Sum 1) `mappend` Only (Sum 1) `shouldBe` Only (Sum 2)
    it "Correctly `mappend`s two `Only Product`s" $
        Only (Product 4) `mappend` Only (Product 2) `shouldBe` Only (Product 8)
    it "Correctly `mappend`s `Only Sum` with `Nada`" $
        Only (Sum 1) `mappend` Nada `shouldBe` Only (Sum 1)
    it "Correctly `mappend`s `Only []` with `Nada`" $
        Only [1] `mappend` Nada `shouldBe` Only [1]
    it "Correctly `mappend`s `Nada` with `Only`" $
        Nada `mappend` Only (Sum 1) `shouldBe` Only (Sum 1)
    it "Correctly `mappend`s `Nada` with `Nada`" $
        Nada `mappend` Nada `shouldBe` (Nada :: Optional (Sum Int))

testOptionalWithCheckers :: Spec
testOptionalWithCheckers =
    context "Semigroup for Optional" $ do
        testBatch $ semigroup (undefined :: (Optional String, Int))
        testBatch $ monoid (undefined :: Optional String)

spec :: Spec
spec = do
    testOptional
    testOptionalWithCheckers
