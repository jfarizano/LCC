def ordenada(list):
    if list == []:
        return False
    else:
        for i in range(0, len(list)-1):
            if list[i] > list[i+1]:
                return False
        return True
                
            
print(ordenada([1, 2, 3]))
print(ordenada([1, 2, 2]))
