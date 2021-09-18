import Parsing

import Data.Char
import Control.Monad
import Control.Applicative hiding (many)

-- ----------------------------------------------------------------------------

data Hasktype = DInt | DChar | Fun Hasktype Hasktype deriving Show

haskt :: Parser Hasktype
haskt = do t <- base
           (do symbol "->"
               h <- haskt
               return (Fun t h)
            <|>
            return t)

base :: Parser Hasktype
base = do symbol "Int"
          return DInt
          <|>
          (do symbol "Char"
              return DChar)

eval :: String -> Hasktype
eval xs = fst (head (parse haskt xs))