module HaskellProgramming.Chapter06.Exercises.DoesItTypeCheck where

-- Question 1
{-# HLINT ignore Person "Use newtype instead of data" #-}
data Person =
    Person Bool
    deriving (Show)

{-# HLINT ignore printPerson "Use print" #-}
printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)

-- Question 2
data Mood
    = Blah
    | Woot
    deriving (Show, Eq)

settleDown :: Mood -> Mood
settleDown x =
    if x == Woot
        then Blah
        else x

-- Question 4
type Subject = String

type Verb = String

type Object = String

data Sentence =
    Sentence Subject
             Verb
             Object
    deriving (Eq, Show)

s1 :: Object -> Sentence
s1 = Sentence "dogs" "drool"

s2 :: Sentence
s2 = Sentence "Julie" "loves" "dogs"
