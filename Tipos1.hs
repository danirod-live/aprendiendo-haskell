data Fecha = Fecha Int Int Int -- Año Mes Dia

showDate :: Fecha -> String
showDate (Fecha y m d) = show y ++ "/" ++ show m ++ "/" ++ show d

data Aniversario = Cumple String Fecha
                 | Boda String String Fecha
showAniversario :: Aniversario -> String

showAniversario (Cumple persona fecha) = persona ++ " nació el " ++ showDate fecha
showAniversario (Boda persona1 persona2 fecha) = persona1 ++ " se casó con " ++ persona2 ++ " el " ++ showDate fecha
