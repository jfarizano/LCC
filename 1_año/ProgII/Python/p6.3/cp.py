def cp(file):
    with open(file, "r") as entrada:
        datos = entrada.read()
    with open(str(file[:-4]+"-copia.txt"), "w+") as salida:
        salida.write(datos)

cp("prueba.txt")

