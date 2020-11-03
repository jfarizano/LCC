import math

def algoritmo(m, xf):
    x = 0
    k = 0.046
    v2 = 0 # veloc al cuadrado
    incx = xf / 10
    R = 0
    flag = 0
    while (x <= xf):
        if flag == 2:
            incx *= 2
        var = 19.6 - (2000 / m) * R
        v2 += incx * var 
        R = k * v2
        flag += 1
        x+= incx
        print("x = ", x, "R = ", R, "var =  ", var, "v2 = ", v2)
    return math.sqrt(v2)

def main():
    m = int(input("Ingrese el m: "))
    xf = int(input("Ingrese el xf: "))
    print(algoritmo(m, xf))

main()
        



