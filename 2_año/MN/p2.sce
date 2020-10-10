function r = raicesRobustas(p)
    c = coeff(p, 0);
    b = coeff(p, 1);
    a = coeff(p, 2);
    disc = b^2 - 4*a*c
    
    if disc < 0 then
        return [%nan, %nan]
    end
    
    if b < 0 then
        r(1) = 2*c / (-b + sqrt(disc))
        r(2) = (-b + sqrt(disc))/(2*a)
    else
        if b > 0 then
            r(1) = (-b - sqrt(disc))/(2*a)
            r(2) = 2*c / (-b - sqrt(disc))
        else
            r(1) = sqrt(c/a)
            r(2) = -r(1)
        end
    end
endfunction

function [x, d] = horner(p, x0)
    coeffs = coeff(p)
    n = length(coeffs)
    x = 0
    d = 0 
    for i = n:-1:1
        x = coeffs(i) + x*x0
        if i > 1 then
            d = coeffs(i) * (i-1) + d*x0
        end
    end
endfunction

function x = derivar(f,v,n,h)
    if (n ==0) then
        x = f(v)
    else
    x = (derivar(f,v+h,n-1,h)-derivar(f,v,n-1,h))/h
    end
endfunction

function x = derivarExtra(f,v,n,h)
    deff("y=D0F(x)", "y="+f)
    for i = 1:1:n-1
        deff("y=D"+string(i)+"F(x)", "y=(D"+string(i-1)+"F(x+h)-D"+string(i-1)+"F(x))/h")
    end
    deff ("y=DnF(x)", "y=(D"+string(n-1)+"F(x+h)-D"+string(n-1)+"F(x))/h")
    x = DnF(v)
endfunction

function x = derivarMultiple(f,v,n,h)
    deff("y=D0F(x)", "y="+f)
    for i = 1:1:n
        deff("y=D"+string(i)+"F(x)", "y=(D"+string(i-1)+"F(x+h)-D"+string(i-1)+"F(x))/h")
        x(i) = evstr("D" + string(i) +"F(v)")
    end
endfunction

function x = taylor(f, n, a, v, h)
    deff("y=F0(x)", "y="+f)
    x = F0(a)
    factorial = 1
    derivadas = derivarMultiple(f, a, n, h)
    for i = 1:1:n
        factorial = factorial * n
        x = x + (derivadas(i) * ((v - a) ** i))/factorial
    end
endfunction
