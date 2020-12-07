function [x1, iters] = metodoGaussSeidel(A, x0, b, eps)
    iters = 0
    [m, n] = size(A)
    x1 = zeros(n, 1)
    
    // Primera iteración
    for i = 1:n
        suma = 0
        for j = 1:n
            if j <> i then
                suma = suma + A(i, j)*x1(j)
            end
        end 
        x1(i) = (b(i) - suma)/A(i,i)
    end
    iters = iters + 1
    
    // Inicio del bucle
    while (norm(x0 - x1) > eps)
        x0 = x1
        for i = 1:n
            suma = 0
            for j = 1:n
                if j <> i then
                    suma = suma + A(i, j)*x1(j)
                end
            end 
            x1(i) = (b(i) - suma)/A(i,i)
        end
        iters = iters + 1
    end    
endfunction

function [x1, iters, w] = metodoSORTridiagonal(A, x0, b, eps)
    iters = 0
    [m, n] = size(A)
    x1 = zeros(n, 1)
    
    // Calculo el parámetro óptimo del método para una matriz tridiagonal
    Tj = eye(A) - inv(diag(diag(A)))*A
    w = 2/(1 + sqrt(1 - (max(abs(spec(Tj))) ** 2 )))
    
    // Primera iteración
    for i = 1:n
        suma = 0
        for j = 1:n
            if j <> i then
                suma = suma + A(i, j)*x1(j)
            end
        end 
        x1(i) = (1-w) * x1(i) + w*(b(i) - suma)/A(i,i)
    end
    iters = iters + 1
    
    // Inicio del bucle
    while (norm(x0 - x1) > eps)
        x0 = x1
        for i = 1:n
            suma = 0
            for j = 1:n
                if j <> i then
                    suma = suma + A(i, j)*x1(j)
                end
            end 
            x1(i) = (1-w) * x1(i) + w*(b(i) - suma)/A(i,i)
        end
        iters = iters + 1
    end    
endfunction

function pregunta3(eps)
    A = [4 3 0; 3 4 -1; 0 -1 4]
    b = [24; 30; -24]
    x0 = [2; 3; -3]
    
    [x1, iters1] = metodoGaussSeidel(A, x0, b, eps)
    [x2, iters2, w] = metodoSORTridiagonal(A, x0, b, eps)
    
    disp("Solución dada por el método de Gauss-Seidel")
    disp(x1)
    printf("\n")
    printf("Se necesitaron %d iteraciones\n", iters1)
    
    disp("Solución dada por el método SOR")
    disp(x2)
    printf("\n")
    printf("Se necesitaron %d iteraciones y el parámetro óptimo calculado fue %f\n", iters2, w)
endfunction

// Resultado de ejecutar pregunta3(10**-7) (busco la solución con una precisión)
// de siete lugares decimales)

/*

--> pregunta3(10**-7)

 Solución dada por el método de Gauss-Seidel

   3.0000001
   3.9999999
  -5.

Se necesitaron 36 iteraciones

 Solución dada por el método SOR

   3.
   4.
  -5.

Se necesitaron 16 iteraciones y el parámetro óptimo calculado fue 1.240408

*/
