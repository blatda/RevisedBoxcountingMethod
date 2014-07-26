function H1=SHANNONBAYES(N)
    nstar=1e7;
    tol=1e200; 
    Ntotal=sum(N);
    nmax=length(N);
    k=sum(N>0);
    N=N(N>0);
    if k>Ntotal-2 && nmax==nstar
        H1=NaN;
        return
    end
    bay=1;
    bay1=SHANNONFIXED(N);
    b=1;
    H1=bay1/bay;
    for j=1:nmax-k
        H1old=H1;
        b=b/j*(k+j)*(k+j-1)/(k+Ntotal+j-1);
        bay=bay+b;
        N=[N,0];
        bay1=bay1+b*SHANNONFIXED(N);
        H1=bay1/bay;
        if bay>tol
            bay1=bay1/bay;
            b=b/bay;
            bay=1;
        end
        if abs(H1-H1old)< 1e-8
            break
        end
    end
end
    