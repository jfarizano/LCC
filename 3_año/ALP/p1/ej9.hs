import Parsing

import Data.Char
import Control.Monad
import Control.Applicative hiding (many)

-- ----------------------------------------------------------------------------

data CType = CInt | CChar | CFloat deriving Show


declaration