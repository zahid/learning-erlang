-module(hhfuns).
-compile(export_all).

one() -> 1.
two() -> 2.

add(X,Y) -> X() + Y().

incrementList([]) -> [];
incrementList([H|T]) -> [H+1|incrementList(T)].

decrementList([]) -> [];
decrementList([H|T]) -> [H-1|decrementList(T)].

map(_,[]) -> [];
map(F, [H|T]) -> [F(H)| map(F,T)].

increment(X) -> X + 1.
decrement(X) -> X - 1.

PrepareAlarm = fun(Room) ->
        io:format("Alarm set in ~s.~n", [Room]),
        fun() -> io:format("Alarm tripped in ~s. Call Batman!~n", [Room])
    end.

AlarmReady = PrepareAlarm("bathroom").
AlarmReady().
