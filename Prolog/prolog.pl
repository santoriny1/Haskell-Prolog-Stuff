%% Comentario

hombre(jose).
hombre(bryan).

mujer(ana).
mujer(luz).

pareja(M,H):-mujer(M),hombre(H).

gusto(ana,cine).
gusto(luz,teatro).
gusto(bryan,fut).
gusto(jose,cine).

expectativa(ana,negocios).
expectativa(luz,profesional).
expectativa(bryan,divertirse).
expectativa(jose,negocios).

novios(M,H):-pareja(M,H),
             gusto(M,G),gusto(H,G),
             expectativa(M,E),expectativa(H,E).