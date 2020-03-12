def primerosNEnterosPares():
    """
    primerosNEnterosPares: Number -> Numbers

    Dado un número natural n, devuelve los primeros n números enteros pares

    Ejemplos
        primerosNEnterosPares(5) = 0 2 4 6 8
        primerosNEnterosPares(3) = 0 2 4
    """

    n = int(input("Ingrese un número: "))

    for x in range(0, n):
        print(x * 2)


primerosNEnterosPares()