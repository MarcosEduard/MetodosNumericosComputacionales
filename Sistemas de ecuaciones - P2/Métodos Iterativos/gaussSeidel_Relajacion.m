function [x1, x2, x3, Ea1, Ea2, Ea3] = gaussSeidel_Relajacion(matriz, matriz2, matrizreal, tol, maxIter, W)
    % Verificar si la matriz A es cuadrada
    [filasA, columnasA] = size(matriz);
    if filasA ~= columnasA
        error('La primera matriz debe ser cuadrada para usar el método de Cramer.');
    end

    % Verificar si el vector b tiene el mismo número de filas que A
    if numel(matriz2) ~= filasA
        error('La matriz o vector de resultados debe tener el mismo número de filas que la primera matriz.');
    end
    fprintf('\n');
    fprintf('k           x1           Ea              x2             Ea              x3             Ea             Eabc<tol');
    fprintf('\n\n');
    fprintf('0           0                            0                               0                               0');
    fprintf('\n\n');
    
    x1 = 0; x2 = 0; x3 = 0;
    Ea1 = 0; Ea2 = 0; Ea3 = 0;

    for k = 1:maxIter
        a = x1;
        x1 = (matrizreal(1,4)*W - matrizreal(1,2)*x2*W - matrizreal(1,3)*x3*W+matrizreal(1,1)*x1*(1-W)) / matrizreal(1,1);
        Ea1 = (abs(x1 - a)*100) / abs(x1);

        b = x2;
        x2 = (matrizreal(2,4)*W - matrizreal(2,1)*x1*W - matrizreal(2,3)*x3*W+matrizreal(2,2)*x2*(1-W)) / matrizreal(2,2);
        Ea2 = (abs(x2 - b)*100) / abs(x2);

        c = x3;
        x3 = (matrizreal(3,4)*W - matrizreal(3,1)*x1*W - matrizreal(3,2)*x2*W+matrizreal(3,3)*x3*(1-W)) / matrizreal(3,3);
        Ea3 = (abs(x3 - c)*100) / abs(x3);

        berel = (Ea1 < tol) && (Ea2 < tol) && (Ea3 < tol);
        fprintf('%d  %13.6f  %13.6f  %13.6f   %13.6f  %13.6f   %13.6f   %10d \n', k, x1, Ea1, x2, Ea2, x3, Ea3, berel);

        if berel
            break;
        end

        fprintf('\n');
    end
end
