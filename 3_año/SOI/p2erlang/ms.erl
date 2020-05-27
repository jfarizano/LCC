-module(ms).
-import(lists, [nth/2]).
-export([test/0]).
-export([to_slave/2, slave/0, spawn_slaves/1, respawn_slave/2]).
-export([master_loop/1,  master/1, start/1]).

to_slave(Msj, N) ->
  master ! {Msj, N}.

slave() ->
  receive
    die -> exit(latigazos);
    Msj -> io:format("Soy ~p, me llegó ~p ~n", [self(), Msj]),
           slave()
  end.

spawn_slaves(0) -> [];
spawn_slaves(N)-> [spawn_link(?MODULE, slave, [])] ++ spawn_slaves(N - 1).

respawn_slave([P | Ps], Pid)-> 
  if 
    P == Pid -> NewPid = spawn_link(?MODULE, slave, []),
                [NewPid] ++ Ps;
    true -> [P] ++ respawn_slave(Ps, Pid)
  end.

master_loop(Ps) -> 
  receive
    {Msj, N} -> nth(N, Ps) ! Msj,
                master_loop(Ps);
    {'EXIT', FromPid, Reason} -> io:format("~p murió por ~p, reviviendo proceso~n", [FromPid, Reason]),
                                 NewPs = respawn_slave(Ps, FromPid),
                                 master_loop(NewPs);
    exit -> unregister(master),
            exit(ninovimo)
  end.                                

master(N) -> 
  process_flag(trap_exit, true),
  Ps = spawn_slaves(N),
  master_loop(Ps).

start(N) ->
  MasterPid = spawn(?MODULE, master, [N]),
  register(master, MasterPid).

test()->
  start(3),
  to_slave("Prueba 1", 1),
  to_slave("Prueba 2", 2),
  to_slave("Prueba 3", 3),
  to_slave(die, 2),
  timer:sleep(1000),
  to_slave("Prueba 2 respawneado", 2),
  ok.