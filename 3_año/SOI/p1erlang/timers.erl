-module(timers).
-import(timer, [sleep/1, exit_after/2, apply_interval/4]).
-export([wait/1, cronometro/3, f/0]).

wait(Time) -> 
  receive
  after Time -> ok
  end.

f() -> io:format("Tick ~n").

cronometro(F, Time, Per)->
  if 
    Per > Time -> ok;
    true ->  wait(Per),
             F(),
            cronometro(F, Time - Per, Per)
  end.
