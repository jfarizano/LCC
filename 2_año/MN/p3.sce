function r = metodoBiseccion(f, a, b, eps)
    fa = f(a)
    fb = f(b)
    
    if f(a)*f(b) >= 0 then
        r = %nan
    else
        c = (a + b)/2
        
        while (abs(b - c) > eps)
            fc = f(c)
            if f(b) * f(c) <= 0 then
                a = c
            else
                b = c
            end
            c = (a + b)/2
        end
    
        r = c    
    end 
endfunction

function r = metodoSecante(f, xm, xn, eps, maxIter)
    iter = 1
    while (abs(f(xn)) > eps) && (iter < maxIter)
        temp = xn
        xn = xm - f(xm) *(xm - xn) / (f(xm) - f(xn))
        xm = temp
        iter = iter + 1        
    end
    
    if iter == maxIter then
        r = %nan
    else
        r = xn
    end
    
endfunction

function r = metodoPuntoFijo(f, x, eps, maxIter)
    iter = 1
    x1 = f(x)
    while (abs(x1 - x) > eps) && (iter < maxIter)
        x = x1
        x1 = f(x1)
    end
    
    if iter == maxIter then
        r = %nan
    else
        r = x1
    end
endfunction

function r = metodoNewton(f, x, eps, maxIter)
    iter = 1
    x1 = x - f(x)/numderivative(f, x)
    while (abs(x1 - x) > eps) && (iter < maxIter)
        x = x1
        x1 = x - f(x)/numderivative(f, x)
    end
    
    if iter == maxIter then
        r = %nan
    else
        r = x1
    end
endfunction

function r = metodoNewtonMulti(f, x, eps, maxIter)
    iter = 1
    J = numderivative(f, x)
    x1 = x - inv(J) * f(x)
    
    while (norm(x1 - x) > eps) && (iter < maxIter)
        x = x1
        J = numderivative(f, x)
        x1 = x - inv(J) * f(x)
    end
    
    if iter == maxIter then
        r = %nan
    else
        r = x1
    end
endfunction

function z = ej9(x)
    z(1) = 1 + x(1)**2-x(2)**2+exp(x(1))*cos(x(2))
    z(2) = 2 *x(1)*x(2) + exp(x(1))*sin(x(2))
endfunction

function z = ej10(x)
    z(1) = x(1)**2 + x(1)*(x(1)**3) - 9
    z(2) = 3*(x(1)**2)*x(2) - 4 - x(2)**3
endfunction
