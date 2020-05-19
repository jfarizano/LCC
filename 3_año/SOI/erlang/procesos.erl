-module(procesos).
-export([start/2, recv/1, sender/3]).

%===============================================================================

% Escribir una función start/2 que tome un entero M y un mensaje Msj, cree
% dos procesos que envíen M mensajes Msj entre ellos y terminen, ambos
% correctamente.

% Espera a recibir un mensaje de la función 'sender', y luego le contesta
% enviandole el mismo mensaje.
recv(Msj)->
  receive
      {Msj, PID}-> io:format("1: ~p ~n", [Msj]),
                   PID ! Msj,
      recv(Msj)
  end.

% Se encarga de mandarle un mensaje a PID, luego, espera su respuesta, y vuelve
% a llamarse recursivamente M veces.
sender(0, _, _)-> io:format("Fin de la comunicación~n");
sender(M, Msj, PID)-> 
  PID ! {Msj, self()},
  receive
    Msj-> io:format("2: ~p ~n", [Msj]),
    sender(M-1, Msj, PID)
  end.

start(M, Msj)->
  % Creamos un proceso inicial PID1, que queda a la espera de que el segundo 
  % proceso que iniciaremos a continuación, mande el mensaje.

  % Proceso que ejecutará la función recv.
  PID1 = spawn(procesos, recv, [Msj]),
  % Proceso que ejecutará la función sender.
  spawn(procesos, sender, [M, Msj, PID1]).

%===============================================================================

% Escribir una función startAnillo/3 que tome dos entero M,N y un mensaje Msj, 
% genere N procesos en forma de anillo, y haga circular el mensaje Msj unas M 
% veces. Todos los procesos deberán terminar correctamente.