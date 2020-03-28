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
                | otherwise = (s, n-1)
moverDer :: Linea -> Linea
moverDer(s, n) | n == length s = (s, n)
                | otherwise = (s, n+1)

moverIni :: Linea -> Linea
moverIni (s, n) = (s, 0)

moverFin :: Linea -> Linea
moverFin (s, n) = (s, length s)

insertar :: Char -> Linea -> Linea
insertar c (s, 0) = (c:s, 1)
insertar c (s:ss, n) = (s : snd snd ((insertar c (ss, n-1))), 1)
