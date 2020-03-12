def es_potencia_de_dos(x):

    while x != 1:
        if x % 2 == 0:
            x = x/2
        else:
            return False
    return True

print(es_potencia_de_dos(2048))

def potencias(x, y):
    for z in range(x, y):
        if es_potencia_de_dos(z):
            print(z)

potencias(2, 1024)
