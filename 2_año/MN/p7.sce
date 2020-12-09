function y = map(f, x)
    [m, n] = size(x)
    y = zeros(n)
    
    for i = 1:n
        y(i) = f(x(i))
    end
endfunction

function L = Lk(k, x)
    [m, n] = size(x)
    L = 1
    for i = 1:n
        if i <> k then
            L = L * (poly([-x(i), 1], "x", "coeff") / (x(k) - x(i)))
        end
    end
endfunction

function p = polInterpolLagrange(x, y)
    [m, n] = size(x)
    p = 0
    for k = 1:n
        p = p + Lk(k, x) * y(k)
    end
endfunction

function d = diferenciaDividida(x, y)
    [m, n] = size(x)
    if n == 2 then
       d = (y(2) - y(1)) / (x(2) - x(1))
    else
       xi = x(1, 2:n)
       xd = x(1, 1:n-1)
       yi = y(1, 2:n)
       yd = y(1, 1:n-1)
       d = (diferenciaDividida(xi, yi) - diferenciaDividida(xd, yd)) / (x(n) - x(1))
    end
endfunction

function p = polInterpolNewton(x, y)
    [m, n] = size(x)
    p = y(1)
    acum = 1
    for i = 2:n
        acum = acum * poly([-x(i - 1), 1], "x", "coeff")
        p = p + acum * diferenciaDividida(x(1, 1:i), y(1, 1:i))
    end
endfunction

