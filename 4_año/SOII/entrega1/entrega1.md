# Entrega 1

## Integrantes: Juan Ignacio Farizano, Natalia Mellino.

### Ejercicio 1

1. abstraccion 
2. abstraccion/aislamiento/administración
3. abstraccion/administracion?
4. administracion
5. aislamiento/administración
6. administracion
7. abstracción

### Ejercicio 2

- Desde el punto de vista de un desarrollador, es importante estudiar sistemas operativos ya que comprender su funcionamiento básico y saber diseñar algoritmos y procesos que se ajusten mejor al SO en el que se va a ejecutar el programa, puede resultar en un factor decisivo en el producto final.
  
- Como un administrador de sistemas, es tarea diaria enfrentarse a situaciones de bajo rendimiento, conflictos entre aplicaciones, demoras en la ejecución, etc. Para poder hacerle frente a estos problemas de manera óptima es muy importante entender lo que ocurre detrás de escena. 
Un área de interés son los sistemas de archivos, donde se plantean algunas de las siguientes cuestiones:
    - ¿Cómo comparar las virtudes y desventajas de tantos sistemas existentes?
    - ¿Por qué puede resultar conveniente mezclar distintos sistemas existentes en el mismo servidor?
    - ¿Cómo evitar la corrupción o pérdida de información?
    - ¿Cómo recuperar información de un disco dañado?

### Ejercicio 3

Un algoritmo muy conocido y visto en Sistemas Operativos I es el algoritmo propuesto por Dijkstra para evitar el bloqueo mutuo. Este puede ser explicado usando la analogía de un banco, donde los clientes son los procesos y el dinero los recursos, mientras que el banquero es el sistema operativo (por este motivo el algoritmo es conocido como 'Algoritmo del Banquero'): cada cliente dispone de un crédito que corresponde al máximo de dinero que el banquero le prestará. El cliente irá solicitando fondos de ese crédito conforme los necesite. Los recursos del banquero son limitados, por lo tanto no puede darle a todos los clientes el máximo de crédito al mismo tiempo. Entonces, la solución es que el banquero gestione sus fondos de manera que todos los clientes puedan llegar al máximo en algún momento pero no al mismo tiempo. Se dice que mantiene un **estado seguro** si en el sistema existe una secuencia de asignaciones y liberaciones de recursos que permita a todos los clientes alcanzar en algún momento sus necesidades máximas de recursos, en este caso, el dinero. Este algoritmo se puede explicar muy fácilmente llevándolo a un caso de la vida real como hicimos recién, sin embargo, en la práctica no es muy aplicable ya que el algoritmo necesita conocer los recursos de cada proceso de antemano y la mayoría de las veces esto no es posible.  

### Ejercicio 4

1. Nachos corre como un único proceso Unix, donde en cambio sistemas operativos reales corren directamente sobre el hardware.
2. Nachos simula una máquina que aproxima la arquitectura MIPS.
3. La arquitectura MIPS sobre la que Nachos está basado es de tipo RISC. Contiene 40 **registros** numerados del 0 al 39 entre los cuales se incluye un puntero de pila, un registro doble para resultados de multiplicaciones, un contador de programas, entre otros. Contiene también una **memoria física** organizada, por defecto, en 31 páginas de 128 bytes. Además la máquina de Nachos soporta una **memoria virtual** a través de un TLB (Translation Lookaside Buffer) ó una única tabla de paginación lineal.

