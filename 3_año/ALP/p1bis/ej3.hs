import Parsing

import Data.Char
import Control.Monad
import Control.Applicative hiding (many)

-- ----------------------------------------------------------------------------

parens :: Parser a -> Parser a
parens p = do symbol "("
              r <- p
              symbol ")"
              return r
              <|>
              (do r <- p
                  return r) 