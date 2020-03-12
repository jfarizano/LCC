char* copiar_cadena (char* cad , int longitud ){
  char* a = malloc ( sizeof (char) * longitud );
  a = cad;
  return a;
}

int main (){
  char a[10] = "hola";
  char* b = copiar_cadena (a, 10);
  printf (" %s %s\n", a, b);
  b[0] = 's';
  printf (" %s %s\n", a, b);
}
