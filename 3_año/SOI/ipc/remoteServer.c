/* Cabeceras de Sockets */
#include <sys/types.h>
#include <sys/socket.h>
/* Cabecera de direcciones por red */
#include <netinet/in.h>
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
int soclient;

void siginit_handler(int sig) {
  printf("\nSe captó la señal %d, cerrando conexión...\n", sig);
  send(soclient, "\\exit", 5, 0);
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
    /* Si el mensaje recibido es un "\exit" se terminan los hilos */
    if (strncmp(buf, "\\exit", 5) == 0) {
      printf("El cliente terminó la conexión, cerrando servidor.\n");
      pthread_cancel(threads[1]);
      pthread_exit(NULL);
    }
    /* Si el mensaje es no vacío se imprime y se limpia el buffer */
    if (strlen(buf) != 0) {
      printf("[CLIENT] %s", buf);
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
  int sock;
  struct sockaddr_in servidor, clientedir;
  socklen_t clientelen;

  if (argc <= 1) error("Faltan argumentos");

  /* Creamos el socket */
  if( (sock = socket(AF_INET, SOCK_STREAM, 0)) < 0 )
    error("Socket Init");

  /* Creamos a la dirección del servidor.*/
  servidor.sin_family = AF_INET; /* Internet */
  servidor.sin_addr.s_addr = INADDR_ANY; /**/
  servidor.sin_port = htons(atoi(argv[1]));

  /* Inicializamos el socket */
  if (bind(sock, (struct sockaddr *) &servidor, sizeof(servidor)))
    error("Error en el bind");

  printf("Binding existoso, escuchando en el puerto: %s\n",argv[1]);

  /* Ya podemos aceptar conexiones */
  if(listen(sock, 1) == -1)
    error(" Listen error ");

  clientelen = sizeof(clientedir);
  if ((soclient = accept(sock
                        , (struct sockaddr *) &clientedir
                        , &clientelen)) == -1)
    error("No se puedo aceptar la conexión. ");

  printf("Conexión exitosa, comunicando con el cliente...\n");

  /* Llamamos al manejador de la señal SIGINT (CTRL+C) */
  signal(SIGINT, siginit_handler);

  /* Le enviamos el socket a los hilos*/
  pthread_create(&threads[0], NULL , receiver, (void *) &soclient);
  pthread_create(&threads[1], NULL , sender, (void *) &soclient);

  /* Se utiliza join para que main cierre el socket una vez que terminen los hilos*/
  pthread_join(threads[0], NULL);
  pthread_join(threads[1], NULL);

  /* Una vez finalizada la comunicación se cierra el socket */
  close(sock);

  return 0;
}