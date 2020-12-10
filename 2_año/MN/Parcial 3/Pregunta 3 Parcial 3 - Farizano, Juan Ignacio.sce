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
    printf("Valor real: %f | Valor aproximado por método compuesto del trapecio: %f\n", vr1, aprox1)
    printf("Error absoluto: %f | Error relativo: %f\n", ea1, er1)
    
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
    printf("Valor real: %f | Valor aproximado por método compuesto del trapecio: %f\n", vr4, aprox4)
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
    printf("Valor real: %f | Valor aproximado por método compuesto del trapecio: %f\n", vr5, aprox5)
    printf("Error absoluto: %f | Error relativo: %f\n", ea5, er5)       
endfunction

ej2()

// Resultado de evaluar ej2():

/*
Punto a 
Valor real: 1.098612 | Valor aproximado por método compuesto del trapecio: 0.847619
Error absoluto: 0.250993 | Error relativo: 0.228464

------------------------

Punto d 
Valor real: 0.636620 | Valor aproximado por método compuesto del trapecio: 0.547661
Error absoluto: 0.088959 | Error relativo: 0.139736

------------------------

Punto e 
Valor real: -6.283185 | Valor aproximado por método compuesto del trapecio: -5.123611
Error absoluto: 1.159574 | Error relativo: 0.184552
*/
