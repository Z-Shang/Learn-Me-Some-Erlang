-module('1-2').
-export([ack/2, f_rec/1, pascal/1, ex113/1]).

%Exercise 1.10's ack:
ack(_, 0) ->
    0;
ack(0,Y) ->
    Y * 2;
ack(_, 1) ->
    2;
ack(X,Y) ->
    ack(X - 1, ack(X, Y - 1)).

%Exercise 1.11
f_rec(N) when N < 3 ->
    N;
f_rec(N) ->
    f_rec(N - 1) + 2 * f_rec(N - 2) + 3 * f_rec(N - 3).

%Exercise 1.12
gen_lst([_]) ->
    [];
gen_lst([X, Y|XS]) ->
    [X + Y] ++ gen_lst([Y] ++ XS).

sum_pre(1) ->
    [];
sum_pre(2) ->
    [2];
sum_pre(N) ->
    gen_lst(pascal(N)).

pascal(1) ->
    [1];
pascal(2) ->
    [1, 1];
pascal(X) ->
    [1] ++ sum_pre(X - 1) ++ [1].

%Exercise 1.13
phi(N) ->
    math:pow((1 + math:sqrt(5)) / 2, N).

psi(N) ->
    math:pow((1 - math:sqrt(5)) / 2, N).

fib(0) ->
    0;
fib(1) ->
    1;
fib(N) ->
    fib(N - 1) + fib(N - 2).

ex113(N) ->
    round((phi(N) - psi(N)) / math:sqrt(5)) == fib(N).
