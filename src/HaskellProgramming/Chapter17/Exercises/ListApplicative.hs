module HaskellProgramming.Chapter17.Exercises.ListApplicative where

import           Test.QuickCheck
import           Control.Applicative

data List a =
    Nil
    | Cons a (List a)
    deriving (Eq, Show)

instance Arbitrary a => Arbitrary (List a) where
    arbitrary = oneof [return Nil, liftA2 Cons arbitrary arbitrary]

instance Functor List where
    fmap _ Nil           = Nil
    fmap f (Cons a rest) = Cons (f a) (fmap f rest)

append :: List a -> List a -> List a
append Nil         ys = ys
append (Cons x xs) ys = Cons x $ xs `append` ys

fold :: (a -> b -> b) -> b -> List a -> b
fold _ b Nil        = b
fold f b (Cons h t) = f h (fold f b t)

concat' :: List (List a) -> List a
concat' = fold append Nil

flatMap :: (a -> List b) -> List a -> List b
flatMap f as = concat' $ fmap f as

instance Applicative List where
    pure a = Cons a Nil
    fs <*> vs = flatMap (`fmap` vs) fs

take' :: Int -> List a -> List a
take' _ Nil         = Nil
take' 0 _           = Nil
take' n (Cons a as) = Cons a (take' (n - 1) as)

toList :: [a] -> List a
toList = foldr Cons Nil
