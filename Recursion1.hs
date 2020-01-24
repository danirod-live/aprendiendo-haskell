factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

dobleFactorial :: Integer -> Integer
dobleFactorial 1 = 1
dobleFactorial 2 = 2
dobleFactorial n = n * dobleFactorial (n - 2)
