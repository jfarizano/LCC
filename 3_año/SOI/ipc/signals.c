#include <unistd.h> /* sleep()*/
#include <stdio.h> /* printf() */
#include <stdlib.h> /* exit()*/
#include <signal.h>

void sigint_handler(int sig){

  exit(0);
  return;
}

int main(void){
  signal(SIGINT, sigint_handler);

  for(;;){
    printf("Esperando para salir de casa\n");
    sleep(1);
  }
  return 0;
}
