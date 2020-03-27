def nTriangulares(n):
    """
    Representamos números triángulares mediante números
    nTriangulares: Number -> Numbers
    Dado un número n, devuelve los primeros n números triángulares, junto con su índice:

    """
    for num in range(1, n+1):
            triang = triangular(num)
            print(num, " - ", triang)


def triangular(num):
    """
    triangular: Number -> Number
    Dado un número n, devuelve su triangular

    :
    """
    triangular = 0
    for num in range(1, num+1):
        triangular+=num
    return triangular

nTriangulares(5)