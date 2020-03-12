#include <stdio.h>
#include <string.h>

int main(){
    // Ext: String exterior, Int: String interior.
    char strExt[100], strInt[100];
    int lenExt, lenInt, flag = 0, coincidencias;

    printf("Ingrese el primer string:\n");
    scanf("%s", strExt);
    printf("Ingrese el segundo string:\n");
    scanf("%s", strInt);

    lenExt = strlen(strExt); lenInt = strlen(strInt);

    for(int i = 0; i <= lenExt-lenInt; i++){
        coincidencias = 0;
        for(int j = i; j < lenInt+i; j++){
            if(strExt[j] == strInt[j-i]){
                coincidencias += 1;
            }
        }

        if (coincidencias == lenInt){
            flag = 1;
        }
    }

    if(flag){
        printf("SI\n");
    }else{
        printf("NO\n");
    }


}