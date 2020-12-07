FRECUENTA (Persona, Bar)
SIRVE (Bar, Cerveza, Precio)
Gusta (Persona, Cerveza)

-- a
SELECT DISTINCT Bar FROM SIRVE
WHERE Cerveza IN (SELECT Cerveza FROM Gusta
                  WHERE Persona = 'Juan');

-- b
SELECT DISTINCT FRECUENTA.Persona FROM FRECUENTA, SIRVE, GUSTA
WHERE FRECUENTA.Persona = GUSTA.Persona
AND FRECUENTA.Bar = SIRVE.Bar
AND GUSTA.Cerveza = SIRVE.Cerveza;

-- c
SELECT DISTINCT Persona FROM FRECUENTA
GROUP BY FRECUENTA.Persona
HAVING COUNT(*) = (SELECT COUNT(DISTINCT SIRVE.Bar) FROM SIRVE, GUSTA
                   WHERE SIRVE.Cerveza = GUSTA.Cerveza
                   AND FRECUENTA.Persona = GUSTA.Persona);


-- d
SELECT DISTINCT Persona FROM FRECUENTA
WHERE Persona NOT IN (SELECT DISTINCT FRECUENTA.Persona FROM FRECUENTA, SIRVE, GUSTA
                      WHERE FRECUENTA.Persona = GUSTA.Persona
                      AND FRECUENTA.Bar = SIRVE.Bar
                      AND GUSTA.Cerveza = SIRVE.Cerveza);

-- e
SELECT DISTINCT Bar FROM SIRVE
WHERE Cerveza = 'Miller'
AND Precio = (SELECT Precio FROM SIRVE
              WHERE Cerveza = 'Bud'
              AND Bar = 'HardRock');
-- f
SELECT DISTINCT Persona FROM FRECUENTA F1
WHERE NOT EXISTS (SELECT * FROM SIRVE
                  WHERE NOT EXISTS (SELECT * FROM FRECUENTA F2
                                    WHERE F1.Persona = F2.Persona
                                    AND SIRVE.Bar = F2.Bar));
