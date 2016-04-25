%---------Bubble sort-----------
swap([X, Y | R], [Y, X | R]) :-
	X>Y, !.

swap([X | R1], [X | R2]) :-
	swap(R1, R2).

bsort(L, Sorted) :-
	swap(L, L1), !,
	bsort(L1, Sorted).

bsort(Sorted, Sorted).
%----------------------------------------

%-- Wyswietlanie wszystkich el. listy--
printList([]).

printList([K|R]) :-
	print(K),
	printList(R).
%----------------------------------------

%-Wyznaczanie wszystkich subsetow dlugosci n-
subset([], 0, []).

subset([A|B], N, [A|R]):-
  N1 is N - 1,
  subset(B, N1, R).
  
subset([_|B], N, R):-
  subset(B, N, R).
%----------------------------------------

%--Sprawdzanie, czy &1 jest podlista &2--
isSublist([], _).

isSublist([A|B], [A|R]) :-
  isSublist(B,R).
  
isSublist([A|B], [_|R]) :-
  isSublist([A|B], R).
%----------------------------------------
  
%----------- Odwracanie listy -----------
reverseList(List, Result) :-
	reverseList1(List, [], Result).

reverseList1([], Result, Result).

reverseList1([A|B], Acc, Result) :-
  reverseList1(B, [A|Acc], Result).
%----------------------------------------

%----------- "Quick" sort ---------------
quickSort([A|B], Result) :-
	partition(A, B, Left, Right),
	quickSort(Left, LResult),
	quickSort(Right, RResult),
	append(LResult, [A|RResult], Result).
	
quickSort([], []).
	
% jak A >= B, to B wpisujemy do lewej listy
partition(A, [B|C], [B|Left], Right) :-
	A >= B, !,
	partition(A, C, Left, Right).
	
% wpp, B przypisujemy do prawej
partition(A, [B|C], Left, [B|Right]) :-
	partition(A, C, Left, Right).
	
partition(_, [], [], []).

append([], Result, Result).

append([A|B], C, [A|Result]) :-
	append(B, C, Result).
%----------------------------------------
