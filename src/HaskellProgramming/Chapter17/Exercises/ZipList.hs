module HaskellProgramming.Chapter17.Exercises.ZipList where

import           Test.QuickCheck
import           Test.QuickCheck.Checkers
import           HaskellProgramming.Chapter17.Exercises.ListApplicative

newtype ZipList' a =
    ZipList' (List a)
    deriving (Eq, Show)

instance Eq a => EqProp (ZipList' a) where
    xs =-= ys = xs' `eq` ys'
      where
        xs' = let (ZipList' l) = xs in take' 3000 l
        ys' = let (ZipList' l) = ys in take' 3000 l

instance Arbitrary a => Arbitrary (ZipList' a) where
    arbitrary = ZipList' <$> arbitrary

instance Functor ZipList' where
    fmap f (ZipList' xs) = ZipList' $ fmap f xs

instance Applicative ZipList' where
    pure x = ZipList' $ toList (repeat x)
    ZipList' fs <*> ZipList' vs = ZipList' $ zipListApply fs vs
      where
        zipListApply Nil          _            = Nil
        zipListApply _            Nil          = Nil
        zipListApply (Cons f fs') (Cons v vs') = Cons (f v) (zipListApply fs' vs')
