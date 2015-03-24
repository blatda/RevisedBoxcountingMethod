function H0=HARTLEYBAYES(N, alpha)
    tol=1e200; 
    nmax=length(N);
    K=sum(N>0);
    Ntotal=sum(N);

    bay=1; bay0=log(K); H0=bay0/bay; b=1;
    for j=1:nmax-K
       H0old=H0;
       b=b/j*(K+j)*gamma((K+j)*alpha)/gamma((K+j)*alpha-alpha)*gamma(Ntotal+(K+j)*alpha-alpha)/gamma(Ntotal+(K+j)*alpha);
       %b=b/j*(k+j)*(k+j-1)/(k+Ntotal+j-1);
       bay=bay+b;
        bay0=bay0+b*log(K+j);
        H0=bay0/bay;
        if bay>tol
            bay0=bay0/bay;
            b=b/bay;
            bay=1;
        end
        if abs(H0-H0old) < 1e-8
            break
        end
    end
end