function [x3, fxx, b, numIter2] = interpolacion_Cuadratica(opcion2, f, x0, x1, x2, tol, maxIter)
    if opcion2 == 2
        % Definir la función opuesta a f
        g = @(x) -f(x);
    else
        % Si opcion2 es 1, simplemente usar la función original
        g = f;
    end

    ea = 0;
    x3 = 0;
    fx0 = g(x0);
    fx1 = g(x1);
    fx2 = g(x2);
    numIter = 1;

    fprintf('\n');
    fprintf('k          x0             x1            x2            x3           f(x0)           f(x1)           f(x2)         f(x3)           ea\n');
    
    while (numIter <= maxIter)
        z = x3;
        x3 = (fx0 * (x1^2 - x2^2) + fx1 * (x2^2 - x0^2) + fx2 * (x0^2 - x1^2)) / (2 * fx0 * (x1 - x2) + 2 * fx1 * (x2 - x0) + 2 * fx2 * (x0 - x1));
        fx3 = g(x3);     
        if numIter > 1
            ea = abs((x3 - z) / x3) * 100;
            b=ea;
        end

        if numIter == 1
            ea = '';
        end

        if opcion2 == 1
            fprintf('%d  %13.6f  %13.6f  %13.6f  %13.6f  %13.6f  %13.6f  %13.6f %13.6f %13.6f\n', numIter, x0, x1, x2, x3, fx0, fx1, fx2, fx3, ea);
        else
            fprintf('%d  %13.6f  %13.6f  %13.6f  %13.6f  %13.6f  %13.6f  %13.6f %13.6f %13.6f\n', numIter, x0, x1, x2, x3, -fx0, -fx1, -fx2, -fx3, ea);
        end

        if x3 > x1
            if fx3 > fx1
                x0 = x1;
                fx0 = fx1;
                x1 = x3;
                fx1 = fx3;
                fxx = fx3;
            else
                x2 = x3;
                fx2 = fx3;
                fxx = fx1;
            end
        else
            if fx3 > fx1
                m = x1;
                fm = f(m);
                x1 = x3;
                fx1 = fx3;
                x2 = m;
                fx2 = fm;
                fxx = fx3;
            else
                x0 = x3;
                fx0 = fx3;
                fxx = fx1;
            end
        end
        numIter2=numIter;
        numIter = numIter + 1;
        if ea < tol
            fprintf('\n');
            return;
        end
    end
end
