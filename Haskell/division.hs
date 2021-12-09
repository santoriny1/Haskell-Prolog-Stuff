--Division de enteros
division::Int->Int->Int
division num den = if(num < den) then 0
                   else (1 + (division (num - den) den))

division2::Int->Int->Int
division2 num den 
                | (num < den) = 0
                | (num >= den) = 1 + (division2 (num - den) den)

division3::Int->Int->Int
division3 num den 
                | (num < den) = 0
                | otherwise = 1 + (division3 (num - den) den)