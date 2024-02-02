clc;clear all;

while true
    clc; % Limpiar la pantalla

    % Mostrar menú
    disp('Menú para resolver ecuaciones');
    fprintf('\n');
    disp('1. Método Gráfico');
    disp('2. Método de la Bisección');
    disp('3. Método de Falsa Posición');
    disp('4. Método de Newton');
    disp('5. Método de la Secante');
    disp('6. Método del punto fijo');
    disp('7. Salir');
    fprintf('\n');
    opcion = input('Seleccione una opción: ');

    switch opcion
        case 1
            % Método gráfico
            fprintf('\n');
            disp('Método Gráfico seleccionado.');
            
            % Solicitar datos necesarios
            funcion = input('Ingrese la función de la ecuación : ', 's');     
            x_min = input('Ingrese xmín : ');
            x_max = input('Ingrese xmax : ');

            % Convertir la cadena de entrada en una función de MATLAB
            f = str2func(['@(x) ' funcion]);
            %creamos un espacio para graficar
            xx= x_min:0.01:x_max;
            plot(xx,f(xx));
            grid on;
            xlabel('x');
            ylabel('y');
            title('Gráfico de f(x)')
            pause; % Pausa para que el usuario vea el resultado
           
           
        case 2
            % Método de la Bisección
            fprintf('\n');
            disp('Método de la Bisección seleccionado.');
            
            % Solicitar datos necesarios
            funcion = input('Ingrese la función de la ecuación : ', 's');     
            a = input('Ingrese el extremo inferior de [a, b]: ');
            b = input('Ingrese el extremo superior de [a, b]: ');
            tol = input('Ingrese la tolerancia: ');
            maxIter = input('Ingrese el número máximo de iteraciones: ');

            % Convertir la cadena de entrada en una función de MATLAB
             f = str2func(['@(x) ' funcion]);
            
            % Llamar a la función de Bisección
            [c fc error] = mbisec(f,a,b,tol,maxIter);

            % Mostrar resultado
            disp('Resultado del Método de la Bisección:');
            disp(['Raiz estimada: ' num2str(c)]);
            disp(['Valor de la función en la raiz: ' num2str(fc)]);
            disp(['Error: ' num2str(error)]);

           pause; % Pausa para que el usuario vea el resultado

         case 3
            % Método de la Falsa Posicion
            fprintf('\n');
            disp('Método de la Falsa posición seleccionado.');

            % Solicitar datos necesarios
            funcion = input('Ingrese la función de la ecuación : ', 's');
            a = input('Ingrese el extremo inferior de [a, b]: ');
            b = input('Ingrese el extremo superior de [a, b]: ');
            tol = input('Ingrese la tolerancia: ');
            maxIter = input('Ingrese el número máximo de iteraciones: ');

            % Convertir la cadena de entrada en una función de MATLAB
            f = str2func(['@(x) ' funcion]);

            % Llamar a la función de Bisección
            [c fc] = falsaposicion(f,a,b,tol,maxIter);

            % Mostrar resultado
            disp('Resultado del Método de falsa posición:');
            disp(['Raiz estimada: ' num2str(c)]);
            disp(['Valor de la función en la rai­z: ' num2str(fc)]);

           pause; % Pausa para que el usuario vea el resultado

         case 4
            % Método de Newton
            fprintf('\n');
            disp('Método de Newton seleccionado.');

            % Solicitar datos necesarios
            funcion = input('Ingrese la función de la ecuación : ', 's');
            derivada = input('Ingrese la derivada de la función : ', 's');
            x0 = input('Ingrese el punto inicial: ');
            tol = input('Ingrese la tolerancia: ');
            maxIter = input('Ingrese el número máximo de iteraciones: ');

            % Convertir las cadenas de entrada en funciones de MATLAB
            f = str2func(['@(x) ' funcion]);
            df = str2func(['@(x) ' derivada]);

            % Llamar a la función de Newton
            [x, fx, erel] = newton(f, df, x0, tol, maxIter);

            % Mostrar resultado
            disp('Resultado del Método de Newton:');
            disp(['Raiz estimada: ' num2str(x)]);
            disp(['Valor de la función en la raiz: ' num2str(fx)]);
            disp(['Error relativo: ' num2str(erel)]);

            pause; % Pausa para que el usuario vea el resultado

        case 5
            % Método de la secante
            fprintf('\n');
            disp('Método de la Secante seleccionado.');

            % Solicitar datos necesarios
            funcion = input('Ingrese la función de la ecuación : ', 's');
            x0 = input('Ingrese el primer punto inicial: ');
            x1 = input('Ingrese el segundo punto inicial: ');
            tol = input('Ingrese la tolerancia: ');
            maxIter = input('Ingrese el número máximo de iteraciones: ');

            % Convertir la cadena de entrada en una función de MATLAB
            f = str2func(['@(x) ' funcion]);

            % Llamar a la función de Bisección
            [x fx erel] = secante(f,x0,x1,tol,maxIter);

            % Mostrar resultado
            disp('Resultado del Método de la secante');
            disp(['Raiz estimada: ' num2str(x)]);
            disp(['Valor de la función en la rai­z: ' num2str(fx)]);
            disp(['Error relativo: ' num2str(erel)]);

           pause; % Pausa para que el usuario vea el resultado

         case 6
            % Método del punto fijo
            fprintf('\n');
            disp('Método del punto fijo seleccionado.');

            % Solicitar datos necesarios
            funcion = input('Ingrese la función de la ecuación : ', 's');
            funcion_iter = input('Ingrese la función iteración: ', 's');
            x0 = input('Ingrese el punto inicial: ');
            tol = input('Ingrese la tolerancia: ');
            maxIter = input('Ingrese el número máximo de iteraciones: ');

            % Convertir las cadenas de entrada en funciones de MATLAB
            f = str2func(['@(x) ' funcion]);
            g = str2func(['@(x) ' funcion_iter]);

            % Llamar a la función de Newton
            [x, fx, erel] = puntofijo(f, g, x0, tol, maxIter);

            % Mostrar resultado
            disp('Resultado del Método de punto fijo:');
            disp(['Rai­z estimada: ' num2str(x)]);
            disp(['Valor de la función en la raiz: ' num2str(fx)]);
            disp(['Error relativo: ' num2str(erel)]);

            pause; % Pausa para que el usuario vea el resultado
        case 7
            disp('Saliendo del programa...');
            break; % Salir del bucle
        otherwise
            disp('Opción no válida. Intente de nuevo.');
            pause; % Pausa para que el usuario vea el mensaje de error
    end
end


