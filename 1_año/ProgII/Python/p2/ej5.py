def farCel():
    """
    Representamos temperaturas mediante números
    farCel: -> Number
    Devuelve una tabla de conversión de temperaaturas de Fahrenheit a Celsius, desde 0° F hasta 120° F, de 10 en 10

    """
    print("Farenheit | Celsius")
    for tempF in range(0, 121, 10):
        tempC = (tempF-32)*5/9
        print(tempF, "|", int(tempC))
farCel()