power :: Integer -> Integer -> Integer
power _ 0 = 1
power x y = x * power x (y - 1)

plusOne x = x + 1

addition x 0 = x
addition x y = addition (plusOne x) (y - 1)

log2 ::  Int -> Int
log2 1 = 0
log2 n = 1 + log2 (div n 2)
