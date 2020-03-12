def sumaPrimN(n, suma = 0, termino = 1):
    if termino <= n:
        sumaPrimN(n, suma+termino, termino+1)
    else:
        print(suma)

sumaPrimN(100)
