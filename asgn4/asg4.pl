/*
 * CSCI3180 Principles of Programming Languages
 *
 * --- Declaration ---
 *
 * I declare that the assignment here Hmitted is original except for source
 * material explicitly acknowledged. I also acknowledge that I am aware of
 * University policy and regulations on honesty in academic work, and of the
 * disciplinary guidelines and procedures applicable to breaches of such policy
 * and regulations, as contained in the website
 * http://www.cuhk.edu.hk/policy/academichonesty/
 *
 * Assignment 4
 * Ame : Lam King Fung
 * Student ID : 1155108968
 * Email Addr : kflam8@cse.cuhk.edu.hk
 */

%Q1
% append/3
append([], L, L).
append([X|L1], L2, [X|L3]):- append(L1, L2, L3).

% a : element_last(X, L)
element_last(X, L) :- append(_, [X], L).
% element_last(e, [a, b, c, d, e]).


% b : element_n(X, L, N)
element_n(X, [X|_], s(0)).
element_n(X, [_|L], s(N)) :- element_n(X, L, N).
% element_n(c, [a, b, c, d, e], s(s(s(0)))).

% c : remove_n(X, L1, N, L2)
remove_n(X, [X|T], s(0), T).
remove_n(X, [H|L1], s(N), [H|L2]) :- remove_n(X, L1, N, L2).
% remove_n(X, [a, b, c, d, e], s(s(s(0))), L2).

/*
d : remove_n query
?- remove_n(a, L1, s(s(0)), [c, b, d, e]).
*/

% e : insert_n(X, L1, N, L2)
insert_n(X, T, s(0), [X|T]).
insert_n(X, [H|L1], s(N), [H|L2]) :- insert_n(X, L1, N, L2).
% insert_n(h, [a, b, c], s(s(0)), L2).


% f : repeat_three(L1, L2)
repeat_three([], []).
repeat_three([H|L1], [H, H, H|L2]) :- repeat_three(L1, L2).
% repeat_three([a, b, c, d, e], X).

/*
g : repeat_three(L1, L2) query
?- repeat_three(L1, [i, i, i, m, m, m, n, n, n]).
*/

%=================================================================================

%Q2
% sum/3
sum(0, X, X).
sum(s(X), Y, s(Z)) :- sum(X, Y, Z).

/*
a : Tree representation
mt(a, [mt(b, [mt(e, []), mt(f, [])]), mt(c, []), mt(d, [mt(g, [])])]).
*/

% b : is_tree(Term)
is_tree(mt(_, F)) :- is_forest(F).
is_forest([]).
is_forest([H|T]) :- is_tree(H), is_forest(T).
% is_tree(mt(a, [mt(b, [mt(e, []), mt(f, [])]), mt(c, []), mt(d, [mt(g, [])])])).

% c : num_node(Tree, N)
num_node(mt(_, []), s(0)).
num_node(mt(_, [H|T]), s(N)) :- num_node(H, A), tree_num(T, B), sum(B, A, N).
tree_num([], 0).
tree_num([H|T], N):-num_node(H, A), tree_num(T, B), sum(B, A, N).
% num_node(mt(a, [mt(b, [mt(e, []), mt(f, [])]), mt(c, []), mt(d, [mt(g, [])])]), N).

% d : sum_length(Tree, L)
sum_length(T, L) :- num_node_alt(T, L, 0).
num_node_alt(mt(_, []), 0, _).
num_node_alt(mt(_, [H|T]), S, D) :- num_node_alt(H, A, s(D)), trees_num_alt(T, B, s(D)), sum(B, A, N), sum(s(D), N, S).
trees_num_alt([], 0, _).
trees_num_alt([H|T], S, D) :- num_node_alt(H, A, D), trees_num_alt(T, B, D), sum(B, A, N), sum(D, N, S).
% sum_length(mt(a, [mt(b, [mt(e, []), mt(f, [])]), mt(c, []), mt(d, [mt(g, [])])]), N).