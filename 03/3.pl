% Tomas Kozakas
% 2 užduotis: 1.11; 2.5; 3.3; 4.3

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (1.11)
% iterpti(S,K,R) - sąrašas R gautas į duotąjį skaičių 
% sąrašą S, įterpus duotąjį skaičių K, kad K kaimynas iš 
% kairės sąraše R būtų mažesnis, o iš dešinės - didesnis negu K. 
% Pavyzdžiui:
% ?- iterpti([10,2,14,8,1],13,R).
% R = [10,2,13,14,8,1].

% Jei sarasas yra tuscias, iterpiame skaiciu i tuscia sarasa.
% iterpti([], K, [K]).

% Jei K yra mazesnis uz pirma saraso elementa, iterpiame K pries sarasa.
% iterpti([H|T], K, [K, H|T]) :- K < H.

% Jei K yra didesnis uz pirma, bet mazesnis uz antra, iterpiame K tarp ju.
iterpti([H1, H2|T], K, [H1, K, H2|T]) :- 
	K > H1, 
	K < H2.

% Kitais atvejais ieskome tinkamos vietos iterpimui.
iterpti([H|T], K, [H|R]) :-
	iterpti(T, K, R).
	
last_el(X,[X]).
last_el(X,[_|T]) :- last_el(X,T).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (2.5)
%  galiniai(S,K,R) - sąrašas R - paskutiniųjų K duoto sąrašo S 
% elementų sąrašas. 
% Pavyzdžiui:
% ?- galiniai([a,b,c,d,e],3,R).
% R = [c,d e].

% Jei sarasas yra tuscias, rezultatas taip pat yra tuscias sarasas
galiniai([], _, []).

galiniai(S, K, R) :-
	ilgis(S, Len), 		% apskaiciuojame saraso S ilgi
	Start is Len - K + 1, 	% nustatome pradzios pozicija Start
	nthtail(Start, S, R).	% gauname saraso dalis nuo sios pozicijos

ilgis([], 0).
ilgis([_|T], Len) :-
	ilgis(T, Len1),
	Len is Len1 + 1.

% Grazina saraso dalis nuo N-to elemento.
nthtail(1, L, L).
nthtail(N, [_|T], R) :-
	N > 1,
	N1 is N - 1,
	nthtail(N1, T, R),
	!.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (3.3)
% nesikartoja(S,R) - sąrašas R gaunamas iš duotojo 
% sąrašo S pašalinus pasikartojančius elementus. 
% Pavyzdžiui:
% ?- nesikartoja([a,b,a,d],R).
% R = [a,b,d].

% Jei sarasas yra tuscias, rezultatas taip pat yra tuscias sarasas.
nesikartoja([], []).

% Jei elemento nera likusioje saraso dalyje, pridedame ji prie rezultato.
nesikartoja([H|T], [H|R]) :-
	\+ member(H, T),
	nesikartoja(T, R),
	!.

% Jei elementas pasikartoja likusioje saraso dalyje, praleidziame ji
nesikartoja([H|T], R) :-
	member(H, T),
	nesikartoja(T, R),
	!.

% Tikrina, ar elementas yra sarase.
member(X, [X|_]). % base case randa X
member(X, [_|T]) :-
	member(X, T). % praeinam pro sarašą

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (4.3)
% suma(S1,S2,Sum) - S1 ir S2 yra skaičiai vaizduojami skaitmenų 
% sąrašais. Sum - tų skaičių suma vaizduojama skaitmenų sąrašu. 
% Pavyzdžiui:
% ?- suma([9,4,6,1,3,4],[2,8],Sum).
% Sum = [9,4,6,1,6,2].

% Abieju sarasu ilgiai yra 0, grazinama suma.
suma([], [], 0, []).

% Abieju sarasu ilgiai yra 0, bet yra perkelimas.
suma([], [], 1, [1]).

suma([], [H2|T2], Carry, [R|T]) :-
	Sum is H2 + Carry,
	(Sum >= 10 -> R is Sum - 10, NewCarry = 1 ; R = Sum, NewCarry = 0),
	suma([], T2, NewCarry, T).

suma([H1|T1], [], Carry, [R|T]) :-
	Sum is H1 + Carry,
	(Sum >= 10 -> R is Sum - 10, NewCarry = 1 ; R = Sum, NewCarry = 0),
	suma(T1, [], NewCarry, T).

% Pagrindine suma
suma([H1|T1], [H2|T2], Carry, [R|T]) :-
	Sum is H1 + H2 + Carry,
	(Sum >= 10 -> R is Sum - 10, NewCarry = 1 ; R = Sum, NewCarry = 0),
	suma(T1, T2, NewCarry, T).

suma(S1, S2, Sum) :-
	reverse_list(S1, RS1),
	reverse_list(S2, RS2),
	suma(RS1, RS2, 0, RSum),
	reverse_list(RSum, Sum),
	!.
    
reverse_list([], List, List).

% Pradedam no Tail listo ir pridedam prie naujo listo rekursiskai
reverse_list([Head|Tail], List, Reversed) :-
	reverse_list(Tail, [Head|List], Reversed).

reverse_list(List, Reversed) :-
	reverse_list(List, [], Reversed).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


