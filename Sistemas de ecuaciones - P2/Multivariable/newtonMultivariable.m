function [x, y, m, n] = newtonMultivariable(f, g, a, b, xt, yt, tol, maxIter)
    syms xs ys;

    numIter = 0;
    eaf = 0;
    eag = 0;
    fprintf('k          x            ex             erx              y             ey              ery    \n');
    
    while (numIter <= maxIter)
        fx = f(xs, ys);
        gy = g(xs, ys);
        dfx = diff(fx, xs);
        dfy = diff(fx, ys);
        dgx = diff(gy, xs);
        dgy = diff(gy, ys);

        dfxx = double(subs(dfx, {xs, ys}, {a, b}));
        dfyy = double(subs(dfy, {xs, ys}, {a, b}));
        dgxx = double(subs(dgx, {xs, ys}, {a, b}));
        dgyy = double(subs(dgy, {xs, ys}, {a, b}));

        fx_val = double(subs(fx, {xs, ys}, {a, b}));
        gy_val = double(subs(gy, {xs, ys}, {a, b}));

        erx = abs(a - xt) * 100 / xt;
        ery = abs(b - yt) * 100 / yt;        
        
        if numIter == 0
            eaf = '             ';
            eag = '             ';
        end
        
        fprintf('%d  %13.6f   %s%13.6f  %13.6f     %s%13.6f          %d \n', numIter, a, eaf, erx, b, eag, ery);
        fprintf('\n');
        if numIter==0
           eaf=101;eag=101;
       end
        if (eaf < tol) && (eag < tol)
            fprintf('\n');
            x = a;
            y = b;
            return;
        end
        
        numIter = numIter + 1;
        
        A = a; B = b;
        
        a = a - ((fx_val * dgyy - gy_val * dfyy) / (dfxx * dgyy - dfyy * dgxx));
        b = b - ((gy_val * dfxx - fx_val * dgxx) / (dfxx * dgyy - dfyy * dgxx));        
        
        eaf = abs(a - A) * 100 / abs(a);
        eag = abs(b - B) * 100 / abs(b);
        m=eaf; n=eag;
       
    end
    
    x = a; % Asignar valores finales a x e y
    y = b;
end
