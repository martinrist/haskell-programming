module HaskellProgramming.Chapter17.Exercises.Lookups where

import Data.List (elemIndex)


-- Question 1

added :: Maybe Integer
added = (+ 3) <$> lookup (3 :: Int) (zip [1, 2, 3] [4, 5, 6])


-- Question 2

y2 :: Maybe Integer
y2 = lookup (3 :: Int) $ zip [1, 2, 3] [4, 5, 6]

z2 :: Maybe Integer
z2 = lookup (3 :: Int) $ zip [1, 2, 3] [4, 5, 6]

tupled :: Maybe (Integer, Integer)
tupled = (,) <$> y2 <*> z2


-- Question 3

x3 :: Maybe Int
x3 = elemIndex (3 :: Int) [1, 2, 3, 4, 5]

y3 :: Maybe Int
y3 = elemIndex (4 :: Int) [1, 2, 3, 4, 5]

max' :: Int -> Int -> Int
max' = max

maxed :: Maybe Int
maxed = max' <$> x3 <*> y3


-- Question 4
xs4 :: [Int]
xs4 = [1, 2, 3]

ys4 :: [Int]
ys4 = [4, 5, 6]

x4 :: Maybe Int
x4 = lookup 3 $ zip xs4 ys4

y4 :: Maybe Int
y4 = lookup 2 $ zip xs4 ys4

summed :: Maybe Int
summed = sum <$> ((,) <$> x4 <*> y4)
