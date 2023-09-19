% Tomas Kozakas
% 2 užduotis: 2.1; 6.4

% (2.1)
% Duomenų bazėje saugomi duomenys apie studentus faktais: studentas(Vardas, Kursas);
% yraVyresnis(StudentoVardas1, StudentoVardas2). Sąryšis „būti vyresniu“ yra tranzityvus,
% todėl į faktų aibę neįtraukiami tie faktai, kurie seka iš tranzityvumo sąryšio.
% Tai reiškia, kad, jeigu Jonas vyresnis už Miglę, o Miglė % už Ritą, tai faktų aibėje yra
% predikatai yraVyresnis(jonas, migle) ir yraVyresnis(migle, rita), bet nėra predikato 
% yraVyresnis(jonas, rita). Taip pat sąryšis „būti vyresniu“ yra pilnai sutvarkantis 
% studentų aibę. Tai 
% reiškia, kad, kokius bepaimsime du skirtingus studentus Studentas1 ir Studentas2, arba 
% Studentas1 bus vyresnis už Studentas2, arba Studentas2 bus vyresnis už Studentas1. Taigi, 
% pavyzdžiui, tokia faktų aibė yra negalima: yraVyresnis(jonas, migle), yraVyresnis(migle, 
% rita), yraVyresnis(jonas, tadas) ir yraVyresnis(tadas, rita). Apibrėžkite predikatą:

% studentas(Vardas, Kursas)
studentas(tomas, 3).
studentas(algis, 3).
studentas(benas, 3).
studentas(nikita, 2).
studentas(petras, 2).
studentas(jonas, 2).
studentas(gabija, 1).
studentas(migle, 1).
studentas(rolandas, 4).

% studentas A yra vyresnis už to paties kurso studentą B
vyresnis(tomas, algis).
vyresnis(algis, benas).

yraVyresnis(StudentoVardas1, StudentoVardas2) :-
    	vyresnis(StudentoVardas1, StudentoVardas2).
yraVyresnis(StudentoVardas1, StudentoVardas2) :-
    	vyresnis(StudentoVardas1, X),
    	yraVyresnis(X, StudentoVardas2).
    
    
% Natūralieji skaičiai yra modeliuojami termais nul, s(nul), s(s(nul)),… (žr. paskaitos medžiagą). 
% Apibrėžkite predikatą: pirmasis skaičius dalus antrajam.
subtract(X, nul, X).		% atimties bazinė sąlyga 

% Rekursinė atimties sąlyga
% atimame po vieneta
subtract(s(X), s(Y), Z) :-
    subtract(X, Y, Z).
    
subtract(X, nul, X).        % atimties bazinė sąlyga 

% Rekursinė atimties sąlyga
% atimame po vieneta
subtract(s(X), s(Y), Z) :-
    subtract(X, Y, Z).

dalus(X, X).
dalus(X, Y) :-
    subtract(X, Y, Z), 
    X \= Z,           
    dalus(Z, Y). 
    
% 6 / 2 dalus(s(s(s(s(s(s(nul)))))),s(s(nul))) -> true
% 5 / 2 dalus(s(s(s(s(s(nul))))),s(s(nul))) -> false

