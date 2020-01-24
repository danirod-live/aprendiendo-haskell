import Data.List

-- Ejercicio 1.a
negateNum :: Int -> Int
negateNum n = 0 - n
negateXS = map negateNum

-- Ejercicio 1.b
divisors :: Int -> [Int]
divisors p = [f | f <- [1..p], p `mod` f == 0]
divisorsXS = map divisors

-- Ejercicio 1.c
negateXSS = map (negateXS . divisors)

-- Ejercicio 2
rleEncode :: [Char] -> [(Int, Char)]
rleEncode str = map countOcurrences (group str) where
  countOcurrences n = (count, letter) where
    count = length n
    letter = head n

buildValue :: (Int, Char) -> [Char]
buildValue pair =
  let count = fst pair
      letter = snd pair
   in repeatValue count letter where
     repeatValue count letter
       | count > 0 = letter : repeatValue (count - 1) letter
       | otherwise = []

rleDecode :: [(Int, Char)] -> [Char]
rleDecode = concat . (map buildValue)
