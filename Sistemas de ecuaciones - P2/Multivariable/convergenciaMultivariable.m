function convergenciaMultivariable = convergenciaMultivariable(f, g)
    syms xs ys;

    fx = f(xs, ys);
    gy = g(xs, ys);
    dfx = diff(fx, xs);
    dfy = diff(fx, ys);
    dgx = diff(gy, xs);
    dgy = diff(gy, ys);

    dfxx = double(subs(dfx, {xs, ys}, {0, 0}));
    dfyy = double(subs(dfy, {xs, ys}, {0, 0}));

    % Verificar si hay división por cero en la función g
    try
        dgxx = double(subs(dgx, {xs, ys}, {0, 0}));
        dgyy = double(subs(dgy, {xs, ys}, {0, 0}));
    catch
        disp('La convergencia no está garantizada debido a una posible división por cero en la función g.');
        return;
    end
    
    if ((dfxx + dgxx) >= 1) || ((dfyy + dgyy) >= 1)
        % No cumple con la convergencia
        disp('La convergencia no está garantizada.');
    else
        disp('Probabilidad de convergencia');
    end

end
