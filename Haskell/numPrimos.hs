--Obtiene el modulo de un numero
modulo::Int->Int->Int
modulo num den = if(num < den) then num
                    else (modulo (num - den) den)

--Suma cuantos modulos dan como resultado 0
primo::Int->Int->Int
primo n 1 = 1
primo n c = if ((modulo n c) == 0) then 1 + (primo n (c-1))
            else 0 + (primo n (c-1))

--True = numero primo, False = numero no primo
resultado::Int->Bool
resultado 0 = False 
resultado x = let
                pri = primo x x
              in 
               if(pri <= 2) then True
               else False

--Cuenta cuantos primos hay
cprimos::Int->Int
cprimos 1 = 0
cprimos q = if (resultado q == True) then 1 + (cprimos (q-1))
            else 0 + (cprimos (q-1))  

--Pattern matching: Mecanismo que permite tener dos versiones (reglas) distintas de una definición de función
--Al ejecutarse una llamada el intérprete escoje aquella que hace emparejamiento de patrones


--------------------------------------------------------------------------------------------------------------

--Ejercicio: Dado n, determine cuantos multiplos de 4 hay en la serie 1 ... n

---------------------------------------------------------------------------------------------------------------
multi4::Int->Int
multi4 1 = 0
multi4 n 
        |((modulo n 4) == 0) = 1 + multi4 (n-1)
        | otherwise = 0 + multi4 (n-1)