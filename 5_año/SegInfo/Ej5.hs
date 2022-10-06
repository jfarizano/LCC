module Ej5 where

import Data.Set ( Set , isSubsetOf )
import qualified Data.Set as S
-- Utilizo map para hacer algo equivalente a las funciones parciales de Z
import Data.Map ( Map )
import qualified Data.Map as M
import Numeric.Natural
import Data.Maybe

-- Identifico a las categorías por su nombre utilizando un string
type Category = String
-- Identifico a los objetos por su nombre utilizando un string
type Object = String
-- Los archivos y los subjetos son objetos
type File = Object  
type Subject = Object 
-- Represento a los niveles de seguridad con números naturales
type SecurityLevel = Natural
-- Las clases de acceso son pares ordenados de niveles de seguridad
-- y conjuntos de categorías
type AccessClass = (SecurityLevel , Set Category)
-- Usamos solo los dos modos de acceso básicos, lectura y escritura
data AccessMode = Read | Write deriving (Show, Eq)

-- Estado del sistema
data SecState = SecState {
  -- Función que asocia objetos con clases de acceso,
  sc :: Map Object AccessClass ,
  -- Función que asocia sujetos con los objetos que están accediendo
  -- y en qué modo
  oobj :: Map Subject [(Object , AccessMode)] ,
  -- Conjunto de objetos
  ol :: Set Object ,
  -- Conjunto de sujetos, usado para diferenciarlos de los objetos que no son
  -- sujetos (archivos por ej.)
  sl :: Set Subject
} deriving Show

initSecState :: SecState
initSecState = SecState M.empty M.empty S.empty S.empty

-- Función que retorna True si la clase de acceso del primer argumento domina
-- a la clase de acceso del segundo argumento, en caso contrario retorna False
dominates :: AccessClass -> AccessClass -> Bool
dominates (sl1, cs1) (sl2, cs2) = sl2 <= sl1 && cs2 `isSubsetOf` cs1

-- Dado el estado del sistema, un usuario (sujeto), un archivo (objeto), 
-- y un tipo de acceso (lectura, escritura), devuelve en un par ordenado
-- el nuevo estado del sistema y un booleano indicando si se puede llevar 
-- adelante el acceso, siguiendo la política del modelo Bell-LaPadula.
grant :: SecState -> Subject -> File -> AccessMode -> (SecState , Bool)
grant st u f Read = if and
                        -- u es un sujeto 
                       [u `S.member` sl st,
                        -- u y o deben ser objetos existentes en el sistema
                        u `M.member` sc st && f `M.member` sc st,
                        -- s no tiene abierto a o en modo de lectura
                        case lookup f (fromJust $ (M.lookup u (oobj st))) of {Just Read -> False; _ -> True},
                        -- la clase de acceso de u domina a la de o (no read-up)
                        uk `dominates` fk,
                        -- la clase de acceso de o está dominada por la clase de acceso
                        -- de todos los objetos que s tiene abiertos en modo de escritura
                        and $ map (\f2 -> (fromJust $ M.lookup (fst f2) (sc st)) `dominates` fk) 
                                  (filter (\(_ , accm) -> accm == Write) uoo)]
                       then let st' = st {oobj = M.insert u ((f , Read) : uoo) (oobj st)}
                            in (st', True)
                       else (st, False)
                       where
                          -- clave de acceso del usuario
                          uk = fromJust $ M.lookup u (sc st)
                          -- objetos abiertos por el usuario
                          uoo = fromJust $ M.lookup u (oobj st)
                          -- clave de acceso del archivo
                          fk = fromJust $ M.lookup f (sc st)
grant st u f Write = if and
                        -- u es un sujeto 
                       [u `S.member` sl st,
                        -- u y o deben ser objetos existentes en el sistema
                        u `M.member` sc st && f `M.member` sc st,
                        -- s no tiene abierto a o en modo de escrita
                        case lookup f (fromJust $ (M.lookup u (oobj st))) of {Just Write -> False; _ -> True},
                        -- la clase de acceso de u domina a la de o (no read-up)
                        uk `dominates` fk,
                        -- la clase de acceso de o domina a la clase de acceso
                        -- de todos los objetos que s tiene abiertos en modo de lectura
                        and $ map (\f2 -> (fk `dominates` (fromJust $ M.lookup (fst f2) (sc st)))) 
                                  (filter (\(_ , accm) -> accm == Read) uoo)]
                       then let st' = st {oobj = M.insert u ((f , Write) : uoo) (oobj st)}
                            in (st', True)
                       else (st, False)
                       where
                          -- clave de acceso del usuario
                          uk = fromJust $ M.lookup u (sc st)
                          -- objetos abiertos por el usuario
                          uoo = fromJust $ M.lookup u (oobj st)
                          -- clave de acceso del archivo
                          fk = fromJust $ M.lookup f (sc st)