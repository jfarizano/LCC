#include <stdio.h>

int main(){

    int n = 0, terminar = 0, suma = 0;

    while(n < 5 || n > 100){
        printf("Ingrese la cantidad de números a ingresar(entre 5 y 100)\n");
        scanf("%d", &n);
    }

    int a[n];

    for(int i = 0; i < n && terminar == 0; i++){
        int entrada;
        printf("Ingrese un número entre 5 y 100, faltan: %d\n", n-i);
        scanf("%d", &entrada);
        if(entrada < 5 || entrada > 100){
            printf("ERROR\n");
            terminar = 1;
        }else{
            a[i] = entrada;
            suma += entrada;
        }
    }

    if(suma > 30 && terminar == 0){
        printf("La suma de todos los elementos es mayor a 30\n");
    }else if(terminar == 0){
        printf("La suma de todos los elementos NO es mayor a 30\n");
    }

    return 0;
}
