-module(procesos).
-export([start/2, recv/1, sender/3]).

% Escribir una función start/2 que tome un entero M y un mensaje Msj, cree
% dos procesos que envíen M mensajes Msj entre ellos y terminen, ambos
% correctamente.

recv(Msj)->
  receive
      {Msj, PID}-> io:format("1: ~p ~n", [Msj]),
                   PID ! Msj,
      recv(Msj)
  end.

sender(0, _, _)-> io:format("Fin de la comunicación~n");
sender(M, Msj, PID)-> 
  PID ! {Msj, self()},
  receive
    Msj-> io:format("2: ~p ~n", [Msj]),
    sender(M-1, Msj, PID)
  end.

start(M, Msj)->
  PID1 = spawn(procesos, recv, [Msj]),
  spawn(procesos, sender, [M, Msj, PID1]).