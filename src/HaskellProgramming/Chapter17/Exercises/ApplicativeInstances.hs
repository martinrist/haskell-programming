module HaskellProgramming.Chapter17.Exercises.ApplicativeInstances where

import           Test.QuickCheck
import           Test.QuickCheck.Checkers
import           Control.Applicative

-- Question 1 - `Pair a`

data Pair a = Pair a a
    deriving (Eq, Show)

instance Eq a => EqProp (Pair a) where
    (=-=) = eq

instance Arbitrary a => Arbitrary (Pair a) where
    arbitrary = liftA2 Pair arbitrary arbitrary

instance Functor Pair where
    fmap f (Pair x y) = Pair (f x) (f y)

instance Applicative Pair where
    pure a = Pair a a
    Pair f1 f2 <*> Pair v1 v2 = Pair (f1 v1) (f2 v2)


-- Question 2 - `Two a b`

data Two a b = Two a b
    deriving (Eq, Show)

instance (Eq a, Eq b) => EqProp (Two a b) where
    (=-=) = eq

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
    arbitrary = liftA2 Two arbitrary arbitrary

instance Functor (Two a) where
    fmap f (Two x y) = Two x (f y)

instance Monoid a => Applicative (Two a) where
    pure = Two mempty
    Two a b <*> Two a' b' = Two (a <> a') (b b')


-- Question 3 - `Three a b c`

data Three a b c = Three a b c
    deriving (Eq, Show)

instance (Eq a, Eq b, Eq c) => EqProp (Three a b c) where
    (=-=) = eq

instance (Arbitrary a, Arbitrary b, Arbitrary c) => Arbitrary (Three a b c) where
    arbitrary = liftA3 Three arbitrary arbitrary arbitrary

instance Functor (Three a b) where
    fmap f (Three x y z) = Three x y (f z)

instance (Monoid a, Monoid b) => Applicative (Three a b) where
    pure = Three mempty mempty
    Three a b c <*> Three a' b' c' = Three (a <> a') (b <> b') (c c')


-- Question 4 - `Three' a b`

data Three' a b = Three' a b b
    deriving (Eq, Show)

instance (Eq a, Eq b) => EqProp (Three' a b) where
    (=-=) = eq

instance (Arbitrary a, Arbitrary b) => Arbitrary (Three' a b) where
    arbitrary = liftA3 Three' arbitrary arbitrary arbitrary

instance Functor (Three' a) where
    fmap f (Three' x y z) = Three' x (f y) (f z)

instance Monoid a => Applicative (Three' a) where
    pure x = Three' mempty x x
    Three' a b c <*> Three' a' b' c' = Three' (a <> a') (b b') (c c')



-- Question 5 - `Four a b c d`

data Four a b c d = Four a b c d
    deriving (Eq, Show)

instance (Eq a, Eq b, Eq c, Eq d) => EqProp (Four a b c d) where
    (=-=) = eq

instance (Arbitrary a, Arbitrary b, Arbitrary c, Arbitrary d) => Arbitrary (Four a b c d) where
    arbitrary = Four <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary

instance Functor (Four a b c) where
    fmap f (Four w x y z) = Four w x y (f z)

instance (Monoid a, Monoid b, Monoid c) => Applicative (Four a b c) where
    pure = Four mempty mempty mempty
    Four a b c d <*> Four a' b' c' d' = Four (a <> a') (b <> b') (c <> c') (d d')


-- Question 6 - `Four` a b`

data Four' a b = Four' a a a b
    deriving (Eq, Show)

instance (Eq a, Eq b) => EqProp (Four' a b) where
    (=-=) = eq

instance (Arbitrary a, Arbitrary b) => Arbitrary (Four' a b) where
    arbitrary = Four' <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary

instance Functor (Four' a) where
    fmap f (Four' w x y z) = Four' w x y (f z)

instance Monoid a => Applicative (Four' a) where
    pure = Four' mempty mempty mempty
    Four' a b c d <*> Four' a' b' c' d' = Four' (a <> a') (b <> b') (c <> c') (d d')

