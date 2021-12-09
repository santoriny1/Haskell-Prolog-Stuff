--HACER LA DIVISION DEL MODULO: REGRESAR EL RESIDUO DE UNA DIVISION DE ENTEROS (USANDO RESTAS)
--EJEMPLO SI ES: DIV 7 2 = 1
--EJEMPLO SI ES: DIV 13 7 = 6

modulo::Int->Int->Int
modulo num den = if(num < den) then num
                    else (modulo (num - den) den)

modulo2::Int->Int->Int
modulo2 num den 
                | (num < den) = num
                | (num >= den) = (modulo2 (num - den) den)

modulo3::Int->Int->Int
modulo3 num den 
                | (num < den) = num
                | otherwise = (modulo3 (num - den) den)