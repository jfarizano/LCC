-module(mutex).
%% Funciones de la variable mutex
-export([crear/0, borrar/1]).
-export([tomar/1, soltar/1]).
-export[(locker/1)].

%% Funciones para testear la implementación
-export([testLock/0,waiter/2]).
-export([f/2]).

crear() -> spawn(?MODULE, locker, [unblocked]).

borrar(Locker) -> 
  Locker ! borrar,                 
  io:format("Locker borrado~n").

tomar(Locker) ->
  Locker ! {lock, self()},
  receive
    locked -> tomar(Locker);
    unblocked -> io:format("~p tomó el recurso del locker ~p ~n", [self(), Locker])
  end.

soltar(Locker) -> 
  Locker ! unblock,
  io:format("~p soltó el recurso del locker ~p ~n", [self(), Locker]).

locker(unblocked) ->
  receive
    {lock, PID} -> PID ! unblocked,
                   locker(locked);
    unblock -> locker(unblocked);
    borrar -> ok
  end;
locker(locked) ->
  receive 
    {lock, PID} -> PID ! locked,
                   locker(locked);
    unblock -> locker(unblocked);
    borrar -> ok
  end.  

testLock () ->
  L = crear(),
  W=spawn(?MODULE,waiter,[L,3]),
  spawn(?MODULE,f,[L,W]),
  spawn(?MODULE,f,[L,W]),
  spawn(?MODULE,f,[L,W]),
  ok.

f (L,W) -> 
  tomar(L),
  % 
  io:format("uno ~p~n",[self()]),
  io:format("dos ~p~n",[self()]),
  io:format("tres ~p~n",[self()]),
  io:format("cuatro ~p~n",[self()]),
  %
  soltar(L),
  W!finished.
          
waiter (L,0) -> borrar(L);
waiter (L,N) -> receive finished -> waiter(L,N-1) end.