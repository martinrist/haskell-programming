module HaskellProgramming.Chapter15.Exercises.Optional where

import           Test.QuickCheck
import           Test.QuickCheck.Checkers

data Optional a =
    Nada
    | Only a
    deriving (Eq, Show)

instance Semigroup a => Semigroup (Optional a) where
    Nada   <> Nada   = Nada
    Only a <> Nada   = Only a
    Nada   <> Only b = Only b
    Only a <> Only b = Only $ a <> b

instance Semigroup a => Monoid (Optional a) where
    mempty = Nada

instance Arbitrary a => Arbitrary (Optional a) where
    arbitrary = frequency [(1, return Nada),
                           (3, Only <$> arbitrary)]

instance Eq a => EqProp (Optional a) where
    (=-=) = eq
