function [r, iter, evaluaciones] = metodoSecante(f, x0, x1, eps, maxIter)
    f1 = f(x1)
    evaluaciones = 1
    iter = 0
    
    while (f1 > eps) && (iter < maxIter)
        temp = x1
        f0 = f(x0)
        x1 = x1 - f1 *(x1 - x0) / (f1 - f0)
        x0 = temp
        f1 = f(x1)
        iter = iter + 1
        evaluaciones = evaluaciones + 2
    end
    
    if iter == maxIter then
        r = %nan
    else
        r = x1
    end 
endfunction

function [r, iter, evaluaciones] = metodoNewton(f, x, eps, maxIter)
    
    fx = f(x)
    derivada = (f(x + eps) - fx)/eps
    x1 = x - fx/derivada
    
    fx = f(x1)
    iter = 1
    evaluaciones = 3
    
    while (fx > eps) && (iter < maxIter)
        derivada = (f(x1 + eps) - fx)/eps
        x1 = x1 - fx/derivada
        fx = f(x1)
        iter = iter + 1
        evaluaciones = evaluaciones + 2
    end
    
    if iter == maxIter then
        r = %nan
    else
        r = x1
    end
endfunction

function pregunta4(eps)
    deff("y=f(x)", "y=x**2-9")
    [r1, iters1, evals1] = metodoSecante(f, 1000, 990, eps, 1000)
    [r2, iters2, evals2] = metodoNewton(f, 1000, eps, 1000)
    
    printf("Método de la secante:\n")
    printf("Raíz obtenida: %f, n° de iteraciones: %d, n° de evals: %d\n", r1, iters1, evals1)
    printf("\n")
    printf("Método de Newton:\n")
    printf("Raíz obtenida: %f, n° de iteraciones: %d, n° de evals: %d\n", r2, iters2, evals2)
endfunction


// Resultado de ejecutar pregunta4(10**-4)

/*

--> pregunta4(10**-4)
Método de la secante:
Raíz obtenida: 3.000001, n° de iteraciones: 16, n° de evals: 33

Método de Newton:
Raíz obtenida: 3.000000, n° de iteraciones: 12, n° de evals: 25

*/
