#include <unistd.h> /* sleep()*/
#include <stdio.h> /* printf() */
#include <stdlib.h> /* exit()*/
#include <signal.h>

void sigint_handler(int sig){

  exit(0);
  return;
}
