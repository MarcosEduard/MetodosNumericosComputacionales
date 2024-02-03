function [suma, real, ea, er] = Taylor(f, equis, a, n)
    syms x
    real = f(equis);
    numIter = 0;
    suma = 0;
    fprintf('k           Valor aprox.          ea                     er\n');
    while (numIter <= n)
        if numIter == 0
            df = f;
            dfx = df(a);
        else
            df = diff(df, x);
            dfx = double(subs(df,a));
        end
        Aprox = (dfx * ((equis - a) ^ numIter))/(factorial(numIter));
        sumaAnterior = suma;
        suma = suma + Aprox;
        if numIter == 0
            ea ='';
        else
            ea = abs((suma - sumaAnterior)/suma)*100;
        end
        er = abs((real - suma)/real)*100;
        fprintf('%d      %13.6f       %13.4f        %13.4f\n',numIter,suma,ea,er);
        numIter = numIter +1;
    end
end