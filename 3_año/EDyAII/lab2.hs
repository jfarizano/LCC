module Lab02 where

{-
   Laboratorio 2
   EDyAII 2020
-}

import Data.List

{-
1) Inferir, de ser posible, los tipos de las siguientes funciones:
(puede suponer que sqrt :: Float → Float)
-}

-- a)
modulus = sqrt . sum . map (^2)

-- b)
vmod [] = []
vmod (v : vs) = modulus v : vmod vs


-- 2) Dado el siguiente tipo para representar números binarios:
type NumBin = [Bool]

{- donde el valor False representa el número 0 y True el 1. Definir las siguientes operaciones tomando como convención una representación Little-Endian (i.e. el primer elemento de las lista de dı́gitos es el dı́gito menos significativo del número representado).-}

--a) suma binaria
sumaBin :: NumBin -> NumBin -> NumBin
sumaBin = undefined

--b) producto binario
prodBin :: NumBin -> NumBin -> NumBin
prodBin = undefined

-- c) cociente y resto de la división por dos

cociente :: NumBin -> NumBin
cociente = undefined

modBin :: NumBin -> NumBin
modBin = undefined


-- 3) Dado el tipo de datos
data CList a = EmptyCL | CUnit a | Consnoc a (CList a) a

{-a) Implementar las operaciones de este tipo algebraico teniendo en cuenta que:

* Las funciones de acceso son headCL, tailCL, isEmptyCL, isCUnit.
* headCL y tailCL no están definidos para una lista vacı́a.
* headCL toma una CList y devuelve el primer elemento de la misma (el de más a la izquierda).
* tailCL toma una CList y devuelve la misma sin el primer elemento.
* isEmptyCL aplicado a una CList devuelve True si la CList es vacı́a (EmptyCL) o False en caso contrario.
* isCUnit aplicado a una CList devuelve True sii la CList tiene un solo elemento (CUnit a) o False en caso contrario.-}


-- b) Definir una función reverseCL que toma una CList y devuelve su inversa.


-- c) Definir una función inits que toma una CList y devuelve una CList con todos los posibles inicios de la CList.

-- d) Definir una función lasts que toma una CList y devuelve una CList con todas las posibles terminaciones de la CList.


-- e) Definir una función concatCL que toma una CList de CList y devuelve la CList con todas ellas concatenadas

-- 4) Dada las siguientes representaciones de árboles generales y de árboles binarios

data GenTree a = EmptyG | NodeG a [GenTree a]

data BinTree a = EmptyB | NodeB (BinTree a) a (BinTree a)

{-defina una función g2bt que dado un árbol nos devuelva un árbol binario de la siguiente manera:
la función g2bt reemplaza cada nodo n del árbol general (NodeG) por un nodo n' del árbol binario (NodeB ), donde
el hijo izquierdo de n' representa el hijo más izquierdo de n, y el hijo derecho de n' representa al hermano derecho
de n, si existiese (observar que de esta forma, el hijo derecho de la raı́z es siempre vacı́o).-}

g2bt :: GenTree a -> BinTree a
g2bt = undefined


-- 5) Definir las siguientes funciones sobre árboles binarios de búsqueda (bst):

data BST a = Hoja | Nodo (BST a) a (BST a)
--a) maximum, que calcula el máximo valor en un bst.

maximum :: Ord a => BST a -> a
maximum = undefined

--b) checkBST, que chequea si un árbol binario es un bst.

checkBST :: Ord a => BST a -> Bool
checkBST = undefined
