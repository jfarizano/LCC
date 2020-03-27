#include <stdio.h>

int main(){
    
    int len, flag = 1;
    char str[20], carac;

    printf("Ingrese una palabra\n");
    scanf("%s", str);

    len = strlen(str);
    
    for(int i = 0; i < len/2; i++){
        if(str[i] != str[len-i-1]){
            flag = 0;
        }
    }
    
    if(flag == 1){
        printf("Es capicúa\n");
    }else{
        printf("No es capicúa\n");
    }

    return 0;
}