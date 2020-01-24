cons8 :: (Num a) => [a] -> [a]
cons8 l = l ++ [8]

myCons :: [a] -> a -> [a]
myCons list thing = thing:list
