module Router where

import Prelude

import Control.Alt ((<|>))
import Data.Either (hush)
import Data.Maybe (Maybe)
import Effect (Effect)
import Routing (match)
import Routing.Hash (getHash, matches)
import Routing.Match (Match, end, lit, str)


data Route
  = Roast
  | Chips
  | Salad
  | Potato String
  | Dud


routing :: Match Route
routing = pure Roast <* end
          <|> Roast <$ lit "roast" <* end
          <|> Chips <$ lit "chips" <* end
          <|> Salad <$ lit "salad" <* end
          <|> Potato <$> ( lit "potato" *> str <* end ) 
          <|> pure Dud


router :: (Route -> Effect Unit) -> Effect Unit
router cb = void $ matches routing (\_old new -> cb new)


getRoute :: Effect (Maybe Route)
getRoute = do
  hash <- getHash
  pure $ hush $ match routing hash 
