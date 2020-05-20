import Prelude hiding (map, take, drop)

-- Ej 1:

data BTree a = Empty | Node Int (BTree a) a (BTree a) deriving Show

(|||) :: a -> a -> (a,a)
x ||| y = (x,y)

tree2List :: BTree a -> [a]
tree2List Empty = []
tree2List (Node _ l x r) = tree2List l ++ [x] ++ tree2List r

size :: BTree a -> Int
size Empty = 0
size (Node s _ _ _) = s

nth :: BTree a -> Int -> a
nth (Node s l x r) n | n == m = x
                     | n < m = nth l n
                     | otherwise = nth r (n - m -1)
                     where m = size l

cons :: a -> BTree a -> BTree a
cons x Empty = Node 1 Empty x Empty
cons x (Node n l y r) = Node (n + 1) (cons x l) y r

tabulate :: (Int -> a) -> Int -> BTree a
tabulate _ 0 = Empty
tabulate f n = let m = div n 2
                   x = f m
                   (l, r) = tabulate f m ||| (tabulate (f.(+(m+1))) (n - m -1))
                   in (Node n l x r)

map :: (a -> b) -> BTree a -> BTree b
map f Empty = Empty
map f (Node n l x r) = let (nl,nr) = map f l ||| map f r
                           y = f x
                           in Node n nl y nr

take :: Int -> BTree a -> BTree a
take 0 _ = Empty
take _ Empty = Empty
take n (Node s l x r) | n == m = l
                      | n < m = take n l
                      | otherwise = Node n l x (take (n - m -1) r)
                      where m = size l

drop :: Int -> BTree a -> BTree a
drop 0 s = s
drop _ Empty = Empty
drop n (Node s l x r) | n == m = (Node (s-m) Empty x r)
                      | n < m = (Node (s-n) (drop n l) x r)
                      | otherwise = drop (n - m - 1) r
                      where m = size l

t = Node 7 (Node 3 (Node 1 Empty 0 Empty) 1 (Node 1 Empty 2 Empty)) 3 (Node 3 (Node 1 Empty 4 Empty) 5 (Node 1 Empty 6 Empty))