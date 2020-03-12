#include <stdio.h>

int main(){

    int anio;
    printf("Ingrese el anio:\n");
    scanf("%d", &anio);

    if(anio < 100){
        if(anio % 4 == 0){
            printf("Es bisiesto \n");
        }else{
            printf("No es bisiesto\n");
        }
    }

    if(anio >= 100 && anio < 400){
        if((anio % 4 == 0 ) && (anio % 100 != 0)){
            printf("Es bisiesto \n");
        }else{
            printf("No es bisiesto\n");
        }
    }

    if(anio >= 400){
        if(((anio % 4 == 0 ) && (anio % 100 != 0)) || (anio % 400 == 0)){
            printf("Es bisiesto \n");
        }else{
            printf("No es bisiesto\n");
        }
    }

    return 0;

}
