% Recursividad con listas

posee(juan,[vidrio,computadora]).
posee(victoria,[lentes]).
posee(tomas,[botella,papel,termo,mate]).

fecha(termo,2022).
fecha(mate,2023).
fecha(papel,2021).
fecha(botella,2020).

fecha(vidrio,2020).
fecha(computadora,2023).

fecha(lentes,1990).


cosasOrdenadas(Persona):-
    posee(Persona,Cosas),
    estanOrdenadasPorFecha(Cosas).

estanOrdenadasPorFecha([]).
estanOrdenadasPorFecha([_]).
estanOrdenadasPorFecha([Primero|XS]):-
    fecha(Primero,F),
    head(XS,Segundo),
    fecha(Segundo,FechaDelSegundo),
    F =< FechaDelSegundo,
    estanOrdenadasPorFecha(XS).

% Variante haciendo pattern matching con los dos primeros elementos de la lista

estanOrdenadasPorFecha([Primero,Segundo|XS]):-
    fecha(Primero,F),
    fecha(Segundo,FechaDelSegundo),
    F =< FechaDelSegundo,
    estanOrdenadasPorFecha([Segundo|XS]).

loUltimo(Persona,UltimaCosa):-
    posee(Persona,Cosas),
    ultimo(Cosas,UltimaCosa).

loPrimero(Persona,PrimeraCosa):-
    posee(Persona,Cosas),
    head(Cosas,PrimeraCosa).

head([X|_],X).

ultimo([X],X).
ultimo([_|Lista] ,Ultimo):-
    ultimo(Lista,Ultimo).


% Recursividad sin listas

tiene(juan,vidrio,3).
tiene(juan,computadora,1).
tiene(nahuel,computadora,5).
tiene(nahuel,computadora,15).
tiene(nahuel,lentes,3).
tiene(victoria,lentes,8).
tiene(mica,lentes,89).

tiene(lentes,vidrio,2).
tiene(vidrio,arena,45).
tiene(computadora,cpu,1).
tiene(cpu,cobre,1).
tiene(cpu,oro,1).
tiene(computadora,pantalla,1).
tiene(pantalla,vidrio,20).

contiene(Algo,Elemento):-
    tiene(Algo,Elemento,_).
contiene(Algo,Elemento):-
    tiene(Algo,Intermedio,_),
    contiene(Intermedio,Elemento).


% Ejemplos de listas 

pasa(medrano,[151,109,160]).

colectivoFacu(Linea):-
    pasa(medrano,ListaLineas),
    member(Linea,ListaLineas).


esUnaPersona(juan).
esUnaPersona(nahuel).
esUnaPersona(mica).
esUnaPersona(victoria).

cantidadCosasQueTiene(Alguien,C,Cantidad):-
    esUnaPersona(Alguien),
    tiene(_,C,_),
    findall(C ,tiene(Alguien,C,_),L),
    length(L,Cantidad).
