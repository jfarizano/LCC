def text(str):
    str = str.upper().split(" ")
    diccionario = {}
    
    for cadena in str:
        for i in range(0, len(cadena)):
            char = cadena[i]
            if char not in diccionario:
                diccionario[char] = cadena
            elif char in diccionario and len(diccionario[char]) < len(cadena):
                diccionario[char] = cadena
    
    return diccionario
        
texto = "En una manana lluviosa de octubre swirzt se cayo por las escaleras nuevas de la facultad z"
print(text(texto)) 