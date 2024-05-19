data List a = Nil | Cons a (List a) deriving (Show)

headCons :: a -> List a -> List a
headCons x xs = Cons x xs

isEmpty :: List a -> Bool
isEmpty Nil = True
isEmpty _ = False

head :: List a -> Maybe a
head Nil = Nothing
head (Cons x _) = Just x

tail :: List a -> List a
tail Nil = Nil
tail (Cons _ xs) = xs

prepend :: a -> List a -> List a
prepend x xs = Cons x xs

append :: a -> List a -> List a
append x Nil = Cons x Nil
append x xs = xs ++ Cons x Nil

appendIter :: a -> List a -> List a
appendIter x xs = 
  let result = foldr (\acc y -> Cons y acc) Nil xs
  in Cons x result

length :: List a -> Int
length Nil = 0
length (Cons _ xs) = 1 + length xs

lengthIter :: List a -> Int
lengthIter xs = foldl (\acc _ -> acc + 1) 0 xs

elementAt :: Int -> List a -> Maybe a
elementAt _ Nil = Nothing
elementAt 0 (Cons x _) = Just x
elementAt i (Cons _ xs) = elementAt (i - 1) xs

elementAtIter :: Int -> List a -> Maybe a
elementAtIter i xs 
  | i < 0 || isEmpty xs = Nothing
  | otherwise = iterate head (drop i xs) >>= head

reverse :: List a -> List a
reverse Nil = Nil
reverse xs = foldr (\x acc -> Cons x acc) Nil xs

reverseIter :: List a -> List a
reverseIter xs = foldl (\acc x -> prepend x acc) Nil xs
