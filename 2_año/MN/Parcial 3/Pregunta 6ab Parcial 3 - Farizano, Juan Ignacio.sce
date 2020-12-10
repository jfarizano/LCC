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

function pregunta6()
    deff("y = f(x)", "y = exp(-x ** 2)")
    a = 0
    b = 1
    n = 100
    
    // Valor calculado por Scilab
    vr = intg(a, b, f)
    // Aproximación por método compuesto del trapecio
    aproxTra = metodoTrapecioComp(f, a, b, n)
    // Errores absoluto y relativo de la aprox anterior
    eaTra = abs(aproxTra - vr)
    erTra = eaTra / abs(vr)
    // Aproximación por método compuesto de Simpson
    aproxSimp = metodoSimpsonComp(f, a, b, n)
    // Errores absoluto y relativo de la aprox anterior
    eaSimp = abs(aproxSimp - vr)
    erSimp = eaSimp / abs(vr)
    
    
    printf("Valor real: %f \n", vr)
    printf("-----------------------------------\n")
    printf("Valor aproximado por método compuesto del trapecio: %f\n", aproxTra)
    printf("Error absoluto: %f | Error relativo: %f \n", eaTra, erTra)
    printf("-----------------------------------\n")
    printf("Valor aproximado por método compuesto de Simpson: %f\n", aproxSimp)
    printf("Error absoluto: %f | Error relativo: %f \n", eaSimp, erSimp)
    
    printf("-----------------------------------\n")
    
    if erTra < erSimp then
        printf("El error de la aproximación por método compuesto del trapecio es menor")
    else
        printf("El error de la aproximación por método compuesto de Simpson es menor")
    end
    
endfunction

pregunta6()

// Resultado de evaluar pregunta6():

/*
Valor real: 0.746824 
-----------------------------------
Valor aproximado por método compuesto del trapecio: 0.739350
Error absoluto: 0.007474 | Error relativo: 0.010008 
-----------------------------------
Valor aproximado por método compuesto de Simpson: 0.738117
Error absoluto: 0.008707 | Error relativo: 0.011659 
-----------------------------------
El error de la aproximación por método compuesto del trapecio es menor
*/
