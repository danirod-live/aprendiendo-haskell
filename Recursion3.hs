replicate' :: Int -> a -> [a]
replicate' 0 _ = []
replicate' n x = x : (replicate' (n - 1) x)

indexOf' :: [a] -> Int -> a
indexOf' (x:xs) 0 = x
indexOf' (x:xs) n = indexOf' xs (n - 1)

zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x,y) : (zip' xs ys)

length' x = go x 0
  where
    go [] n = n
    go (x:xs) n = go xs (n + 1)
