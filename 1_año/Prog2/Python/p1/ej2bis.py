def primerosn(terminos = 50, n = 1):
     if n < terminos:
          print(n*2)
          primerosn(terminos, n+1)
     else:
          print(n*2)

primerosn()
