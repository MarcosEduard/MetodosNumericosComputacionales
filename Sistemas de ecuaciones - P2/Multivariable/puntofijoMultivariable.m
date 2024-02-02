function   [x, y, eaf, eag] = puntofijoMultivariable(f,g,x,y,xt, yt, tol,maxIter)
numIter= 0;
 fprintf( 'k           x            ex              erx             y              ey              ery      \n');
while(numIter<=maxIter)
       fx = f(x, y);
       gy = g(fx, y);
       erx= abs(x-xt)*100/xt;
       ery= abs(y-yt)*100/yt;
       
       if numIter==0
           eaf = '';
           eag = '';
       end
       fprintf('%d  %13.6f  %13.6f  %13.6f   %13.6f   %13.6f   %13.6f   %d \n',numIter,x,eaf,erx,y,eag,ery);
       fprintf('\n');
       if numIter==0
           eaf=101;eag=101;
       end
       if  (eaf < tol)&&(eag<tol)
        fprintf('\n');
        return;
       end
       eaf= abs(fx-x)*100/fx;
       eag= abs(gy-y)*100/gy;
      numIter = numIter+1;
      x=fx; y=gy;
end

end


