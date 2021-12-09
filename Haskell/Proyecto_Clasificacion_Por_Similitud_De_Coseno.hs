--  ====================  PROYECTO  ====================
--             FRASES POR SIMILITUD DE COSENO

--    INTEGRANTES:
--    Lemus Magaña José Adolfo 
--    Piñón Campos Karol Andrea
--    Zavala Moreno David
--  ====================================================

--  IMPORTS
import Data.Char
import Data.List

--  CATEGORIAS
carros = 
    [
        "Una camioneta es el vehiculo preferido de las mamás para transportar a su familia.",
        "Ferrari y Lamborghini son marcas de super deportivos de lujo, alcanzan velocidades superiores a los 260 kilometros por hora.",
        "Un auto tipo sedan tiene una cajuela más amplia que un modelo hatchback.",
        "Las marcas de autos más vendidas en México son: Chevrolet, Nissan, Ford y Honda",
        "Los automoviles, como carros y camionetas, son el principal medio de transporte en la ciudad."
    ]

deportes =
    [
        "El triatlón comunmente está compuesto por tres deportes, que son, natación, ciclismo y carrera.",
        "El ejercicio suministra oxigeno a los tejidos y ayuda a que el sistema cardiovascular funcione de manera más eficiente.",
        "Disfrutar del aire libre o simplemente participar en actividades deportivas hace feliz.",
        "Al realizar ejercicio nuestro cuerpo consume energía, que se traduce en un descanso más profundo.",
        "Ir al gimnasio y practicar ejercicio conlleva mejorar el cuerpo, perder grasas sobrantes."
    ]

cocteles = 
    [
        "Los mojitos son una bebida tipica de cuba, hecha a base de jugo de limón y ron con hielo.",
        "Un carajillo es la combinación de café y algún licor, como coñac, ron, anís, orujo o whisky.",
        "El martini o martini seco es uno de los cócteles más conocidos, compuesto de ginebra con un chorro de vermut.",
        "La margarita es un cóctel compuesto por tequila, triple sec y jugo de lima o limón.",
        "Un Cosmopolitan o Cosmo es un cóctel de vodka con cierto matiz a fruta ácida."
    ]

--  LIMPIAR LA CADENA DE CARACTERES TIPOGRAFICOS

limpiar cadena =
    let
        --  convertimos la cadena a minusculas
        minusculas = query cadena
        --  eliminamos signos de puntuacion
        signosPuntuacion = ['.',',',':',';','\'','\"','¿','?','!','¡']
        sinSignos = [cad | cad<-minusculas, not (elem cad signosPuntuacion)]
        --  quitamos acentos
        sinAcentos = [quitaAcentos cad | cad<-sinSignos ]
    in
        sinAcentos

