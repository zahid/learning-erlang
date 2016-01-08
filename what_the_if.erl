-module(what_the_if).
-compile(export_all).

%% As Ward Cunningham once put it, "Clean code is when you look at a routine and it's pretty much what you expected." - http://learnyousomeerlang.com/syntax-in-functions

heh_fine() ->
    if 1 =:= 1 ->
        works
    end,
    if 1 =:= 2, 1 =:= 1 ->
        works
    end,
    if 1 =:= 2, 1 =:= 1 ->
        fails
    end.

oh_god(N) ->
    if N =:= 2 -> might_succeed;
        true -> always_does
    end.

help_me(Animal) -> 
    Talk = if Animal == cat -> "meow";
        Animal == dog -> "woof";
        Animal == cow -> "moo";
        Animal == tree -> "grrraawwwwwwwghh";
        true -> "what the . . ?"
    end,
    {Animal, "says " ++ Talk ++ "!"}. 

help_me2(Animal) when Animal == cat ->
    meow;
help_me2(Animal) when Animal == dog ->
    woof;
help_me2(Animal) when Animal == cow ->
    moo_moo_moo;
help_me2(Animal) when Animal == tree ->
    grrraaaWWwhh; 
help_me2(_) -> what_the.

insert(X, []) ->
    [X];
insert(X, Set) ->
    case lists:member(X, Set) of
        true -> Set;
        false -> [X|Set]
    end.

beach(Temperature) ->
    case Temperature of
        {celsius, N} when N >= 20, N =< 45 ->
            favorable;
        {kelvin, N} when N >= 293, N =< 318 ->
            scientifically_favorable;
        {fahrenheit, N} when N >= 68, N =< 113 ->
            favorable_in_the_us;
        _ ->
            avoid_beach
    end.

beachf({celsius, N}) when N >= 20, N =< 45 ->
    favorable;
beachf({kelvin, N}) when N >= 293, N =< 318 ->
    scientifically_favorable;
beachf({fahrenheit, N}) when N >= 68, N =< 113 ->
    favorable_in_the_us;
beachf(_) ->
    avoid_beach.
