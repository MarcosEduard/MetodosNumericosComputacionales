function [I, integralValor, ea, et] = simpsonTresTerciosUnOctavo(f, a, b, n)
    syms x;
    df = diff(f, x);
    dff = diff(df, x);
    dfff = diff(dff, x);
    dffff = diff(dfff, x);
    variacionX = (b - a) / n;
    suma = 0;

    % Convertir la cadena de entrada en una función manejable de MATLAB
    f = matlabFunction(f, 'vars', x); % Añadir 'vars', x para especificar la variable
    df = matlabFunction(df, 'vars', x);
    dff = matlabFunction(dff, 'vars', x);
    dfff = matlabFunction(dfff, 'vars', x);
    dffff = matlabFunction(dffff, 'vars', x);

    % Evaluar la integral exacta utilizando la función integral de MATLAB
    integralValor = integral(f, a, b);
    
    % Evaluar la integral de la segunda derivada
    integralTruncamiento = integral(dffff, a, b);
    promCuartaDerivada = integralTruncamiento / (b - a);
    
    numIter = 0;
    
    fprintf('i          x(i)           coefi            f(xi)            coefi * f(xi)\n');
    
    while (numIter <= n)

        if (numIter == 0) || (numIter == n)
            coefi = 1;
        elseif (mod(numIter,3) == 1) || (mod(numIter,3) == 2)
            coefi = 3;
        else
            coefi = 2;
        end

        xi = a + numIter * variacionX;
        fx = f(xi);
        factor = fx * coefi;
        suma = suma + factor;

        I = ((variacionX*3)/8) * suma;

        et = abs((I - integralValor) * 100 / integralValor);
        ea = (abs((-((b - a)^5) * promCuartaDerivada) / (80 * (numIter^4))) * 100 / integralValor);
        
        fprintf('%d  %13.6f  %13.6f  %13.6f   %13.6f\n', numIter, xi, coefi, fx, factor);
        numIter = numIter + 1;
    end
end
