def primeros100(n = 1):
     if n < 100:
          print(n*2)
          primeros100(n+1)
     else:
          print(n*2)

primeros100()
