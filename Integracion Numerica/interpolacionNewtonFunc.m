function polinomio = interpolacionNewtonFunc(x, y)
    % x e y son los puntos de datos
    % x y y deben ser vectores del mismo tamaño
    
    % Número de puntos de datos
    n = length(x);
    
    % Inicializar la matriz de diferencias divididas
    diferencias_divididas = zeros(n, n);
    
    % Almacenar las diferencias divididas de primer orden
    diferencias_divididas(:, 1) = y';
    
    % Calcular las diferencias divididas de orden superior
    for j = 2:n
        for i = 1:n-j+1
            diferencias_divididas(i, j) = (diferencias_divididas(i+1, j-1) - diferencias_divididas(i, j-1)) / (x(i+j-1) - x(i));
        end
    end
    
    % Coeficientes del polinomio de interpolación de Newton
    coeficientes = diferencias_divididas(1, :);
    
    % Construir la ecuación del polinomio resultante
    polinomio = '';
    for i = 1:length(coeficientes)
        if coeficientes(i) ~= 0
            if i == 1
                polinomio = [polinomio, num2str(coeficientes(i), 10)];
            else
                polinomio = [polinomio, ' + ', num2str(coeficientes(i), 10)];
                for j = 1:i-1
                    polinomio = [polinomio, '*(x - ', num2str(x(j)), ')'];
                end
            end
        end
    end
end
