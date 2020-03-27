#include <stdio.h>

int sumaArr(int a[], int n){
    int suma = 0;

    for (int i = 0; i < n; i++){
        suma += a[i];
    }

    return suma;
}

int main(){
    
    int n = 100, suma;
    int a[n];

    for (int i = 0; i < n; i++){
        a[i] = i*2;
    }

    suma = sumaArr(a, n);

    printf("%d\n", suma);

    return 0;

}
