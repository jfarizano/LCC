import Parsing

import Data.Char
import Control.Monad
import Control.Applicative hiding (many)

-- ----------------------------------------------------------------------------

data Basetype = DInt | DChar | DFloat deriving Show
type Hasktype = [Basetype]

haskt :: Parser Hasktype
haskt = sepBy baset (symbol "->")

baset :: Parser Basetype
baset = do symbol "Int"
           return DInt
           <|>
           (do symbol "Char"
               return DChar
               <|>
               (do symbol "Float"
                   return DFloat))

eval :: String -> Hasktype
eval xs = fst (head (parse haskt xs))