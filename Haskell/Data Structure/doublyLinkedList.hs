data DoublyLinkedList a = Node (DoublyLinkedList a) a (DoublyLinkedList a)

linked :: Integer -> [a] -> [a]
linked n xs | n < 0 = (last xs):(init xs)
            | n > 0 = tail xs ++ [head xs]

fromList :: [a] -> DoublyLinkedList a
fromList xs = Node (fromList $ linked (-1) xs) (head xs) (fromList $ linked 1 xs)

printRight :: Integer -> DoublyLinkedList a -> [a]
printRight 0 _ = []
printRight n (Node _ x next) = x : (printRight (n-1) next)

printLeft :: Show a => Integer -> DoublyLinkedList a -> [a]
printLeft 0 _ = []
printLeft n (Node prev x _) = x : (printLeft (n-1) prev)