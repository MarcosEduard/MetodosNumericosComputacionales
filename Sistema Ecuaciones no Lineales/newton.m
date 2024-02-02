  function [x fx erel] = newton(f,df,x0,tol,maxIter)
  fprintf('\n');
  fprintf( 'k       x(k)          f(xk)              df(xk)            erel              erel < tol\n'  );
  fprintf("%d  %13.6f  %13.6f  %13.6f \n",0,x0,f(x0),df(x0));
  for k =1:maxIter
    x = x0 - (f(x0) / df(x0));
    eabs = abs(x - x0);
    erel = (eabs / abs(x));
    fr = f(x);
    dfr=df(x);
    berel = erel< tol;
    fprintf('%d  %13.6f  %13.6f  %13.6f   %13.6f   %10d \n',k,x,fr,dfr,erel,berel);
    x0=x;
    if (erel< tol)
      break;
    end
 end
  fprintf('\n');
  x=x0;
  fx=f(x);

end

