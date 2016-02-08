-module('1-1').
-export([e13/3, new_sqrt/1, c_root/1]).

%Exercise 1.1
%In ERL

%Exercise 1.2
%Trivial

%Exercise 1.3
e13(X,Y,Z) when (X < Y) and (X < Z) ->
    Y + Z;
e13(X,Y,Z) when (Y < Z) and (Y < X) ->
    X + Z;
e13(X,Y,Z) ->
    X + Y.

%1.4 ~ 1.6: See Learn Me A Haskell

%Exercise 1.7
average(X,Y) ->
    (X+Y) / 2.

improve(Guess,X) ->
    average(Guess, (X/Guess)).

good_enough(PreGuess,NewGuess,X) ->
    abs((NewGuess-PreGuess) / PreGuess) =< 0.001.

sqrt_iter(PreGuess,NewGuess,X) ->
    case good_enough(PreGuess,NewGuess,X) of
        true -> NewGuess;
        false -> sqrt_iter(NewGuess, improve(NewGuess,X), X)
    end.

new_sqrt(X) ->
    sqrt_iter(1,2,X).

%Exercise 1.8
c_good_enough(Guess, X) ->
    abs((math:pow(Guess,3) - X) / X) =< 0.001.

c_improve(Guess,X) ->
    ((X / math:pow(Guess,2)) + Guess * 2) / 3.

c_root_iter(Guess,X) ->
    case c_good_enough(Guess,X) of
        true ->
            Guess;
        false ->
            c_root_iter(c_improve(Guess,X), X)
    end.

c_root(X) ->
    c_root_iter(1, X).
