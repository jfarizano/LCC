def paresMayores(m, n):
    """
    paresMayores: Number Number -> Numbers

    Dado dos números enteros m y n, imprime los primeros n números pares mayores que m
    :return:
    """

    for x in range(m+1, m+n*2, 2):
        if (x % 2) == 0:
            print(x)
        else:
            print(x+1)

paresMayores(6, 3)
paresMayores(3, 6)