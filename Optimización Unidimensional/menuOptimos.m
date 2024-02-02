clc;clear;
opcion1 = 0;
while opcion1 ~= 5
    clc;clear;
            disp('Optimizacion unidimensional no restringida');
            fprintf('\n');
            disp('1. Grafica');
            disp('2. Seccion Dorada');
            disp('3. Interpolacion cuadrática');
            disp('4. Newton');
            disp('5. Salir');
            fprintf('\n');
            opcion1 = input('Seleccione una opción: ');
            clc;
            switch opcion1
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
                    % Método de la Seccion Dorada
                    fprintf('\n');
                    disp('Método de la Seccion Dorada.');
                    fprintf('\n');
                    disp('1. Hallar máximo.');
                    disp('2. Hallar mínimo.');
                    fprintf('\n'); 
          
                    while true
                        
                        opcion2 = input('Selecciona una opción: ');

                        if opcion2 == 1 || opcion2 == 2
                            break; % Sale del bucle si la opción es válida
                        else
                            disp('La opción ingresada no existe. Por favor, elige 1 o 2.');
                        end
                    end
                    clc;
                    % Solicitar datos necesarios
                    funcion = input('Ingrese la función de la ecuación : ', 's');     
                    xl = input('Ingrese el extremo inferior de [xl, xu]: ');
                    xu = input('Ingrese el extremo superior de [xl, xu]: ');
                    tol=input('ingrese la tolerancia: ');
                    maxIter = input('Ingrese el número máximo de iteraciones: ');
                    
                    % Convertir la cadena de entrada en una función de MATLAB
                    f = str2func(['@(x) ' funcion]);
                
                    % Llamar a la función de seccion_Dorada
                    [x1, x2, fx1, fx2, fxx, xx, b, numIter2] = seccion_Dorada(opcion2, f, xl, xu, tol, maxIter);

                    % Mostrar resultado
                    disp('Resultado de la Seccion Dorada');
                    if opcion2==1
                       fprintf('La función máxima es: %.6f\n', fxx);
                       fprintf('El punto para que la función sea máxima es: %.6f\n', xx);  
                       fprintf('Número de iteraciones para llegar a la tolerancia: %d\n', numIter2);

                    end
                    if opcion2==2
                        fprintf('La función mínima es: %.6f\n', -fxx);
                        fprintf('El punto para que la función sea mínima es: %.6f\n', xx);
                        fprintf('Número de iteraciones para llegar a la tolerancia: %d\n', numIter2);

                    end
                        fprintf('Error hallado: %.6f\n', b);

                    pause; % Pausa para que el usuario vea el resultado
                case 3
                    % Método de Interpolacion Cuadrática
                    fprintf('\n');
                    disp('Método de Interpolacion Cuadrática.');
                    fprintf('\n');
                    disp('1. Hallar máximos.');
                    disp('2. Hallar mínimos.');
                    fprintf('\n'); 
          
                    while true
                        opcion2 = input('Selecciona una opción: ');

                        if opcion2 == 1 || opcion2 == 2
                            break; % Sale del bucle si la opción es válida
                        else
                            disp('La opción ingresada no existe. Por favor, elige 1 o 2.');
                        end
                    end
                    clc;
            
                    % Solicitar datos necesarios
                    funcion = input('Ingrese la función de la ecuación : ', 's');     
                    x0 = input('Ingrese x0: ');
                    x1 = input('Ingrese x1: ');
                    x2 = input('Ingrese x2: ');
                    tol=input('Ingrese la tolerancia: ');
                    maxIter = input('Ingrese el número máximo de iteraciones: ');

                    % Convertir la cadena de entrada en una función de MATLAB
                    f = str2func(['@(x) ' funcion]);
            
                    % Llamar a la función de Interpolación Cuadrática
                    [x3, fxx, b, numIter2]=interpolacion_Cuadratica(opcion2, f, x0, x1, x2, tol, maxIter);

                    % Mostrar resultado
                    disp('Resultado de la interpolacion');
                    if opcion2 == 1
                        fprintf('La función máxima es: %.6f\n', fxx);
                        fprintf('El punto para que la función sea máxima es: %.6f\n', x3);
                        fprintf('Número de iteraciones para llegar a la tolerancia: %d\n', numIter2);
                    end

                    if opcion2 == 2
                        fprintf('La función mínima es: %.6f\n', -fxx);
                        fprintf('El punto para que la función sea máxima es: %.6f\n', x3);
                        fprintf('Número de iteraciones para llegar a la tolerancia: %d\n', numIter2);
                    end

                    fprintf('Error hallado: %.6f\n', b);

                        pause; % Pausa para que el usuario vea el resultado              
                case 4
                    % Método de Newton
                    fprintf('\n');
                    disp('Método de Newton seleccionado.');
                    fprintf('\n');
                    disp('1. Hallar máximos.');
                    disp('2. Hallar mínimos.');
                    fprintf('\n');
                    while true
                        opcion2 = input('Selecciona una opción: ');

                        if opcion2 == 1 || opcion2 == 2
                            break; % Sale del bucle si la opción es válida
                        else
                            disp('La opción ingresada no existe. Por favor, elige 1 o 2.');
                        end
                    end
                    clc;
                    % Solicitar datos necesarios
                    funcion = input('Ingrese la función de la ecuación : ', 's');
                    x0 = input('Ingrese el punto inicial: ');
                    tol = input('ingrese tolerancia: ');
                    maxIter = input('Ingrese el número máximo de iteraciones: ');
                    
                    % Convertir las cadenas de entrada en funciones de MATLAB
                    f = str2func(['@(x) ' funcion]);
            
                    % Llamar a la función de Newton
                    [m, fm, b, numIter2] = Newton_para_optimos(opcion2, f, x0, tol, maxIter);

                    % Mostrar resultado
                    fprintf('Resultado del Método de Newton:\n');
                    fprintf('Raiz estimada: %.6f\n', m);
                    fprintf('Valor de la función en la raiz: %.6f\n', fm);
                    fprintf('Número de iteraciones para llegar a la tolerancia: %d\n', numIter2);
                    fprintf('Error: %.6f\n', b);
                    pause; % Pausa para que el usuario vea el resultado
                case 5
                    disp('Saliendo del programa. Hasta luego!');
                    fprintf('\n');
            end
end