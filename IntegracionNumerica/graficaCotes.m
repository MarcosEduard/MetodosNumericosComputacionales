function graficaCotes(funcion,a,b, n)
funcion_corregida = strrep(funcion, '*', '.*');
funcion_corregida = strrep(funcion_corregida, '^', '.^');
                    
% Convertir la cadena de entrada en una función de MATLAB
f = str2func(['@(x) ' funcion_corregida]);

% Generar puntos para la gráfica
x = linspace(a, b, 1000);
y = f(x);

% Graficar la función
figure;
plot(x, y, 'LineWidth', 2);
hold on;

% Calcular la integral numérica
integral_numerica = integral(f, a, b);

% Crear rectángulos debajo de la curva
rectangulos_x = linspace(a, b, n);
rectangulos_y = f(rectangulos_x);

% Graficar los rectángulos
bar(rectangulos_x, rectangulos_y, 'FaceColor', 'cyan', 'EdgeColor', 'blue');

% Mostrar el resultado de la integral numérica
title(['Integral numérica: ' num2str(integral_numerica)]);
xlabel('x');
ylabel('y');

% Añadir leyendas
legend('Función', 'Rectángulos de Integración');

% Mostrar la cuadrícula
grid on;

% Mantener la gráfica visible
hold off;
