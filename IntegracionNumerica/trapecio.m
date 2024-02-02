function [I, integralValor, ea, et] = trapecio(f, a, b, n)
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
    
    fprintf('i          x(i)           coefi            f(xi)            coefi * f(xi)\n');
    
    while (numIter <= n)

        if (numIter == 0) || (numIter == n)
            coefi = 1;
        else
            coefi =2;
        end

        xi = a + numIter * variacionX;
        fx = f(xi);
        factor = fx * coefi;
        suma = suma + factor;

        I = (variacionX/2) * suma;

        et = abs((I - integralValor) * 100 / integralValor);
        ea = abs((-((b - a)^3) * promSegunDerivada) / (12 * (numIter^2)) * 100 / integralValor);
        
        fprintf('%d  %13.6f  %13.6f  %13.6f   %13.6f\n', numIter, xi, coefi, fx, factor);
        numIter = numIter + 1;
    end
end
