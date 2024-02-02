function Grafica2D(fig, f, X, Y, Z)
    ax = gca(fig);
    currentPoint = get(ax, 'CurrentPoint');
    x = currentPoint(1, 1);
    y = currentPoint(1, 2);
    z = f(x, y);
    
    if interp2(X, Y, Z, x, y) == z
        title(ax, sprintf('Puntero del ratón en (x=%f, y=%f, z=%f)', x, y, z));
    else
        title(ax, 'Coordenada no contenida en la función graficada');
    end
end    