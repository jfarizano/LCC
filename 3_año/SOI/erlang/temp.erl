-module(temp).
-export([f2c/1, c2f/1, convertir/1]).

f2c(F) -> (F - 32) * (5/9).

c2f(C) -> C * (9/5) + 32.

convertir({c, Temp}) -> {f, c2f(Temp)};
convertir({f, Temp}) -> {c, f2c(Temp)}.