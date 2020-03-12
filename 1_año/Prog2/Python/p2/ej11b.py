def multiplos(x, y):

    mult = 2
    num = x*mult
    contador = 0

    while num < y:
        contador += 1
        mult += 1
        num = x*mult

    print(contador)

multiplos(3, 12)

