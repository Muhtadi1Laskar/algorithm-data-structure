binarySearch :: (Ord a) => [a] -> a -> Maybe Int
binarySearch [] _ = Nothing
binarySearch array target = binarySearch' array target 0 (length array - 1)
  where
    binarySearch' :: (Ord a) => [a] -> a -> Int -> Int -> Maybe Int
    binarySearch' array target low high
      | low > high = Nothing
      | otherwise = case compare midValue target of
                      EQ -> Just mid
                      LT -> binarySearch' array target (mid + 1) high
                      GT -> binarySearch' array target low (mid - 1)
      where
        mid = (low + high) `div` 2
        midValue = array !! mid
