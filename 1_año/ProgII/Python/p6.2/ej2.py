from random import *

def diccionarioContar(str):
    list = str.lower().split()
    diccionario = {}
    for i in range(0, len(list)):
        if list[i] not in diccionario:
            diccionario[list[i]] = 1
        else:
            diccionario[list[i]] += 1
    return diccionario

print(diccionarioContar("que lindo dia que hace hoy"))

def tiradaDadosNVeces(n):
    contador = 0
    diccionario = {}

    for tirada in range(0, n):

        dado1 = randint(1, 6)
        dado2 = randint(1, 6)

        suma = str(dado1+dado2)
        
        if suma not in diccionario:
            diccionario[suma] = 1
        else:
            diccionario[suma] += 1
    return diccionario

print(tiradaDadosNVeces(1000000))
