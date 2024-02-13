function [I, integralValor, ea, et] = puntoMedio(f, a, b, n)
    syms x;
    df = diff(f, x);
    dff = diff(df, x);
    variacionX = (b - a) / n;
    suma = 0;

    % Convertir la cadena de entrada en una función manejable de MATLAB
    f = matlabFunction(f, 'vars', x); % Añadir 'vars', x para especificar la variable
    df = matlabFunction(df, 'vars', x);
    dff = matlabFunction(dff, 'vars', x);
    
    % Evaluar la integral exacta utilizando la función integral de MATLAB
    integralValor = integral(f, a, b);
    
    % Evaluar la integral de la segunda derivada
    integralTruncamiento = integral(dff, a, b);
    promSegunDerivada = integralTruncamiento / (b - a);
    
    numIter = 0;
    
    fprintf('i          x(i)            xprom(i)            f(x)\n');
    
    while (numIter <= n)
        if numIter == 0
            xi = a;
            xpromi = '';
            fx = '';   
        else
            xianterior = xi;
            xi = a + numIter * variacionX;
            xpromi = (xi + xianterior) / 2;
            fx = f(xpromi);
            suma = suma + fx;
        end

        I = variacionX * suma;

        et = abs((I - integralValor) * 100 / integralValor);
        ea = abs((-((b - a)^3) * promSegunDerivada) / (3 * (numIter^2)) * 100 / integralValor);
        
        fprintf('%d  %13.6f  %13.6f  %13.6f\n', numIter, xi, xpromi, fx);
        numIter = numIter + 1;
    end
end
