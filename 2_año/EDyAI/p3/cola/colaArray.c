#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#define MAX_COLA 500

typedef struct _Cola {
    int *datos;
    int primero, ultimo;
} *Cola;

Cola cola_crear() {
    Cola cola = malloc(sizeof(cola));
    cola->datos = malloc(sizeof(int) * MAX_COLA);
    cola->primero = MAX_COLA - 1;
    cola->ultimo = MAX_COLA;

    return cola;
}

int cola_es_vacia(Cola cola) {
    return cola->ultimo > cola->primero;
}

int cola_primero(Cola cola) {
  return cola->datos[cola->primero];
}

void cola_encolar(Cola cola, int dato) {
  cola->ultimo--;
  cola->datos[cola->ultimo] = dato;
}

void cola_desencolar(Cola cola) {
  for (int i = cola->primero; i >= cola->ultimo; i--) {
    cola->datos[i] = cola->datos[i - 1];
  }
  cola->ultimo++;
}

void cola_imprimir(Cola cola) {
  for (int i = cola->primero; i >= cola->ultimo; i--) {
    printf("%d ", cola->datos[i]);
  }
  printf("\n");
}

void cola_destruir(Cola cola) {
  free(cola->datos);
  free(cola);
}

int main() {
  Cola cola = cola_crear();

  for (int i = 0; i <= MAX_COLA; i++) {
    cola_encolar(cola, i);
  }

  cola_imprimir(cola);

  for (int i = 0; i < 99; i++) {
    cola_desencolar(cola);
  }

  cola_imprimir(cola);

  return 0;
}
