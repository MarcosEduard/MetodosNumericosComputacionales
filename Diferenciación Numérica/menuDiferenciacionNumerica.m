clc;clear;
disp('Diferenciacion numerica');
fprintf('\n');
disp('1. Aproximacion de la primera derivada');
disp('2. Aproximacion de la segunda  derivada');
disp('3. Serie de Taylor');
disp('4. Serie de Mc Laurin');
fprintf('\n');
opcion = input('seleccione una opcion: ');
clc;
switch opcion
    case 1
        % Solicitar datos necesarios
        funcion = input('Ingrese la función : ', 's');
        a = input('Ingrese a: ');
        n = input('Ingrese el numero iteraciones (n): ');
        h = input('Ingrese h: ');

        % Convertir la cadena de entrada en una función de MATLAB
        f = str2func(['@(x) ' funcion]);

        % Llamar a la función de Taylor
        [Aprox, ea, er, dfa] = AproxDerivada1(f, a, n, h);

        %resultado
        fprintf('El valor aproximado: %.6f\n',Aprox);
        fprintf('El valor real es: %.6f\n', dfa);
        fprintf('Error aproximado(%%): %.4f\n', ea);
        fprintf('Error verdadero(%%): %.4f\n', er);
    case 2
        clc; clear;
        % Solicitar datos necesarios
        funcion = input('Ingrese la función : ', 's');
        a = input('Ingrese a: ');
        n = input('Ingrese el numero iteraciones (n): ');
        h = input('Ingrese h: ');

        % Convertir la cadena de entrada en una función de MATLAB
        f = str2func(['@(x) ' funcion]);

        % Llamar a la función de Taylor
        [Aprox, ea, er, dffa] = AproxDerivada2(f, a, n, h);

        %resultado
        fprintf('El valor aproximado: %.6f\n',Aprox);
        fprintf('El valor real es: %.6f\n', dffa);
        fprintf('Error aproximado(%%): %.4f\n', ea);
        fprintf('Error verdadero(%%): %.4f\n', er);
    case 3
        % Solicitar datos necesarios
        funcion = input('Ingrese la función : ', 's');
        equis = input('Ingrese X: ');
        a = input('Ingrese a: ');
        n = input('Ingrese el orden: ');
        
        % Convertir la cadena de entrada en una función de MATLAB
        f = str2func(['@(x) ' funcion]);

        % Llamar a la función de Taylor
        [suma, real, ea, er] = Taylor(f, equis, a, n);

        %resultado
        fprintf('El valor aproximado por Taylor: %.6f\n',suma);
        fprintf('El valor real es: %.6f\n', real);
        fprintf('Error aproximado(%%): %.4f\n', ea);
        fprintf('Error verdadero(%%): %.4f\n', er);
    case 4
        % Solicitar datos necesarios
        funcion = input('Ingrese la función : ', 's');
        equis = input('Ingrese X: ');
        n = input('Ingrese el orden: ');
        
        % Convertir la cadena de entrada en una función de MATLAB
        f = str2func(['@(x) ' funcion]);

        % Llamar a la función de Taylor
        [suma, real, ea, er] = McLaurin(f, equis, n);

        %resultado
        fprintf('El valor aproximado por Taylor: %.6f\n',suma);
        fprintf('El valor real es: %.6f\n', real);
        fprintf('Error aproximado(%%): %.4f\n', ea);
        fprintf('Error verdadero(%%): %.4f\n', er);
        otherwise
        disp('Saliendo del programa. Hasta luego!');
        fprintf('\n');
        pause;
end