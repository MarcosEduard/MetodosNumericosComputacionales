function [m, fm, b, numIter2] = Newton_para_optimos(opcion2, f, x0, tol, maxIter)
    if opcion2 == 2
        g = @(x) -f(x);
    else
        g = f;
    end
    syms x;
    ea=0;
    numIter = 0;
    fprintf('\n');
    fprintf('k          x            f(x)            df(x)        d(df(x))        ea\n');
    
    while (numIter <= maxIter)
        df = diff(g, x);
        dff = diff(df, x);
        fx0 = g(x0);
        dfx = double(subs(df, x0));
        ddfx = double(subs(dff, x0));
        if ddfx == 0
            fprintf('La segunda derivada es cero en el punto actual. El método no puede continuar.\n');
            break;
        end

        if numIter > 0
            ea = abs((x0 - m) / x0) * 100;
            b=ea;
        end
        
        if numIter == 0
            ea = '';
        end
        
        
        if opcion2 == 1
            fprintf('%d  %13.6f  %13.6f  %13.6f %13.6f %13.6f\n', numIter, x0, double(fx0), dfx, ddfx, ea);
        else
            fprintf('%d  %13.6f  %13.6f  %13.6f %13.6f %13.6f\n', numIter, x0, -double(fx0), -dfx, -ddfx, ea);
        end
        m=x0;
        x1 = x0 - dfx / ddfx;
        x0 = x1;
        fm = double(f(m));  % Convertir a número de punto flotante
        numIter2=numIter;
        numIter = numIter + 1;
        if ea < tol
            fprintf('\n');
            return;
        end
    end
end
