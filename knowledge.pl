% ===== FACTS =====

male(abraham).
male(herb).
male(homer).
male(clancy).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

parent(abraham, herb).
parent(mona, herb).

parent(abraham, homer).
parent(mona, homer).

parent(clancy, marge).
parent(jackie, marge).

parent(clancy, patty).
parent(jackie, patty).

parent(clancy, selma).
parent(jackie, selma).

parent(homer, bart).
parent(marge, bart).

parent(homer, lisa).
parent(marge, lisa).

parent(homer, maggie).
parent(marge, maggie).

parent(selma, ling).


% ===== RULES =====

father(X, Y) :-
    male(X),
    parent(X, Y).

mother(X, Y) :-
    female(X),
    parent(X, Y).

son(X, Y) :-
    male(X),
    parent(Y, X).

daughter(X, Y) :-
    female(X),
    parent(Y, X).

brother(X, Y) :-
    male(X),
    parent(P, X),
    parent(P, Y),
    X \= Y.

sister(X, Y) :-
    female(X),
    parent(P, X),
    parent(P, Y),
    X \= Y.

grandfather(X, Z) :-
    male(X),
    parent(X, Y),
    parent(Y, Z).

aunt(X, Y) :-
    female(X),
    parent(P, Y),
    sister(X, P).

uncle(X, Y) :-
    male(X),
    parent(P, Y),
    brother(X, P).

cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    (brother(P1, P2) ; sister(P1, P2)),
    X \= Y.

ancestor(X, Y) :-
    parent(X, Y).

ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).
	
	% ==========================================
% TEST QUERIES AND RESULTS
% ==========================================

% 74 ?- father(homer, bart).
% true.

% 75 ?- father(clancy, marge).
% true.

% 76 ?- mother(marge, lisa).
% true.

% 77 ?- mother(selma, ling).
% true.

% 78 ?- son(bart, homer).
% true.

% 79 ?- son(homer, abraham).
% true.

% 80 ?- daughter(lisa, marge).
% true.

% 81 ?- daughter(ling, selma).
% true.

% 82 ?- brother(homer, herb).
% true.

% 83 ?- brother(herb, homer).
% true.

% 84 ?- sister(patty, marge).
% true.

% 85 ?- sister(selma, marge).
% true.

% 86 ?- grandfather(abraham, bart).
% true.

% 87 ?- grandfather(clancy, lisa).
% true.

% 88 ?- aunt(patty, bart).
% true.

% 89 ?- aunt(selma, lisa).
% true.

% 90 ?- uncle(herb, bart).
% true.

% 91 ?- uncle(herb, lisa).
% true.

% 92 ?- cousin(bart, ling).
% true.

% 93 ?- cousin(lisa, ling).
% true.

% 94 ?- ancestor(abraham, maggie).
% true.

% 95 ?- ancestor(jackie, ling).
% true.