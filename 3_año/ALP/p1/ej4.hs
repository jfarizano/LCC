import Parsing

import Data.Char
import Control.Monad
import Control.Applicative hiding (many)

-- ----------------------------------------------------------------------------

data Expr = Num Int | BinOp Op Expr Expr deriving Show
data Op = Add | Mul | Min | Div deriving Show

exprT :: Parser Expr
exprT = do t <- termT
           (do char '+'
               e <- exprT
               return (BinOp Add t e)
               <|> (do char '-'
                       e <- exprT
                       return (BinOp Min t e)
                       <|> return t))

termT :: Parser Expr
termT = do f <- factorT
           (do char '*'
               t <- termT
               return (BinOp Mul f t)
               <|> (do char '/'
                       t <- termT
                       return (BinOp Div f t)
                       <|> return f))

factorT :: Parser Expr
factorT = do d <- digit
             return (Num (digitToInt d))
             <|> (do char '('
                     e <- exprT
                     char ')'
                     return e)