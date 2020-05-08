/* RemoteClient.c
   Se introducen las primitivas necesarias para establecer una conexión simple
   dentro del lenguaje C utilizando sockets.
*/
/* Cabeceras de Sockets */
#include <sys/types.h>
#include <sys/socket.h>
/* Cabecera de direcciones por red */
#include <netdb.h>
/**********/
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
/**********/
/* Threads! */
#include <pthread.h>

/*
  El archivo describe un sencillo cliente que se conecta al servidor establecido
  en el archivo RemoteServer.c. Se utiliza de la siguiente manera:
  $cliente IP port
 */

void error(char *msg){
  exit((perror(msg), 1));
}

void *receiver(void *arg) {
  int socket = *(int*) arg;
  char buf[1024];
  bzero(buf, 1024);

  while (1) {
    recv(socket, buf, sizeof(buf), 0);
    if (strlen(buf) != 0) {
      printf("%s", buf);
      bzero(buf, 1024);
    } 
  }

  free((int*) arg);
  return NULL;   
}

void *sender(void *arg) {
  int socket = *(int*) arg;
  char buf[1024];
  bzero(buf, 1024);

  while (1) {
    fgets(buf, 1024, stdin);
    if (strlen(buf) != 0) {
      send(socket, buf, sizeof(buf), 0);
      bzero(buf, 1024);
    }    
  }

  free((int*) arg);
  return NULL;
}

int main(int argc, char **argv){
  int sock;
  char buf[1024];
  struct addrinfo *resultado;
  pthread_t threads[2];

  /*Chequeamos mínimamente que los argumentos fueron pasados*/
  if(argc != 3){
    fprintf(stderr,"El uso es \'%s IP port\'", argv[0]);
    exit(1);
  }

  /* Inicializamos el socket */
  if( (sock = socket(AF_INET , SOCK_STREAM, 0)) < 0 )
    error("No se pudo iniciar el socket");

  /* Buscamos la dirección del hostname:port */
  if (getaddrinfo(argv[1], argv[2], NULL, &resultado)){
    fprintf(stderr,"No se encontro el host: %s \n",argv[1]);
    exit(2);
  }

  if(connect(sock, (struct sockaddr *) resultado->ai_addr, resultado->ai_addrlen) != 0)
    /* if(connect(sock, (struct sockaddr *) &servidor, sizeof(servidor)) != 0) */
    error("No se pudo conectar :(. ");

  pthread_create(&threads[0], NULL , receiver, (void *) &sock);
  pthread_create(&threads[1], NULL , sender, (void *) &sock);

  pthread_join(threads[0], NULL);
  pthread_join(threads[1], NULL);

  /* Cerramos :D!*/
  freeaddrinfo(resultado);
  close(sock);

  return 0;
}
