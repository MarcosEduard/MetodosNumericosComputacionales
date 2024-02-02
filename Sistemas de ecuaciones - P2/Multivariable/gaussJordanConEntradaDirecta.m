function gaussJordanConEntradaDirecta()
    % Solicitar al usuario que ingrese la matriz aumentada
    elementos = input('Ingrese la lista de elementos de la matriz: ');
    elementos2 = input('Ingrese la columna de resultados: ');

    % Convertir la lista de elementos a una matriz
    matriz = reshape(elementos, [], size(elementos, 2));
    matriz2 = reshape(elementos2, [], size(elementos2, 2));

    % Verificar si la matriz A es cuadrada
    [filasA, columnasA] = size(matriz);
    if filasA ~= columnasA
        error('La primera matriz debe ser cuadrada para usar el método de Cramer.');
    end

    % Verificar si el vector b tiene el mismo número de filas que A
    if numel(matriz2) ~= filasA
        error('La matriz o vector de resultados debe tener el mismo número de filas que la primera matriz.');
    end
    matrizreal = [matriz matriz2];

    % Mostrar la matriz original
    fprintf('\nMatriz Aumentada:\n');
    disp(matrizreal);

    % Obtener el tamaño de la matriz
    [filas, ~] = size(matrizreal);
    
    % Aplicar eliminación de Gauss-Jordan
    for i = 1:filas
        % Normalizar la fila i
        matrizreal(i, :) = matrizreal(i, :) / matrizreal(i, i);
        
        % Eliminar otros elementos en la columna i
        for j = 1:filas
            if i ~= j
                matrizreal(j, :) = matrizreal(j, :) - matrizreal(j, i) * matrizreal(i, :);
            end
        end
    end
    

    % Mostrar las soluciones
    fprintf('\nSoluciones:\n');
    disp(matrizreal(:, end));
end
