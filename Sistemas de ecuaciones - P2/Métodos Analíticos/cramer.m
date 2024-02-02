function cramer()
    % Solicitar al usuario que ingrese la lista de elementos
    A = input('Ingrese la lista de elementos de la matriz: ');
    % Solicitar al usuario que ingrese la lista de elementos
    b = input('Ingrese la columna de resultados: ');

    % Convertir la lista de elementos a una matriz
    matriz = reshape(A, [], size(A, 2));
    matriz2 = reshape(b, [], size(b, 2));

    % Verificar si la matriz A es cuadrada
    [filasA, columnasA] = size(matriz);
    if filasA ~= columnasA
        error('La primera matriz debe ser cuadrada para usar el método de Cramer.');
    end

    % Verificar si el vector b tiene el mismo número de filas que A
    if numel(matriz2) ~= filasA
        error('La matriz o vector de resultados debe tener el mismo número de filas que la primera matriz.');
    end

    % Calcular el determinante de la matriz A
    detA = det(matriz);

    % Inicializar el vector de soluciones
    soluciones = zeros(filasA, 1);

    % Resolver el sistema utilizando el método de Cramer
    for i = 1:filasA
        % Crear una copia de la matriz A y reemplazar la columna i con el vector b
        Ai = matriz;
        Ai(:, i) = matriz2;

        % Calcular el determinante de la matriz modificada
        detAi = det(Ai);

        % Calcular la solución para la variable i
        soluciones(i) = detAi / detA;
    end

    % Mostrar las soluciones de manera más clara
    fprintf('Soluciones:\n');
    for i = 1:filasA
        fprintf('x%d = %.4f\n', i, soluciones(i));
    end
end
