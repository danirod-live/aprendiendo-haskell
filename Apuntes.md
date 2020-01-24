# Comandos GHCi

:load - cargar archivos .hs
:reload - recargar archivos
:quit - salir
:cd - cambiar de directorio

# Comentarios

Single line: --
Multilinea: {-      -}


# Funciones

Es como declarar expresiones, pero
poniendo **argumentos** antes del
igual.


¿¿Cómo evaluaría GHCi la expresión `quadruple 5`??

quadruple x = double (double x)
double x = 2 * x





quadruple 5
double (double 5)
double (2 * 5)
2 * (2 * 5)
2 * 10
20





## Where

Sirve para declarar variables locales con expresiones intermedias
que hacen falta para evaluar una función.


## Booleanos

Con mayúscula.

True, False.


## Evaluar tipos

Usando :type.

El operador :: se traduce por "es de tipo". Por ejemplo, si calculo `:type True`, me dice `True :: Bool`, que se puede leer como True es de tipo Bool.




## EJERCICIOS



1. negate :: Int -> Int
2. (||) :: Bool -> Bool -> Bool
3. monthLength :: Bool -> Int -> Int
4. f :: Bool -> Bool -> Bool
5. g :: Int -> Int


## Strings

String es una lista de caracteres.

Se concatenan con ++

No se concatenan con +



## Listas y pares

* Listas. Deben tener el mismo tipo.
* : => concatenar por la izquierda.

* Tuplas. Entre paréntesis y tipos diversos, pero no crecen.

* fst: primer elemento de una 2-tupla
* snd: segundo elemento de una 2-tupla

* head / tail: para listas.


# Typeclasses

Numéricos

Tipos: Int, Integer, Double, Float
Tipoclases: Num, Fractional


fromIntegral: Convierte Integral a Num, lo cual es importante
porque si le pasas un Integral a una función que espera un Num,
va a reventar.


Ejercicios de listas
====================

Listas de listas 1
1. 1:2:3:[]:[]
2. 1:[2,3]:4:[]
3. [1,2,3]:[]:[]

Listas de listas 2
1. [[], [1, 2, 3], [1, 2, 3]]
2. [[]]
3. [[1], []]
4. []
5. ["hi", 1]
6.




# If..Then..Else

* Siempre debe haber ambas expresiones
  (es decir, no puedo hacer un if then sin else)
* La expresión retornada en el then y en el else
  debe ser del mismo tipo.

# Composición de funciones

Ya lo sabes, Dani.

(f . g) x = f (g x)






LIBRERIA ESTNADAR DE FUNCIONES DE HOY

round = redondear
floor = redondear hacia abajo
???? = redondee hacia arriba
div = division euclideo
mod = resto euclideo



MAS SOBRE TIPOS DE DATOS

Tipos de datos con nombre en los campos

    data Color = { red :: Int, green :: Int, blue :: Int}

Genera funciones accesoras cuyo nombre es el nombre del
campo.

    azul = Color 51 102 255
    red azul
    >> 51

También tengo mutadores

    morado = azul { red = 255 }
    :t morado
    >> Color
    red morado
    >> 255

Esto soporta pattern matching también

    colorarray (Color { red = r, green = g, blue = b }) = [r,g,b]

Es decir, podemos usar los corchetes para extraer ciertos valores.

También pueden usarse los corchetes en tiempo de declaración

    RGB { red = 10, blue = 50, green = 0 }


Tipos parametrizados

A la izquierda del igual también puedes poner variables de tipo que luego puedes usar para indicar que un tipo de la derecha es de ese tipo concreto.

    data Maybe a = Nothing | Just a
    data Result a b = Ok a | Error b


CLASES Y TIPOS

Declaración de clases:

    class [ClassName type] where
        [op, op] :: [tipo]
        [op] :: [tipo]

Ejemplo:

    class Eq a where
        (==), (/=) :: a -> a -> Bool

Puede incluir una definición mínima, por ejemplo:

    x == y = not (x /= y)
    x /= y = not (x == y)

Con que declares una será suficiente, porque con la definición mínima, Haskell puede inferir automáticamente la otra a partir de la que has definido.

Asociar un data type a un clase usando la palabra instance:

    instance [class] [datatype] where
        [impl]

    data Foo = Foo { x :: String, y :: String }
    instance Eq Foo where
        (Foo x1 y1) == (Foo x2 y2) = (x1 == x2) && (y1 == y2)

Para ahorrar tiempo las puedes derivar, es decir, Haskell puede fabricar implementaciones de esas funciones automáticamente y hacer que el data sea instance automáticamente.

    data Foo { ... } deriving (class)

Hace que mi tipo ya sea instancia de las clases dichas.

Pero sólo de las siguientes:

    Eq: (==), (/=)

    Ord: (<, <=, >, >=, min, max, compare)

    Enum: sintaxis de lista tipo [January .. March]

    Bounded: (minBound, maxBound)
    Por ejemplo, (minBound :: Foo) si Foo es enumerado
    te da el más pequeño de su enumerado

    Show: (show), pasa a string de tipo
    Read: (read), pasa de string a tipo

Herencia:

    class (Eq a) => Ord a

Declara una clase llamada Ord que aplica a un tipo a siempre que a sea también Eq (es decir, implemente el tipo Eq)

    class (Num a, Ord a) => Real a

Restricciones de tipos

Podemos forzar que una función, una clase, una instancia o un data tengan tipos que implementen clases concretas.

    class Located a where
        getLocation :: a -> (Int, Int)

    data NamedPoint = NamedPoint { ... }

    instance Located NamedPoint where
        getLocation p = (pointX p, pointY p)

    move :: (Movable a) => (Int, Int) -> a -> a

Aquí a puede ser cualquier clase que quieras. Es decir, no te estoy obligando a que le pases un NamedPoint. Lo único que te estoy obligando, es a que ese a implemente un Movable, es decir, haya una instance entre Movable y el tipo.
