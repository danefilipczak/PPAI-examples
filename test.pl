cupsToQuarts(C, Q) :-
  C / 4 = Q.

quartsToGallons(Q, G) :-
  Q / 4 = G.

cupsToGallons(C, G) :-
  cupsToQuarts(C, X),
  quartsToGallons(X, G).
