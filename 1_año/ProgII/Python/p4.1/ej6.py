def presente(elemen, limpia):
    if limpia == []:
        return False
    else:
        for i in range(0, len(limpia)):
            if elemen == limpia[i]:
                return True
        return False

def eliminaDuplicados(list, limpia = []):

    if list == []:
        print(limpia)
    else:
        if presente(list[0], limpia):
            eliminaDuplicados(list[1:], limpia)
        else:
            limpia += [list[0]]
            eliminaDuplicados(list[1:], limpia)



eliminaDuplicados([1, 1, 2, 3, 4, 4])

