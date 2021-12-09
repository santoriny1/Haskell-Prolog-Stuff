import Data.Char;
-------------------------------------------------------------------------------------------------------------------------------
-- TEORIA
-------------------------------------------------------------------------------------------------------------------------------

--Notación explicita de listas
-- [1,2,3,4]

-- O bien indicando un intervalo
-- [1,4..16]
-- [1,4,7,10,13,16]

-- Notación constructora de listas
-- 3:[4,5] = [3,4,5]

-- Caso base de una lista: []
-- Caso general de una lista: Una lista no vacia en notación simbolica: (x:xs)

-- Si tengo una lista como: [5,4,3] 

-------------------------------------------------------------------------------------------------------------------------------
-- EJERCICIOS
-------------------------------------------------------------------------------------------------------------------------------

-- Contar los elementos de una lista
largo [] = 0
largo (x:xs) = 1 + (largo xs)

--Construir una función para determinar si el numero 7 esta en una lista de enteros
largo7::[Int]->Bool
largo7 [] = False
largo7 (x:xs)
             | (x == 7) = True
             | otherwise = largo7 xs

--Contar cuantos impares hay en una lista
-- odd n = True, si n es impar
impares::[Int]->Int
impares [] = 0
impares (x:xs) 
               | ((odd x) == True) = 1 + (impares xs)
               | otherwise = 0 + (impares xs)

--Sumar pares de una lista                             
pares::[Int]->Int
pares [] = 0
pares (x:xs) 
               | ((odd x) == False) = x + (pares xs)
               | otherwise = 0 + (pares xs)

--Sumar numeros que estan en posicion impar de una lista
sumarPos::[Int]->Int
sumarPos l = impares2 l 0
impares2::[Int]->Int->Int
impares2 [] n = 0
impares2 (x:xs) n = if (odd n == True) then 0 + (impares2 xs (n+1))
                     else x + (impares2 xs (n+1))      

--Sumar los valores de una lista cuya posición es multiplo de q
calcMul::[Int]->Int->Int
calcMul p q = multiplo p 0 q 

multiplo::[Int]->Int->Int->Int
multiplo [] n1 m1 = 0
multiplo (x:xs) n1 m1 = if (((mod (n1) m1) == 0)) then x + (multiplo xs (n1+1) m1)
                         else (multiplo xs (n1+1) m1)


--Borrar de una lista los numemros impares
borrarImpares::[Int]->[Int]
borrarImpares [] = []
borrarImpares (x:xs) = if (odd x) then borrarImpares xs
                       else x:(borrarImpares xs)

--Dada una lista borrar los multiplos de 7 y los multiplos de 9
procesaL lista = let
                  lista1 = borraM7 lista
                  r = borraM9 lista1
                 in
                  r 

borraM7 [] = []
borraM7 (x:xs) = if ((mod x 7) == 0) then borraM7 xs
                 else x:(borraM7 xs)

borraM9 [] = []
borraM9 (x:xs) = if ((mod x 9) == 0) then borraM9 xs
                 else x:(borraM9 xs)

--Dada una lista borrar el numero mayor y el menor
mayMen list = let
               may = findMay list
               men = findMen list
               r1 = (quitNums (may) (men) (list)) 
              in
               r1 

findMay [] = 0
findMay (x:xs) = maximum (x:xs)

findMen [] = 0
findMen (x:xs) = minimum (x:xs)

quitNums c v [] = []
quitNums c v (x:xs) = if ((x == c) || (x == v)) then (quitNums c v xs)
                      else x:(quitNums c v xs)

--Metodo para ordenar una lista de numeros enteros
ordena [] = []
ordena lu = ordenar [] lu

findMen2 [] = 0
findMen2 (x:xs) = minimum (x:xs)

quitMen [] = []
quitMen (x:xs) = if (x == (findMen2 (x:xs))) then xs
                    else x:(quitMen xs)

ordenar lista_ordenada [] = lista_ordenada
ordenar lista_ordenada (x:xs) = ordenar ((findMen2 (x:xs)):lista_ordenada) (quitMen (x:xs))

----------------------------------------------------------------------------------------------------------------

--LISTAS INTENSIONALES

----------------------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------------------

--Ejercicios

----------------------------------------------------------------------------------------------------------------

--De la lista del 1 al 100 eliminar impares
elimimpares = [x | x <- [1..100], mod x 2 == 0]

--Funcion para describir los numeros de una lista
primo n 1 = 1
primo n c = if ((mod n c) == 0) then 1 + (primo n (c-1))
            else 0 + (primo n (c-1))

resultado 0 = False 
resultado x = let
                pri = primo x x
              in 
               if(pri <= 2) then True
               else False

listaI = [1..10]

descripcion = [(fdesc x) | x <- listaI]

fdesc x 
        | (resultado x) = "primo"
        | (odd x) = "impar"
        | (even x) = "par"

--Dadas dos listas
--A = [1,2,3]
--B = [4,5,6]

--Construir mediante listas intencionales el producto cartesiano entre las dos, debe resultar una lista como:
-- [(1,4), (1,5), (1,6), (2,4), (2,5), ... (3,6)]

productoCartesiano = [(x,y) | x <- [1,2,3], y <- [4,5,6]]

--Devuelve la longitud de una frase
frase = "hola que tal"
recorre [] = 0
recorre (x:xs) = 1 + (recorre xs)
largoDeFrase = recorre frase

--Dada una frase regresar su valor en ordinal (ascii)
ordinales fr = [ord c | c <- fr]

--Dada una frase encriptarla, sumandole 3 a su ordinal
encriptar cadena = let
                    ordinales = [ord c | c <- cadena]
                    encriptado = [(o+2) | o <- ordinales]
                    fraseEnc = [(chr e) | e <- encriptado]
                   in
                    fraseEnc

desencriptar cadena = let
                       ordinales = [(ord c)| c<-cadena ]
                       desencriptado = [(o-2) | o<-ordinales]
                       fraseDesenc = [(chr e)| e<-desencriptado]
                      in
                       fraseDesenc

-- Dada una lista de palabras de una frase,
-- borrar aquellas palabras que son artículos: la, las, lo, los, el

articulos = ["la", "las", "lo", "los", "le", "les"]

cleanP1 frase = let
                cleanSymb1  = [c | c<-frase]
                palabras1 = [w | w<-(words cleanSymb1), not (elem w articulos)]
               in
                palabras1

--Quita las ',' y los '.' de una frase
cleanP frase = let
                cleanSymb  = [c | c<-frase, (c /= ',') && (c /= '.')]
                palabras = [w | w<-(words cleanSymb), not (elem w articulos)]
               in
                palabras