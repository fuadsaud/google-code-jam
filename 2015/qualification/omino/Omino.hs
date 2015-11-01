module Omino where

import Data.List.Split (splitOn)

data Omino = Omino Int Int Int

main = do
        t <- getLine
        contents <- getContents
        let problems = (parse $ lines contents)
        mapM_ (putStrLn . presentCase) (zip [1..] . solveAll $ problems)

parse :: [String] -> [Omino]
parse [] = []
parse (line:lines) = let [x, r, c] = splitOn " " line
                     in (Omino (read x) (read r) (read c)) : parse lines

presentCase :: (Int, Bool) -> String
presentCase (i, result)  = "Case #" ++ show i ++ ": " ++ presentResult result

presentResult :: Bool -> String
presentResult True  = "GABRIEL"
presentResult False = "RICHARD"

solveAll :: [Omino] -> [Bool]
solveAll = map solve

solve :: Omino -> Bool
solve o@(Omino x r c)
        | ((area o) `mod` x) /= 0        = False
        | area o >= 7                    = False
        | area o == 6 && (min r c) <=  3 = False
        | area o == 5 && ((min r c) <= 2 || ((min r c) == 3 && (max r c) == 5)) = False
        | area o == 4 && (min r c) <= 2  = False
        | area o == 3 && (min r c) <= 1  = False
        | otherwise                      = True

area :: Omino -> Int
area (Omino _ r c) = r * c
