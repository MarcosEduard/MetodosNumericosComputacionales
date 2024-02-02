clc;clear;
opcion3 = 0;
while opcion3 ~= 5
    clc;clear;
            disp('Sistemas de ecuaciones lineales');
            fprintf('\n');
            disp('1. Graficar')
            disp('2. Métodos analíticos');
            disp('3. Métodos iterativos');
            disp('4. Multivariable')
            disp('5. Salir');
            fprintf('\n');            
            opcion3 = input('Seleccione una opción: ');
            clc;
            switch opcion3
                case 1
                    disp('Graficar función');
                    fprintf('\n');
        
                    % Solicitar datos necesarios
                    funcion = input('Ingrese la función: ', 's');
                    numVariables = input('Ingrese el número de variables (1 o 2): ');

                    switch numVariables
                        case 1
                            f = str2func(['@(x) ' funcion]);
                            x_values = linspace(-10, 10, 100);
                            y_values = f(x_values);
    
                            figure;
                            plot(x_values, y_values);
                            grid on;
                            hold on;
                            set(gcf, 'WindowButtonMotionFcn', @(src, event) Grafica1D(src, f, x_values, y_values));
                            zoom on;
                            datacursormode on;

                        case 2
                            f = str2func(['@(x,y) ' funcion]);
                            [X, Y] = meshgrid(linspace(-10, 10, 100), linspace(-10, 10, 100));
                            Z = f(X, Y);

                            figure;
                            surf(X, Y, Z);
                            grid on;
                            hold on;
                            set(gcf, 'WindowButtonMotionFcn', @(src, event) Grafica2D(src, f, X, Y, Z));
                            zoom on;
                            datacursormode on;

                        otherwise
                            disp('Número de variables no válido.');
                    end

                    pause; % Pausa para que el usuario vea el resultado
                case 2
                    fprintf('\n');
                    disp('Métodos analíticos');
                    fprintf('\n');
                    disp('1. Gauss Jordan');
                    disp('2. Cramer');
                    fprintf('\n');                    
                    opcion4 = input('Seleccione una opción: ');
                    clc;
                        switch opcion4
                            case 1
                                disp('Gauss Jordan');
                                gaussJordanConEntradaDirecta();
                                
                            case 2
                              disp('Cramer');
                              cramer();
                        end
                case 3
                    fprintf('\n');
                    disp('Métodos iterativos');
                    fprintf('\n');
                    disp('1. Jacobi');
                    disp('2. Gauss Seidel');
                    disp('3. Gauss Seidel con relajacion');
                    fprintf('\n');
                    opcion5 = input('Seleccione una opción: ');
                    clc;
                    switch opcion5
                        case 1
                            % Método de Jacobi
                            fprintf('\n');
                            disp('Método de Jacobi.');
            
                            % Solicitar datos necesarios
                            elementos = input('Ingrese la lista de elementos de la matriz: ');
                            elementos2 = input('Ingrese la matriz o vector de resultados: ');
                            tol = input('Ingrese la tolerancia: ');
                            maxIter = input('Ingrese el número máximo de iteraciones: ');

                            % Convertir la lista de elementos a una matriz
                            matriz = reshape(elementos, [], size(elementos, 2));
                            matriz2 = reshape(elementos2, [], size(elementos2, 2));
                            matrizreal = [matriz matriz2];

                            if esDiagonalDominante(matriz)
                                % Llamar a la función de seccion_Dorada
                                [x1, x2, x3, Ea1, Ea2, Ea3] = jacobi(matriz, matriz2, matrizreal, tol, maxIter);
                                % Mostrar resultado
                                disp('Resultado de jacobi');
                                disp(['x1 =', num2str(x1), ', Error(%) x1 = ', num2str(Ea1)]);
                                disp(['x2 =', num2str(x2), ', Error(%) x2 = ', num2str(Ea2)]);
                                disp(['x3 =', num2str(x3), ', Error(%) x3 = ', num2str(Ea3)]);

                                pause; % Pausa para que el usuario vea el resultado
                            else
                                disp('La matriz no es diagonal dominante. La convergencia no está garantizada.');
                            end
                        case 2
                            % Método de Gauss Seidel
                            fprintf('\n');
                            disp('Método de Gauss Seidel.');
            
                            % Solicitar datos necesarios
                            elementos = input('Ingrese la lista de elementos de la matriz: ');
                            elementos2 = input('Ingrese la columna de resultados: ');
                            tol = input('Ingrese la tolerancia: ');
                            maxIter = input('Ingrese el número máximo de iteraciones: ');

                            % Convertir la lista de elementos a una matriz
                            matriz = reshape(elementos, [], size(elementos, 2));
                            matriz2 = reshape(elementos2, [], size(elementos2, 2));
                            matrizreal = [matriz matriz2];

                            if esDiagonalDominante(matriz)
                                % Llamar a la función Guss Seidel
                                [x1, x2, x3, Ea1, Ea2, Ea3] = gaussSeidel(matriz, matriz2, matrizreal, tol, maxIter);
                                % Mostrar resultado
                                disp('Resultado de Gauss Seidel');
                                disp(['x1 =', num2str(x1), ', Error(%) x1 = ', num2str(Ea1)]);
                                disp(['x2 =', num2str(x2), ', Error(%) x2 = ', num2str(Ea2)]);
                                disp(['x3 =', num2str(x3), ', Error(%) x3 = ', num2str(Ea3)]);

                                pause; % Pausa para que el usuario vea el resultado
                            else
                                disp('La matriz no es diagonal dominante. La convergencia no está garantizada.');
                            end
                        case 3
                            % Método de Gauss Seidel con relajacion
                            fprintf('\n');
                            disp('Método de Gauss Seidel con relajacion.');
            
                            % Solicitar datos necesarios
                            elementos = input('Ingrese la lista de elementos de la matriz: ');
                            elementos2 = input('Ingrese la columna de resultados: ');
                            W = input('Ingrese el factor de relajación: ');
                            tol = input('Ingrese la tolerancia: ');
                            maxIter = input('Ingrese el número máximo de iteraciones: ');

                            % Convertir la lista de elementos a una matriz
                            matriz = reshape(elementos, [], size(elementos, 2));
                            matriz2 = reshape(elementos2, [], size(elementos2, 2));
                            matrizreal = [matriz matriz2];

                            if esDiagonalDominante(matriz)            
                                % Llamar a la función Guss Seidel
                                [x1, x2, x3, Ea1, Ea2, Ea3] = gaussSeidel_Relajacion(matriz, matriz2, matrizreal, tol, maxIter, W);
                                % Mostrar resultado
                                disp('Resultado de Gauss Seidel con relajacion');
                                disp(['x1 =', num2str(x1), ', Error(%) x1 = ', num2str(Ea1)]);
                                disp(['x2 =', num2str(x2), ', Error(%) x2 = ', num2str(Ea2)]);
                                disp(['x3 =', num2str(x3), ', Error(%) x3 = ', num2str(Ea3)]);

                                pause; % Pausa para que el usuario vea el resultado
                            else
                                disp('La matriz no es diagonal dominante. La convergencia no está garantizada.');
                            end
                    end                            
                case 4
                    fprintf('\n');
                    disp('1. Analisis de convergencia')
                    disp('2. Punto fijo multivariable');
                    disp('3. Newton Multivariable ');
                    fprintf('\n');
                    opcion6 = input('Seleccione una opción: ');
                    clc;
                    switch opcion6
                        case 1
                            fprintf('\n');
                            % Solicitar datos necesarios
                            funcion = input('Ingrese la primera función de la ecuación : ', 's');
                            funcion2 = input('Ingrese la segunda función de la ecuación : ', 's');
                            % Crear funciones anónimas directamente
                            f = str2func(['@(x, y) (' funcion ')']);
                            g = str2func(['@(x, y) (' funcion2 ')']);
                            convergenciaMultivariable(f, g);
                            

                        case 2
                            % Método de punto fijo multivariable
                            fprintf('\n');
                            disp('Método de punto fijo multivariable.');

                            % Solicitar datos necesarios
                            disp('Ingresar funciones ya despejadas');
                            fprintf('\n');
                            funcion = input('Ingrese la primera función de la ecuación : ', 's');
                            funcion2 = input('Ingrese la segunda función de la ecuación : ', 's');
                            x = input('Ingrese x inicial: ');
                            y = input('Ingrese y incial: ');
                            xt = input('Ingrese x real: ');
                            yt = input('Ingrese y real: ');
                            tol = input('Ingrese la tolerancia: ');
                            maxIter = input('Ingrese el número máximo de iteraciones: ');

                            % Crear funciones anónimas directamente
                            f = str2func(['@(x, y) (' funcion ')']);
                            g = str2func(['@(x, y) (' funcion2 ')']);

  
                            % Llamar a la función de puntofijoMultivariable
                            [x, y, eaf, eag] = puntofijoMultivariable(f, g, x, y, xt, yt, tol, maxIter);

                            % Mostrar resultado
                            disp('Resultado de Punto Fijo Multivariable');
                            disp(['x: ' num2str(x)]);
                            disp(['y: ' num2str(y)]);
                            disp(['Error(%): ' num2str(eaf)]);
                            disp(['Error(%): ' num2str(eag)]);
                        case 3
                            % Método newton multivariable
                            fprintf('\n');
                            disp('Método newton multivariable.');

                            % Solicitar datos necesarios
                            disp('Ingresar funciones sin despejar');
                            fprintf('\n');
                            funcion = input('Ingrese la primera función de la ecuación : ', 's');
                            funcion2 = input('Ingrese la segunda función de la ecuación : ', 's');
                            a = input('Ingrese x inicial: ');
                            b = input('Ingrese y incial: ');
                            xt = input('Ingrese x real: ');
                            yt = input('Ingrese y real: ');
                            tol = input('Ingrese la tolerancia: ');
                            maxIter = input('Ingrese el número máximo de iteraciones: ');

                            % Crear funciones anónimas directamente
                            f = str2func(['@(x, y) (' funcion ')']);
                            g = str2func(['@(x, y) (' funcion2 ')']);

                            % Llamar a la función de puntofijoMultivariable
                            [x, y, m, n] = newtonMultivariable(f,g,a,b,xt, yt, tol,maxIter);
    
                            % Mostrar resultado
                            disp('Resultado de newton Multivariable');
                            disp(['x: ' num2str(x)]);
                            disp(['y: ' num2str(y)]);
                            disp(['Error(%) x: ' num2str(m)]);
                            disp(['Error(%) y: ' num2str(n)]);
                    end
            end
end