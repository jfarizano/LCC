#include <stdio.h>

int main(){
    int nota;
    printf("Ingrese la nota:\n");
    scanf("%d", &nota);
    if (nota<=5 && nota > 1){
        printf("Insuficiente \n");
    }else if (nota == 1){
        printf("Pésimo\n");
    }else if (nota==6 ){
        printf("Aprobado \n");
    }else if (nota==7 ){
        printf("Bueno \n");
    }else if (nota==8 ){
        printf("Muy bueno \n");
    }else if (nota==9 ){
        printf("Distinguido \n");
    }else if (nota==10 ){
        printf("Sobresaliente \n");
    }else{
        printf("Invalido \n");
    }
    return 0;
}
