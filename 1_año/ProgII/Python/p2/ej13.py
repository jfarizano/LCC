def es_primo(x):
    for y in range(2, x-1):
        if x % y == 0:
            return False
    return True

def primos(x):
    for y in range(2, x):
        if es_primo(y):
            print(y)

primos(120)
