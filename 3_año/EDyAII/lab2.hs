module Lab02 where

{-
   Laboratorio 2
   EDyAII 2020
-}

import Prelude hiding (maximum, minimum)
import Data.List hiding (inits, maximum, minimum)

-- ----------------------------------------------------------------------------

{-
1) Inferir, de ser posible, los tipos de las siguientes funciones:
(puede suponer que sqrt :: Float → Float)
-}

-- a)
modulus :: [Float] -> Float
modulus = sqrt . sum . map(^2)

-- b)
vmod :: [[Float]] -> [Float]
vmod [] = []
vmod (v:vs) = modulus v : vmod vs

-- ----------------------------------------------------------------------------

-- 2) Dado el siguiente tipo para representar números binarios:
type NumBin = [Bool]

{- 
donde el valor False representa el número 0 y True el 1.
Definir las siguientes operaciones tomando como convención una representación
Little-Endian (i.e. el primer elemento de las lista de dı́gitos es el dı́gito
menos significativo del número representado). 
-}

-- a) Suma Binaria
add1 :: NumBin -> NumBin
add1 [] = [True]
add1 (x:xs) = if x then False : add1 xs else True : xs

sumaBin :: NumBin -> NumBin -> NumBin
sumaBin xs [] = xs
sumaBin [] ys = ys
sumaBin (x:xs) (y:ys) = if x && y then False : add1(sumaBin xs ys) else (x || y) : (sumaBin xs ys)

-- b) Producto binaro
-- Utilizo el algoritmo del campesino ruso
prodBin :: NumBin -> NumBin -> NumBin
prodBin _ [] = [False]
prodBin _ [False] = [False]
prodBin xs [True] = xs
prodBin xs (False:ys) = prodBin (False : xs) ys
prodBin xs (y:ys) = sumaBin xs (prodBin (False:xs) ys)

-- c) Cociente y resto de la división por 2
cocienteX2 :: NumBin -> NumBin
cocienteX2 [] = [False]
cocienteX2 (_:[]) = [False]
cocienteX2 (_:xs) = xs

modBin :: NumBin -> NumBin
modBin [] = [False]
modBin (x:_) = [x]

-- ----------------------------------------------------------------------------

-- 3) Dado el tipo de datos
data CList a = EmptyCL | CUnit a | Consnoc a (CList a) a deriving Show

{-
a) Implementar las operaciones de este tipo algebraico teniendo en cuenta que:

* Las funciones de acceso son headCL, tailCL, isEmptyCL, isCUnit.
* headCL y tailCL no están definidos para una lista vacı́a.
* headCL toma una CList y devuelve el primer elemento de la misma
(el de más a la izquierda).
* tailCL toma una CList y devuelve la misma sin el primer elemento.
* isEmptyCL aplicado a una CList devuelve True si la CList es vacı́a (EmptyCL)
o False en caso contrario.
* isCUnit aplicado a una CList devuelve True sii la CList tiene un solo elemento
(CUnit a) o False en caso contrario.
-}

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

-- b) Definir una función reverseCL que toma una CList y devuelve su inversa.
reverseCL :: CList a -> CList a
reverseCL (Consnoc x y z) = Consnoc z (reverseCL y) x
reverseCL x = x

-- c) Definir una función inits que toma una CList y devuelve una CList
-- con todos los posibles inicios de la CList.
inits :: CList a -> CList (CList a)
inits EmptyCL   = CUnit EmptyCL
inits (CUnit x) = Consnoc EmptyCL EmptyCL (CUnit x)
inits (Consnoc x EmptyCL y) = Consnoc EmptyCL (CUnit (CUnit x)) (Consnoc x EmptyCL y)
inits x = snocCL x (inits (delLastCL x))

-- d) Definir una función lasts que toma una CList y devuelve una CList
-- con todas las posibles terminaciones de la CList.
lasts :: CList a -> CList (CList a)
lasts EmptyCL   = CUnit EmptyCL
lasts (CUnit x) = Consnoc (CUnit x) EmptyCL EmptyCL
lasts (Consnoc x EmptyCL y) = Consnoc (Consnoc x EmptyCL y) (CUnit (CUnit y)) EmptyCL
lasts x = consCL x (lasts (delHeadCL x))

-- e) Definir una función concatCL que toma una CList de CList y devuelve
-- la CList con todas ellas concatenadas
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

-- 4) Dada las siguientes representaciones de árboles generales y de árboles
-- binarios

data GenTree a = EmptyG | NodeG a [GenTree a] deriving Show

data BinTree a = EmptyB | NodeB (BinTree a) a (BinTree a) deriving Show

{-
defina una función g2bt que dado un árbol nos devuelva un árbol binario de
la siguiente manera: la función g2bt reemplaza cada nodo n del árbol general
(NodeG) por un nodo n' del árbol binario (NodeB ), donde el hijo izquierdo
de n' representa el hijo más izquierdo de n, y el hijo derecho de n' representa
al hermano derecho de n, si existiese (observar que de esta forma,
el hijo derecho de la raı́z es siempre vacı́o). 
-}

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

-- 5) Definir las siguientes funciones sobre árboles binarios de búsqueda (bst):

data BST a = Hoja | Nodo (BST a) a (BST a)

minimum :: Ord a => BST a -> a
minimum (Nodo Hoja x _) = x
minimum (Nodo l _ _) = minimum l

--a) maximum, que calcula el máximo valor en un bst.
maximum :: Ord a => BST a -> a
maximum (Nodo _ x Hoja) = x
maximum (Nodo _ _ r) = maximum r

--b) checkBST, que chequea si un árbol binario es un bst.
checkBST :: Ord a => BST a -> Bool
checkBST Hoja = True
checkBST (Nodo l x r) = maximum l <= x && x < minimum r && checkBST l && checkBST r