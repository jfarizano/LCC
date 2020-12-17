-- Ej 1:

type Color = (Int, Int, Int) -- (R, G, B)

mezclar :: Color -> Color -> Color
mezclar (r1, g1, b1) (r2, g2, b2) = (div (r1 + r2) 2, div (g1 + g2) 2, div (b1 + b2) 2)

-- ----------------------------------------------------------------------------

-- Ej 2:

type Linea = (String, Int)

vacia :: Linea
vacia = ([], 0)

moverIzq :: Linea -> Linea
moverIzq (s, n) | n == 0 = (s, 0)
                | otherwise = (s, n - 1)
                
moverDer :: Linea -> Linea
moverDer(s, n) | n == length s = (s, n)
                | otherwise = (s, n + 1)

moverIni :: Linea -> Linea
moverIni (s, n) = (s, 0)

moverFin :: Linea -> Linea
moverFin (s, n) = (s, length s)

insertar :: Char -> Linea -> Linea
insertar c (s, 0) = (c:s, 1)
insertar c (s:ss, n) = (s : fst (insertar c (ss, n - 1)), n + 1)

borrar :: Linea -> Linea
borrar (s, 0) = (s, 0)
borrar (s:ss, 1) = (ss, 0)
borrar (s:ss, n) = (s : fst (borrar (ss, n - 1)), n - 1)

-- ----------------------------------------------------------------------------

-- Ej 3:

data CList a = EmptyCL | CUnit a | Consnoc a (CList a) a deriving Show

-- a)

consCL :: a -> CList a -> CList a
consCL x EmptyCL = CUnit x
consCL x (CUnit y) = Consnoc x EmptyCL y
consCL x (Consnoc y z w) = Consnoc x (consCL y z) w

snocCL :: a -> CList a -> CList a
snocCL x EmptyCL = CUnit x
snocCL y (CUnit x) = Consnoc x EmptyCL y
snocCL z (Consnoc x xs y)= Consnoc x (snocCL y xs) z

isEmptyCL :: CList a -> Bool
isEmptyCL EmptyCL = True
isEmptyCL _ = False

isCUnit :: CList a -> Bool
isCUnit (CUnit _) = True
isCUnit _ = False

headCL :: CList a -> a
headCL (CUnit x) = x
headCL (Consnoc x _ _) = x

lastCL :: CList a -> a
lastCL (CUnit x) = x
lastCL (Consnoc _ _ z) = z

tailCL :: CList a -> CList a
tailCL (CUnit _) = EmptyCL
tailCL (Consnoc _ y z) = case y of
                         EmptyCL -> CUnit z
                         CUnit y' -> Consnoc y' EmptyCL z
                         otherwise -> Consnoc (headCL y) (tailCL y) z

delHeadCL :: CList a -> CList a
delHeadCL (CUnit _) = EmptyCL
delHeadCL (Consnoc x y z) = case y of 
                            EmptyCL -> CUnit z
                            CUnit y' -> Consnoc y' EmptyCL z
                            otherwise -> Consnoc (headCL y) (tailCL y) z

delLastCL :: CList a -> CList a
delLastCL (CUnit _) = EmptyCL
delLastCL (Consnoc x y z) = case y of
                            EmptyCL -> CUnit x
                            CUnit y' -> Consnoc x EmptyCL y' 
                            otherwise -> Consnoc x (delLastCL y) (lastCL y)

-- b)

reverseCL :: CList a -> CList a
reverseCL (Consnoc x y z) = Consnoc z (reverseCL y) x
reverseCL x = x

-- c)

inits :: CList a -> CList (CList a)
inits EmptyCL   = CUnit EmptyCL
inits (CUnit x) = Consnoc EmptyCL EmptyCL (CUnit x)
inits (Consnoc x EmptyCL y) = Consnoc EmptyCL (CUnit (CUnit x)) (Consnoc x EmptyCL y)
inits x = snocCL x (inits (delLastCL x))

-- d)

lasts :: CList a -> CList (CList a)
lasts EmptyCL   = CUnit EmptyCL
lasts (CUnit x) = Consnoc (CUnit x) EmptyCL EmptyCL
lasts (Consnoc x EmptyCL y) = Consnoc (Consnoc x EmptyCL y) (CUnit (CUnit y)) EmptyCL
lasts x = consCL x (lasts (delHeadCL x))

-- e)

(+++) :: CList a -> CList a -> CList a
(+++) EmptyCL y = y
(+++) x EmptyCL = x
(+++) (CUnit x) y = Consnoc x (delLastCL y) (lastCL y)
(+++) x y = Consnoc (headCL x) (tailCL x +++ delLastCL y) (lastCL y)

concatCL :: CList (CList a) -> CList a
concatCL EmptyCL         = EmptyCL
concatCL (CUnit x)       = x
concatCL (Consnoc x y z) = x +++ (concatCL y) +++ z

-- ----------------------------------------------------------------------------

-- Ej 4:

data Aexp = Num Int | Prod Aexp Aexp | Div Aexp Aexp

-- a)

eval :: Aexp -> Int
eval (Num x) = x
eval (Prod x y) = (eval x) * (eval y)
eval (Div x y) = div (eval x) (eval y)

seval :: Aexp -> Maybe Int
seval (Num x) = Just x
seval (Prod x y) = case seval x of
                    Nothing -> Nothing
                    Just n -> case seval y of
                                Nothing -> Nothing
                                Just m  -> Just (m * n)
seval (Div x y) = case seval x of
                    Nothing -> Nothing
                    Just n -> case seval y of
                                Nothing -> Nothing
                                Just m  -> if m == 0 then Nothing else Just (m * n)

-- ----------------------------------------------------------------------------

--Ej 5:

-- ----------------------------------------------------------------------------

-- Ej 6:

data GenTree a = EmptyG | NodeG a [GenTree a] deriving Show
data BinTree a = EmptyB | NodeB (BinTree a) a (BinTree a) deriving Show

-- Primera recursión de la raíz que no tiene hermanos
g2bt :: GenTree a -> BinTree a
g2bt EmptyG = EmptyB
g2bt (NodeG a []) = NodeB EmptyB a EmptyB
g2bt (NodeG a (x:xs)) = NodeB (g2bt' x xs) a EmptyB

-- Recursiones restante con hermanos
g2bt' :: GenTree a -> [GenTree a] -> BinTree a
g2bt' (NodeG a []) [] = NodeB EmptyB a EmptyB
g2bt' (NodeG a (x:xs)) [] = NodeB (g2bt' x xs) a EmptyB
g2bt' (NodeG a []) (y:ys) = NodeB EmptyB a (g2bt' y ys)
g2bt' (NodeG a (x:xs)) (y:ys) = NodeB (g2bt' x xs) a (g2bt' y ys)

-- ----------------------------------------------------------------------------

-- Ej 7:

