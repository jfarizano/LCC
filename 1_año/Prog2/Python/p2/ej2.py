def fichasDomino():
    """
    Representamos una ficha de dominó como un string estructurado de la siguiente forma: "n | m"
    donde n y m son números

    fichasDomino: -> "n | m"

    Imprime todas las fichas de dominó, una por línea y sin repetir
    """
    for x in range (0, 7):
        for y in range(0, 7):
            print(x, "|", y)
fichasDomino()