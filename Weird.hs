data Weird a b = First a
               | Second b
               | Third [(a,b)]
               | Fourth (Weird a b)
               deriving (Show)

weirdMap :: (a -> c) -> (b -> d) -> Weird a b -> Weird c d
weirdMap tra trb = g where
  mapList [] = []
  mapList ((a,b):xs) = (tra a,trb b):(mapList xs)
  g (First a) = First (tra a)
  g (Second b) = Second (trb b)
  g (Third lst) = Third (mapList lst)
  g (Fourth w) = Fourth (g w)

weirdFold :: (a -> c) -> (b -> c) -> ([(a,b) -> c]) -> (c -> c) -> Weird a b -> c
weirdFold f1 f2 f3 f4 = g where
  g (First a) = f1 a
  g (Second b) = f2 b
  g (Third c) = f3 c
  g (Fourth d) = f4 (g d)
