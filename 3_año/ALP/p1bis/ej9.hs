import Parsing

import Data.Char
import Control.Monad
import Control.Applicative hiding (many)

-- ----------------------------------------------------------------------------

data CDeclaration = CDec CType CDeclarator deriving Show
data CType = CInt | CChar | CFloat deriving Show
data CDeclarator = CPointer CDeclarator | CArray CDeclarator Int | CIdentifier String deriving Show

declaration :: Parser CDeclaration
declaration = do t <- type_specifier
                 d <- declarator
                 symbol ";"
                 return (CDec t d)

declarator :: Parser CDeclarator
declarator = do symbol "*"
                d <- declarator
                return (CPointer d)
                <|>
                direct_declarator

direct_declarator :: Parser CDeclarator
direct_declarator = do symbol "("
                       d <- direct_declarator
                       symbol ")"
                       direct_declarator' d
                       <|>
                       (do i <- ident
                           direct_declarator' (CIdentifier i))

direct_declarator' :: CDeclarator -> Parser CDeclarator
direct_declarator' d = do symbol "["
                          n <- natural
                          symbol "]"
                          direct_declarator' (CArray d n)
                          <|>
                          return d

type_specifier :: Parser CType
type_specifier = do symbol "int"
                    return CInt
                    <|>
                    (do symbol "char"
                        return CChar
                        <|>
                        (do symbol "float"
                            return CFloat))

eval :: String -> CDeclaration
eval xs = fst (head (parse declaration xs))