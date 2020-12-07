function I = metodoTrapecio(f, a, b)
    I = (b - a) * (f(a) + f(b)) /2
endfunction

function I = metodoTrapecioComp(f, a, b, n)
    h = (b - a) / n
    x = linspace(a, b, n)
    I = 0
    
    for i = 1:n
        if (i == 1) || (i == n) then
            I = I + (1/2) * f(x(i))
        else
            I = I + f(x(i))
        end
    end
    I = I * h
endfunction

function I = metodoTrapecioBiDim(f, a, b, c, d)
    h = (b - a) * (d - c) / 4
    I = h * (f(c,a) + f(c,b) + f(d, a) + f(d,b))
endfunction

function I = metodoSimpson(f, a, b)
    h = (b - a) / 2
    c = a + h
    I = (h/3) * (f(a) + 4 * f(c) + f(b))
endfunction

function I = metodoSimpsonComp(f, a, b, n)  
    if modulo(n, 2) then
        I = %nan
    else
        h = (b - a) / n
        x = linspace(a, b, n)
        I = 0
        
        for i = 1:n
            if (i == 1) || (i == n) then
                mul = 1
            else
                if modulo(i, 2) == 0 then
                    mul = 4
                else
                    mul = 2
                end
            end
            I = I + mul * f(x(i))
        end
        I = I * (h/3)
    end
endfunction
