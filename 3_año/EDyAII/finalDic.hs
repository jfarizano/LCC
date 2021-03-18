import Seq
import Par
import qualified Arr as A
import ArrSeq

data Tree a = E | L a | N Int (Tree a) (Tree a) deriving Show

inorderT :: Tree a -> [a]
inorderT E = []
inorderT (L x) = [x]
inorderT (N _ l r) = inorderT l ++ inorderT r

size :: Tree a -> Int
size E = 0
size (L _) = 1
size (N s _ _) = s

partir :: (Num a, Ord a) => Tree a -> (Tree (Int, a), Tree (Int, a))
partir t = partir' t 0

partir' :: (Num a, Ord a) => Tree a -> Int -> (Tree (Int, a), Tree (Int, a))
partir' E _ = (E, E)
partir' (L x) i = if x > 0 then (L (i, x), E) else (E, L (i, x))
partir' (N s l r) i = let
                        sl = size l
                        ((l1, l2), (r1, r2)) = partir' l i ||| partir' r (sl + i)
                        (sl', sr') = size l1 + size r1 ||| size l2 + size r2
                      in N sl' l1 r1 ||| N sr' l2 r2

t = N 6 (N 4 (N 2 (L (-1)) (L 2)) (N 2 (L (-3)) (L 4))) (N 2 (L (- 5)) (L 6))

-----------------------------------------------

infer :: Seq s => s a -> s a -> s a
infer x _ = x

incluidos :: Seq s => s (Float, Float) -> Int
incluidos s = let
                n = lengthS s
                s' = (tabulateS (\i -> incluidos' (takeS s i) (nthS s i)) n) :: A.Arr Bool
              in lengthS $ filterS id s'
    
incluidos' :: Seq s => s (Float, Float) -> (Float, Float) -> Bool
incluidos' s (x, y) = reduceS (||) False $ mapS (\(z, w) -> (x >= z) && (x + y <= z + w)) s

s = fromList [(1,3), (1,2), (2,3), (2,2), (3,2)] :: A.Arr (Float, Float)
