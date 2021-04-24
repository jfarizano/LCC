#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>

int* hola;
int i = 0;

void handler(int signal) {
  printf("Recibí la señal %d\n", signal);
  printf("Modifiqué %d \n", hola[0]);
  return;
}

int main() {
  signal(SIGSEGV, handler);

  printf("Me voy a romper: %d \n", hola[0]);

  return 0;
}
