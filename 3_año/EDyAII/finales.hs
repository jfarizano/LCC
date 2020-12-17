import Seq
import Par
import qualified Arr as A
import ArrSeq

{-
tad Bosque (V : Ordered Set) where
  import Bool, Conjunto
  nuevo : Conjunto V -> Bosque V
  nuevoLado : (V, V) -> Bosque V -> Bosque V
  esVertice : V -> Bosque V -> Bool
  esLado : (V, V) -> Bosque V -> Bool
  camino : V -> V -> Bosque V -> Bool

  -- a)
esVertice v (nuevo xs) = if v \in xs then True else False
esVertice v (nuevoLado (x, y) b) = esVertice b
-}

-- -- b)
-- data GTree a = Node a [GTree a] deriving Show
-- type Bosque a = [GTree a]

-- nuevo :: [a] -> Bosque a
-- nuevo xs = Prelude.map (\x -> Node x []) xs

-- esVertice :: Eq a => a -> Bosque a -> Bool
-- esVertice _ [] = False
-- esVertice v ((Node x _) : b) = v == x || esVertice v b

{-
-- c)
elem x [] = False
elem x (y:ys) = x == y || elem x ys

elem x xs => esVertice x (nuevo xs)

Voy a demostrar por inducción estructural sobre listas, defino el principio:
Dada una propiedad P sobre [], para probar ∀ xs :: [a]. P(xs):

- Probamos P([])
- Probamos que si P(xs) entonces P(x : xs)

Y sea la propiedad P(xs): elem x xs => esVertice x (nuevo xs)

- Case base: []
elem v []
= { elem. 1 }
False
----------
esVertice v (nuevo [])
= { nuevo.1 }
esVertice v (map (\x -> Node x []) [])
= { def map }
esVertice v []
= { esVertice.1 }
False

F => F = T

- Caso recursivo: x:xs (elem v (x:xs) => esVertice v (nuevo (v:vs)))
HI: elem v xs => esVertice v (nuevo xs)

elem v (x:xs)
= { elem.2 }
v == x || elem v xs
= { HI }
v == x || esVertice v (nuevo xs)
= { esVertice.2 }
esVertice v (x : xs)

Ponele que QED
-}

-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------

-- Final Aldu

-- Ej 1
-- allPoints :: Seq s => Int -> s (Int, Int)
-- allPoints n = joinS (tabulateS (\i -> allPoints' i (n - 1)) n)
--   where allPoints' x n = tabulateS (\y -> (x, y)) n

-- points :: Seq s => Int -> s (Int, Int)
-- points n = filterS (\(x, y) -> x <= y) $ allPoints n

-- -- Ej 2
-- data Tree a = E | N Int (Tree a) a (Tree a) deriving Show

-- inorderT :: Tree a -> [a]
-- inorderT E = []
-- inorderT (N _ l x r) = inorderT l ++ [x] ++ inorderT r

-- sizeT :: Tree a -> Int
-- sizeT E = 0
-- sizeT (N s _ _ _) = s

-- takeWhileEnd :: (a -> Bool) -> Tree a -> Tree a
-- takeWhileEnd _ E = E
-- takeWhileEnd f (N s l x r) = let 
--                               ((l', r'), b) = (takeWhileEnd f l ||| takeWhileEnd f r) ||| f x
--                               ((sr, sr'), sl') = (sizeT r ||| sizeT r') ||| sizeT l'
--                              in if b && sr' == sr then N (sl' + sr' + 1) l' x r
--                                 else r'

-- dropWhileEnd :: (a -> Bool) -> Tree a -> Tree a
-- dropWhileEnd _ E = E
-- dropWhileEnd f (N s l x r) = let 
--                               ((l', r'), b) = (takeWhileEnd f l ||| takeWhileEnd f r) ||| f x
--                               ((sr, sr'), sl') = (sizeT r ||| sizeT r') ||| sizeT l'
--                              in if b && sr' == 0 then l'
--                                                  else N s l x r'

-- t = N 6 (N 3 E 1 (N 2 E 2 (N 1 E 3 E))) 4 (N 2 (N 1 E 7 E) 9 E)

-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------

-- intereses :: Seq s => s Int -> Int -> Int
-- intereses s x = let 
--                   f (a, b) (c, d) = (c, b + d)
--                   (s', y) = scanS f (0, 0) $ mapS (\x -> (x, x)) s
--                   z = appendS (dropS s' 1) (singletonS y)
--                   z' = filterS (\(_, a) -> a < x) z
--                   lz' = lengthS z'
--                   (maxInteres, maxAcum) = nthS z' (lz' - 1)
--                 in if lz' == 0 then 0 else ((lengthS s) - lz') * maxInteres + maxAcum
                
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------

data Tree a = E | L a | N (Tree a) (Tree a) deriving Show

mapreduceT :: (a -> b) -> (b -> b -> b) -> b -> Tree a -> b
mapreduceT _ _ e E = e
mapreduceT f g e (L v) = g e (f v)
mapreduceT f g e (N xs ys) = let (l, r) = (mapreduceT f g e xs, mapreduceT f g e ys)
                                 in g l r

inorderTree :: Tree a -> [a]
inorderTree E = []
inorderTree (L x) = [x]
inorderTree (N l r) = inorderTree l ++ inorderTree r

addInfo :: Tree Int -> Tree (Bool, Int, Bool)
addInfo t = addInfo' $ separar t

addInfo' (L (l, x, r)) = let
                          (l', r') = x : (inorderTree l) ||| x : (inorderTree r)
                          (b1, b2) = minimum l' < x ||| maximum r' > x
                         in L (b1, x, b2)
addInfo' (N l r) = N (addInfo' l) (addInfo' r)

separar :: Tree Int -> Tree (Tree Int, Int, Tree Int)
separar (L x) = L (E, x, E)
separar (N l r) = N (separar' l E r) (separar' r l E)

separar' (L x) l r = L (l, x, r)
separar' (N l r) l' r' = let
                          (nl, nr) = separar' l l' (N r r') ||| separar' r (N l l') r'
                         in N nl nr

t :: Tree Int
t = N (N (L 1) (L 3)) (L 2)