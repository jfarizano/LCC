def head(file, n):
    limpio = []
    with open(file, "r") as archivo:
        lineas = archivo.readlines()[:n]
    for i in range(len(lineas)):
        limpio += lineas[i].split()
    print(limpio)

head("prueba.txt", 4)
