module HaskellProgramming.Chapter16.FunctorLaws where

import Test.QuickCheck.Function

-- Functor Identity
type FunctorIdentity f a = f a -> Bool

{-# HLINT ignore functorIdentity "Functor law" #-}
functorIdentity :: (Functor f, Eq (f a)) => FunctorIdentity f a
functorIdentity x = fmap id x == x


type FunctorCompose f a b c = f a -> Fun a b -> Fun b c -> Bool

{-# HLINT ignore functorCompose "Functor law" #-}
functorCompose :: (Eq (f c), Functor f) => FunctorCompose f a b c
functorCompose x (Fun _ f) (Fun _ g) = fmap (g . f) x == (fmap g . fmap f $ x)
