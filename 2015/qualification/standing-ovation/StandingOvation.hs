module StandingOvation where

import System.IO
import Data.Char

hGetLines :: Handle -> IO [String]
hGetLines h = hGetContents h >>= return . lines

solve :: [String] -> [String]
solve ins = []

main = do
    getLine

    lines <- withFile "./sample.in" ReadMode hGetLines

    mapM_ putStrLn (solve lines)

    putStrLn "lol"

    return ()
