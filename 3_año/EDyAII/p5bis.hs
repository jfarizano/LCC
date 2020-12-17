import Prelude hiding (map, take, drop)
import Par

-- Ej 1
data BTree a = Empty | Node Int (BTree a) a (BTree a) deriving Show

size :: BTree a -> Int
size Empty = 0
size (Node s _ _ _) = s

nth :: BTree a -> Int -> a
nth (Node _ l x r) n | sl < n = nth l n
                     | sl > n = nth l (n - sl - 1)
                     | otherwise = x
                     where sl = size l

cons :: a -> BTree a -> BTree a
cons x Empty = Node 1 Empty x Empty
cons x (Node s l y r) = Node (s + 1) (cons x l) y r

tabulate :: (Int -> a) -> Int -> BTree a
tabulate _ 0 = Empty
tabulate f n = (Node n l (f mid) r)
               where
                 mid = div n 2
                 g = (\m -> f (m + mid + 1))
                 (l, r) = tabulate f mid ||| tabulate g (n - mid - 1)

map :: (a -> b) -> BTree a -> BTree b
map f Empty = Empty
map f (Node s l x r) = Node s nl (f x) nr
                       where
                         (nl, nr) = map f l ||| map f r

take :: Int -> BTree a -> BTree a
take 0 _ = Empty
take n Empty = Empty
take n (Node s l x r) | n < sl = take n l
                      | n > sl = Node (sl + snr + 1) l x nr
                      | otherwise = l
                      where
                        sl = size l
                        nr = (take (n - sl - 1) r)
                        snr = size nr

drop :: Int -> BTree a -> BTree a
drop 0 t = t
drop n Empty = Empty
drop n (Node s l x r) | n < sl = Node (s - n) (drop n l) x r
                      | n > sl = drop (n - sl - 1) r
                      | otherwise = Node (s - n) Empty x r
                      where
                        sl = size l

-- ----------------------------------------------------------------------------

-- Ej 3:

data Tree a = E | Leaf a | Join (Tree a) (Tree a) deriving Show

mapT :: (a -> b) -> Tree a -> Tree b
mapT f E          = E
mapT f (Leaf x)   = Leaf (f x)
mapT f (Join l r) = let (l', r') = mapT f l ||| mapT f r
                    in Join l' r'

reduceT :: (a -> a -> a) -> a -> Tree a -> a
reduceT _ e E = e
reduceT f e (Leaf x) = f e x
reduceT f e (Join l r) = let (l', r') = reduceT f e l ||| reduceT f e r
                         in f l' r'

mapreduceT :: (a -> b) -> (b -> b -> b) -> b -> Tree a -> b
mapreduceT _ _ e E          = e
mapreduceT f g e (Leaf x)   = g e $ f x
mapreduceT f g e (Join l r) = let (l', r') = mapreduceT f g e l ||| mapreduceT f g e r
                              in g l' r'

mejorGanancia :: Tree Int -> Int
mejorGanancia t = maxAll $ mapT (\(n, t') -> mapT (\m -> m - n) t') $ conSufijos t

sufijos :: Tree Int -> Tree (Tree Int)
sufijos E = E
sufijos t = sufijos' t E

sufijos' (Leaf x) acum = Leaf acum
sufijos' (Join l r) acum = case acum of
                            E ->  Join (sufijos' l r) (sufijos' r acum)
                            _ ->  Join (sufijos' l (Join r acum)) (sufijos' r acum)

conSufijos :: Tree Int -> Tree (Int, Tree Int)
conSufijos E = E
conSufijos t = conSufijos' t (sufijos t)

conSufijos' (Leaf n) (Leaf t) = Leaf (n, t)
conSufijos' (Join l r) (Join l' r') = Join (conSufijos' l l') (conSufijos' r r')

maxT :: Tree Int -> Int
maxT = reduceT max minBound

maxAll :: Tree (Tree Int) -> Int
maxAll = mapreduceT maxT max minBound

t :: Tree Int
t = Join (Join (Leaf 10) (Leaf 15)) (Leaf 20)