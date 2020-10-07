import Parsing

import Data.Char
import Control.Monad
import Control.Applicative hiding (many)

-- ----------------------------------------------------------------------------

expr :: Parser Int
expr = do t <- ter  m
          expr' t

expr' :: Int -> Parser Int
expr' t = do char '+'
             t' <- term
             expr' (t + t')
             <|> (do char '-'
                     t' <- term
                     expr' (t - t')
                     <|> return t)

term :: Parser Int
term = do f <- factor
          term' f

term' :: Int -> Parser Int
term' f = do char '*'
             f' <- factor
             term' (f * f')
             <|> (do char '/'
                     f' <- factor
                     term' (div f f')
                     <|> return f)

factor :: Parser Int
factor = do d <- digit
            return (digitToInt d)
            <|> (do char '('
                    e <- expr
                    char ')'
                    return e)