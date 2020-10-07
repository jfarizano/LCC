import Parsing

import Data.Char
import Control.Monad
import Control.Applicative hiding (many)

-- ----------------------------------------------------------------------------

data Basetype = DInt | DChar | DFloat deriving Show
type Hasktype = [Basetype]

hask :: Parser Hasktype
hask = do l <- sepBy base (symbol "->")
          return l

base :: Parser Basetype
base = do symbol "Int"
          return DInt
          <|> (do symbol "Char"
                  return DChar
                  <|> (do symbol "Float"
                          return DFloat))