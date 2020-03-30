link(a, b).
link(b, d).
link(c, f).
link(d, f).
link(a, c).
link(c, d).
link(d, e).
link(f, a).

/*
	kind of broken, naive graph search. Since the graph is cyclic and it's depth first, 
	we can very easily get into shitty situations. 
*/

path(Node, Node).

path(StartNode, EndNode) :-
  link(StartNode, NextNode),
  path(NextNode, EndNode).

/*
	defining a simple list predicate seems kind of dumb, but it allows us to costrain the generation
	of paths to the shortest one first. Consider that list(X) will generate lists of increasing length
	starting with the empty list. This is exactly what we need in order to contrain the length of path,
	e.g. by calling 
		list(X), path(a, b, X).

	This effectivley forces shorter routes to be tried first, making the search breadth first instead of
	the default depth first.
*/
list([]).

list([H|T]) :-
  list(T).

path(Node, Node, [Node]).

path(StartNode, EndNode, [StartNode | Rest]) :-
  link(StartNode, NextNode),
  path(NextNode, EndNode, Rest).
