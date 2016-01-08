-module(functions).
-compile(export_all). %% replace with function names later!

head([H|_]) -> H.

second([_,X|_]) -> X.

same(X,X) -> true;
same(_,_) -> false.

valid_time({Date={Y,M,D}, Time={H,Min,S}}) ->
    io:format("Date tuple ~p says today is: ~p-~p/~p~n", [Date,D,M,Y]),
    io:format("Time tuple ~p says it is: ~p:~p:~p~n", [Time,H,Min,S]);
valid_time(_) ->
    io:format("Stop feeding me incorrect data!~n").

