-module(timers).
-import(timer, [sleep/1]).
-export([wait/1]).

wait(Time) -> sleep(Time).

