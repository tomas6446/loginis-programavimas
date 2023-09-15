% tevas(Tevas, Vaikas) - Pirmasis asmuo (Tevas) yra antrojo (Vaikas) tėvas;

% asmuo(Vardas, Lytis, Amzius)
asmuo(rolandas, vyras, 40).
asmuo(emilija, moteris, 38).
asmuo(oskar, vyras, 10).
asmuo(inga, moteris, 8).

% mama(Mama, Vaikas)
mama(emilija, oskar).
mama(emilija, inga).

% pora(Vyras, Žmona) 
pora(rolandas, emilija).

% ar yra asmuo tevas
tevas(Tevas, Vaikas) :- 
    mama(Mama, Vaikas),         % ar Vaikui yra Mama
    pora(Tevas, Mama),          % ar Tevas sudaro pora su Mama
    asmuo(Tevas, vyras, _).     % ar Tevas yra vyras

% test
tevas(rolandas, oskar). 	% true
tevas(emilija, oskar). 		% false
