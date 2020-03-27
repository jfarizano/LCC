def contar(l, x):

    contador = 0

    for i in range(0, len(x)):
        if x[i] == l:
            contador += 1

    print(contador)

contar("o", "colorado mufa")