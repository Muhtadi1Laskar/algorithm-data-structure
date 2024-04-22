linearSearch :: Eq a => a -> [a] -> Maybe Int
linearSearch _ [] = Nothing
linearSearch target (x:xs)
  | target == x   = Just 0
  | otherwise     = fmap (+1) (linearSearch target xs)

main :: IO ()
main = do
  let list = [3, 5, 7, 9, 11]
  print $ linearSearch 7 list  -- Output: Just 2
  print $ linearSearch 12 list -- Output: Nothing
