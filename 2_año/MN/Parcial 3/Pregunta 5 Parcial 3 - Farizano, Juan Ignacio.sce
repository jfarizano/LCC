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

function pregunta5()
    x = (0:0.4:8)'
    y = [10.61; 14.89; 11.50; -4.58; 13.65; 23.47; 24.29; 23.33; 22.80; 45.03; 25.85
         46.46; 40.84; 65.50; 75.96; 79.91; 93.19; 126.21; 147.40; 158.78; 193.23]
         
    p = minimosCuadradosPoli(x, y, 3)
    
    plot(x, y, "b")
    plot(x, horner(p, x), "r")  
    a = gca();a.x_location="origin";a_y_location="origin";
    hl = legend(["Datos experimentales", "Aprox. por min. cuadrados"])
endfunction

pregunta5()

// Polinomio obtenido: 18.276386 -11.692376x +3.9997288x^2
