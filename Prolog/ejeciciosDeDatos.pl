%% Se requiere un programa para asignar jueces del concurso de innovacion de una region del pais,
%% donde un juez es especialista de alguna categoria y se debe cuidar que el juez no pertenezca a la misma
%% zona de donde es el evento, cada juez esta adscrito a un tecnologico. El evento tiene como sede un tecnologico.
%% Todos los tecnologicos pertenecen a alguna zona del pais.

juez(gualo_ramos,software).
juez(sergio,alimentos).
juez(liliana,procesos).
juez(eleonor,electronica).
juez(beatriz,quimica).
juez(francisco,procesos).

adscripcion(gualo_ramos, itmorelia).
adscripcion(sergio, itqueretaro).
adscripcion(liliana, itaguascalientes).
adscripcion(eleonor, itdurango).
adscripcion(beatriz, ittijuana).
adscripcion(francisco, ciudad_victoria).

zona(itmorelia, centro_occidente).
zona(itqueretaro, centro).
zona(itaguascalientes, centro).
zona(itdurango, norte).
zona(ittijuana, noroeste).
zona(ciudad_victoria, noreste).

asignarJ(J,Categoria, Sede):-
                             zona(Sede,SedeZona),
                             juez(J,Categoria),
                             adscripcion(J,TecJuez),
                             zona(TecJuez, ZonaJuez),
                             SedeZona\==ZonaJuez.

%%===============================================================================================                            
%%===============================================================================================

%% Se va a organizar una fiesta y se cuenta con un presupuesto
%% Determine las combinaciones válidas de elementos
%% de la fiesta y que no se pasen del presupuesto

banquete(birria,80).
banquete(carnitas,60).
banquete(lomo_cerdo,45).
banquete(pollo,40).

bebida(whiskey,90).
bebida(vino_nacional,70).
bebida(cerveza,60).
bebida(agua_fresca,20).

musica(conjunto,25000).
musica(banda,35000).
musica(sonido,12000).

muebles(austero,5000).
muebles(laboral,10000).
muebles(elegante,22000).

fiesta(Banquete,Musica,Bebida,Muebles,N,Costo,Presup):-
banquete(Banquete,Pban), TotBan is Pban * N,
bebida(Bebida,Pbeb), TotBeb is Pbeb * N,
musica(Musica,Pmusica),
muebles(Muebles,Pmuebles),
Costo is TotBan + TotBeb + Pmusica + Pmuebles,
Costo =< Presup.