-module(timers).
-import(timer, [sleep/1, exit_after/2, apply_interval/4]).
-export([wait/1, cronometro/3, f/0]).

wait(Time) -> sleep(Time).

f() -> io:format("Tick ~n").

cronometro(F, Time, Per)->
  exit_after(Time, self()),
  apply_interval(Per, ti, F, []).

