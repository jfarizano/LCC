#include <stdio.h>

int sumaAlt(int *a, int n){
    int resultado=1;

    for (int i = 0; i < n; i++){
        if(i%2 == 0 && a[i] != 0){
            resultado *= a[i];
        }
    }
    return resultado;
}

int main(){
    
    int n = 10, resultado;
    int a[n];

    for (int i = 0; i < n; i++){
        a[i] = i;
    }

    resultado = sumaAlt(a, n);

    printf("%d\n", resultado);

    return 0;

}