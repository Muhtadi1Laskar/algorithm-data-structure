module DataStructures.MaxHeap where

maxHeap :: Ord a => [a] -> [a]
maxHeap [] = []
maxHeap [x] = [x]
maxHeap xs = maxHeap' xs (div (length xs) 2)

insert :: Ord a => [a] -> a -> [a]
insert [] e = [e]
insert xs e = upHeapify (xs ++ [e]) (length xs)


maxHeap' :: Ord a => [a] -> Int -> [a]
maxHeap' xs 0 = maxHeapify xs 0
maxHeap' xs i = maxHeap' (maxHeapify xs i) (i-1)

upHeapify :: Ord a => [a] -> Int -> [a]
upHeapify xs 0 = xs
upHeapify xs i | xs !! i <= xs !! ip = xs
               | otherwise = upHeapify (swap xs i ip) ip
                where
                    ip = parent i

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

delete :: Ord a => [a] -> a -> [a]
delete [] _ = []
delete xs e = let i' = (search xs e)
                  f = if xs !! (length xs - 1) > e then upHeapify else maxHeapify
                  in case i' of 
                      Nothing -> xs
                      Just i  -> f (take ((length xs) - 1) (swap xs i ((length xs) - 1))) i

search :: Eq a => [a] -> a -> Maybe Int
search xs e = search' xs e 0 

search' :: Eq a => [a] -> a -> Int -> Maybe Int
search' [] _ _ = Nothing
search' (x:xs) e i | e == x = Just i
                   | otherwise = search' xs e (i+1)

swap :: [a] -> Int -> Int -> [a]
swap xs i1 i2 = map snd . foldr (\x a -> 
        if fst x == i1 then ys !! i2 : a
        else if fst x == i2 then ys !! i1 : a
        else x : a) [] $ ys
    where ys = zip [0..] xs

leftChild :: Int -> Int
leftChild i = 2 * i + 1

rightChild i = 2 * i + 2

parent ::  Int -> Int
parent i = floor (fromIntegral (div (i-1) 2))

hasLeftChild, hasRightChild, hasAnyChild :: [a] -> Int -> Bool
hasLeftChild xs i = leftChild i < length xs

hasRightChild xs i = rightChild i < length xs

hasAnyChild xs i = hasLeftChild xs i || hasRightChild xs i