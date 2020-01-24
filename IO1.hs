main = do
  putStrLn "La base?"
  base <- getLine
  putStrLn "La altura?"
  altura <- getLine
  let baseNumerica = read base :: Double
  let alturaNumerica = read altura :: Double
  let area = baseNumerica * alturaNumerica / 2
  putStrLn ("El area del triangulo es " ++ show area)
