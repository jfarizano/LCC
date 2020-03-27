def cuantaslargas(str):

    contador = 0
    lista = partir(str)

    for palabra in lista:
        if len(palabra) > 5:
            contador += 1

    print(contador)


def partir(str):

    marcas = []
    lista = []

    for i in range(0, len(str)):
        if str[i] == " ":
            marcas += [i]
    marcas += [len(str)]

    for i in range(0, len(marcas)):
        if i == 0:
            lista += [str[:marcas[i]]]
        else:
            lista += [str[marcas[i-1]+1:marcas[i]]]
    return lista


cuantaslargas("Probando esta función que no se si funciona")