% 6. Grafo brėžimas.
% Duotas plokštuminis grafas. Raskite kelią, einantį per visas grafo briaunas, kai:
% 6.1 per tą pačią briauną antrą kartą leidžiama eiti tik priešinga kryptimi, negu buvo eita pirmąjį kartą;

% Pasirenka elementa ir istrina ji is listo
% select_el(Element, List, RemainingList)
select_el(Elem, [Elem|Tail], Tail).
select_el(Elem, [Head|Tail], [Head|NewTail]) :-
    select_el(Elem, Tail, NewTail).
    
% reverse_list(List, ReversedList)
reverse_list(List, ReversedList) :-
    reverse_list(List, [], ReversedList).

% reverse_list(CurrentList, Accumulator, Result)
reverse_list([], Accumulator, Accumulator).
reverse_list([Head|Tail], Accumulator, Result) :-
    reverse_list(Tail, [Head|Accumulator], Result).

% Jeigu existuoja pora tada ji yra panaikinama is seto
connected((N1, N2), Edges, NewEdges) :- 
    select_el((N1, N2), Edges, NewEdges);
    select_el((N2, N1), Edges, NewEdges).

% path(CurrentNode, EdgesLeft, PathSoFar, FinalPath).
path(Node, EdgesLeft, PathSoFar, FinalPath) :-
    traverse(Node, EdgesLeft, [Node|PathSoFar], FinalPath).

traverse(_, [], Path, Path). % Daugiau nera poru pabaigiam darba
traverse(CurrentNode, EdgesLeft, PathSoFar, FinalPath) :-
    connected((CurrentNode, NextNode), EdgesLeft, RemainingEdges), % Pasirinkam briauna
    !,
    traverse(NextNode, RemainingEdges, [NextNode|PathSoFar], FinalPath). % Einam toliau

% find_path(StartingNode, EdgeTuples, Path).
find_path(StartingNode, EdgeTuples, Path) :-
    path(StartingNode, EdgeTuples, [], RevNodes),
    reverse_list(RevNodes, Nodes),
    nodes_to_edges(Nodes, Path).

% nodes_to_edges(ListOfNodes, ListOfEdges)
nodes_to_edges([], []).
nodes_to_edges([_], []).
nodes_to_edges([Node1,Node2|Nodes], [(Node1,Node2)|Edges]) :-
    nodes_to_edges([Node2|Nodes], Edges).

% Example query to find a path.
% ?- find_path(b, [(a, b), (b, a), (b, c), (c, b), (c, d), (d, c), (d, a), (a, d), (b, d), (d, b)], Path), write(Path).
% ?- find_path(a, [(a, b), (b, a), (b, c), (c, d), (d, c), (d, a), (b, d)], Path), write(Path).
