def duplicado(list):
    if list == []:
        return False
    else:
        for i in range(0, len(list)):
            for j in range(0, len(list)):
                if list[i] == list[j] and i != j:
                    return True
        return False

print(duplicado(["prueba", "prueba", 1, 2, 3]))
print(duplicado(["prueba", 1, 2, 3]))
        
