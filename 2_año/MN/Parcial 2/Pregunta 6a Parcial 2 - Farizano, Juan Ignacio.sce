// Apartado a)

function A = matrizA(n, a)
    A = a * eye(n, n)
    temp = ones(n, n) - eye(n,n)
    for j = 1:n
        temp(1:n, j) =  (-1)**j * temp(1:n, j)
    end
    A = A + temp    
endfunction

/*
Ejemplos de evaluaciones de matrizA:

--> A = matrizA(4, 1)
 A  = 

   1.   1.  -1.   1.
  -1.   1.  -1.   1.
  -1.   1.   1.   1.
  -1.   1.  -1.   1.

--> A = matrizA(4, 5)
 A  = 

   5.   1.  -1.   1.
  -1.   5.  -1.   1.
  -1.   1.   5.   1.
  -1.   1.  -1.   5.
