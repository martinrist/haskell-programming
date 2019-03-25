module HaskellProgramming.Chapter17.ZipList where

import           Control.Applicative
import           Test.QuickCheck

instance Semigroup a => Semigroup (ZipList a) where
    (<>) = liftA2 (<>)

instance Monoid a => Monoid (ZipList a) where
    mempty = pure mempty
