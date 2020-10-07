import Parsing

import Data.Char
import Control.Monad
import Control.Applicative hiding (many)

-- ----------------------------------------------------------------------------

data Hasktype = DInt | DChar | Fun Hasktype Hasktype deriving Show

hask :: Parser Hasktype
hask = do t <- base
          (do symbol "->"
              h <- hask
              return (Fun t h)
              <|> return t)

base :: Parser Hasktype
base = do symbol "Int"
          return DInt
        <|> (do symbol "Char"
                return DChar)