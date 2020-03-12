def posicionesMultiplo(list, num:)
    """
     posicionesMultiplo: List Number -> List

     Dada una lista list y un número num, devuelve una lista formada por los elementos de list que estén en una posición
     múltiplo de num

    """
    lista = []
    
    for pos in range(0, len(list)):
        if (pos % num == 0):
            lista += [list[pos]]
    print(lista)
    
posicionesMultiplo([1, 2, 3, 4, 5, 6, 7], )2
posicionesMultiplo([1, 2, 3, 4, 5, 6, 7], 3)