--  QUITAR STOPWORDS DE LA CADENA
quitaStopWords c =
    let
        lista = limpiar c
        cadena = words lista
        stopWords = ["vuelva","realizar","vimos","semana","pasada","luego","dices","k","poner","hablamos","favor","sale","digo","miro","tarde","saludo","dejan","dado","quería","necesitaría","decir","día","hacerlo","hace","muchas","pedimos","ido","genial","preguntar","quedo","pasa","días","tardes","buenas","necesito","buenos","hola","gracias","quieres","quiero","de","la","que","el","en","y","a","los","del","se","las","por","un","para","con","no","una","su","al","lo","como","más","pero","sus","le","ya","o","este","sí","porque","esta","entre","cuando","muy","sin","sobre","también","me","hasta","hay","donde","quien","desde","todo","nos","durante","todos","uno","les","ni","contra","otros","ese","eso","ante","ellos","e","esto","mí","antes","algunos","qué","unos","yo","otro","otras","otra","él","tanto","esa","estos","mucho","quienes","nada","muchos","cual","poco","ella","estar","estas","algunas","algo","nosotros","mi","mis","tú","te","ti","tu","tus","ellas","nosotras","vosotros","vosotras","os","mío","mía","míos","mías","tuyo","tuya","tuyos","tuyas","suyo","suya","suyos","suyas","nuestro","nuestra","nuestros","nuestras","vuestro","vuestra","vuestros","vuestras","esos","esas","estoy","estás","está","estamos","estáis","están","esté","estés","estemos","estéis","estén","estaré","estarás","estará","estaremos","estaréis","estarán","estaría","estarías","estaríamos","estaríais","estarían","estaba","estabas","estábamos","estabais","estaban","estuve","estuviste","estuvo","estuvimos","estuvisteis","estuvieron","estuviera","estuvieras","estuviéramos","estuvierais","estuvieran","estuviese","estuvieses","estuviésemos","estuvieseis","estuviesen","estando","estado","estada","estados","estadas","estad","he","has","ha","hemos","habéis","han","haya","hayas","hayamos","hayáis","hayan","habré","habrás","habrá","habremos","habréis","habrán","habría","habrías","habríamos","habríais","habrían","había","habías","habíamos","habíais","habían","hube","hubiste","hubo","hubimos","hubisteis","hubieron","hubiera","hubieras","hubiéramos","hubierais","hubieran","hubiese","hubieses","hubiésemos","hubieseis","hubiesen","habiendo","habido","habida","habidos","habidas","soy","eres","es","somos","sois","son","sea","seas","seamos","seáis","sean","seré","serás","será","seremos","seréis","serán","sería","serías","seríamos","seríais","serían","era","eras","éramos","erais","eran","fui","fuiste","fue","fuimos","fuisteis","fueron","fuera","fueras","fuéramos","fuerais","fueran","fuese","fueses","fuésemos","fueseis","fuesen","siendo","sido","tengo","tienes","tiene","tenemos","tenéis","tienen","tenga","tengas","tengamos","tengáis","tengan","tendré","tendrás","tendrá","tendremos","tendréis","tendrán","tendría","tendrías","tendríamos","tendríais","tendrían","tenía","tenías","teníamos","teníais","tenían","tuve","tuviste","tuvo","tuvimos","tuvisteis","tuvieron","tuviera","tuvieras","tuviéramos","tuvierais","tuvieran","tuviese","tuvieses","tuviésemos","tuvieseis","tuviesen","teniendo","tenido","tenida","tenidos","tenidas","tened","ahí","ajena","ajeno","ajenas","ajenos","algúna","allá","ambos","aquello","aquellas","aquellos","así","atrás","aun","aunque","bajo","bastante","bien","cabe","cada","casi","cierto","cierta","ciertos","ciertas","conmigo","conseguimos","conseguir","consigo","consigue","consiguen","consigues","cualquier","cualquiera","cualquieras","cuan","cuanto","cuanta","cuantas","cuantos","de","dejar","demás","demasiadas","demasiados","dentro","dos","ello","emplean","emplear","empleas","encima","entonces","era","eras","eramos","eses","estes","gueno","hacer","hacemos","hacia","hago","incluso","intenta","intentas","intentamos","intentan","intento","ir","mismo","ningúno","nunca","parecer","podemos","podría","podrías","podríais","podríamos","podrían","primero","puedes","pueden","pues","querer","quiénes","quienesquiera","quienquiera","quizás","sabe","sabes","saben","sabéis","sabemos","saber","sino","solo","esta","tampoco","tan","tanta","tantas","tantos","tener","tiempo","toda","todas","tomar","trabaja","trabajas","tras","último","ultimo","última","ultima","unas","ustedes","variasos","verdadera","pocas","pocos","podéis","podemos","poder","podría","podrías","podríais","podríamos","podrían","primero","puede","puedo","pueda","pues","querer","quiénes","quienesquiera","quienquiera","quizás","mas","sabe","sabes","saben","sabéis","sabemos","saber","según","ser","si","siempre","sino","so","solamente","solo","sólo","sr","sra","sres","sta","tal","tales","tampoco","tan","tanta","tantas","tantos","tener","tiempo","toda","den","queria","todas","tomar","trabaja","trabajo","trabajáis","trabajamos","trabajan","trabajar","trabajas","tras","último","ultimo","unas","usa","usas","usáis","usamos","usan","usar","uso","usted","ustedes","va","van","vais","valor","vamos","varias","varias","varios","vaya","verdadera","voy","vez","más","ok"];
        resultado = [cad | cad<-cadena , not (elem cad stopWords)]
    in
        resultado

--  CREAR DICCIONARIO DE TEXTO
crearDiccionario [] = []
crearDiccionario (x:xs) = (quitaStopWords x)++(crearDiccionario xs)

diccionarioCarros   = nub (crearDiccionario carros)
diccionarioDeportes = nub (crearDiccionario deportes)
diccionarioCocteles = nub (crearDiccionario cocteles)

