#include <stdio.h>
#include <string.h>

int main(){

    int veces;
    char str[21], carac;

    printf("Escriba como máximo 20 caracteres\n");
    fgets(str, 21, stdin);
    printf("Ingrese un caracter\n");
    scanf("%c", &carac); 

    for (int i = 0; i < 20; i++){
        if(str[i] == carac){
            veces += 1;
        }
    }

    printf("El caracter %c aparece en %s%d veces.", carac, str, veces);

    return 0;
}