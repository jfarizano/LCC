import Parsing

import Data.Char
import Control.Monad
import Control.Applicative hiding (many)

-- ----------------------------------------------------------------------------

parParent :: Parser a -> Parser a
parParent p = do char '('
                 r <- p
                 char ')'
                 return r
              <|> (do r <- p
                      return r)