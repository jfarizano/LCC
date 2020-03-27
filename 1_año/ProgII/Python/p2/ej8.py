def positivo():

    x = int(input("Ingrese un número positivo: "))

    while x <= 0:
        print("Un número positivo te dije la concha de tu madre")
        x = int(input("Ingresá un número positivo esta vez: "))

positivo()