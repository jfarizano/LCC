def posiciones(lista, x):
    contador = 0
    pos = []
    for i in range(0, len(lista)):
        if lista[i] == x:
            contador += 1
            pos += [i]
    return contador, pos

print(posiciones([1, 1, 2, 3, 4, 4, 5, 6, 6, 6, 6, 7, 7], 6))