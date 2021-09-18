import Parsing

import Data.Char
import Control.Monad
import Control.Applicative hiding (many)

-- ----------------------------------------------------------------------------

type Heterogeneo = Either Int Char

hetList :: Parser [Heterogeneo]
hetList = do symbol "["
             l <- sepBy hetItem (symbol ",")
             symbol "]"
             return l

hetItem :: Parser Heterogeneo
hetItem = do d <- nat
             return (Left d)
             <|>
             (do char '\''
                 c <- letter
                 char '\''
                 return (Right c))

eval :: String -> [Heterogeneo]
eval xs = fst (head (parse hetList xs))
