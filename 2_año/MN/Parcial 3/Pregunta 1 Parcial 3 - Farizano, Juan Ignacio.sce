function cotasGers(A)
    [n,m] = size(A)
    // Calculo los centros de los círculos (cada elemento de la diagonal
    // de A es el centro de un círculo, es decir, el centro del círculo i
    // es a(i,i))
    centros = diag(A)
    // Calculo los radios, donde el radio del círculo i es la suma de la fila i
    // menos el elem de la diagonal (o a(i,i))
    radios = sum(abs(A),'c') - abs(centros)
    
    // Imprimo las cotas
    for i = 1:n
        printf("Un autovalor se puede encontrar en el círculo de centro %f y radio %f\n", i, centros(i), radios(i))
    end    
endfunction

function ej1()
    
    A2 = [1 0 0; -0.1 0 0.1; -0.1 -0.1 2]
    printf("\nMatriz punto b)\n")
    disp(A2)
    printf("\nCotas de autovalores por teorema de Gerschgorin:\n")
    cotasGers(A2)
    printf("\nAutovalores calculados por Scilab:\n")
    disp(spec(A2)')
    
    printf("\n ------------------------------------------- \n")
    
    
    A4 = [4 -1 0; -1 4 -1; -1 -1 4]
    printf("\nMatriz punto d)\n")
    disp(A4)
    printf("\nCotas de autovalores por teorema de Gerschgorin:\n")
    cotasGers(A4)
    printf("\nAutovalores calculados por Scilab:\n")
    disp(spec(A4)')
    
    printf("\n ------------------------------------------- \n")
    
    A6 = [4.75 2.25 -0.25; 2.25 4.75 1.25; -0.25 1.25 4.75]
    printf("\nMatriz punto f)\n")
    disp(A6)
    printf("\nCotas de autovalores por teorema de Gerschgorin:\n")
    cotasGers(A6)
    printf("\nAutovalores calculados por Scilab:\n")
    disp(spec(A6)')  
    
endfunction

ej1()

// Resultado de evaluar ej1():

/*

Matriz punto b)

   1.    0.    0. 
  -0.1   0.    0.1
  -0.1  -0.1   2. 

Cotas de autovalores por teorema de Gerschgorin:
Un autovalor se puede encontrar en el círculo de centro 1.000000 y radio 1.000000
Un autovalor se puede encontrar en el círculo de centro 2.000000 y radio 0.000000
Un autovalor se puede encontrar en el círculo de centro 3.000000 y radio 2.000000

Autovalores calculados por Scilab:

   1.9949874   0.0050126   1.

 ------------------------------------------- 

Matriz punto d)

   4.  -1.   0.
  -1.   4.  -1.
  -1.  -1.   4.

Cotas de autovalores por teorema de Gerschgorin:
Un autovalor se puede encontrar en el círculo de centro 1.000000 y radio 4.000000
Un autovalor se puede encontrar en el círculo de centro 2.000000 y radio 4.000000
Un autovalor se puede encontrar en el círculo de centro 3.000000 y radio 4.000000

Autovalores calculados por Scilab:

   4.618034   2.381966   5.

 ------------------------------------------- 

Matriz punto f)

   4.75   2.25  -0.25
   2.25   4.75   1.25
  -0.25   1.25   4.75

Cotas de autovalores por teorema de Gerschgorin:
Un autovalor se puede encontrar en el círculo de centro 1.000000 y radio 4.750000
Un autovalor se puede encontrar en el círculo de centro 2.000000 y radio 4.750000
Un autovalor se puede encontrar en el círculo de centro 3.000000 y radio 4.750000

Autovalores calculados por Scilab:

   2.0646374   4.9616991   7.2236635

*/
