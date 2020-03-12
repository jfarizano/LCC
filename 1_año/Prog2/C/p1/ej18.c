#include <stdio.h>
#include <string.h>

int estaCaracter(char str[], char carac){
    
    int encontrada = 0;
    
    for (int i = 0; i < 20; i++){
        if(str[i] == carac){
            encontrada = 1;
        }
    }

    return encontrada;
}

int main(){
    char str[21], carac;

    printf("Escriba como máximo 20 caracteres\n");
    fgets(str, 21, stdin);
    printf("Ingrese un caracter\n");
    scanf("%c", &carac); 

    if(estaCaracter(str, carac)){
        printf("Se encuentra\n");
    }else{
        printf("No se encuentra\n");
    }

    return 0;
}