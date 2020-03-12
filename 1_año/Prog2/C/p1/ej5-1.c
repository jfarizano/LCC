#include <stdio.h>

int main(){
    int nota;
    printf("Ingrese la nota:\n");
    scanf("%d", &nota);
    if (nota<=5 && nota > 1){
        printf("Insuficiente \n");
    }
    if (nota == 1){
        printf("Pésimo\n");
    }
    if (nota==6 ){
        printf("Aprobado \n");
    }
    if (nota==7 ){
        printf("Bueno \n");
    }
    if (nota==8 ){
        printf("Muy bueno \n");
    }
    if (nota==9 ){
        printf("Distinguido \n");
    }
    if (nota==10 ){
        printf("Sobresaliente \n");
    }
    if (nota<1 || nota > 10 ){
        printf("Invalido \n");
    }
    return 0;
}
