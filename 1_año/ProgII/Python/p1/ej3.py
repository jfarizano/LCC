def mayores(n, m, termino = 1):
    if termino*2 <= m:
        mayores(n, m, termino+1)
    elif termino*2 <(n*2)+m:
        print(termino*2)
        mayores(n, m, termino+1)
    else:
        print(termino*2)
        
mayores(6, 6)
        
        
