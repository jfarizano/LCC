import Parsing

import Data.Char
import Control.Monad
import Control.Applicative hiding (many)

-- ----------------------------------------------------------------------------

type Heterogeneo = Either Int Char

hetList :: Parser [Heterogeneo]
hetList = do char '['
             l <- sepBy het (char ',')
             char ']'
             return l

het :: Parser Heterogeneo
het = do n <- nat
         return (Left n)
         <|> (do char '\''
                 l <- letter
                 char '\''
                 return (Right l))

hetListToList :: String -> [Heterogeneo]
hetListToList xs = fst (head (parse hetList xs))