--  CREAR UN VECTOR PARA CADA FRASE
convertirAVector frase tipo =
    let
        vector = if(tipo == "carros") then generarVector diccionarioCarros frase
                    else if(tipo == "deportes") then generarVector diccionarioDeportes frase
                        else  generarVector diccionarioCocteles frase
    in
        vector

generarVector [] frase = []
generarVector (x:xs) frase = (contarApariciones (quitaStopWords frase) x):generarVector xs frase

--  COMPARAR POR SIMILITUD DE COSENO
diccionarioCarrosEnVectores [] tipo = []
diccionarioCarrosEnVectores (x:xs) tipo = (convertirAVector x tipo):(diccionarioCarrosEnVectores xs tipo)

vectorCarros = diccionarioCarrosEnVectores carros "carros"
vectorDeportes = diccionarioCarrosEnVectores deportes "deportes"
vectorCocteles = diccionarioCarrosEnVectores cocteles "cocteles"

similitudCarros frase =
    let
        vectorFrase = convertirAVector frase "carros"
        valores = [(cosen vectorFrase vc) | vc<-vectorCarros]
        promedio = (sumaValores valores)/(cantidadElementos valores)
    in
        promedio

similitudDeportes frase =
    let
        vectorFrase = convertirAVector frase "deportes"
        valores = [(cosen vectorFrase vc) | vc<-vectorDeportes]
        promedio = (sumaValores valores)/(cantidadElementos valores)
    in
        promedio

similitudCocteles frase =
    let
        vectorFrase = convertirAVector frase "cocteles"
        valores = [(cosen vectorFrase vc) | vc<-vectorCocteles]
        promedio = (sumaValores valores)/(cantidadElementos valores)
    in
        promedio

--  OPERACIONES PARA CALCULAR SIMILITUD DE COSENO
cosen a b
        |   ((coseno a b) >= 0) = coseno a b
        |   otherwise = 0

coseno a b = (sumatoriaAB a b) / ((sqrt (sumatoria2 a)) * (sqrt (sumatoria2 b)))

sumatoriaAB [] [] = 0
sumatoriaAB (x:xs) (y:ys) = (x*y) + (sumatoriaAB xs ys)

sumatoria2 [] = 0
sumatoria2 (x:xs) = (x*x) + (sumatoria2 xs)

--  OBTENCION DEL RESULTADO
similitud frase =
    let
        resultado = mayor (similitudCarros frase) (similitudDeportes frase) (similitudCocteles frase)
        tupla = ("COINCIDENCIA: ",resultado,"Carros: ",(similitudCarros frase),"Deportes: ",(similitudDeportes frase),"Cocteles: ",(similitudCocteles frase))
    in
        tupla

perro =  [ord a | a <- "saludos a todos"]

--  =================================================================
--  FUNCION PARA CONVERTIR A MINUSCULAS
stringToLower::String->String
stringToLower = map toLower

query::String->String
query [] = []
query (x:xs) = stringToLower (x:xs)

--  FUNCION PARA QUITAR ACENTOS
quitaAcentos cadena = 
    let
        n = (ord cadena)
        letra = if(n==225) then 97                      --  á
            else if(n==233) then 101                    --  é
                else if(n==237) then 105                --  í
                    else if(n==243) then 111            --  ó
                        else if(n==250) then 117        --  ú
                            else if(n==252) then 117    --  ü
                                else n
        res = (chr letra)
    in
        res
    
--  FUNCION PARA CONTAR CUANTAS VECES APARECE UNA PALABRA EN UNA LISTA DE PALABRAS
contarApariciones [] palabra = 0
contarApariciones (x:xs) palabra = if(x==palabra) then 1 + contarApariciones xs palabra
                                   else contarApariciones xs palabra

--  DEVUELVE LA CANTIDAD DE ELEMENTOS QUE HAY EN UNA LISTA
cantidadElementos [] = 0
cantidadElementos (x:xs) = 1 + cantidadElementos xs

--  DEVULVE LA SUMA DE TODOS LOS VALORES DE UNA LISTA
sumaValores [] = 0
sumaValores (x:xs) = x + sumaValores xs

--  DEVUELVE EL MAYOR DE 3 NUMEROS
mayor a b c 
    |   (a>b && a>c) = "carros"
    |   (b>a && b>c) = "deportes"
    |   (c>a && c>b) = "cocteles"
