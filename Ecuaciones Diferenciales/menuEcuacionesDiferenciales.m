clc;clear;
            disp('Ecuaciones diferenciales ordinarias');
            fprintf('\n');
            disp('1. Método de Euler');
            disp('2. Método de Runge Kutta');
            fprintf('\n');
            opcion = input('Seleccione una opción: ');
            clc;
            switch opcion
                case 1
                % Solicitar datos necesarios
                funcion = input('Ingrese la función : ', 's');
                a = input('Ingrese x1: ');
                beta = input('Ingrese y1: ');
                b = input('Ingrese el x ultimo: ');
                n = input('Ingrese el numero de intervalos: ');

                % Crear funciones anónimas directamente
                f = str2func(['@(x, y) (' funcion ')']);

                %llamar
                [yi, ea] = Euler(f, a, beta, b, n);

                %resultado
                fprintf('El valor aproximado: %.6f\n',yi);
                fprintf('Error aproximado(%%): %.4f\n', ea);
                case 2
                % Solicitar datos necesarios
                funcion = input('Ingrese la función : ', 's');
                a = input('Ingrese x1: ');
                beta = input('Ingrese y1: ');
                b = input('Ingrese el x ultimo: ');
                n = input('Ingrese el numero de intervalos: ');

                % Crear funciones anónimas directamente
                f = str2func(['@(x, y) (' funcion ')']);

                %llamar
                [yi, ea] = RungeKutta(f, a, beta, b, n);

                %resultado
                fprintf('El valor aproximado: %.6f\n',yi);
                fprintf('Error aproximado(%%): %.4f\n', ea);
                otherwise
                disp('Saliendo del programa. Hasta luego!');
                fprintf('\n');
                pause;
            end