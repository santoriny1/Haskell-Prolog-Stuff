potencia::Int->Int->Int
potencia b 0 = 1
potencia b e = b * (potencia b (e-1))

potencia2::Int->Int->Int
potencia2 b e = if(e == 0) then 1
                else b * (potencia2 b (e-1))

potencia3::Int->Int->Int
potencia3 b e 
            | (e == 0) = 1  --Estos segmentos se llaman guardas
            | (e > 0) = b * (potencia3 b (e-1))

potencia4::Int->Int->Int  --Recibe 2 enteros y regresa un entero
potencia4 b e
            | (e == 0) = 1
            | otherwise = b * (potencia b (e-1))
