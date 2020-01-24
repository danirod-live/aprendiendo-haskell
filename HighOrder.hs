miCurry :: ((a, b) -> c) -> a -> b -> c
miCurry func = intermedio func
  where intermedio func a b = func (a, b)


miUncurry :: (a -> b -> c) -> (a, b) -> c
miUncurry func = intermedio func
  where intermedio func par = func (fst par) (snd par)

miConst :: a -> b -> a
miConst prim seg = prim
