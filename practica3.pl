nat(0).
nat(s(X)):-nat(X).

suma(0,X,X).                     
suma(s(X),Y,Z) :- suma(X,s(Y),Z).

producto(X,0,0):-nat(X).
producto(X,s(Y),Z):-producto(X,Y,T), suma(T,X,Z).

potencia(X,0,s(0)):-nat(X).
potencia(X,s(Y),Z):- producto(X,Y,T), producto(T,X,Z).

factorial(0,s(0)).
factorial(s(X),F) :- factorial(X,T), producto(s(X),T,F).

concatena([], L1, L1).
concatena([A|As],Bs,[A|Cs]):- concatena(As, Bs, Cs).

member(X,[X|_]).
member(X,[_|Ys]):-member(X,Ys).

reversa([],[]). 
reversa([H|T],L):- reversa(T,R), concatena(R,[H],L).

length([], L, L).
length([_|Xs], N, L):- N2 is N + 1,length(Xs, N2, L).

minList(M, [X|Xs]):-minimo2(M, X, Xs).
minimo2(M, M, []):- !.
minimo2(X, Y, [Z|Zs]):- Z =< Y,!,minimo2(X, Z, Zs).
minimo2(X, Y, [Z|Zs]):-Z >= Y,minimo2(X, Y, Zs).

sumList([], 0).
sumList([X|Xs], S):-sumList(Xs, S2), S is S2 + X.

ordena([], []).
ordena([H|T], R) :- ordena(T, L), inserta(H,L,R).


inserta(X,[],[X]).
inserta(X,[H|T],[X|L]) :- X =< H, inserta(H,T,L).
inserta(X, [H|T], [H|L]) :- X > H, inserta(X, T, L).