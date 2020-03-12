def primeros25(n = 1):
     if n < 25:
          print(n*2)
          primeros25(n+1)
     else:
          print(n*2)

primeros25()
