--Calcular suma de componentes de una computadora 

--RAM: Cada 4 GB = $2000
--CPU:
    --i3 = $4000
    --i5 = $6000
    --i7 = $7000
--Tarjeta madre:
    --Con acelerador grafico = $3000
    --Sin acelerador grafico = $2000
--Disco duro: Cada 500 GB = $1000
--Gabinete:
    --Simple = $500
    --Doble ventilador = $800

ram::Int->Int
ram cant = (div cant 4) * 2000

cpu::String->Int
cpu tipo
        | (tipo == "i3") = 4000
        | (tipo == "i5") = 6000
        | (tipo == "i7") = 7000

motherb::String->Int
motherb tipo
            | (tipo == "AG") = 3000
            | (tipo == "SAG") = 2000

disco::Int->Int
disco cant = (div cant 500) * 1000

gabinete::String->Int
gabinete tipo 
             | (tipo == "S") = 500
             | (tipo == "DV") = 800

cuenta::Int->String->String->Int->String->Int
cuenta cantRam tipoCPU tipoMotherB cantDisco tipoGabinete = (ram cantRam) + (cpu tipoCPU) + (motherb tipoMotherB) + (disco cantDisco) + (gabinete tipoGabinete)           

--Estructura de codigo funcional: let - in
cuenta2::Int->String->String->Int->String->Int
cuenta2 cantRam tipoCPU tipoMotherB cantDisco tipoGabinete = let 
                                                              pmem = ram cantRam 
                                                              pcpu = cpu tipoCPU
                                                              pm = motherb tipoMotherB
                                                              pd = disco cantDisco
                                                              pg = gabinete tipoGabinete
                                                             in 
                                                              pmem + pcpu + pm + pd + pg

