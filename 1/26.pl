% istekejusi(Istekejusi) - Asmuo Istekejusi yra ištekėjusi (moteris);

% asmuo(Vardas, Lytis)
asmuo(ieva, moteris).
asmuo(rolandas, vyras).
asmuo(emilija, moteris).
asmuo(gabija, moteris).
asmuo(tomas, vyras).

% pora(Vyras, Žmona) 
pora(rolandas, ieva).

% ar moteris yra ištekėjusi
istekejusi(Moteris) :- 
    asmuo(Moteris, moteris),  	% ar Moteris yra moteris.
    pora(Vyras, Moteris),       % ar Vyras, sudaro pora su Moteris.
    asmuo(Vyras, vyras).	% ar Vyras yra vyras
    
% test
istekejusi(ieva). 		% true
istekejusi(emilija). 		% false
