% stos_i_informatika(Abiturientas) - Asmuo Abiturientas yra pakankamo (patys nuspręskite kokio) amžiaus ir domisi (mėgsta) informatika;

% Abiturientas(Vardas, Amzius, Domisi, Išlaike)
abiturientas(tomas, 18, informatika, taip).
abiturientas(valdemaras, 19, chemija, taip).
abiturientas(donatas, 19, matematika, ne).
abiturientas(igoris, 18, informatika, ne).
abiturientas(petras, 17, informatika, taip).

baige_mokykla(Vardas) :-
    abiturientas(Vardas, Amzius, _, taip),
    Amzius >= 18.

domisi_informatika(Vardas) :-
    abiturientas(Vardas, _, informatika, _).

stos_i_informatika(Abiturientas) :-
    domisi_informatika(Abiturientas),
    baige_mokykla(Abiturientas).
    
% test
stos_i_informatika(tomas).	% true
stos_i_informatika(igoris). 	% false
stos_i_informatika(petras).	% false
stos_i_informatika(valdemaras).	% false
