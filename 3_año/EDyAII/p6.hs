import Seq
import Par
import ListSeq
import qualified Arr as A
import ArrSeq

-- Ejercicio 4b

data Paren = Open | Close

f :: Paren -> Int
f Open  = 1
f Close = -1

matchParen :: Seq s => s Paren -> Bool
matchParen s = let (s', r) = scanS (+) 0 (mapS f s)
               in (r == 0) && ((reduceS min 0 s') == 0)

-- ----------------------------------------------------------------------------

-- Ejercicio 6

reduceMultiplos :: Seq s => s Int -> s (Int, s Int)
reduceMultiplos s = tabulateS (\i -> (nthS s i, dropS s (i + 1))) ((lengthS s) - 1)

calcularMultiplos :: Seq s => (Int, s Int) -> Int
calcularMultiplos (n, s) = lengthS (filterS (\m -> (mod n m) == 0) s) 

cantMultiplos :: Seq s => s Int -> Int
cantMultiplos s = reduceS (+) 0 (mapS calcularMultiplos (reduceMultiplos s))