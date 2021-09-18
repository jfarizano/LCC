import Parsing

import Data.Char
import Control.Monad
import Control.Applicative hiding (many)

-- ----------------------------------------------------------------------------

expr :: Parser Int
expr = do t <- term
          expr' t

expr' :: Int -> Parser Int
expr' t = do symbol "+"
             t' <- term
             expr' (t + t')
             <|>
             (do symbol "-"
                 t' <- term
                 expr' (t - t')
                 <|> 
                 return t)

term :: Parser Int
term = do f <- factor
          term' f

term' :: Int -> Parser Int
term' f = do symbol "*"
             f' <- factor
             term' (f * f')
             <|>
             (do symbol "/"
                 f' <- term
                 expr' (div f f')
                 <|> 
                 return f)

factor :: Parser Int
factor = do n <- natural
            return n
            <|>
            (do symbol "("
                e <- expr
                symbol ")"
                return e)
                
eval :: String -> Int
eval xs = fst (head (parse expr xs))