takeInt :: Int -> [Int] -> [Int]
takeInt 0 _ = []
takeInt n [] = []
takeInt n (x:xs) = x : (takeInt (n - 1) xs)

dropInt :: Int -> [Int] -> [Int]
dropInt _ [] = []
dropInt 1 (x:xs) = xs
dropInt n (x:xs) = dropInt (n - 1) xs

sumInt :: [Int] -> Int
sumInt [] = 0
sumInt (x:xs) = x + (sumInt xs)

scanSum :: [Int] -> [Int]
scanSum x = go x 0
  where
  go [] partial = []
  go (x:xs) acc = (x + acc) : (go xs (acc + x))

