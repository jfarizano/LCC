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
ej4a :: Bool
ej4a = if true then false else true where false = True; true = False
-- Devuelve False

-- b) 
-- ej4b = if if then then else else
-- Mal formada, eror sintáctico

-- c) 
ej4c :: Bool
ej4c = False == (5 >= 4)
-- Bien formada, devuelve False

-- d) 
-- ej4d = 1 < 2 < 3
-- Mal formada, combinación de < inválida, error sintáctico

-- e) 
ej4e :: Num a => a
ej4e = 1 + if ('a' < 'z') then -1 else 0
-- Bien formada, devuelve 0

-- f) 
-- ej4f = if fst p then fst p else snd p where p = (True, 2)
-- Mal formada, error de tipos

-- g)
ej4g :: Bool
ej4g = if fst p then fst p else snd p where p = (True, False)
-- Bien formada, devuelve True

-- ----------------------------------------------------------------------------

-- Ej 5:

-- a)
ej5a :: a -> a
ej5a x = x

-- b)
ej5b :: Ord a => a -> a -> Bool
ej5b x y = x > y

-- c)
ej5c :: (a, b) -> a
ej5c (x, y) = x

-- ----------------------------------------------------------------------------

-- Ej 6:

-- a)
smallest :: Ord a => a -> a -> a -> a
smallest = \x y z -> if x <= y && x <= z then x 
                      else if y <= x && y <= z then y 
                        else z

-- b)
-- second  :: ¿?
second = \x -> (\x -> x)

-- c)
andThen :: Bool -> Bool -> Bool
andThen = \x y -> if x then y else x

-- d)
-- twice :: ¿?
twice = \f x -> f (f x)

-- e)
flip :: (a -> a -> a) -> a -> a -> a
flip = \f x y -> f y x
                        
-- f)
inc :: Num a => a -> a
inc = \x -> (+1) x

-- ----------------------------------------------------------------------------

-- Ej 7:

-- a)
iff :: Bool -> Bool -> Bool
iff True y = not y
iff False y = y

-- b)
alpha :: a -> a
alpha x = x

-- ----------------------------------------------------------------------------

-- Ej 8:

{- 
f :: c -> d
g :: a -> b -> c

h :: a -> b -> d
h x y = f (g x y)

equivalentes : h = f . g
                h x y = (f . g) x y
-}

-- ----------------------------------------------------------------------------

-- Ej 9:

-- Definición recursiva
zip3 :: [a] -> [b] -> [c] -> [(a, b, c)]
zip3 [] _ _ = []
zip3 _ [] _ = []
zip3 _ _ [] = []
zip3 (x:xs) (y:ys) (z:zs) = (x, y, z) : (Main.zip3 xs ys zs)

-- Definición utilizando zip
zip3' :: [a] -> [b] -> [c] -> [(a, b, c)]
zip3' xs ys zs = [(x,y,z) | ((x,y),z) <- zip (zip xs ys) zs]

-- ----------------------------------------------------------------------------

-- Ej 10:
-- Otro día será

-- ----------------------------------------------------------------------------

-- Ej 11:

-- Suponiendo que sqrt :: Float -> Float
modulus :: [Float] -> Float
modulus = sqrt . sum . map(^2)

vmod :: [[Float]] -> [Float]
vmod [] = []
vmod (v:vs) = modulus v : vmod vs
-- Es lo mismo que map(modulus)

-- ----------------------------------------------------------------------------

-- Ej 12:

type NumBin = [Bool] 
-- Numbin representa números binarios donde Flase representa el 0
-- y True el 1.
-- Tomando como convención una representación Little-Endian

-- a) Suma Binaria
add1 :: NumBin -> NumBin
add1 [] = [True]
add1 (x:xs) = if x then False : add1 xs else True : xs

sumaBin :: NumBin -> NumBin -> NumBin
sumaBin xs [] = xs
sumaBin [] y = y
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

restoX2 :: NumBin -> NumBin
restoX2 [] = [False]
restoX2 (x:_) = [x]

-- ----------------------------------------------------------------------------

-- Ej 13:

-- a)
divisors :: Integral a => a -> [a]
divisors x | x < 0 = []
           | x == 0 = [0]
           | otherwise = [y | y <- [1..x-1], mod x y == 0]

-- b)
matches :: (Num a, Eq a) => a -> [a] -> [a]
matches x l = filter(== x) l

-- c)
cuadruplas :: (Num a, Eq a, Enum a) => a -> [(a, a, a, a)]
cuadruplas n = [(a, b, c, d) | a <- [1..n], b <- [1..n], c <- [1..n], 
                                d <- [1..n], (a ^ 2) + (b ^ 2) == (c ^2) + (d ^ 2)]
-- d)
unique :: (Num a, Eq a) => [a] -> [a]
unique [] = []
unique (x:xs) = x : unique(filter(/= x) xs) 

-- ----------------------------------------------------------------------------

-- Ej 14:

scalarproduct :: Num a => [a] -> [a] -> a
scalarproduct xs ys = sum [x * y | (x, y) <- zip xs ys]