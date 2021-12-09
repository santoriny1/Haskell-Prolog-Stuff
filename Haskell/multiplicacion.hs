--Multiplicacion de enteros
producto::Int->Int->Int
producto factor1 factor2 = if((factor1 == 0)) then 0
                           else factor1 + (producto factor1 (factor2 - 1))

producto2::Int->Int->Int
producto2 factor1 factor2 | ((factor1 == 0) || (factor2 == 0)) = 0
                         | ((factor1 > 0) || (factor2 > 0)) = factor1 + (producto2 factor1 (factor2 - 1))

producto3::Int->Int->Int
producto3 factor1 factor2 | ((factor1 == 0) || (factor2 == 0)) = 0
                          | otherwise = factor1 + (producto3 factor1 (factor2 - 1))

--Variacion de la multiplicacion: iniciar el contador de sumas en 1 hasta b
multiplicacion::Int->Int->Int
multiplicacion a 0 = 0
multiplicacion a b = a + (multiplicacion a (b-1))

multiplicacion2::Int->Int->Int
multiplicacion2 a c = multi a c 1
multi a c cont = if(cont == c) then a
                 else a + (multi a c (cont + 1))
