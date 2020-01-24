-- Ejercicio 1
-- No, porque como es lazy, la evaluación del scanSum es condicional a que
-- takeInt continúe operando, así que cuando takeInt vale 0, deja de tomar
-- enteros de la lista infinita.

-- Ejercicio 2
myLastElementIn x = drop ((length x) - 1) x
myLastElementOut x = take ((length x) - 1) x
