#include <stdio.h>
int main () {
  char textoA [30] = " Agarrate Catalina ";
  char textoB [30] = "El Cuarteto de Nos";
  char* p= textoA ;
  char* q= textoB ;
  printf (" textoA : %s\ntextoB : %s\n", textoA , textoB );
  while (*p++ = *q++);
  printf (" while (*p++ = *q++) ;\n");
  printf (" textoA : %s\ntextoB : %s\n", textoA , textoB );

  return 1;
}
