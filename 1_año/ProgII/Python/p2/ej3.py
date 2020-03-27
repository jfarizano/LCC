def fichasJuego(n):
    """
    Representamos una ficha de un juego como un string estructurado de la siguiente forma: "x | y"
    donde x e y son números

    fichasDomino: -> "x | y"

    Dado un número n, genera fichas de un juego que puede tener números de 0 a n
    
    """
    for x in range (0, n+1):
        for y in range(0, n+1):
            print(x, "|", y)
fichasJuego(9)