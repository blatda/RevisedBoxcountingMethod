function H1=SHANNONBAYES(N, alpha)
    tol=1e200; 
    Ntotal=sum(N);
    nmax=length(N);
    K=sum(N>0);
    N=N(N>0);
    bay=1;
    bay1=SHANNONFIXED(N);
    b=1;
    H1=bay1/bay;
    for j=1:nmax-k
        H1old=H1;
        b=b/j*(K+j)*gamma((K+j)*alpha)/gamma((K+j)*alpha-alpha)*gamma(Ntotal+(K+j)*alpha-alpha)/gamma(Ntotal+(K+j)*alpha);
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
    