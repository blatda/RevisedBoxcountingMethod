function H1=SHANNONBAYES(Nvec, alpha)
    N=sum(Nvec); K=sum(Nvec>0);
    Nvec=Nvec(Nvec>0);
    bay=1; bay1=SHANNONFIXED(Nvec); H1=bay1/bay; b=1;
    for j=1: length(Nvec)-K
        H1old=H1;
        b=b/j*(K+j) * prod(ones(1, N)-alpha./((K+j)*alpha:N-1+(K+j)*alpha));
        bay=bay+b;
        Nvec=[Nvec,0];
        bay1=bay1+b*SHANNONFIXED(Nvec);
        H1=bay1/bay;
        if bay>1e200;
            bay1=bay1/bay;
            b=b/bay;
            bay=1;
        end
        if abs(H1-H1old)< 1e-8
            break
        end
    end
end