clc;clear;
opcion = 0;
while opcion ~= 5
    clc;clear;
            disp('Integracion Numerica');
            fprintf('\n');
            disp('1. Encontrar funcion');
            disp('2. Regla del punto medio');
            disp('3. Regla del trapecio');
            disp('4. Regla de simpson');
            fprintf('\n');
            opcion = input('Seleccione una opción: ');
            clc;
            switch opcion
                case 1
                    % Solicitar datos necesarios
                    x = input('Ingrese columna de los x: ');
                    y = input('Ingrese columna de los y: ');

                    % Llamar a la función local
                    ecuacion = interpolacionNewtonFunc(x, y);

                    % Mostrar resultado
                    fprintf('\n');
                    disp('Ecuacion del polinomio de interpolacion de Newton:');
                    disp(ecuacion);
                    pause;
                case 2
                    % Solicitar datos necesarios
                    funcion = input('Ingrese la función : ', 's');
                    a = input('Ingrese el límite de integración inferior: ');
                    b = input('Ingrese el límite de integración superior: ');
                    n = input('Ingrese el numero de intervalos: ');

                    % Convertir la cadena de entrada en una función de MATLAB
                    f = str2func(['@(x) ' funcion]);

                    % Llamar a la función del punto medio
                    [I, integralValor, ea, et] = puntoMedio(f, a, b, n);
     
                    
                    % Mostrar resultado
                    disp('Resultado del punto medio');
                    fprintf('El valor verdadero de la integral es: %.6f\n', integralValor);
                    fprintf('El valor de la integral por punto medio es: %.6f\n', I);
                    fprintf('Error truncado(%%): %.6f\n', ea);
                    fprintf('Error verdadero(%%): %.6f\n', et);
                    graficaCotes(funcion,a,b,n);
                    pause;
                
                case 3
                    % Solicitar datos necesarios
                    funcion = input('Ingrese la función : ', 's');
                    a = input('Ingrese el límite de integración inferior: ');
                    b = input('Ingrese el límite de integración superior: ');
                    n = input('Ingrese el numero de intervalos: ');

                    % Convertir la cadena de entrada en una función de MATLAB
                    f = str2func(['@(x) ' funcion]);

                    % Llamar a la función del metodo de trapecio
                    [I, integralValor, ea, et] = trapecio(f, a, b, n);
                    % Mostrar resultado
                    disp('Resultado del metodo del trapecio');
                    fprintf('El valor verdadero de la integral es: %.6f\n', integralValor);
                    fprintf('El valor de la integral por metodo del trapecio es: %.6f\n', I);
                    fprintf('Error truncado(%%): %.6f\n', ea);
                    fprintf('Error verdadero(%%): %.6f\n', et);
                    graficaCotes(funcion,a,b,n);
                    pause;

                case 4
                    disp('Regla de simpson');
                    fprintf('\n');
                    disp('1. Regla de simpson 1/3');
                    disp('2. Regla de simpson 3/8');
                    fprintf('\n');
                    opcion1 = input('Seleccione una opción: ');
                    clc;

                    switch opcion1
                        case 1
                            % Solicitar datos necesarios
                            funcion = input('Ingrese la función : ', 's');
                            a = input('Ingrese el límite de integración inferior: ');
                            b = input('Ingrese el límite de integración superior: ');
                            n = input('Ingrese el numero de intervalos: ');

                            % Convertir la cadena de entrada en una función de MATLAB
                            f = str2func(['@(x) ' funcion]);

                            % Llamar a la función del simpsonUnTercio
                            [I, integralValor, ea, et] = simpsonUnTercio(f, a, b, n);
                            % Mostrar resultado
                            disp('Resultado del metodo de Simspon Un tercio');
                            fprintf('El valor verdadero de la integral es: %.6f\n', integralValor);
                            fprintf('El valor de la integral por metodo de Simspon Un tercio: %.6f\n', I);
                            fprintf('Error truncado(%%): %.6f\n', ea);
                            fprintf('Error verdadero(%%): %.6f\n', et);
                            graficaCotes(funcion,a,b,n);
                            pause;

                        case 2
                            % Solicitar datos necesarios
                            funcion = input('Ingrese la función : ', 's');
                            a = input('Ingrese el límite de integración inferior: ');
                            b = input('Ingrese el límite de integración superior: ');
                            n = input('Ingrese el numero de intervalos: ');

                            % Convertir la cadena de entrada en una función de MATLAB
                            f = str2func(['@(x) ' funcion]);

                            % Llamar a la función de Simpon Tres tercios Un octavo
                            [I, integralValor, ea, et] = simpsonTresTerciosUnOctavo(f, a, b, n);
                            % Mostrar resultado
                            disp('Resultado del metodo de Simpon Tres tercios Un octavo');
                            fprintf('El valor verdadero de la integral es: %.6f\n', integralValor);
                            fprintf('El valor de la integral por metodo de Simpon Tres tercios Un octavo: %.6f\n', I);
                            fprintf('Error truncado(%%): %.6f\n', ea);
                            fprintf('Error verdadero(%%): %.6f\n', et);
                            graficaCotes(funcion,a,b,n);
                            pause;

                        otherwise
                            disp('Saliendo del programa. Hasta luego!');
                            fprintf('\n');
                            pause;
                            break;
                            
                    end
                otherwise
                    disp('Saliendo del programa. Hasta luego!');
                    fprintf('\n');
                    pause;
                    break;
            end
end