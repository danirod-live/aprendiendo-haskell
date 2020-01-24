import Data.List

-- Ej. 1
miAnd :: [Bool] -> Bool
miAnd [] = True
miAnd (x:xs)
  | x = miAnd xs
  | otherwise = False

miOr :: [Bool] -> Bool
miOr [] = False
miOr (x:xs) = if x then True else miOr xs

miAndFold :: [Bool] -> Bool
miAndFold = foldr (\ x acc -> x && acc) True

miOrFold :: [Bool] -> Bool
miOrFold = foldr (\ x acc -> x || acc) False

-- Ej. 2
maximumL :: [Int] -> Int
maximumL = foldl1 (\ acc x -> max acc x)

maximumR :: [Int] -> Int
maximumR = foldr1 (\ x acc -> max x acc)

-- Ej. 3
revertir :: [a] -> [a]
revertir = foldl' (\ accList item -> item : accList) []
