 function [x fx erel] = secante(f,x0,x1,tol,maxIter)

  fprintf( 'k        x(k)        f(x(k))           erel           erel < tol\n');

   fprintf ('%1d  %13.6f  %13.6f \n',0, x0, f(x0));
   fprintf ('%1d  %13.6f  %13.6f \n',1, x1, f(x1));

  for k=1:maxIter
    x = x1 - (f(x1)*(x1-x0))/ (f(x1) - f(x0));
    eabs = abs(x-x1);
    erel = eabs / (abs(x));
    berel = erel < tol;

 fprintf ('%1d  %13.6f  %13.6f   %13.6f   %10d\n',k+1, x, f(x),erel,berel);
    if  (erel< tol)
      break;
    end
    x0=x1;
    x1=x;
   end
   fprintf('\n');
   fx = f(x);
end


