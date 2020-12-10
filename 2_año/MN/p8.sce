function I = metodoTrapecio(f, a, b)
    I = (b - a) * (f(a) + f(b)) /2
endfunction

function I = metodoTrapecioComp(f, a, b, n)
    // Longitud de los subintervalos
    h = (b - a) / n
    // Calculo los xi
    x = linspace(a, b, n)
    // Acumulador
    I = 0
    
    for i = 1:n
        // Caso x0 y xn
        if (i == 1) || (i == n) then
            I = I + (1/2) * f(x(i))
        // Caso x1 a x(n-1)
        else
            I = I + f(x(i))
        end
    end
    // Resultado final
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
    // La cantidad de subintervalos debe ser par
    if modulo(n, 2) <> 0 then
        I = %nan
    else
        // Longitud de los subintervalos
        h = (b - a) / n
        // Calculo los xi
        x = linspace(a, b, n)
        // Acumulador
        I = 0
        
        for i = 1:n
            // Caso x0 y xn
            if (i == 1) || (i == n) then
                mul = 1
            else
            // Caso x1 a x(n-1)
                if modulo(i, 2) == 0 then
                    mul = 4
                else
                    mul = 2
                end
            end
            // Utilizo mul para representar el valor por el que se multiplica
            // a f(xi) en Sn(f)
            I = I + mul * f(x(i))
        end
        // Resultado final
        I = I * (h/3)
    end
endfunction

function ej1()
    printf("Primera integral, punto a \n")
    f1 = log
    a1 = 1
    b1 = 2
    vr1 = intg(a1, b1, f1)
    aprox1tra = metodoTrapecio(f1, a1, b1)
    aprox1simp = metodoSimpson(f1, a1, b1)
    printf("Valor real: %f \nValor aproximado por trapecio: %f \nvalor aprox por Simpson: %f\n", vr1, aprox1tra, aprox1simp)
    
    printf("\n------------------------\n\n")
    
    printf("Segunda integral, punto b \n")
    deff("y = f2(x)", "y = x ** (1/3)")
    a2 = 0
    b2 = 0.1
    vr2 = intg(a2, b2, f2)
    aprox2tra = metodoTrapecio(f2, a2, b2)
    aprox2simp = metodoSimpson(f2, a2, b2)
    printf("Valor real: %f \nValor aproximado por trapecio: %f \nvalor aprox por Simpson: %f\n", vr2, aprox2tra, aprox2simp)
    
    printf("\n------------------------\n\n")
    
    printf("Tercera integral, punto c \n")
    deff("y = f3(x)", "y = sin(x) ** 2")
    a3 = 0
    b3 = %pi/3
    vr3 = intg(a3, b3, f3)
    aprox3tra = metodoTrapecio(f3, a3, b3)
    aprox3simp = metodoSimpson(f3, a3, b3)
    printf("Valor real: %f \nValor aproximado por trapecio: %f \nvalor aprox por Simpson: %f\n", vr3, aprox3tra, aprox3simp)
endfunction

function ej2()
    printf("Punto a \n")
    deff("y = f1(x)", "y = 1/x")
    a1 = 1
    b1 = 3
    n1 = 4
    vr1 = intg(a1, b1, f1)
    aprox1 = metodoTrapecioComp(f1, a1, b1, n1)
    ea1 = abs(aprox1 - vr1)
    er1 = ea1 / abs(vr1)
    printf("Valor real: %f | Valor aproximado por método compuesto de trapecio: %f\n", vr1, aprox1)
    printf("Error absoluto: %f | Error relativo: %f\n", ea1, er1)
    
    printf("\n------------------------\n\n")
    
    printf("Punto b \n")
    deff("y = f2(x)", "y = x ** 3")
    a2 = 0
    b2 = 2
    n2 = 4
    vr2 = intg(a2, b2, f2)
    aprox2 = metodoTrapecioComp(f2, a2, b2, n2)
    ea2 = abs(aprox2 - vr2)
    er2 = ea2 / abs(vr2)
    printf("Valor real: %f | Valor aproximado por método compuesto de trapecio: %f\n", vr2, aprox2)
    printf("Error absoluto: %f | Error relativo: %f\n", ea2, er2)
    
    printf("\n------------------------\n\n")
    
    printf("Punto c \n")
    deff("y = f3(x)", "y = x * ((1 + x**2) ** (1/2))")
    a3 = 0
    b3 = 3
    n3 = 6
    vr3 = intg(a3, b3, f3)
    aprox3 = metodoTrapecioComp(f3, a3, b3, n3)
    ea3 = abs(aprox3 - vr3)
    er3 = ea3 / abs(vr3)
    printf("Valor real: %f | Valor aproximado por método compuesto de trapecio: %f\n", vr3, aprox3)
    printf("Error absoluto: %f | Error relativo: %f\n", ea3, er3)
    
    printf("\n------------------------\n\n")
    
    printf("Punto d \n")
    deff("y = f4(x)", "y = sin(%pi * x)")
    a4 = 0
    b4 = 1
    n4 = 8
    vr4 = intg(a4, b4, f4)
    aprox4 = metodoTrapecioComp(f4, a4, b4, n4)
    ea4 = abs(aprox4 - vr4)
    er4 = ea4 / abs(vr4)
    printf("Valor real: %f | Valor aproximado por método compuesto de trapecio: %f\n", vr4, aprox4)
    printf("Error absoluto: %f | Error relativo: %f\n", ea4, er4)
        
    printf("\n------------------------\n\n")

    printf("Punto e \n")
    deff("y = f5(x)", "y = x * sin(x)")
    a5 = 0
    b5 = 2 * %pi
    n5 = 8
    vr5 = intg(a5, b5, f5)
    aprox5 = metodoTrapecioComp(f5, a5, b5, n5)
    ea5 = abs(aprox5 - vr5)
    er5 = ea5 / abs(vr5)
    printf("Valor real: %f | Valor aproximado por método compuesto de trapecio: %f\n", vr5, aprox5)
    printf("Error absoluto: %f | Error relativo: %f\n", ea5, er5)
    
    printf("\n------------------------\n\n")

    printf("Punto f \n")
    deff("y = f6(x)", "y = x**2 * exp(x)")
    a6 = 0
    b6 = 1
    n6 = 8
    vr6 = intg(a6, b6, f6)
    aprox6 = metodoTrapecioComp(f6, a6, b6, n6)
    ea6 = abs(aprox6 - vr6)
    er6 = ea6 / abs(vr6)
    printf("Valor real: %f | Valor aproximado por método compuesto de trapecio: %f\n", vr6, aprox6)
    printf("Error absoluto: %f | Error relativo: %f\n", ea6, er6)
       
