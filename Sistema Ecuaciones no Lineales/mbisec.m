function [c  fc error] = mbisec(f,a,b,tol, maxIter)

  fa = f(a);
  fb = f(b);

  fprintf('\n');
  fprintf( 'k         ak            bk            ck            fak            fbk            fck            error           error < tol \n');

 for k=1:maxIter
   c = a + (b-a)/2; % c= (a+b)/2;
   fc = f(c);
   pfc  = abs(fc);
   pc=0.5*(b-a);
  boolc = pc < tol;
  fprintf('%d  %13.9f  %13.9f  %13.9f  %13.9f  %13.9f  %13.9f  %13.9f %10d\n',k-1, a , b, c,fa,fb ,fc , 0.5*(b-a) , boolc);

 if  ( pc< tol)
   break;
 end

  if fc == 0 ;
     a=c;
     b=c;
  elseif fb*fc > 0;
     b=c;
     fb = fc;
  else
     a=c;
     fa = fc;
   end
 end
  fprintf('\n');
  error=pc;
end



