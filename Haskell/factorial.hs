factorial::Int->Int
factorial 0 = 1
factorial n = n * (factorial (n-1))

factorial2::Int->Int
factorial2 n = if(n==0) then 1
                else n * (factorial2(n-1))

factorial3::Int->Int
factorial3 n
            | (n==0) = 1
            | (n>0) = n * (factorial3 (n-1))

factorial4::Int->Int
factorial4 n
            | (n==0) = 1
            | otherwise = n * (factorial3 (n-1))
