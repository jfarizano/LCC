-module(listas).
-import(lists, [append/2]).
-export([min/1, max/1, min_max/1, map/2, foreach/2]).

min([Hd]) -> Hd;
min([Hd | Tl]) ->
  Rest = min(Tl),
  if
    Hd =< Rest -> Hd;
    true -> Rest
  end.

max([Hd]) -> Hd;
max([Hd | Tl]) ->
  Rest = max(Tl),
  if
    Hd > Rest -> Hd;
    true -> Rest
  end.

min_max(Xs) -> {min(Xs), max(Xs)}.

map(_, []) -> [];
map(F, [Hd | Tl]) -> [F(Hd) | map(F, Tl)]. 

foreach(_, []) -> ok;
foreach(F, [Hd | Tl]) ->
  F(Hd),
  foreach(F, Tl).