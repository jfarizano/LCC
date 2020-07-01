-module(ej).
-import(lists, [nth/2]).
-compile(export_all).

w() ->
	io:format(user, "Trabajando...~n", []),
	timer:sleep(2000),
	w().

s_loop() ->
  Nodos = nodes(),
  if
    Nodos == [] -> ok;
    true -> spawn_link(nth(1, Nodos), ?MODULE, w, []),
            receive
              {'EXIT', _, _} -> s_loop()
            end
  end.

s() ->
    process_flag(trap_exit, true),
    s_loop().