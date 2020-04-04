p(1).

p(2) :- !.

p(3).

%% 5.2

class(N, positive) :- N > 0, !.

class(0, zero) :- !.

class(N, negative).

pos(N) :- N >= 0.

neg(N) :- N < 0.

split([], [], []).

split([H | T], [H | Rest], Ns) :-
	H >= 0, !,
	split(T, Rest, Ns).

split([H | T], Ps, [H | Rest]) :-
	% H < 0,
	split(T, Ps, Rest).

% 5.4

valid([], _, []).

% valid(Candidates, RuledOut, List).

valid([H | T], RuledOut, [H1 | Rest]) :-
	not(member(H, RuledOut)), !,
	H = H1,
	valid(T, RuledOut, Rest).

valid([H | T], RuledOut, L) :-
	valid(T, RuledOut, L).

% 5.6

unifiable([], _, []).

unifiable([H | T], Term, [H | Rest]) :-
	not(not(H = Term)), !,
	unifiable(T, Term, Rest).

unifiable([H | T], Term, L) :-
	unifiable(T, Term, L).
