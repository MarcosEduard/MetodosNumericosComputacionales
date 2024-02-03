function [Aprox, ea, er, dffa] = AproxDerivada2(f, a, n, h)
    syms x;
    df = diff(f,x);
    dff = diff(df,x);
    dffa = double(subs(dff,a));
    numIter = 1;
    fa = f(a);
    h = h * 2;
    Aprox = 0;
    fprintf('k          a            h            f(a)           f(a+h)       f(a-h)         Aprox        Ea          Er\n');
    while numIter <= n
        h = h/2;
        AproxAnterior = Aprox;
        fah = f(a + h);
        famh = f(a - h);
        Aprox = (fah-2*fa + famh)/(h*h);
        if numIter == 1
            ea = '';
        else
            ea = abs((Aprox - AproxAnterior) / Aprox)*100;
        end
        er = abs((dffa - Aprox)/dffa)*100;
        fprintf('%d  %13.6f %13.6f %13.6f %13.6f %13.6f  %13.6f %13.4f %13.4f\n', numIter, a, h, fa, fah, famh, Aprox, ea, er);
        numIter = numIter + 1;
    end