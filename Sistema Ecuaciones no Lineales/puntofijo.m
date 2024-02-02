
function   [x fx erel] = puntofijo(f,g,x0,tol,maxIter)
numIter= 0;
 fprintf( 'k       x           g(x)          f(x)          erel           erel < tol  \n');
 fprintf('%d',0);
  fprintf('  %10.6f  ' ,x0);
  fprintf('  %10.6f  ',g(x0));
  fprintf('  %10.6f',f(x0));
  fprintf('\n');
while(numIter<=maxIter)
       x=g(x0);
       fx= f(x);
       eabs= abs(norm(x-x0));
       erel = eabs / (norm(x));
       bool = erel < tol;
       fprintf('%d',numIter+1)  ;
       fprintf('  %10.6f  ',x)  ;
       fprintf('  %10.6f  ',g(x));
       fprintf('  %10.6f  ',fx);
       fprintf('  %10.6f  ',erel);
       fprintf('  %10d',bool);
       fprintf('\n');
      if  (erel < tol)
        fprintf('\n');
        return;
      end
      numIter = numIter+1;
      x0=x;
end

end


