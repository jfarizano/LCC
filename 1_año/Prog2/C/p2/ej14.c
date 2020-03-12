#include <stdio.h>

int main(){
    int a[100], n, max = -1, maxCant;

    for(int i = 0; i < 100; i ++){
        a[i] = 0;
    }

    printf("Ingrese un entero entre 0 y 99:\n");
    scanf("%d", &n);
    if(n >= 0 && n < 100){
        a[n] = 1;

        while(n >= 0 && n < 100){
            printf("Ingrese un entero entre 0 y 99:\n");
            scanf("%d", &n);
            a[n] += 1;
        }
    }else{
        printf("BAI\n");
    }

    for(int i = 0; i < 100; i ++){
        if(a[i] >= maxCant){
            maxCant = a[i];
            max = i;
        }
    }

    printf("El número que se ingresó más veces es: %d, ingresado %d veces", max, maxCant);

    return 0;
}
