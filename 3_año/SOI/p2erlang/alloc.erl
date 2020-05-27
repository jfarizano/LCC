-module(alloc).
-export([test/0, waiter/2, f/2, f2/2, buscar_recurso/2]).
-export([crear/1, borrar/1, pedir/1, soltar/2, alloc/2, liberar/2, allocar/3]).

crear(R) -> spawn(?MODULE, alloc1, [R, []]).

borrar(A) -> exit ! A.

%% Función que busca un recurso libre, y lo entrega.
%% Notar que se lleva cuenta quien tiene cada recurso.
allocar([], EnUso, Pid) ->
  Pid ! noHay,
  {[], EnUso};
allocar([R1 | Recursos], EnUso, Pid) ->
  Pid ! {hay, R1},
  {Recursos, [{R1 , Pid} | EnUso]}.

liberar(_, []) -> [];
liberar(Tomado, [R | Rs]) ->
  if
    Tomado == R -> Rs;
    true -> [R] ++ liberar(Tomado, Rs)
  end.

buscar_recurso(Pid, [{R, P} | Rs]) ->
  if
    Pid == P -> R;
    true -> buscar_recurso(Pid, Rs)
  end.

alloc(Libres, EnUso) ->
  receive
    {tomar, Pid} ->
      {NLibres, NEnUso} = allocar(Libres, EnUso, Pid),
      alloc(NLibres, NEnUso);
    {liberar, Pid, Recurso} ->
      NEnUso = liberar({Pid, Recurso}, EnUso),
      alloc([Recurso | Libres], NEnUso);
    {'EXIT', FromPid, Reason} ->  
      io:format("~p murió por ~p, liberando su recurso~n", [FromPid, Reason]),
      Recurso = buscar_recurso(FromPid, EnUso),
      NEnUso = liberar({Recurso, FromPid}, EnUso),
      alloc([Recurso | Libres], NEnUso))
    borrar -> exit(nv)
  end.

pedir(A) ->
  A ! {tomar, self()},
  receive
    noHay -> pedir(A);
    {hay, R} -> R
  end.

soltar(A, R) ->
  A ! {liberar, self(), R}.

f(A, W) ->
  R = pedir(A),
  % 
  io:format("~p uno ~p~n",[R, self()]),
  io:format("~p dos ~p~n",[R, self()]),
  io:format("~p tres ~p~n",[R, self()]),
  io:format("~p cuatro ~p~n",[R, self()]),
  %
  soltar(A, R),
  W ! finished.

f2(A, W) ->
  R = pedir(A),
  % 
  io:format("~p uno ~p~n",[R, self()]),
  io:format("~p dos ~p~n",[R, self()]),
  exit(died),
  io:format("~p tres ~p~n",[R, self()]),
  io:format("~p cuatro ~p~n",[R, self()]),
  %
  soltar(A, R),
  W ! finished. 

test() ->
  R = [r1, r2],
  A = crear(R),
  W = spawn(?MODULE,waiter, [A,4]),
  spawn(?MODULE,f2,[A,W]),
  spawn(?MODULE,f,[A,W]),
  spawn(?MODULE,f,[A,W]),
  ok.

waiter (A, 0) -> borrar(A);
waiter (A, N) -> receive finished -> waiter(A, N-1) end.