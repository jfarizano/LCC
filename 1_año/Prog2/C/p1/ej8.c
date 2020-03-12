#include <stdio.h>

int main(){

    int n, cantPasos = 0;

    printf("Ingrese un entero mayor a 1:\n");
    scanf("%d", &n);

    while(n>1){
        if(n%2 == 0){
            cantPasos++;
            n= n/2;
        }else{
            cantPasos++;
            n = n*3 + 1;         
        }
        printf("El siguiente valor es: %d\n", n);
    }

    if(n=1){
        printf("Valor final %d, cantidad de pasos: %d\n", n, cantPasos);
    }else{
        printf("Error\n");
    }
    return 0;
}