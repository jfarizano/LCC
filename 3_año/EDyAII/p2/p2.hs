-- Ej 1:
-- a)
test :: (Eq a, Num a) => (a-> a) -> a -> Bool
test f x = f x == x + 2

-- b) 
esMenor :: Ord a => a -> a -> Bool
esMenor y z = y < z

-- c) 
eq :: Eq a => a -> a -> Bool
eq a b = a == b

-- d) 
showVal :: Show a => a -> String
showVal x = "Valor:" ++ show x

-- ----------------------------------------------------------------------------

-- Ej 2:
-- a) 
ej2a :: Num a => a -> a
ej2a = (+5)
-- Es la operación suma con segundo argumento fijado igual a 5,
-- suma 5 a cualquier número dado

-- b) 
ej2b :: (Ord a, Num a) => a -> Bool
ej2b = (0<)
-- Es la operación menor con su primer argumento fijado igual a 0,
-- devuelve True si el número dado es mayor a 0, en caso contrario devuelve False

-- c) 
ej2c :: String -> String
ej2c = ('a':)
-- Concatena el caracter 'a' al inicio del string dado

-- d) 
ej2d :: String -> String
ej2d = (++"n")
-- Concatena un salto de línea al final del string dado

-- e) 
ej2e :: (Eq a, Num a) => [a] -> [a]
ej2e = filter (== 7)
-- Dada una lista de enteros devuelve
-- la misma lista pero solo con sus elementos iguales a 7

-- f)
ej2f :: Num a => [[a]] -> [[a]] 
ej2f = map (++[1])
-- Tipo lista de lista de numeros (es decir, [[Num]]). Agrega 1 al final de cada
-- sublista perteneciente a la lista dada

-- ----------------------------------------------------------------------------

-- Ej 3:
-- a) (Int -> Int) -> Int

ej3a1 :: (Int -> Int) -> Int
ej3a1 f = f 3

ej3a2 :: (Int -> Int) -> Int
ej3a2 f = f (f 3)

-- b) Int -> (Int -> Int) es lo mismo que Int -> Int -> Int

add :: Int -> (Int -> Int)
add x y = x + y

sub :: Int -> (Int -> Int)
sub x y = x - y

-- c) (Int -> Int) -> (Int -> Int) es lo mismo que (Int -> Int) -> Int -> Int

ej3c1 :: (Int -> Int) -> (Int -> Int)
ej3c1 f x = f x

ej3c2 :: (Int -> Int) -> (Int -> Int)
ej3c2 f x = f (f x)

-- d) Int -> Bool

positivo :: Int -> Bool
positivo x = x > 0

nonegativo :: Int -> Bool
nonegativo x = x >= 0

-- e) Bool -> (Bool -> Bool) es lo mismo que Bool -> Bool -> Bool

and' :: Bool -> (Bool -> Bool)
and' x y = x && y

or' :: Bool -> (Bool -> Bool)
or' x y = x || y

-- f) (Int, Char) -> Bool

iguales :: (Int, Char) -> Bool
iguales (x, y) = x == read [y]

sumapositiva :: (Int, Char) -> Bool
sumapositiva (x, y) = x + read [y] > 0

-- g) (Int, Int) -> Int

suma :: (Int, Int) -> Int
suma (x, y) = x + y

resta :: (Int, Int) -> Int
resta (x, y) = x - y

-- h) Int -> (Int, Int)

siguiente :: Int -> (Int, Int)
siguiente x = (x, x+1)

anterior :: Int -> (Int, Int)
anterior x = (x, x-1)

-- i) a -> Bool

siempreTrue :: a -> Bool
siempreTrue _ = True

siempreFalse :: a -> Bool
siempreFalse _ = False

-- j) a -> a

identidad :: a -> a
identidad a = a

identidadDoble :: a -> a
identidadDoble a = identidad a

-- ----------------------------------------------------------------------------

-- Ej 4:
-- a) 
ej4a = if true then false else true where false = True; true = False
-- Devuelve False

-- b) 
-- ej4b = if if then then else else
-- Mal formada, eror sintáctico

-- c) 
ej4c = False == (5 >= 4)
-- Bien formada, devuelve False

-- d) 
-- ej4d = 1 < 2 < 3
-- Mal formada, combinación de < inválida, error sintáctico

-- e) 
ej4e = 1 + if ('a' < 'z') then -1 else 0
-- Bien formada, devuelve 0

-- f) 
-- ej4f = if fst p then fst p else snd p where p = (True, 2)
-- Mal formada, error de tipos

-- g)
ej4g = if fst p then fst p else snd p where p = (True, False)
-- Bien formada, devuelve True

-- ----------------------------------------------------------------------------

-- Ej 5:

