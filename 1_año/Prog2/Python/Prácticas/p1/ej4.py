def sumaPrim50(suma = 0, termino = 1):
    if termino <= 50:
        sumaPrim50(suma+termino, termino+1)
    else:
        print(suma)

sumaPrim50()
