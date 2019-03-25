module HaskellProgramming.Chapter17.Exercises.Validation where

import Test.QuickCheck hiding (Success, Failure)
import Control.Applicative
import Test.QuickCheck.Checkers

data Validation e a =
    Failure e
    | Success a
    deriving (Eq, Show)

data Errors =
    DividedByZero
  | StackOverflow
  | MooglesChewedWires
  deriving (Eq, Show)

instance (Arbitrary e, Arbitrary a) => Arbitrary (Validation e a) where
    arbitrary = oneof [Failure <$> arbitrary, Success <$> arbitrary]

instance (Eq e, Eq a) => EqProp (Validation e a) where
    Failure e =-= Failure e' = e `eq` e'
    Success a =-= Success a' = a `eq` a'

instance Functor (Validation e) where
    fmap _ (Failure x) = Failure x
    fmap f (Success a) = Success (f a)

instance Monoid e => Applicative (Validation e) where
    pure = Success
    (Failure f) <*> (Failure v) = Failure (f `mappend` v)
    _           <*> (Failure v) = Failure v
    (Failure f) <*> _           = Failure f
    (Success f) <*> (Success v) = Success (f v)
