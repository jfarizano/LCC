def tuplasADiccionario(list):
    dict = {}
    for i in range(0, len(list)):
        if list[i][0] not in dict:
            dict[list[i][0]] = [list[i][1]]
        else:
            dict[list[i][0]] += [list[i][1]]
    return dict


l = [('Hola', 'don Pepito'), ('Hola', 'don Jose'), ('Buenos', 'dias')]
print(tuplasADiccionario(l))
