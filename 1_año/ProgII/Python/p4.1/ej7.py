def presente(elemen, limpia):
    if limpia == []:
        return False
    else:
        for i in range(0, len(limpia)):
            if elemen == limpia[i]:
                return True
        return False

def eliminaDuplicados(list, limpia = []):

    limpia = []

    for i in range(0, len(list)):
        if not presente(list[i], limpia):
            limpia += [list[i]]

    return limpia

def distintos(list):

    limpia = eliminaDuplicados(list)
    cant = len(limpia)
    print(cant)

distintos([1, 2, 2, 3, 4, 4, 5])
