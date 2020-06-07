module HaskellProgramming.Chapter15.Examples where

import Test.QuickCheck
import HaskellProgramming.Chapter15.MonoidLaws
import Test.QuickCheck.Checkers

--------------------------------------------------
-- 15.12 - Using QuickCheck to test monoid laws --
--------------------------------------------------

-- Shortcuts
type S = String
type B = Bool


-- Example of a broken Monoid instance which shows we can't
-- return `False` as an identity
data Bull =
    Fools
  | Twoo
  deriving (Eq, Show)

instance Arbitrary Bull where
    arbitrary = frequency [ (1, return Fools)
                          , (1, return Twoo)]

instance Semigroup Bull where
    _ <> _ = Fools

instance Monoid Bull where
    mempty = Fools

type BullMappend = Bull -> Bull -> Bull -> Bool

runBullTests :: IO ()
runBullTests = do
    quickCheck (monoidAssoc :: BullMappend)
    quickCheck (monoidLeftIdentity :: Bull -> Bool)
    quickCheck (monoidRightIdentity :: Bull -> Bool)


-- An example of a type that has a `Semigroup` instance, but not a `Monoid`

data NonEmpty a =
    a :| [a]
    deriving (Eq, Ord, Show)

instance Semigroup (NonEmpty a) where
    (a :| as) <> (b :| bs) = a :| (as <> [b] <> bs)

instance Arbitrary a => Arbitrary (NonEmpty a) where
    arbitrary = do
        a <- arbitrary
        as <- arbitrary
        return (a :| as)

instance Eq a => EqProp (NonEmpty a) where
    (a :| as) =-= (b :| bs) = (a `eq` b) .&&. (as `eq` bs)
--    (a :| _) =-= (b :| _) = a `eq` b
