from random import  *

def programaDeAzarConMujerzuelas():
    """
    Representamos tiradas de dados y dinero mediante números

    programaDeAzarConMujerzuelas: -> Number

    Dado un número n, simula n tiradas de dados, Si sale 6 gana 4 pesos, con un 3 gana 1 dólar

    """
    tiradas = int(input("Ingrese un número: "))
    dinero = 0
    dolar = 37

    for n in range(0, tiradas):

        dado = randint(1, 6)
        print("Tirada n°" +  str(n) + ", salió: " + str(dado))

        if dado == 6:
            dinero += 4
            print("Ganaste 4 pesos")
        elif dado == 3:
            dinero += dolar
            print("Ganaste un dólar")
        elif dado == 2 or dado == 4 or dado == 5:
            dinero -= 2
            print("Perdiste 2 pesos")
        else:
            print("Siga participando")


    print("Dinero final $" + str(dinero))

programaDeAzarConMujerzuelas()