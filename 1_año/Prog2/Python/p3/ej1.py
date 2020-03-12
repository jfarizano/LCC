from random import *

def tiradaDados(contador = 0):
    """
    tiradaDados: -> String

    Simula el lanzamiento de un dado, finaliza cuando sale el número 7
    """
    num = randint(1, 7)

    if num != 7:
        print(num)
        tiradaDados(contador + 1)
    else:
        print("Se lanzó el dado " + str(contador) + " veces")

tiradaDados()

