def sumaAcumulada(list):
    suma = []

    if list == []:
        print(list)
    else:
        for pos in range(0, len(list)):
            if pos == 0:
                suma += [list[0]]
            else:
                x = list[pos] + suma[pos-1]
                suma += [x]
        print(suma)

sumaAcumulada([1, 2, 3])
sumaAcumulada([])
            
