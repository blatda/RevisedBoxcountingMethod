function H0=HARTLEYBAYES(N,k,nmax)
    nstar=1e7;
    tol=1e200; 
    if nargin == 1
        nmax=length(N);
        k=sum(N>0);
        Ntotal=sum(N);
    else
        Ntotal=N;
    end
    if nargin==2
        nmax=nstar;
    end
    if k>Ntotal-2 && nmax==nstar
        H0=NaN;
        return
    end
    bay=1;
    bay0=log(k);
    b=1;
    H0=bay0/bay;
    for j=1:nmax-k
        H0old=H0;
        b=b/j*(k+j)*(k+j-1)/(k+Ntotal+j-1);
        bay=bay+b;
        bay0=bay0+b*log(k+j);
        H0=bay0/bay;
        if bay>tol
            bay0=bay0/bay;
            b=b/bay;
            bay=1;
        end
        if abs(H0-H0old)< 1e-8
            break
        end
    end
end
    