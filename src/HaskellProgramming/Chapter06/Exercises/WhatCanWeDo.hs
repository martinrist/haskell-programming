module HaskellProgramming.Chapter06.Exercises.WhatCanWeDo where

{-# HLINT ignore Rocks "Use newtype instead of data" #-}
data Rocks =
    Rocks String
    deriving (Eq, Show, Ord)

{-# HLINT ignore Yeah "Use newtype instead of data" #-}
data Yeah =
    Yeah Bool
    deriving (Eq, Show, Ord)

data Papu =
    Papu Rocks
         Yeah
    deriving (Eq, Show, Ord)

-- Question 1
--phew = Papu "chases" True
phew :: Papu
phew = Papu (Rocks "chases") (Yeah True)

-- Question 2
truth :: Papu
truth = Papu (Rocks "chomskydoz") (Yeah True)

-- Question 3
equalityForAll :: Papu -> Papu -> Bool
equalityForAll p p' = p == p'

-- Question 4
comparePapus :: Papu -> Papu -> Bool
comparePapus p p' = p > p'
