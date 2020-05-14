-module(mates).
-export([perimetro/1]).

perimetro({square, Side}) -> Side * 4;
perimetro({circle, Radius}) -> Radius * 2 * 3.14;
perimetro({triangle, A, B, C}) -> A + B + C.