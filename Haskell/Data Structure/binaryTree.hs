module BinaryTree.BinaryTree where

import qualified Data.List as L

data BTree a = Empty | Node a (BTree a) (BTree a) deriving (Show)
data Side = LeftSide | RightSide deriving (Eq, Show)

getSubTree :: Side -> BTree a -> BTree a
getSubTree _ Empty = Empty
getSubTree s (Node _ l r) = if s == LeftSide then l else r

getLeftTree :: BTree a -> BTree a
getLeftTree Empty = Empty
getLeftTree (Node _ l _) = l

getRightTree :: BTree a -> BTree a
getRightTree Empty = Empty
getRightTree (Node _ _ r) = r

nodeShow :: (Show a) => BTree a -> String
nodeShow Empty = ""
nodeShow (Node val _ _) = show val

dfsList :: BTree a -> [a]
dfsList Empty = []
dfsList (Node n l r) = [n] ++ (dfsList l) ++ (dfsList r)

bfsList :: BTree a -> [a]
bfsList Empty = []
bfsList t = concat $ takeWhile (\l -> (length l) > 0) [getLevel i 0 t | i <- [0..]]

getLevel :: (Num b, Enum b, Eq b) => b -> b -> BTree a -> [a]
getLevel _ _ Empty = []
getLevel 0 _ (Node n l r) = [n]
getLevel level i (Node n l r)
    | i == level = [n]
    | otherwise = (getLevel level (i+1) l) ++ (getLevel level (i+1) r)

getLevels :: BTree a -> [[a]]
getLevels t = takeWhile (\l -> (length l) > 0) [getLevel i 0 t | i <- [0..]]

getDepth :: BTree a -> Int
getDepth t = length $ getLevels t

fromList :: [a] -> BTree a
fromList lst = fromListInt 0 lst

fromListInt :: Int -> [a] -> BTree a
fromListInt _ [] = Empty
fromListInt i lst@(x:xs) = Node x (fromListInt (2*i + 1) (drop (i+1) lst)) 
                                  (fromListInt (2*i + 2) (drop (i+2) lst))

numNodes :: BTree a -> Int
numNodes t = length $ bfsList t

simplePrint :: (Show a) => BTree a -> String
simplePrint Empty = ""
simplePrint t = (nodeShow t) ++ " " ++ (simplePrint $ getLeftTree t) ++ (simplePrint $ getRightTree t)