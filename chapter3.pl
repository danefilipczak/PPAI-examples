% X is a member of L if X is the head of L or if there is a tail of L for which X is the head

member(X, L) :- 
  [X | Y] = L.

member(X, [Head | Tail]) :-
  member(X, Tail).

% if the first argument is the empty list then the second and third argument must be the same

conc([], L, L).

% if the first argument is a non-empty list then it has a head and a tail and must look like this [X | L1]

conc([X | L1], L2, [X | L3]) :-
  conc(L1, L2, L3).

% exercise 3.1: 
% a: delete the last three elements from a list L producing another list L1

dock3(L, L1) :-
  conc(L1, ([_, _, _]), L).

% b: delete the first three elements and the last three elements from a list

snipEndsBy3(L, L1) :-
  conc([_, _, _], X, L),
  dock3(X, L1).

% 3.2 define last(Item, List)
% a: with conc

last0(X, L) :-
  conc(_, [X], L).

% b: without conc

last1(X, [X]).

last1(X, [_ | Tail]) :-
  last1(X, Tail).

del(X, [X|Tail], Tail).

del(X, [Y|Tail], [Y|Tail1]) :-
  del(X, Tail, Tail1).

sublist(S, L) :-
  conc(L1, L2, L),
  conc(S, L3, L2).

permutation([], []).

permutation([X|Tail], L) :-
  del(X, L, L1),
  permutation(L1, Tail).

dock2(L, L1) :-
  conc(L1, [_, _], L).

evenlength([]).

evenlength(L) :-
  dock2(L, L1),
  evenlength(L1). 

oddLength([X | []]).

oddLength(L) :-
  dock2(L, L1),
  oddLength(L1).

reverse([], []).

reverse([H | T], R) :-
  reverse(T, L1),
  conc(L1, [H], R).

palindrome(L) :-
 reverse(L, L).

shift([H|T], L2) :-
  conc(T, [H], L2). 
  
means(1, one).
means(2, two).
means(3, three).
means(4, four).

% basically a really annoying idiom for writing a map

translate([], []).

translate([H|T], L2) :-
  means(H, X), 
  translate(T, TT),
  conc([X], TT, L2).

subset(Set, []).

subset(Set, [H|T]) :-
  del(H, Set, DS),
  subset(DS, T).

divideList([A, B], [A], [B]).

divideList(L, A, B) :-
  evenlength(L),
  conc(A, B, L),
  length(A, X),
  length(B, X).

divideList(L, A, B) :-
  oddLength(L),
  conc(A, B, L),
  [H|T] = A,
  length(T, X),
  length(B, X).

length1([], 0).

length1([H|T], X) :-
  length1(T, Y),
  X = Y + 1.

