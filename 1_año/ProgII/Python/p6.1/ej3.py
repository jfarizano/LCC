from math import *

def busquedaDicotomica(list, elemen):

    primero = 0
    ultimo = len(list)-1
    mitad = (primero + ultimo) // 2

    while list[mitad] != elemen and primero <= ultimo:

        mitad = (primero + ultimo) // 2

        if list[mitad] < elemen:
            primero = mitad+1
        else:
            ultimo = mitad-1

    return list[mitad] == elemen, mitad

def listaOrdenada(list, elemen):
    busqueda = busquedaDicotomica(list, elemen)
    mitad = busqueda[1]
    if busqueda[0]:
        return busqueda[1]        
    else:
        if elemen < list[0]:
            list = [elemen] + list
        elif elemen > list[len(list)-1]:
            list = list + [elemen]
        else:
            list = list[:mitad+1] + [elemen] + list[mitad+1:]
        return list




print(listaOrdenada([0, 1, 2, 4, 5, 6, 7, 8], 3))
print(listaOrdenada([0, 1, 2, 3, 4, 5, 6, 7, 8], 5))
print(listaOrdenada([0, 1, 2, 3, 4, 5, 6, 7, 8], 0))
print(listaOrdenada([0, 1, 2, 3, 4, 5, 6, 7, 8], 99))
print(listaOrdenada([0, 1, 2, 3, 4, 20, 42, 71, 1230],21))
print(listaOrdenada([1, 2, 3, 4, 5], 0))




