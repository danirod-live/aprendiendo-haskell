main = do
  putStrLn "Como te llamas"
  name <- getLine
  if (name == "Simon" || name == "John" || name == "Phil")
     then putStrLn "Haskell es un gran lenguaje de programacion"
     else if name == "Koen"
       then putStrLn "Depurar Haskell es divertido"
       else putStrLn "Y tu quien eres"
