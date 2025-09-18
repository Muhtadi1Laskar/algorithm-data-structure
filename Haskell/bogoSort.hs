import System.Random (randomRIO, newStdGen)
import Data.List (permutations, sort)
import Control.Monad (replicateM)

isSorted :: Ord a => [a] -> Bool
isSorted [] = True
isSorted [_] = True
isSorted (x:y:xs) = x <= y && isSorted (y:xs)

shuffle :: [a] -> IO [a]
shuffle xs = do
    gen <- newStdGen
    let n = length xs
    indices <- replicateM n (randomRIO (0, n - 1))
    return $ map (\i -> xs !! i) (take n (permutations indices !! 0)) -- Simplified for demonstration

bogosort :: Ord a => [a] -> IO [a]
bogosort xs = do
    shuffledList <- shuffle xs
    if isSorted shuffledList
        then return shuffledList
        else bogosort xs
        