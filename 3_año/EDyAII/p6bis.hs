import Seq
import Par
import qualified Arr as A
import ArrSeq

zip :: Seq s => s a -> s b -> s (a, b)
zip s z = let 
            n = min (lengthS s) (lengthS z)
          in tabulateS (\i -> (nthS s i, nthS z i)) n

-- Ej 1

-- a
promedios :: Seq s => s Int -> s Float
promedios s = let
                (z, x) = scanS (+) 0 s
                n = lengthS s
                z' = appendS (dropS z 1) (singletonS x)
              in tabulateS (\i -> (fromIntegral (nthS z' i)) / (fromIntegral (i + 1))) n

s = tabulateS id 5 :: A.Arr Int

-- b
mayores :: Seq s => s Int -> Int
mayores s = let
              (z, x) = scanS max minBound s
              n = lengthS s
              z' = appendS (dropS z 1) (singletonS x)
              w = infer (tabulateS (\i -> if (nthS s (i + 1)) > (nthS z (i + 1)) then 1 else 0) (n - 1)) s
            in reduceS (+) 0 w

infer :: Seq s => s a -> s a -> s a
infer x _ = x

-- ----------------------------------------------------------------------------

-- Ej 2

mulMatrix :: Num a => (a, a, a, a) -> (a, a, a, a) -> (a, a, a, a)
mulMatrix (a, b, c, d) (w, x, y, z) = (a*w+b*y, a*x+b*z, c*w+d*y, c*x+d*z)

fibSeq :: Seq s => Int -> s Int
fibSeq n = let
            s = tabulateS (\_ -> (1, 1, 1, 0)) n
           in mapS (\(a, _, _, _) -> a) $ fst $ scanS mulMatrix (1, 0, 0, 1) s

-- ----------------------------------------------------------------------------

-- Ej 3

aguaHist :: Seq s => s Int -> Int
aguaHist xs = let ((maxL, _), (maxR', _)) = scanS max 0 xs ||| (scanS max 0 $ reverseS xs)
                  f i = max 0 $ min (nthS maxL i) (nthS (reverseS maxR') i) - nthS xs i
              in reduceS (+) 0 $ infer (tabulateS f (lengthS xs)) xs

ejemplo = fromList [3, 1, 3, 1, 3, 2, 1, 5] :: A.Arr Int

-- ----------------------------------------------------------------------------

-- Ej 4

data Paren = Open | Close

f :: Paren -> Int
f Open  = 1
f Close = -1

-- a


-- b
matchParen :: Seq s => s Paren -> Bool
matchParen s = let (s', r) = scanS (+) 0 (mapS f s)
               in (r == 0) && ((reduceS min 0 s') == 0)

-- ----------------------------------------------------------------------------

-- Ej 5

-- Son los padres

-- sccml :: Seq Int -> Int
-- sccml xs = let ys = mapS (\i->(i,i,1,1)) xs
--                f (w1,x1,y1,z1) (w2,x2,y2,z2) = if w2 > x1 && z2 == y2 then (w1,x2,y2+y1,z2+z1) else (w1,x2,y2+y1,z2)
--                zs = scanS f (minBound,minBound,0,0) ys
--                in mapreduceArr (\(_,_,_,i)->i) max minBound zs

-- ----------------------------------------------------------------------------

-- Ej 6

reduceMultiplos :: Seq s => s Int -> s (Int, s Int)
reduceMultiplos s = tabulateS (\i -> (nthS s i, dropS s (i + 1))) ((lengthS s) - 1)

calcularMultiplos :: Seq s => (Int, s Int) -> Int
calcularMultiplos (n, s) = lengthS (filterS (\m -> (mod n m) == 0) s) 

cantMultiplos :: Seq s => s Int -> Int
cantMultiplos s = reduceS (+) 0 (mapS calcularMultiplos (reduceMultiplos s))