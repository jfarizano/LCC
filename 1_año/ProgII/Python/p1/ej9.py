def suma():
    x = int(input("Ingrese el primer número "))
    y = int(input("Ingrese el segundo número "))
    resultadoSuma = x + y
    print("El resultado de sumar",x, "y", y, "es", resultadoSuma)
    calculadora()

def resta():
    x = int(input("Ingrese el primer número "))
    y = int(input("Ingrese el segundo número "))
    resultadoResta = x - y
    print("El resultado de resta",x, "y", y, "es", resultadoResta)
    calculadora()

def multiplicacion():
    x = int(input("Ingrese el primer número "))
    y = int(input("Ingrese el segundo número "))
    resultadoMult = x * y
    print("El resultado de multiplicar",x, "y", y, "es", resultadoMult)
    calculadora()

def division():
    x = int(input("Ingrese el primer número "))
    y = int(input("Ingrese el segundo número "))

    if y == 0:
        print("¿Cómo vas a dividir por cero pelotudo?")
        calculadora()
    else:    
        resultadoDiv = x / y
        print("El resultado de dividir",x, "y", y, "es", resultadoDiv)
        calculadora()

def calculadora():
    print(
    """
    1. Suma
    2. Resta
    3. Multiplicación
    4. División
    5. Salir
    """)
    opcion = int(input("Ingrese un número para elegir una operación "))

    if opcion == 1:
        suma()
    elif opcion == 2:
        resta()
    elif opcion == 3:
        multiplicacion()
    elif opcion == 4:
        division()
    elif opcion == 5:
        exit
    else:
        calculadora()

calculadora()
