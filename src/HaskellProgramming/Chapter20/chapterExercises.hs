module HaskellProgramming.Chapter20.ChapterExercises where

import Data.Monoid ()
import Data.Foldable ()

------------------------------------
-- Chapter 20 - Chapter Exercises --
------------------------------------

main :: IO ()
main = undefined

-- 1 - Constant
data Constant a b =
    Constant a

instance Foldable (Constant a) where
    foldMap _ (Constant _) = mempty


-- 2 - Two
data Two a b =
    Two a b

instance Foldable (Two a) where
    foldMap f (Two _ b) = f b


-- 3 - Three
data Three a b c =
    Three a b c

instance Foldable (Three a b) where
    foldMap f (Three _ _ c) = f c


-- 4 - Three '
data Three' a b =
    Three' a b b

instance Foldable (Three' a) where
    foldMap f (Three' _ _ b') = f b'


-- 5 - Four'
data Four' a b =
    Four' a b b b

instance Foldable (Four' a) where
    foldMap f (Four' _ _ _ b'') = f b''



-- Filter function for foldable types
filterF :: (Applicative f, Foldable t, Monoid (f a))
            => (a -> Bool) -> t a -> f a
filterF p = foldr (acc p) mempty
    where acc p' a fa =
              if p' a then mappend (pure a) fa else fa
