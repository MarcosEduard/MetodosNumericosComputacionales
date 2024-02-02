function [c yc] = falsaposicion(f,a,b,tol,maxIter)

  ya = f(a);
  yb = f(b);
  fprintf('\n');

fprintf('\n');
  fprintf( 'k         ak              ck             bk            f(ak)          f(ck)          f(bk)         |fck| < tol  \n');
   for k=1:maxIter
    dx = yb*(b-a) / (yb - ya);
    c = b - dx;
    yc = f(c);
    bool= abs(yc)<tol;
   fprintf('%d  %13.6f  %13.6f  %13.6f  %13.6f  %13.6f  %13.6f  %10d\n',k-1, a , c, b, f(a),f(c),f(b),bool);
  if yc == 0 , break;
    elseif yb*yc > 0;
      b=c;
      yb=yc;
    else
      a = c;
      ya = yc;
    end

    if (abs(yc) < tol)
      break;
    end
  end
  yc = f(c);
  fprintf('\n');
end


