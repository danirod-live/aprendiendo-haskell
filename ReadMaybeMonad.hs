import Text.Read

main = do
  putStrLn "Dame un número"
  line <- getLine
  let value = readMaybe line :: Maybe Double
  case fmap (2*) value of
    Nothing -> do
      putStrLn ("No!!!! " ++ line ++ " no es un número")
      putStrLn "Vamos a intentarlo otra vez"
      main
    Just x -> putStrLn ("Sí, " ++ show x ++ " es un número")
