import Parsing

import Data.Char
import Control.Monad
import Control.Applicative hiding (many)

-- ----------------------------------------------------------------------------

expr :: Parser Int
expr = do t <- term
          (do char '+'
              e <- expr
              return (t + e)
              <|> (do char '-'
                      e <- expr
                      return (t - e)
                      <|> return t))

term :: Parser Int
term = do f <- factor
          (do char '*'
              t <- term
              return (f * t)
              <|> (do char '/'
                      t <- term
                      return (div f t)
                      <|> return f))

factor :: Parser Int
factor = do d <- digit
            return (digitToInt d)
            <|> (do char '('
                    e <- expr
                    char ')'
                    return e)

eval :: String -> Int
eval xs = fst (head (parse expr xs))