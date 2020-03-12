#include <stdio.h>

int buscar(int a[10], int n){

    int encontrada = 0, indice = -1;

    if(n < 0 || n > 10){
        printf("No se encontró\n");
    }else{
        for(int i = 0; i < 10; i++){
            if(a[i] == n){
                encontrada = 1;
                indice = i;
            }
        }
    }

    if(encontrada == 1){
        printf("Se encuentra en la posición %d\n", indice);
    }else{
        printf("No se encontró\n");
    }

    return indice;
}

int main(){
    int caso1, caso2, caso3, caso4;
    int a[10];
    for(int i = 0; i < 10; i++){
        a[i] = i;
        }
    caso1 = buscar(a, 3);
    caso2 = buscar(a, 1);
    caso3 = buscar(a, 9);
    caso4 = buscar(a, 1230);

    return 0;
}
