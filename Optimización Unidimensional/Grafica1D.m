function Grafica1D(fig, f, x_values, y_values)
    ax = gca(fig);
    currentPoint = get(ax, 'CurrentPoint');
    x = currentPoint(1, 1);
    y = f(x);
    
    if interp1(x_values, y_values, x) == y
        title(ax, sprintf('Puntero del ratón en (x=%f, y=%f)', x, y));
    else
        title(ax, 'Coordenada no contenida en la función graficada');
    end
end