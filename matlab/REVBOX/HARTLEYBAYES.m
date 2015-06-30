function [H0]=HARTLEYBAYES(Nvec, alpha)     
    N = sum(Nvec); K = sum(Nvec>0);           
        bay=1; bay0=log(K); H0=bay0/bay; b=1;
        for j = 1 : length(Nvec)-K
           H0old=H0;        
           b=b*(K+j)/j*prod(ones(1, N)-alpha./(((K+j)*alpha):(N-1+(K+j)*alpha)));
           bay=bay+b;
           bay0=bay0+b*log(K+j);
           H0=bay0/bay;
           if bay>1e200
               bay0=bay0/bay;
               b=b/bay;
               bay=1;           
           end
           if abs(H0-H0old) < 1e-8
               break
           end
        end       
    
end