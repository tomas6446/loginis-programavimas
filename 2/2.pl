% Tomas Kozakas
% 2 užduotis: 2.1; 6.4

studentas(tomas, 3).
studentas(algis, 3).
studentas(benas, 3).
studentas(nikita, 2).
studentas(petras, 2).
studentas(jonas, 2).
studentas(gabija, 1).
studentas(migle, 1).
studentas(rolandas, 4).

% (2.1)
% Duomenų bazėje saugomi duomenys apie studentus faktais: studentas(Vardas, Kursas);
% yraVyresnis(StudentoVardas1, StudentoVardas2). Sąryšis „būti vyresniu“ yra tranzityvus,
% todėl į faktų aibę neįtraukiami tie faktai, kurie seka iš tranzityvumo sąryšio.
% Tai reiškia, kad, jeigu Jonas vyresnis už Miglę, o Miglė % už Ritą, tai faktų aibėje yra
% predikatai yraVyresnis(jonas, migle) ir yraVyresnis(migle, rita), bet nėra predikato yraVyresnis(jonas,
% rita). Taip pat sąryšis „būti vyresniu“ yra pilnai sutvarkantis studentų aibę. Tai reiškia,
% kad, kokius bepaimsime du skirtingus studentus Studentas1 ir Studentas2, arba Studentas1 bus
% vyresnis už Studentas2, arba Studentas2 bus vyresnis už Studentas1. Taigi, pavyzdžiui, tokia
% faktų aibė yra negalima: yraVyresnis(jonas, migle), yraVyresnis(migle, rita),
% yraVyresnis(jonas, tadas) ir yraVyresnis(tadas, rita). Apibrėžkite predikatą:

% studentas A yra vyresnis už to paties kurso studentą B

yraVyresis(studentoVardas1, studentoVardas2) :-
    studentas(studentoVardas1, X),
    studentas(studentoVardas2, Y),
    studentoVardas1 /= studentoVardas2,
    X = Y.



