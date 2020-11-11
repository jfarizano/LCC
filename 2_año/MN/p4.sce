function x = solveTriagSup(A, b)
    [m, n] = size(A)
    x = zeros(n)
    for i = m:-1:1
        suma = 0
        for j = i+1:n
            suma = suma + A(i, j) * x(j)
        end
        x(i) = (b(i) - suma) / A(i, i)   
    end
endfunction

function x = solveTriagInf(A, b)
    [m, n] = size(A)
    x = zeros(n)
    for i = 1:m
        suma = 0
        for j = 1:i-1
            suma = suma + A(i, j) * x(j)
        end
        x(i) = (b(i) - suma) / A(i, i)   
    end
endfunction

function [x,a] = gausselim(A,b)
    // Esta función obtiene la solución del sistema de ecuaciones lineales A*x=b, 
    // dada la matriz de coeficientes A y el vector b.
    // La función implementa el método de Eliminación Gaussiana sin pivoteo.  
    
    [nA,mA] = size(A) 
    [nb,mb] = size(b)
    
    if nA<>mA then
        error('gausselim - La matriz A debe ser cuadrada');
        abort;
    elseif mA<>nb then
        error('gausselim - dimensiones incompatibles entre A y b');
        abort;
    end;
    
    a = [A b]; // Matriz aumentada
    
    // Eliminación progresiva
    n = nA;
    for k=1:n-1
        for i=k+1:n
            for j=k+1:n+1
                a(i,j) = a(i,j) - a(k,j)*a(i,k)/a(k,k);
            end;
            for j=1:k        // no hace falta para calcular la solución x
                a(i,j) = 0;  // no hace falta para calcular la solución x
            end              // no hace falta para calcular la solución x
        end;
    end;
    
    // Sustitución regresiva
    x(n) = a(n,n+1)/a(n,n);
    for i = n-1:-1:1
        sumk = 0
        for k=i+1:n
            sumk = sumk + a(i,k)*x(k);
        end;
        x(i) = (a(i,n+1)-sumk)/a(i,i);
    end;
endfunction

function d = determinante(A)
    [n,m] = size(A)

    if n<>m then
        error('determinante - La matriz A debe ser cuadrada')
        abort
    end
    
    d = 1
    
    for k=1:n-1
        for i=k+1:n
            for j=k+1:n
                A(i,j) = A(i,j) - A(k,j)*A(i,k)/A(k,k);
            end;
        end;
        d = d * A(k,k);
    end;
    d = d * A(n, n);
endfunction

function [x,a] = gausselimPP(A,b)
    // Esta función obtiene la solución del sistema de ecuaciones lineales A*x=b, 
    // dada la matriz de coeficientes A y el vector b.
    // La función implementa el método de Eliminación Gaussiana con pivoteo parcial.
    
    [nA,mA] = size(A) 
    [nb,mb] = size(b)
    
    if nA<>mA then
        error('gausselim - La matriz A debe ser cuadrada');
        abort;
    elseif mA<>nb then
        error('gausselim - dimensiones incompatibles entre A y b');
        abort;
    end;
    
    a = [A b]; // Matriz aumentada
    n = nA;    // Tamaño de la matriz
    
    // Eliminación progresiva con pivoteo parcial
    for k=1:n-1
        kpivot = k; amax = abs(a(k,k));  //pivoteo
        for i=k+1:n
            if abs(a(i,k))>amax then
                kpivot = i; amax = a(i,k);
            end;
        end;
        temp = a(kpivot,:); a(kpivot,:) = a(k,:); a(k,:) = temp;
        
        for i=k+1:n
            for j=k+1:n+1
                a(i,j) = a(i,j) - a(k,j)*a(i,k)/a(k,k);
            end;
            for j=1:k        // no hace falta para calcular la solución x
                a(i,j) = 0;  // no hace falta para calcular la solución x
            end              // no hace falta para calcular la solución x
        end;
    end;
    
    // Sustitución regresiva
    x(n) = a(n,n+1)/a(n,n);
    for i = n-1:-1:1
        sumk = 0
        for k=i+1:n
            sumk = sumk + a(i,k)*x(k);
        end;
        x(i) = (a(i,n+1)-sumk)/a(i,i);
    end;
endfunction

function [x1, y1] = swap(x0, y0)
    x1 = y0
    y1 = x0
endfunction

function [L, U, P]= factorLU(A)
    U = A
    L = eye(A)
    P = eye(A)
    [m, n] = size(A)
    
    for k = 1:m-1
        maxI = k
        for i = k+1:n
            if abs(U(i, k)) > abs(U(maxI, k)) then
                maxI = i
            end
        end
        [U(k, k:m), U(i, k:m)] = swap(U(k, k:m), U(i, k:m))
        [L(k, 1:k-1), L(i, 1:k-1)] = swap(L(k, 1:k-1), L(i, 1:k-1))
        [P(k, 1:m), P(i, 1:m)] = swap(P(k, 1:m), P(i, 1:m))
        for j = k+1:m
            L(j,k) = U(j,k)/U(k,k)
            U(j,k:m) = U(j,k:m) - L(j,k) * U(k,k:m)
        end  
    end
endfunction

function x = resolverLU(A, b)
    [L, U, P] = factorLU(A)
    y = solveTriagInf(L, P*b)
    x = solveTriagSup(U, y)
endfunction

function [U,ind] = cholesky(A)
    // Factorización de Cholesky.
    // Trabaja únicamente con la parte triangular superior.
    //
    // ind = 1  si se obtuvo la factorización de Cholesky.
    //     = 0  si A no es definida positiva
    //
    //******************
    eps = 1.0e-8
    //******************
    
    n = size(A,1)
    U = zeros(n,n)
    
    t = A(1,1)
    if t <= eps then
        printf('Matriz no definida positiva.\n')
        ind = 0
        return
    end
    U(1,1) = sqrt(t)
    for j = 2:n
        U(1,j) = A(1,j)/U(1,1)
    end
        
    for k = 2:n
        t = A(k,k) - U(1:k-1,k)'*U(1:k-1,k)
        if t <= eps then
            printf('Matriz no definida positiva.\n')
            ind = 0
            return
        end
        U(k,k) = sqrt(t)
        for j = k+1:n
            U(k,j) = ( A(k,j) - U(1:k-1,k)'*U(1:k-1,j) )/U(k,k)
        end
    end
    ind = 1
    
endfunction

function x = resolverCholesky(A, b)
    [U, ind] = cholesky(A)
    
    if ind <> 1 then
        error('resolverCholesky - A no es definida positiva');
        abort;
    end
    
    y = solveTriagInf(U', b)
    x = solveTriagSup(U, y)
endfunction

function [L, U] = doolittle(A)
    [m, n] = size(A)
    L = zeros(m, n)
    U = zeros(m ,n)
    for j = 1 : n
        for i = 1 : n
            // Estamos por arriba de la diagonal.
            if i <= j then
                U(i, j) = A(i, j)
                for k = 1 : i - 1
                    U(i, j) = U(i, j) - L(i, k) * U(k, j)
                end
            end
            if j <= i then
                L(i, j) = A(i, j)
                for k = 1 : j-1
                    L(i, j) = L(i, j) - L(i, k) * U(k, j)
                end
                L(i, j) = L(i, j) / U(j, j)
            end
        end
    end
endfunction

function x = resolverDoolittle(A, b)
    [L, U] = doolittle(A)
    y = solveTriagInf(L, b)
    x = solveTriagSup(U, y)
endfunction
