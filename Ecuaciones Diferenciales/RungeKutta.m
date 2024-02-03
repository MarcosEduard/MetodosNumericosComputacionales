function [yi, ea] = RungeKutta(f, a, beta, b, n)
    variacionX = (b - a) / n;
    numIter = 0;
    yi = 0;
    fprintf('i          x(i)           y(i)             k1            k2              k3              k4            ea\n');
    while (numIter <= n)
        yiAnterior = yi;
        if numIter == 0
            xi = a;
            yi = beta;
            ea = '';
        else
            yi = yi + (variacionX/6) * (k1+2*k2+2*k3+k4);
            xi = a + numIter * variacionX;
            ea = abs((yi -yiAnterior)/yi)*100;
        end
        k1 = f(xi,yi);
        k2 = f(xi + variacionX/2,yi + variacionX*k1/2);
        k3 = f(xi + variacionX/2,yi + variacionX*k2/2);
        k4 = f(xi + variacionX,yi + variacionX*k3);
        fprintf('%d  %13.6f   %13.6f   %13.6f  %13.6f  %13.6f  %13.6f  %13.4f\n', numIter, xi, yi, k1, k2, k3, k4, ea);
        numIter = numIter+ 1;
    end
end