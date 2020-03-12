def multiplos(x, y):
    contador = 0
    for num in range(x+1, y):
        if num % x == 0:
            contador+=1

    print(contador)

multiplos(2, 12)




