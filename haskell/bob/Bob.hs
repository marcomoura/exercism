module Bob (responseFor) where

import Data.Char
import Data.List

removeSilience :: [Char]-> [Char]
removeSilience ws = [x| x <- ws, not( isSpace( x))]

removeNoAlpha :: [Char]-> [Char]
removeNoAlpha ws = [ x | x <- ws, isAlpha x]

responseFor :: [Char] -> [Char]
responseFor speak
  | null( removeSilience( speak)) = "Fine. Be that way!"
  | not( null( removeSilience( removeNoAlpha( speak)))) && all isUpper( removeNoAlpha( speak)) = "Woah, chill out!"
  | isSuffixOf "?" speak  = "Sure."
  | otherwise = "Whatever."

