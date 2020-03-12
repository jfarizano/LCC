def listaNum(lista):
    max = -1
    pos = -1
    for i in range(0, len(lista)):
        if lista[i] > max:
             max = lista[i]
             pos = i
    return (max, pos)

print(listaNum([1, 1, 9, 2, 156, 1 ,43, 43, 43, 14, 67]))