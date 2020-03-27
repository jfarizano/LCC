def notas():

    suma = 0
    notas = []
    x = 0

    while x >= 0:
        x = int(input("Ingrese una nota del promedio, para finalizar el programa ingrese un número menor a 0: "))
        if x >= 0:
            notas += [x]

    for x in notas:
        suma += x
    promedio = suma / len(notas)
    print(promedio)


notas()