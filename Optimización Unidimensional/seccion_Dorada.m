function [x1, x2, fx1, fx2, fxx, xx, b, numIter2] = seccion_Dorada(opcion2, f, xl, xu, tol, maxIter)
    % Definir la función según la opción
    if opcion2 == 2
        g = @(x) -f(x);
    else
        g = f;
    end

    ea = 0;
    fxl = g(xl);
    fxu = g(xu);
    numIter = 1;

    fprintf('\n');
    fprintf('k         xl             xu             x1             x2            f(xl)           f(xu)         f(x1)           f(x2)           ea\n');

    while (numIter <= maxIter)
        R = (sqrt(5) - 1) / 2;
        d = R * (xu - xl);
        x1 = xl + d;
        x2 = xu - d;
        fx1 = g(x1);
        fx2 = g(x2);

        if numIter == 1
            ea = '';
        end

        if opcion2 == 1
            fprintf('%d  %13.6f  %13.6f  %13.6f  %13.6f  %13.6f  %13.6f  %13.6f  %13.6f  %13.6f\n', numIter, xl, xu, x1, x2, fxl, fxu, fx1, fx2, ea);
        else
            fprintf('%d  %13.6f  %13.6f  %13.6f  %13.6f  %13.6f  %13.6f  %13.6f  %13.6f  %13.6f\n', numIter, xl, xu, x1, x2, -fxl, -fxu, -fx1, -fx2, ea);
        end
        
        if fx1 > fx2
            xl = x2;
            fxl = fx2;
            fxx = fx1;
            xx = x1;
        else
            xu = x1;
            fxu = fx1;
            fxx = fx2;
            xx = x2;
        end
        b=ea;
        if ea < tol
            fprintf('\n');
            return;
        end
        ea = (1 - R) * abs((xu - xl) / xx) * 100;
        numIter2=numIter;
        numIter = numIter + 1;      
    end
end
