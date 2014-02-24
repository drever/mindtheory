module Wumpus (
   WumpusWorld (..)
)
where

--import Environment
import Data.List (intercalate)

data WumpusField = Wumpus | Empty | Gold | Smell | Breeze | Trap

instance Show WumpusField where
    show Wumpus = "W"
    show Empty = "#"
    show Gold = "G"
    show Smell = "S"
    show Trap = "T"
    show Breeze = "B" 

data WumpusWorld = WumpusWorld {
	wumpusWorldWidth :: Int
      , wumpusWorldHeight :: Int
      , wumpusWorldPosition :: Int
      , wumpusWorldFields :: [WumpusField] 
}

--instance Environment WumpusWorld where
--    bla = undefined

mkWumpusWorld = WumpusWorld 4 4 11 [
              Gold, Empty, Empty, Smell,
              Empty, Wumpus, Smell, Smell,
              Breeze, Trap, Breeze, Smell,
              Breeze, Empty, Empty, Empty]

instance Show WumpusWorld where
    show (WumpusWorld w h p fl) = prntln w fl ++ coords w p  
                    where prntln w (f:fl) = 
                             (intercalate " " $ map  show $ fst $ splitAt w (f:fl)) ++ "\n" ++ 
                             (prntln w $ snd $ splitAt w (f:fl))
                          prntln _ [] = ""      
                          coords w p = "(" ++ (show $ mod p w) ++ ", " ++ (show $ div p w) ++ ")"
