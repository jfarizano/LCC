#include <stdio.h>
#include <stdlib.h>

#define num 321

int main(){

    int entrada;
    entrada = -1;

    for(int i = 15; i > 0 && entrada != num; i--){
        printf("Ingrese un número en el rango [0, 500], quedan %d intentos\n", i);
        scanf("%d", &entrada);

        if(entrada<0 || entrada>500){
            printf("Número inválido, ingrese uno en el rango dado\n");
            i++;
        }else if(entrada != num){
            if (entrada < num){
                printf("El número es mayor\n");
            }else{
                printf("El número es menor\n");
            }
        }else{
            printf("Número correcto, ganaste\n");
        }
    }

    if(entrada != num){
        printf("Perdiste y el número era: %d\n", num);
    }

    return 0;
}

