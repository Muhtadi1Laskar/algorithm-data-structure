module Sorts.HeapSort where

listToSort :: [Integer]
listToSort = [13, 2, 3, 14, 17, 4, 1, 5, 16, 12, 9, 10, 15, 8, 7, 11, 18, 19, 6, 20]

heapSort :: (Ord a) => [a] -> [a]
heapSort [] = []
heapSort [x] = [x]
heapSort xs = heapSort' (maxHeap xs) []

heapSort' :: Ord a => [a] -> [a] -> [a]
heapSort' [] out = out
heapSort' h out = heapSort' (extract h) out ++ [head h] 

maxHeap :: Ord a => [a] -> [a]
maxHeap [] = []
maxHeap [x] = [x]
maxHeap xs = maxHeap' xs (div (length xs) 2)

maxHeap' :: Ord a => [a] -> Int -> [a]
maxHeap' xs 0 = maxHeapify xs 0
maxHeap' xs i = maxHeap' (maxHeapify xs i) (i-1)

maxHeapify :: (Ord a) => [a] -> Int -> [a]
maxHeapify xs i | not (hasAnyChild xs i) = xs
                | hasLeftChild xs i && hasRightChild xs i = 
                    let largestChild = if xs !! (leftChild i) > xs !! (rightChild i) then leftChild i else rightChild i
                    in if xs !! largestChild > xs !! i then maxHeapify (swap xs largestChild i) largestChild else xs
                | hasLeftChild xs i =
                    if xs !! (leftChild i) > xs !! i then maxHeapify (swap xs (leftChild i) i) (leftChild i) else xs
                | otherwise =
                    if xs !! (rightChild i) > xs !! i then maxHeapify (swap xs (rightChild i) i) (rightChild i) else xs


extract :: Ord a => [a] -> [a]
extract [] = []
extract [_] = []
extract xs = maxHeapify ((last xs):take (length xs - 2) (tail xs)) 0


swap :: [a] -> Int -> Int -> [a]
swap xs i1 i2 = map snd . foldr (\x a -> 
        if fst x == i1 then ys !! i2 : a
        else if fst x == i2 then ys !! i1 : a
        else x : a) [] $ ys
    where ys = zip [0..] xs

leftChild :: Int -> Int
leftChild i = 2 * i + 1

rightChild :: Int -> Int
rightChild i = 2 * i + 2

hasLeftChild, hasRightChild, hasAnyChild :: [a] -> Int -> Bool
hasLeftChild xs i = leftChild i < length xs

hasRightChild xs i = rightChild i < length xs

hasAnyChild xs i = hasLeftChild xs i || hasRightChild xs i


main :: IO ()
main = do
    putStrLn $ "Unsorted: " ++ show listToSort
    putStrLn $ "Sorted: " ++ show (heapSort listToSort)