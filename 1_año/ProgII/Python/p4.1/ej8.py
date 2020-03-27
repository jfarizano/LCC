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

    return list[mitad] == elemen





print(busquedaDicotomica(["A", "B", "C", "D", "E", "F", "G", "H", "J"], "W"))
print(busquedaDicotomica(["A", "B", "C", "D", "E", "F", "G", "H", "J"], "F"))
print(busquedaDicotomica(["A", "B", "C", "D", "E", "F", "G", "H", "J"], "A"))
print(busquedaDicotomica(["A", "B", "C", "D", "E", "F", "G", "H", "J"], "Z"))