endfunction

function ej3()
    printf("Punto a \n")
    deff("y = f1(x)", "y = 1/x")
    a1 = 1
    b1 = 3
    n1 = 4
    vr1 = intg(a1, b1, f1)
    aprox1 = metodoSimpsonComp(f1, a1, b1, n1)
    ea1 = abs(aprox1 - vr1)
    er1 = ea1 / abs(vr1)
    printf("Valor real: %f | Valor aproximado por método compuesto de Simpson: %f\n", vr1, aprox1)
    printf("Error absoluto: %f | Error relativo: %f\n", ea1, er1)
    
    printf("\n------------------------\n\n")
    
    printf("Punto b \n")
    deff("y = f2(x)", "y = x ** 3")
    a2 = 0
    b2 = 2
    n2 = 4
    vr2 = intg(a2, b2, f2)
    aprox2 = metodoSimpsonComp(f2, a2, b2, n2)
    ea2 = abs(aprox2 - vr2)
    er2 = ea2 / abs(vr2)
    printf("Valor real: %f | Valor aproximado por método compuesto de Simpson: %f\n", vr2, aprox2)
    printf("Error absoluto: %f | Error relativo: %f\n", ea2, er2)
    
    printf("\n------------------------\n\n")
    
    printf("Punto c \n")
    deff("y = f3(x)", "y = x * ((1 + x**2) ** (1/2))")
    a3 = 0
    b3 = 3
    n3 = 6
    vr3 = intg(a3, b3, f3)
    aprox3 = metodoSimpsonComp(f3, a3, b3, n3)
    ea3 = abs(aprox3 - vr3)
    er3 = ea3 / abs(vr3)
    printf("Valor real: %f | Valor aproximado por método compuesto de Simpson: %f\n", vr3, aprox3)
    printf("Error absoluto: %f | Error relativo: %f\n", ea3, er3)
    
    printf("\n------------------------\n\n")
    
    printf("Punto d \n")
    deff("y = f4(x)", "y = sin(%pi * x)")
    a4 = 0
    b4 = 1
    n4 = 8
    vr4 = intg(a4, b4, f4)
    aprox4 = metodoSimpsonComp(f4, a4, b4, n4)
    ea4 = abs(aprox4 - vr4)
    er4 = ea4 / abs(vr4)
    printf("Valor real: %f | Valor aproximado por método compuesto de Simpson: %f\n", vr4, aprox4)
    printf("Error absoluto: %f | Error relativo: %f\n", ea4, er4)
        
    printf("\n------------------------\n\n")

    printf("Punto e \n")
    deff("y = f5(x)", "y = x * sin(x)")
    a5 = 0
    b5 = 2 * %pi
    n5 = 8
    vr5 = intg(a5, b5, f5)
    aprox5 = metodoSimpsonComp(f5, a5, b5, n5)
    ea5 = abs(aprox5 - vr5)
    er5 = ea5 / abs(vr5)
    printf("Valor real: %f | Valor aproximado por método compuesto de Simpson: %f\n", vr5, aprox5)
    printf("Error absoluto: %f | Error relativo: %f\n", ea5, er5)
    
    printf("\n------------------------\n\n")

    printf("Punto f \n")
    deff("y = f6(x)", "y = x**2 * exp(x)")
    a6 = 0
    b6 = 1
    n6 = 8
    vr6 = intg(a6, b6, f6)
    aprox6 = metodoSimpsonComp(f6, a6, b6, n6)
    ea6 = abs(aprox6 - vr6)
    er6 = ea6 / abs(vr6)
    printf("Valor real: %f | Valor aproximado por método compuesto de Simpson: %f\n", vr6, aprox6)
    printf("Error absoluto: %f | Error relativo: %f\n", ea6, er6)
       
endfunction

function ej4()
    deff("y = f(x)", "y = (x +1) ** (-1)")
    a = 0
    b = 1.5
    n = 10
    vr = 0.9262907
    aproxTra = metodoTrapecioComp(f, a, b, n) 
    eaTra = abs(aproxTra - vr)
    erTra = eaTra / abs(vr)
    aproxSimp = metodoSimpsonComp(f, a, b, n)
    eaSimp = abs(aproxSimp - vr)
    erSimp = eaSimp / abs(vr)
    
    
    printf("Valor real: %f \n", vr)
    printf("-----------------------------------\n")
    printf("Valor aproximado por método compuesto del trapecio: %f\n", aproxTra)
    printf("Error absoluto: %f | Error relativo: %f \n", eaTra, erTra)
    printf("-----------------------------------\n")
    printf("Valor aproximado por método compuesto de Simpson: %f\n", aproxSimp)
    printf("Error absoluto: %f | Error relativo: %f \n", eaSimp, erSimp)
    
endfunction
