-- Parte I
COMPETICION (P#, DESCRIPCION, CATEGORIA)
CLUB (C#, NOM_C, PRESUPUESTO)
PARTICIPACION (C#, P#, PUESTO)

-- 1
SELECT NOM_C FROM CLUB
WHERE PRESUPUESTO > 2000000
AND C# IN (SELECT C# FROM PARTICIPACION
           WHERE P# IN (SELECT P# FROM COMPETICION
                        WHERE CATEGORIA = 2));

-- 2
SELECT NOM_C FROM CLUB
WHERE C# IN (SELECT C# FROM PARTICIPACION
             WHERE PUESTO = 1)
AND C# NOT IN (SELECT C# FROM PARTICIPACION
               WHERE PUESTO > 1);

-- 3
SELECT NOM_C FROM CLUB
WHERE C# IN (SELECT C# FROM PARTICIPACION
             GROUP BY C#
             HAVING COUNT (DISTINCT P#) = (SELECT COUNT(P#) FROM COMPTECION));

-- 4
SELECT NOM_C FROM CLUB
WHERE C# IN (SELECT C# FROM PARTICIPACION
             WHERE P# = 'P1')
AND C# IN (SELECT C# FROM PARTICIPACION
           WHERE P# = 'P2');

-- 5
SELECT NOM_C, PRESUPUESTO FROM CLUB
WHERE C# NOT IN (SELECT C# FROM PARTICIPACION
                 WHERE PUESTO = 1);