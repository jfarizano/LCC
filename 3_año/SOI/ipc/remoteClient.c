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
#include <signal.h> 
/**********/
/* Threads */
#include <pthread.h>

/* Los hilos y el socket están como variables globales para que el signal
handler pueda matar los hilos y avisar al otro lado de la comunicación que 
terminó */
pthread_t threads[2];
int sock;

void siginit_handler(int sig) {
  printf("\nSe captó la señal %d, cerrando conexión...\n", sig);
  send(sock, "\\exit", 5, 0);
  pthread_cancel(threads[0]);
  pthread_cancel(threads[1]);
  return;
}

void error(char *msg){
  exit((perror(msg), 1));
}

void *receiver(void *arg) {
  int socket = *(int*) arg;
  char buf[1024];
  bzero(buf, 1024);

  while (1) {
    /* Recibimos el mensaje y lo guardamos en el buffer*/
    recv(socket, buf, sizeof(buf), 0);
    /* Si el mensajes recibido es un "\exit" se terminan los hilos */
    if (strncmp(buf, "\\exit", 5) == 0) {
      printf("El servidor terminó la conexión, cerrando cliente.\n");
      pthread_cancel(threads[1]);
      pthread_exit(NULL);
    }
    /* Si el mensaje es no vacío se imprime y se limpia el buffer */
    if (strlen(buf) != 0) {
      printf("[SERVER] %s", buf);
      bzero(buf, 1024);
    } 
  }

  return NULL;   
}

void *sender(void *arg) {
  int socket = *(int*) arg;
  char buf[1024];
  bzero(buf, 1024);

  while (1) {
    /* Se recibe el mensaje a enviar por entrada estandar y se guarda en el buffer */
    fgets(buf, 1024, stdin);
    if (strlen(buf) != 0) {
      send(socket, buf, sizeof(buf), 0);
      /* Si el mensaje enviado es un "\exit" se terminan los hilos */
      if (strncmp(buf, "\\exit", 5) == 0) {
        printf("Cerrando conexión.\n");
        pthread_cancel(threads[0]);
        pthread_exit(NULL);
      }
      bzero(buf, 1024);
    }    
  }

  return NULL;
}

int main(int argc, char **argv){
  struct addrinfo *resultado;

  /*Chequeamos mínimamente que los argumentos fueron pasados*/
  if(argc != 3){
    fprintf(stderr,"El uso es \'%s IP port\' \n", argv[0]);
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

  printf("Conexión exitosa, comunicando con el servidor...\n");

  /* Llamamos al manejador de la señal SIGINT (CTRL+C) */
  signal(SIGINT, siginit_handler);

  /* Le enviamos el socket a los hilos*/
  pthread_create(&threads[0], NULL , receiver, (void *) &sock);
  pthread_create(&threads[1], NULL , sender, (void *) &sock);

  /* Se utiliza join para que main cierre el socket una vez que terminen los hilos*/
  pthread_join(threads[0], NULL);
  pthread_join(threads[1], NULL);

  /* Una vez finalizada la comunicación se cierra el socket */
  close(sock);
  freeaddrinfo(resultado);

  return 0;
}
