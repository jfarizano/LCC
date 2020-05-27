-module(semaphore).
-export([semP/1, semV/1, crearSem/1, eliminarSem/1, f/1, waiter_sem/2]).
-export([sem/2, testSem/0]).

% Pedir recurso al semáforo
semP(S) -> 
  S ! {take, self()},
  receive
    yes -> ok;
    no -> semP(S)
  end.

% Soltar el recurso
semV(S) -> S ! done.

% Semaforo
f(0) ->
  receive
    {take, PID} -> PID ! no,
                   f(0);
    done -> f(1);
    finish -> io:format("Finaliza2 + ~n")
  end;

f(N) -> 
  receive
    {take, PID} -> PID ! yes,
                   f(N - 1);
    done -> f(N+1);
    finish -> io:format("Finaliza2 ~n")
  end.

% Crea un semáforo
crearSem(N) -> spawn(?MODULE, f, [N]).

% Espera a que todos los procesos terminen y luego hace finalizar al semáforo.
waiter_sem(S, 0) -> eliminarSem(S);
waiter_sem(S, N) ->
  receive
    finished -> waiter_sem(S, N-1)
  end.

% Hace terminar el semáforo.
eliminarSem(S) -> S ! finish.

% Función que ejecutan los procesos.
sem(S,W) -> 
  semP(S),
  io:format("uno ~p~n",[self()]),
  io:format("dos ~p~n",[self()]),
  semV(S),
  io:format("Soy ~p, termine ~n", [self()]),
  W ! finished.

% Test
testSem () -> 
  % a lo sumo dos usando io al mismo tiempo
  S = crearSem(2), 
  io:format("Soy S ~p ~n", [S]),
  W = spawn(?MODULE, waiter_sem, [S,5]),
  spawn(?MODULE, sem, [S,W]),
  spawn(?MODULE, sem, [S,W]),
  spawn(?MODULE, sem, [S,W]),
  spawn(?MODULE, sem, [S,W]),
  spawn(?MODULE, sem, [S,W]),
  ok.
  % eliminarSem(S).
