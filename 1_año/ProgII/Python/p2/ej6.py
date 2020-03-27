def tasaInteres(c, x, n):
    """
    Representamos una cantidad de dinero en pesos, una tasa de interés y una cantidad de años mediante números
    tasaInteres(): Number Number Number -> Number

    Dada una cantidad de pesos inicial, una tasa de interés y un números de años, devuelve el monto final a obtener

    Ejemplos:
    >>> tasaInteres(100, 20, 5) = 248.83199999999994
    >>> tasaInteres(300, 20, 5) = 746.4959999999999
    >>> tasaInteres(100000, 7, 35) = 1067658.1484615451
    """
    monto = c * ((1 + (x/100))**n)
    print(monto)

tasaInteres(100, 20, 5)
