function v = algoritmo(m, xf)
    x = 0
    k = 0.046
    v2 = 0
    incx = xf / 10
    R = 0
    flag = 0
    while (x <= xf)
        if flag == 2
            incx = incx * 2
        end
        var = 19.6 - (2000 / m) * R
        v2 = v2 + incx * var 
        R = k * v2
        flag = flag + 1
        x = x + incx
        printf("x = %f, R = %f, var =  %f, v2 = %f \n", x, R, var, v2)
   end
   v = sqrt(v2)
endfunction
