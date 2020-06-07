module HaskellProgramming.Chapter15.Exercises.First where

import HaskellProgramming.Chapter15.Exercises.Optional
import Test.QuickCheck
import Test.QuickCheck.Checkers

newtype First' a =
    First' { getFirst' :: Optional a }
    deriving (Eq, Show)

instance Semigroup (First' a) where
    First' Nada <> y           = y
    x           <> First' Nada = x
    x           <> _           = x

instance Monoid (First' a) where
    mempty = First' Nada

instance Arbitrary a => Arbitrary (First' a) where
    arbitrary = frequency [(1, return (First' Nada)),
                           (3, First' . Only <$> arbitrary)]

instance Eq a => EqProp (First' a) where
    (=-=) = eq
