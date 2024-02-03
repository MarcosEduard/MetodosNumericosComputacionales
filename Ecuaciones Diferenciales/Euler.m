function [yi, ea] = Euler(f, a, beta, b, n)
variacionX = (b - a) / n;

numIter = 0;
yi = 0;
    fprintf('i          x(i)          y(i)            f(i)        ea\n');
    while (numIter <= n)
        yiAnterior = yi;
        if numIter == 0
            xi = a;
            yi = beta;
            ea = '';
        else
            yi = yi + variacionX * f(xi,yi);
            xi = a + numIter * variacionX;
            ea = abs((yi -yiAnterior)/yi)*100;
        end
        zi = f(xi,yi);
        fprintf('%d  %13.6f   %13.6f   %13.6f  %13.4f\n', numIter, xi, yi, zi,ea);
        numIter = numIter+ 1;
    end
end