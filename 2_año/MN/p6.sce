function cotasGers(A)
    [n,m] = size(A)
    // Calculo los centros de los círculos (cada elemento de la diagonal
    // de A es el centro de un círculo, es decir, el centro del círculo i
    // es a(i,i))
    centros = diag(A)
    // Calculo los radios, donde el radio del círculo i es la suma de la fila i
    // menos el elem de la diagonal (o a(i,i))
    radios = sum(abs(A),'c') - abs(centros)
    
    // Imprimo las cotas
    for i = 1:n
        printf("Un autovalor se puede encontrar en el círculo de centro %f y radio %f\n", i, centros(i), radios(i))
    end    
endfunction

function circ(r,x,y)
    xarc(x-r,y+r,2*r,2*r,0,360*64)
endfunction

function Gers(A)
    [n,m] = size(A);
    centros = diag(A);
    radios = sum(abs(A),'c') - abs(centros);
    
    // buscamos calcular un rectángulo que contenga a todos los circulos
    // esquina inferiro izquierda
    
    mx = round (min(centros - radios)-1);
    my = round (min(-radios)-1);
    
    // esquina superior derecha
    
    Mx = round(max(centros+radios)+1);
    My = round(max(radios)+1);
    
    rectangulo = [mx my Mx My];
    
    // dibujamos los autovalores
    plot2d(real(spec(A)),imag(spec(A)),-3,"031","",rectangulo)
    replot(rectangulo); // reeplaza al rect
    xgrid();
    
    for i=1:n
        circ(radios(i),centros(i),0)
    end
endfunction

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

function ej1()
    A1 = [1 0 0; -1 0 1; -1 -1 2]
    printf("Matriz punto a)\n")
    disp(A1)
    printf("\nCotas de autovalores por teorema de Gerschgorin:\n")
    cotasGers(A1)
    printf("\nAutovalores:\n")
    disp(spec(A1)')
    
    printf("\n ------------------------------------------- \n")
    
    A2 = [1 0 0; -0.1 0 0.1; -0.1 -0.1 2]
    printf("\nMatriz punto b)\n")
    disp(A2)
    printf("\nCotas de autovalores por teorema de Gerschgorin:\n")
    cotasGers(A2)
    printf("\nAutovalores:\n")
    disp(spec(A2)')
    
    printf("\n ------------------------------------------- \n")
    
    A3 = [1 0 0; -0.25 0 0.25; -0.25 -0.25 2]
    printf("\nMatriz punto c)\n")
    disp(A3)
    printf("\nCotas de autovalores por teorema de Gerschgorin:\n")
    cotasGers(A3)
    printf("\nAutovalores:\n")
    disp(spec(A3)')
    
    printf("\n ------------------------------------------- \n")
    
    A4 = [4 -1 0; -1 4 -1; -1 -1 4]
    printf("\nMatriz punto d)\n")
    disp(A4)
    printf("\nCotas de autovalores por teorema de Gerschgorin:\n")
    cotasGers(A4)
    printf("\nAutovalores:\n")
    disp(spec(A4)')
    
    printf("\n ------------------------------------------- \n")
    
    A5 = [3 2 1; 2 3 0; 1 0 3]
    printf("\nMatriz punto e)\n")
    disp(A5)
    printf("\nCotas de autovalores por teorema de Gerschgorin:\n")
    cotasGers(A5)   
    printf("\nAutovalores:\n")
    disp(spec(A5)')
    
    printf("\n ------------------------------------------- \n")
    
    A6 = [4.75 2.25 -0.25; 2.25 4.75 1.25; -0.25 1.25 4.75]
    printf("\nMatriz punto f)\n")
    disp(A6)
    printf("\nCotas de autovalores por teorema de Gerschgorin:\n")
    cotasGers(A6)
    printf("\nAutovalores:\n")
    disp(spec(A6)')  
    
endfunction

function ej3(eps)
    printf("Epsilon dado:")
    disp(eps)
    // Defino la matriz A con el eps dado
    A = [1 -1 0; -2 4 -2; 0 -1 1+eps]
    printf("\nMatriz A:")
    disp(A)
    // Polinomio característico
    pol = poly(A, "x")
    printf("\nPolinomio característico:")
    disp(pol)
    // Raices del polinomio característico
    raices = roots(pol)
    printf("\nRaíces del polinomio característico:")
    disp(raices')
    // Autovalores, que coinciden con las raices del pol car
    espectro = spec(A)
    printf("\nAutovalores:")
    disp(espectro')
endfunction

function ej5()
    A1 = [6 4 4 1; 4 6 1 4; 4 1 6 4; 1 4 4 6]
    printf("Matriz A1:")
    disp(A1)
    [l1, v1, iters1] = metodoPotencias(A1, [1, 1, 1, 1]', 10**-6)
    printf("\nAutovalor dominante:")
    disp(l1)
    printf("\nAutovector asociado:")
    disp(v1)
    printf("\nIteraciones utilizadas: %d \n", iters1)
    vr1 = max(abs(spec(A1)))
    ea1 = abs(l1 - vr1)
    er1 = ea1 / abs(vr1)
    printf("Error absoluto del mayor autovalor: %f\n", ea1)
    printf("Error relativo del mayor autovalor: %f\n", er1)
    
    
    printf("\n ------------------------------------------- \n")
    
    A2 = [12 1 3 4; 1 -3 1 5; 3 1 6 -2; 4 5 -2 -1]
    printf("Matriz A2:")
    disp(A2)
    [l2, v2, iters2] = metodoPotencias(A2, [1, 1, 1, 1]', 10**-6)
    printf("\nAutovalor dominante:")
    disp(l2)
    printf("\nAutovector asociado:")
    disp(v2)
    printf("\nIteraciones utilizadas: %d\n", iters2)
    vr2 = max(abs(spec(A2)))
    ea2 = abs(l2 - vr2)
    er2 = ea2 / abs(vr2)
    printf("Error absoluto del mayor autovalor: %f\n", ea2)
    printf("Error relativo del mayor autovalor: %f\n", er2)
endfunction
