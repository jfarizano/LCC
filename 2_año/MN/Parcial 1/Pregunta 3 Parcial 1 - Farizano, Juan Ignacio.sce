function r = raicesRobustas(p)
    // Coeficientes del polinomio
    c = coeff(p, 0);
    b = coeff(p, 1);
    a = coeff(p, 2);
    // Calculo el discriminante del polimonio
    disc = b^2 - 4*a*c
    
    // Si el discriminante es menor a 0 el método no aplica
    // y devuelvo NaN (Not a Number)
    if disc < 0 then
        return [%nan, %nan]
    end
    
    // Si b < 0, determino las raíces mediante las ecuaciones (14) y (7)
    // del pdf de la práctica 2
    if b < 0 then 
        r(1) = 2*c / (-b + sqrt(disc))
        r(2) = (-b + sqrt(disc))/(2*a)
    else
        // Si b > 0, determino las raíces mediante las ecuaciones (6) y (15)
        if b > 0 then
            r(1) = (-b - sqrt(disc))/(2*a)
            r(2) = 2*c / (-b - sqrt(disc))
        // Si b = 0, en las ecuaciones (14) y (15) igualo b a 0 y obtengo 
        // estos resultados.
        else
            r(1) = sqrt(c/a)
            r(2) = -r(1)
        end
    end
endfunction

format(25)
// Defino epsilon y el polinomio a utilizar
epsilon = 0.0001
p = poly([-epsilon, 1/epsilon, epsilon], "x", "coeff") 

// Cálculo de raíces usando función propia y función roots de Scilab
raizRobusta = raicesRobustas(p)(2) // raizRobusta = 0.00000001
raizScilab = roots(p)(2) // raizScilab  = 0.00000001

// Cálculo de errores
errorAbsoluto = abs(raizRobusta - raizScilab) // errorAbsoluto = 0.
errorRelativo = errorAbsoluto / abs(raizScilab) // errorRelativo = 0.

// Imprimo los resultados
printf("Raíz calculada por scilab: %e \n", raizScilab)
printf("Raíz calculada en forma robusta: %e \n", raizRobusta)
printf("Error absoluto: %e       Error relativo: %e  \n", errorAbsoluto, errorRelativo)

// Se obtiene
/* 
Raíz calculada por scilab: 1.000000e-08 
Raíz calculada en forma robusta: 1.000000e-08 
Error absoluto: 0.000000e+00       Error relativo: 0.000000e+00
*/
