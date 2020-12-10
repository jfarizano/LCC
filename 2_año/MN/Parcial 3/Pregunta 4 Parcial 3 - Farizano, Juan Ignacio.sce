function [l, v, iters] = metodoPotencias(A, z0, eps)
    [m, n] = size(A)
    w = A * z0
    z1 = w / norm(w)
    iters = 1
    
    while (norm(z1 - z0) > eps)
        z0 = z1
        w = A * z0
        z1 = w / norm(w)
        iters = iters + 1
    end
    
    l = %nan
    for i = 1:n
        if w(i) <> 0 then
            l = w(i)/z0(i)
            break
        end
    end
    
    v = z1
endfunction

function pregunta4()
    A = [0.4 0.2 0.4; 0.3 0.7 0; 0.3 0.1 0.6]
    centros = diag(A)
    radios = sum(abs(A),'c') - abs(centros)
    
    if max(centros + radios) > 1 then
        printf("El autovalor máximo no se encuentra acotado por 1\n")
    else
        printf("El autovalor máximo se encuentra acotado por 1\n")
    end
    
    printf("----------------------------\n")
    
    [l, v] = metodoPotencias(A, [1, 1, 1]', 10 ** -6)
    printf("Autovalor de módulo máximo")
    disp(l)
    printf("Autovector asociado")
    disp(v)
endfunction

pregunta4()

// Resultado de evaluar pregunta4():

/*
El autovalor máximo se encuentra acotado por 1
----------------------------
Autovalor de módulo máximo
   1.
Autovector asociado
   0.5773503
   0.5773503
   0.5773503
*/
