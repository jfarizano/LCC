function x1 = metodoJacobi(A, x0, b, eps)
    [m, n] = size(A)
    x1 = zeros(n, 1)
    
    for i = 1:n
        suma = 0
        for j = 1:n
            if j <> i then
                suma = suma + A(i, j)*x0(j)
            end
        end 
        x1(i) = (b(i) - suma)/A(i,i)
    end

    while (norm(x0 - x1) > eps)
        x0 = x1
        for i = 1:n
            suma = 0
            for j = 1:n
                if j <> i then
                    suma = suma + A(i, j)*x0(j)
                end
            end 
            x1(i) = (b(i) - suma)/A(i,i)
        end
    end    
endfunction

function x1 = metodoGaussSeidel(A, x0, b, eps)
    [m, n] = size(A)
    x1 = zeros(n, 1)
    
    for i = 1:n
        suma = 0
        for j = 1:n
            if j <> i then
                suma = suma + A(i, j)*x1(j)
            end
        end 
        x1(i) = (b(i) - suma)/A(i,i)
    end

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
    end    
endfunction

function x1 = metodoRelajacion(A, x0, b, w, eps)
    [m, n] = size(A)
    x1 = zeros(n, 1)
    
    for i = 1:n
        suma = 0
        for j = 1:n
            if j <> i then
                suma = suma + A(i, j)*x1(j)
            end
        end 
        x1(i) = (1-w) * x1(i) + w*(b(i) - suma)/A(i,i)
    end

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
    end    
endfunction

function x1 = metodoRelajacionTridiagonal(A, x0, b, eps)
    [m, n] = size(A)
    x1 = zeros(n, 1)
    
    Tj = eye(A) - inv(diag(diag(A)))*A
    w = 2/(1 + sqrt(1 - (max(abs(spec(Tj))) ** 2 )))
    
    for i = 1:n
        suma = 0
        for j = 1:n
            if j <> i then
                suma = suma + A(i, j)*x1(j)
            end
        end 
        x1(i) = (1-w) * x1(i) + w*(b(i) - suma)/A(i,i)
    end

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
    end    
endfunction
