% dar_pagyvens(Asmuo) - Asmuo Asmuo mėgsta kurią nors iš sporto šakų arba yra dar nepensinio amžiaus (64 metai vyrams ir 63 metai moterims);

% Amzius(Asmuo, Amžius)
amzius(tomas, 35).
amzius(inge, 61).
amzius(donatas, 65).
amzius(rita, 63).

% Moteris(Asmuo)
moteris(inge).
moteris(rita).

% Vyras(Asmuo)
vyras(tomas).
vyras(donatas).

% Megsta(Asmuo, Sportas)
megsta(tomas, krepsinis).
megsta(inge, begimas).

dar_pagyvens(Asmuo) :-
    megsta(Asmuo, _).  	% Asmuo patinka kažkoks sportas

dar_pagyvens(Asmuo) :-
    vyras(Asmuo),
    amzius(Asmuo, Amzius),
    Amzius < 64.      	% Vyras nepensinio amžiaus

dar_pagyvens(Asmuo) :-
    moteris(Asmuo),
    amzius(Asmuo, Amzius),
    Amzius < 63.      	% Moteris nepensinio amžiaus

% test
dar_pagyvens(tomas).	% true
dar_pagyvens(inge).	% true
dar_pagyvens(donatas).	% false