function p = minimosCuadradosPoli(x, y, n)
   m = size(x)(1)
   A = zeros(m, n)
   
   for i = 1:m
       for j = 1:n
           A(i, j) = x(i) ** (j - 1)
       end
   end
   
  a = inv((A' * A)) * A' * y
  p = poly(a, "x", "coeff")
   
endfunction

function x = nodosUniformes(a, b, n)
    x = linspace(a, b, n)
endfunction

function p = polChebyshev(n)
    if n == 0 then
        p = 1
    else
        x = poly([0, 1], "x", "coeff")
        if n == 1
            p = x
        else
            p = (2 * x * polChebyshev(n - 1)) - polChebyshev(n - 2)
        end
    end
endfunction

function x = nodosChebyshev(n)
    TSombrerito = (1 / (2 ** n)) * polChebyshev(n)
    x = roots(TSombrerito)'
endfunction

function x = nodosChebyshevCambio(a, b, n)
    TSombrerito = (1 / (2 ** n)) * polChebyshev(n)
    x = roots(TSombrerito)'
    
    for i = 1:n
        x(i) = ((b + a) + x(i) * (b - a)) / 2
    end
    
    x = gsort(x, 'r', 'i')  
endfunction

function x = nodosChebyshevIter(a, b, n)
    x = zeros(n)
    for i = 1:n
        x(i) = (1/2) * (a + b) + (1/2) * (b - a) * cos((((2 * i) - 1)/ (2 * n)) * %pi)
    end
    x = x'
endfunction

function ej1()
    x1 = [0, 0.6]
    y1 = [1.0, 1.8221]
    printf("Para obtener los polinomios lineales utilizo los valores: \n")
    printf("x =")
    disp(x1)
    printf("y = ")
    disp(y1)
    printf("Obtenemos el siguiente polinomio de interpolación lineal por método de Lagrange")
    laLineal = polInterpolLagrange(x1, y1)
    disp(laLineal)
    printf("\nObtenemos el siguiente polinomio de interpolación lineal por método de Newton")
    newLineal = polInterpolNewton(x1, y1)
    disp(newLineal)
    printf("El valor aproximado mediante pol de Lagrange es: %f\n", horner(laLineal, 1/3))
    printf("El valor aproximado mediante pol de Newton es: %f\n", horner(newLineal, 1/3))
    
    printf("\n---------------------------------------------------\n\n")
    
    x2 = [0, 0.2, 0.4, 0.6]
    y2 = [1.0, 1.2214, 1.4918, 1.8221]
    printf("Para obtener los polinomios cúbicos utilizo los valores: \n")
    printf("x =")
    disp(x2)
    printf("y = ")
    disp(y2)
    printf("Obtenemos el siguiente polinomio de interpolación cúbica por método de Lagrange")
    laCubica = polInterpolLagrange(x2, y2)
    disp(laCubica)
    printf("\nObtenemos el siguiente polinomio de interpolación cúbica por método de Newton")
    newCubica = polInterpolNewton(x2, y2)
    disp(newCubica)
    printf("El valor aproximado mediante pol de Lagrange es: %f\n", horner(laCubica, 1/3))
    printf("El valor aproximado mediante pol de Newton es: %f\n", horner(newCubica, 1/3))
    
    printf("\nEl valor real es: %f \n", exp(1/3)) 
endfunction

function ej4()
    x = 2.0:0.1:2.5
    y = [0.2239, 0.1666, 0.1104, 0.5555, 0.0025, -0.0484]
    printf("Mediante el método de Newton obtengo el sgt polinomio interpolante:")
    p = polInterpolNewton(x, y)
    disp(p)
    
    printf("\nValor aproximado de J0(2.15): %f\n", horner(p, 2.15))
    printf("Valor aproximado de J0(2.35): %f\n", horner(p, 2.35))
endfunction

function ej6()
    x = [-1, 1, 2, 4]
    difDiv = [2, 1, -2, 2]
    p = difDiv(1)
    acum = 1
    
    // Encuentro el polinomio interpolante
    for i = 2:4
        acum = acum * poly([-x(i - 1), 1], "x", "coeff")
        p = p + acum * difDiv(i)
    end
    
    printf("Encuentro el siguiente polinomio interpolante:")
    disp(p)
    
    printf("\nValor aproximado de f(0): %f\n", horner(p, 0))
endfunction

function ej7()
    x = [0, 0.15, 0.31, 0.5, 0.6, 0.75]'
    y = [1, 1.004, 1.0031, 1.117, 1.223, 1.422]'
    
    printf("Polinomio de grado 1:")
    p1 = minimosCuadradosPoli(x, y, 2)
    disp(p1)
    printf("\nPolinomio de grado 2:")
    p2 = minimosCuadradosPoli(x, y, 3)
    disp(p2)
    printf("\nPolinomio de grado 3:")
    p3 = minimosCuadradosPoli(x, y, 4)
    disp(p3)
    
    // Grafico
    plot(x, [y, horner(p1, x), horner(p2, x), horner(p3, x)])
    a = gca();a.x_location="origin";a_y_location="origin";
    hl = legend(["Datos dados", "Pol. grado 1", "Pol. grado 2", "Pol. grado 3"])
endfunction

function ej8()
    x = [4, 4.2, 4.5, 4.7, 5.1, 5.5, 5.9, 6.3, 6.8, 7.1]'
    y = [102.56, 113.18, 130.11, 142.05, 167.53, 195.14, 224.87, 256.73, 299.5, 326.72]'
    
    printf("Polinomio de grado 1:")
    p1 = minimosCuadradosPoli(x, y, 2)
    disp(p1)
    printf("\nPolinomio de grado 2:")
    p2 = minimosCuadradosPoli(x, y, 3)
    disp(p2)
    printf("\nPolinomio de grado 3:\n")
    p3 = minimosCuadradosPoli(x, y, 4)
    disp(p3)
    
    // Grafico
    plot(x, y, "m")
    plot(x, horner(p1, x), "r")
    plot(x, horner(p2, x), "g")
    plot(x, horner(p3, x), "b")
    a = gca();a.x_location="origin";a_y_location="origin";
    hl = legend(["Datos dados", "Pol. grado 1", "Pol. grado 2", "Pol. grado 3"])
endfunction

function ej9()
    deff("y = f(x)", "y = 1/(1 + x**2)")
    n = [2, 4, 6, 10, 14]
    rango = -5:0.1:5
    y = map(f, rango)'
    
    colores = ["r", "g", "b", "m", "c"]
    
    for i = 1:5
        x = nodosUniformes(-5, 5, n(i))
        p = polInterpolLagrange(x, map(f, x)')
        plot(rango, (y - horner(p, rango)), colores(i))
    end

    a = gca();a.x_location="origin";a_y_location="origin";
    hl = legend("n = 2", "n = 4", "n = 6", "n = 10", "n = 14")
endfunction

function ej10()
    rango = -1:0.1:1
    x = nodosChebyshev(4)
    y = exp(x)
    p = real(polInterpolLagrange(x, y))
    printf("Polinomio de interpolación obtenido:\n")
    disp(p)
    
    plot(rango, exp(rango) - horner(p, rango))
    a = gca();a.x_location="origin";a_y_location="origin";
endfunction

function ej11()
    rango = 0:0.1:%pi/2
    x = nodosChebyshevCambio(0, %pi/2, 4)
    y = cos(x)
    p = real(polInterpolLagrange(x, y))
    printf("Polinomio de interpolación obtenido:\n")
    disp(p)
    
    plot(rango, cos(rango), "r")
    plot(rango, horner(p, rango), "b")
    a = gca();a.x_location="origin";a_y_location="origin";
    hl = legend("cos(x)", "Aproximación mediante interpolación")
endfunction
