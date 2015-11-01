import Data.List.Split (splitOn)
import Data.Char (isDigit)
import Data.List (insert, sortBy)
import Data.Function (on)

data Haircut = Haircut { n :: Int, barbers :: [Barber] }

data Barber = Barber { i :: Int, time :: Int, originalTime :: Int } deriving Eq

instance Ord Barber where
    (Barber _ t1 _) `compare` (Barber _ t2 _) = t1 `compare` t2

main = do
        t <- getLine
        contents <- getContents
        let problems = (parse $ lines contents)
        mapM_ (putStrLn . presentCase) (zip [1..] . solveAll $ problems)

presentCase :: (Int, Int) -> String
presentCase (i, result) = "Case #" ++ show i ++ ": " ++ show result

parse :: [String] -> [Haircut]
parse [] = []
parse (bn:m:xs) = haircut:(parse xs)
  where
      haircut = let (_, n) = span isDigit bn
                    m'     = splitOn " " $ m
                    in Haircut (read n) (map barber . zip [1..] $ m')
      barber (i, t) = Barber i (read t) (read t)

solveAll :: [Haircut] -> [Int]
solveAll = map solve

solve :: Haircut -> Int
solve (Haircut n barbers) = i . head . head . drop (n'' - 2) . iterate solve' $ barbers
  where
      solve' = cutHair . sortBarbers
      n' = n `mod` qt
      n'' = case n' of
               0 -> qt
               _ -> n'
      m = foldl lcm 1 ots
      qt = foldl (\acc t -> acc + m `div` t) 0 ots
      ots = map originalTime barbers

sortBarbers :: [Barber] -> [Barber]
sortBarbers = sortBy (compare `on` time)

cutHair :: [Barber] -> [Barber]
cutHair (Barber i t ot:bs) = insert (Barber i ot ot) . map (subBarber t) $ bs
  where
      subBarber t (Barber i bt bot) = Barber i (bt - t) bot
