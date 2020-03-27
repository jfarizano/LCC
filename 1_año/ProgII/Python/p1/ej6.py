def sumaN(n, m, suma = 0, num = 1):
    if num <= n:
        sumaN(n, m, suma, num+1)
    else:
        if num < m:
            sumaN(n, m, suma+num, num+1)
        else:
                print(suma)

sumaN(3, 6)
