def factorialNumeros(numeros):
    """
    factorialNumeros: Numbers -> Numbers

    Dado uno o más números, devuelve el factorial de ese números
    """
    for num in numeros:
        print((factorial(num)))

def factorial(n):
    """
    factorial: Number -> Number

    Dado un número, devuelve su factorial

    Ejemplos:
    factorial(5) = 120
    factorial(1) = 1
    """
    factorial = 1
    for numero in range(1, n+1):
        factorial = factorial * numero
    return factorial

factorialNumeros([1, 2, 3 ,4, 5, 6])