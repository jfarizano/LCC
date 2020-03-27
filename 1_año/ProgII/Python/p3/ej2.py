from random import *

def tiradaDadosNVeces():
    """
    Representamos resultados de tiradas de dados mediante números

    tiradaDados: -> String

    Simula el lanzamiento de dos dados n veces, devuelve cuantas veces los dados coincidieron con los resultados
    """
    n = int(input("Ingrese un número: "))
    contador = 0

    for tirada in range(0, n):

        dado1 = randint(1, 6)
        dado2 = randint(1, 6)
        print(dado1, dado2)

        if dado1 == dado2:
            contador += 1

    print("Los dados coincidieron " + str(contador) + " veces")

tiradaDadosNVeces()