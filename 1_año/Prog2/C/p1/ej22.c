#include <stdio.h>

int main(){
    char str[100], dic[26] = "abcdefghijklmnopqrstvwxyz";
    int presente[26], flag = 1;

    for(int i = 0; i < 26; i++){
        presente[0];
    }

    printf("Ingrese una cadena de maximo 100 chars\n");
    fgets(str, 100, stdin);

    for(int i = 0; i < 100; i++){
        for(int j = 0; j < 26; j++){
            if(str[i] == dic[j]){
                presente[j] = 1;
            }
        }
    }

    for(int i = 0; i < 26; i++){
        if(presente[i] == 0){
            flag = 0;
        }
    }

    if(flag){
        printf("Es un pangrama\n");
    }else{
    printf("No es un pangrama\n");
    }

    return 0;
}