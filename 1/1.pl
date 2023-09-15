% Tomas Kozakas
% 1 užduotis: 1; 26; 38; 43

% (1)
% tevas(Tevas, Vaikas) - Pirmasis asmuo (Tevas) yra antrojo (Vaikas) tėvas;
% asmuo(Vardas, Lytis, Amzius, Pomegis)
asmuo(rolandas, vyras, 26, sportas).
asmuo(tomas, vyras, 21, sportas).
asmuo(ana, moteris, 49, sodas).
asmuo(andrius, vyras, 51, alus).
asmuo(romas, vyras, 50, pirtis).
asmuo(stanislava, moteris, 51, pirtis).
asmuo(julija, moteris, 28, knygos).
asmuo(kristina, moteris, 61, siltnamis).
asmuo(romasv, vyras, 62, autobusai).
asmuo(marija, moteris, 82, televizorius).

% mama(Mama, Vaikas)
mama(kristina, ana).
mama(kristina, romas).
mama(marija, andrius).
mama(ana, rolandas).
mama(ana, tomas).
mama(stanislava, julija).

% pora(Vyras, Žmona) 
pora(romasv, kristina).
pora(petras, marija).
pora(romas, stanislava).
pora(andrius, ana).

% ar asmuo yra tevas
tevas(Tevas, Vaikas) :- 
    mama(Mama, Vaikas),         	% ar Vaikui yra Mama
    pora(Tevas, Mama),          	% ar Tevas sudaro pora su Mama
    asmuo(Tevas, vyras, _, _).  	% ar Tevas yra vyras

% test
% tevas(andrius, rolandas) 		% true
% tevas(andrius, tomas)			% true
% tevas(romas, julija)			% true
% tevas(romasv, ana)			% true

% (26)
% istekejusi(Istekejusi) - Asmuo Istekejusi yra ištekėjusi (moteris);
istekejusi(Moteris) :- 
    asmuo(Moteris, moteris),  		% ar Moteris yra moteris.
    asmuo(Vyras, vyras).		% ar Vyras yra vyras
    pora(Vyras, Moteris),       	% ar Vyras, sudaro pora su Moteris.
% test
% istekejusi(ana)			% true
% istekejusi(stanislava)		% true
% istekejusi(julija)			% false
% istekejusi(kristina)			% true

% (38)
% stos_i_informatika(Abiturientas) - Asmuo Abiturientas yra pakankamo (patys nuspręskite kokio) amžiaus ir domisi (mėgsta) informatika;
abiturientas(tomas, 21, informatika).
abiturientas(igor, 17, informatika).

stos_i_informatika(Abiturientas) :-
    abiturientas(Abiturientas, Amzius, informatika),
    Amzius >= 18.
% test
% stos_i_informatika(tomas)		% true
% stos_i_informatika(igor)		% false

% (43)
% dar_pagyvens(Asmuo) - Asmuo Asmuo mėgsta kurią nors iš sporto šakų arba yra dar nepensinio amžiaus (64 metai vyrams ir 63 metai moterims);
% megsta_sporta(Vardas)
megsta_sporta(marija).

dar_pagyvens(Vardas) :-
    megsta_sporta(Vardas).
    
dar_pagyvens(Vardas) :-
    asmuo(Vardas, vyras, Amzius, _),
    Amzius < 64.
    
dar_pagyvens(Vardas) :-
    asmuo(Vardas, moteris, Amzius, _),
    Amzius < 63. 
% test
% dar_pagyvens(marija)			% true
% dar_pagyvens(tomas)			% true
% dar_pagyvens(stanislava)		% true
% dar_pagyvens(romasv)			% true
