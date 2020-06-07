module HaskellProgramming.Chapter05.Exercises.Arith3Broken where

main :: IO ()
main = do
    print (1 + 2 :: Int)
    putStrLn "10"
    print (negate (-1 :: Int))
    print ((+) 0 blah)
  where
    blah = negate 1 :: Int
