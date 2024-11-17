module Sorts.ShellSort where
import Sorts.InsertionSort

gaps :: Int -> [Int]
gaps n = reverse (takeWhile (< n) tokuda)

tokuda :: [Int]
tokuda = [gap n | n <- [1..]]

gap :: (Integral a) => a -> a
gap k = ceiling (gap' k)

gap' :: (Integral a) => a -> Double
gap' 1 = 1
gap' k = 2.25 * gap' (k - 1) + 1

shellSort :: (Ord a) => [a] -> [a]
shellSort xs = shellSort' xs (gaps (length xs))

-- Recursive helper function for shellSort
shellSort' :: (Ord a) => [a] -> [Int] -> [a]
shellSort' [] _ = []
shellSort' [x] _ = [x]
shellSort' l [] = l
shellSort' l (g:gs) = shellSort' (combine [insertionSort (getSub l g i) | i <- [0..g-1]]) gs

getSub :: (Ord a) => [a] -> Int -> Int -> [a]
getSub [] _ _ = []
getSub l g i = [l !! e | e <- [i, i+g..length l - 1]] 

combine :: [[a]] -> [a]
combine [] = []
combine l@(xs:_)
        | length xs == 0 = []
        | otherwise = [x | (x:_) <- l] ++ combine (map (drop 1) l)

main :: IO ()
main = do
    putStrLn $ "Unsorted: " ++ show listToSort
    putStrLn $ "Sorted: " ++ show (shellSort listToSort)