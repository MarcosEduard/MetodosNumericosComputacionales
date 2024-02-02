clc;clear all;

while true
    clc; % Limpiar la pantalla

    % Mostrar men�
    disp('Men� para resolver ecuaciones');
    fprintf('\n');
    disp('1. M�todo Gr�fico');
    disp('2. M�todo de la Bisecci�n');
    disp('3. M�todo de Falsa Posici�n');
    disp('4. M�todo de Newton');
    disp('5. M�todo de la Secante');
    disp('6. M�todo del punto fijo');
    disp('7. Salir');
    fprintf('\n');
    opcion = input('Seleccione una opci�n: ');

    switch opcion
        case 1
            % M�todo gr�fico
            fprintf('\n');
            disp('M�todo Gr�fico seleccionado.');
            
            % Solicitar datos necesarios
            funcion = input('Ingrese la funci�n de la ecuaci�n : ', 's');     
            x_min = input('Ingrese xm�n : ');
            x_max = input('Ingrese xmax : ');

            % Convertir la cadena de entrada en una funci�n de MATLAB
            f = str2func(['@(x) ' funcion]);
            %creamos un espacio para graficar
            xx= x_min:0.01:x_max;
            plot(xx,f(xx));
            grid on;
            xlabel('x');
            ylabel('y');
            title('Gr�fico de f(x)')
            pause; % Pausa para que el usuario vea el resultado
           
           
        case 2
            % M�todo de la Bisecci�n
            fprintf('\n');
            disp('M�todo de la Bisecci�n seleccionado.');
            
            % Solicitar datos necesarios
            funcion = input('Ingrese la funci�n de la ecuaci�n : ', 's');     
            a = input('Ingrese el extremo inferior de [a, b]: ');
            b = input('Ingrese el extremo superior de [a, b]: ');
            tol = input('Ingrese la tolerancia: ');
            maxIter = input('Ingrese el n�mero m�ximo de iteraciones: ');

            % Convertir la cadena de entrada en una funci�n de MATLAB
             f = str2func(['@(x) ' funcion]);
            
            % Llamar a la funci�n de Bisecci�n
            [c fc error] = mbisec(f,a,b,tol,maxIter);

            % Mostrar resultado
            disp('Resultado del M�todo de la Bisecci�n:');
            disp(['Raiz estimada: ' num2str(c)]);
            disp(['Valor de la funci�n en la raiz: ' num2str(fc)]);
            disp(['Error: ' num2str(error)]);

           pause; % Pausa para que el usuario vea el resultado

         case 3
            % M�todo de la Falsa Posicion
            fprintf('\n');
            disp('M�todo de la Falsa posici�n seleccionado.');

            % Solicitar datos necesarios
            funcion = input('Ingrese la funci�n de la ecuaci�n : ', 's');
            a = input('Ingrese el extremo inferior de [a, b]: ');
            b = input('Ingrese el extremo superior de [a, b]: ');
            tol = input('Ingrese la tolerancia: ');
            maxIter = input('Ingrese el n�mero m�ximo de iteraciones: ');

            % Convertir la cadena de entrada en una funci�n de MATLAB
            f = str2func(['@(x) ' funcion]);

            % Llamar a la funci�n de Bisecci�n
            [c fc] = falsaposicion(f,a,b,tol,maxIter);

            % Mostrar resultado
            disp('Resultado del M�todo de falsa posici�n:');
            disp(['Raiz estimada: ' num2str(c)]);
            disp(['Valor de la funci�n en la rai�z: ' num2str(fc)]);

           pause; % Pausa para que el usuario vea el resultado

         case 4
            % M�todo de Newton
            fprintf('\n');
            disp('M�todo de Newton seleccionado.');

            % Solicitar datos necesarios
            funcion = input('Ingrese la funci�n de la ecuaci�n : ', 's');
            derivada = input('Ingrese la derivada de la funci�n : ', 's');
            x0 = input('Ingrese el punto inicial: ');
            tol = input('Ingrese la tolerancia: ');
            maxIter = input('Ingrese el n�mero m�ximo de iteraciones: ');

            % Convertir las cadenas de entrada en funciones de MATLAB
            f = str2func(['@(x) ' funcion]);
            df = str2func(['@(x) ' derivada]);

            % Llamar a la funci�n de Newton
            [x, fx, erel] = newton(f, df, x0, tol, maxIter);

            % Mostrar resultado
            disp('Resultado del M�todo de Newton:');
            disp(['Raiz estimada: ' num2str(x)]);
            disp(['Valor de la funci�n en la raiz: ' num2str(fx)]);
            disp(['Error relativo: ' num2str(erel)]);

            pause; % Pausa para que el usuario vea el resultado

        case 5
            % M�todo de la secante
            fprintf('\n');
            disp('M�todo de la Secante seleccionado.');

            % Solicitar datos necesarios
            funcion = input('Ingrese la funci�n de la ecuaci�n : ', 's');
            x0 = input('Ingrese el primer punto inicial: ');
            x1 = input('Ingrese el segundo punto inicial: ');
            tol = input('Ingrese la tolerancia: ');
            maxIter = input('Ingrese el n�mero m�ximo de iteraciones: ');

            % Convertir la cadena de entrada en una funci�n de MATLAB
            f = str2func(['@(x) ' funcion]);

            % Llamar a la funci�n de Bisecci�n
            [x fx erel] = secante(f,x0,x1,tol,maxIter);

            % Mostrar resultado
            disp('Resultado del M�todo de la secante');
            disp(['Raiz estimada: ' num2str(x)]);
            disp(['Valor de la funci�n en la rai�z: ' num2str(fx)]);
            disp(['Error relativo: ' num2str(erel)]);

           pause; % Pausa para que el usuario vea el resultado

         case 6
            % M�todo del punto fijo
            fprintf('\n');
            disp('M�todo del punto fijo seleccionado.');

            % Solicitar datos necesarios
            funcion = input('Ingrese la funci�n de la ecuaci�n : ', 's');
            funcion_iter = input('Ingrese la funci�n iteraci�n: ', 's');
            x0 = input('Ingrese el punto inicial: ');
            tol = input('Ingrese la tolerancia: ');
            maxIter = input('Ingrese el n�mero m�ximo de iteraciones: ');

            % Convertir las cadenas de entrada en funciones de MATLAB
            f = str2func(['@(x) ' funcion]);
            g = str2func(['@(x) ' funcion_iter]);

            % Llamar a la funci�n de Newton
            [x, fx, erel] = puntofijo(f, g, x0, tol, maxIter);

            % Mostrar resultado
            disp('Resultado del M�todo de punto fijo:');
            disp(['Rai�z estimada: ' num2str(x)]);
            disp(['Valor de la funci�n en la raiz: ' num2str(fx)]);
            disp(['Error relativo: ' num2str(erel)]);

            pause; % Pausa para que el usuario vea el resultado
        case 7
            disp('Saliendo del programa...');
            break; % Salir del bucle
        otherwise
            disp('Opci�n no v�lida. Intente de nuevo.');
            pause; % Pausa para que el usuario vea el mensaje de error
    end
end


