def vocales(str):

    vocales = ["a", "e", "i", "o", "u"]
    contador = [0] * 5

    for i in range(0, len(str)):
        for j in range(0, len(vocales)):
            if str[i].lower() == vocales[j]:
                contador[j] += 1

    print("En la palabra/frase: ", str)
    for i in range(0, len(contador)):
        print("La vocal ", vocales[i], " aparece ", contador[i], " veces.")

vocales("HOLa")
vocales("Probando esta mierda")
