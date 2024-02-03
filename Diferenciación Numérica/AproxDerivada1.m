function [Aprox, ea, er, dfa] = AproxDerivada1(f, a, n, h)
    syms x;
    df = diff(f,x);
    dfa = double(subs(df,a));
    numIter = 1;
    fa = f(a);
    h = h * 2;
    Aprox = 0;
    fprintf('k          a             h            F1            F2        (F2-F1)/h         Ea           Er\n');
    while numIter <= n
        h = h/2;
        AproxAnterior = Aprox;
        fah = f(a + h);
        Aprox = (fah-fa)/h;
        if numIter == 1
            ea = '';
        else
            ea = abs((Aprox - AproxAnterior) / Aprox)*100;
        end
        er = abs((dfa - Aprox)/dfa)*100;
        fprintf('%d  %13.6f %13.6f %13.6f %13.6f %13.6f %13.4f %13.4f\n', numIter, a, h, fa, fah, Aprox, ea, er);
        numIter = numIter + 1;
    end