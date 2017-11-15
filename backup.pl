loves(remeo, juliet).
loves(juliet, remeo) :- loves(remeo, juliet).

human(derek).


male(albert).
male(bob).
male(bill).
male(carl).
male(charlie).
male(dan).
male(edward).

female(alice).
female(betsy).
female(diana).

parent(albert,bob).
parent(albert,betsy).
parent(albert,bill).

parent(alice,bob).
parent(alice,betsy).
parent(alice,bill).

parent(bob,carl).
parent(bob,charlie).

brother(bob, bill).


happy(albert).
happy(alice).
happy(bob).
happy(bill).

with_albert(alice).

near_water(bob).

runs(albert) :- 
    happy(albert).

dances(alice) :-
    happy(alice),
    with_albert(alice).

does_alice_dance :- dances(alice), write('When alice is happy and with albert she dances.').

swims(bob) :-
    happy(bob),
    near_water(bob).

get_grandchild :-
    parent(albert,X),
    parent(X,Y),
    write('Alberts grandchild is '),
    write(Y), nl.


get_grandparent :-
    parent(X,carl),
    parent(X,charlie),
    format('~w ~s grandparent ~n' , [X, 'is the']).

grand_parent(X,Y) :-
    parent(Z,X),
    parent(Y,Z).

blushes(X) :- human(X).


stabs(tybalt,mercutio,sword).
hates(romeo,X) :- stabs(X, mercutio, sword).

what_grade(5) :-
    write('go to kindergarten').
    
what_grade(6) :-
    write('go to 1st').

what_grade(Other) :-
    Grade is Other - 5,
    format('Go to grade ~w', [Grade]).



customer(tom, smith, 20.55).
customer(sally, smith, 120.55).

get_customer_balance(FName,LName) :-
    customer(FName,LName, Bal),
    format('~w owes us $~2f ~n',[LName, Bal]).


vertical(line(point(X,Y), point(X,Y2))).




horizontal(line(point(X,Y), point(X2,Y))).



warm_blooded(penguin).
warm_blooded(human).

produce_milk(penguin).
produce_milk(human).

have_feathers(penguin).
have_hair(human).

mammal(X) :-
    warm_blooded(X),
    produce_milk(X),
    have_hair(X).


%grand father
parent(albert, bob).
parent(albert, betsy).
parent(albert, bill).

%grand mother
parent(alice, bob).
parent(alice, betsy).
parent(alice, bill).

%parent
parent(bob, carl).
parent(bob, charlie).

related(X, Y) :-
    parent(X, Y).

related(X, Y) :-
    parent(X, Z),
    related(Z, Y).

% Write and Read file
% --------------------------------------------------
write_to_file(File, Text) :-
    open(File,write,Stream),
    write(Stream, Text), nl,
    close(Stream).

read_from_file(File) :-
    open(File, read, Stream),
    get_char(Stream, Char1),
    process_stream(Char1, Stream),
    close(Stream).

process_stream(end_of_file, _) :- !.

process_stream(Char, Stream) :-
    write(Char),
    get_char(Stream, Char2),
    process_stream(Char2, Stream).
% ==================================================



% guess number
% --------------------------------------------------
guess_num :- loop(0).

loop(15) :- write('You guessed it').
loop(X) :- 
    X \= 15,
    write('Guess number'),
    read(Guess),
    write(Guess),
    write(' is not the number'), nl,
    loop(Guess).
% ==================================================


% loop example
count_to_10(10) :- write(10), nl.
count_to_10(X) :- 
    write(X), nl,
    Y is X + 1,
    count_to_10(Y).

count_down(Low, High) :-
    between(Low,High, Y),
    Z is High - Y,
    write(Z), nl.

count_up(Low, High) :-
    between(Low,High, Y),
    Z is Low + Y,
    write(Z), nl.