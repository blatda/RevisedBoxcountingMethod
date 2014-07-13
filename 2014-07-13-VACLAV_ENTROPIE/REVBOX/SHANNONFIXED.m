function H1=SHANNONFIXED(N)
Ntotal=sum(N);
n=length(N);
H1=(N+1)/(Ntotal+n)*(psi(Ntotal+n+1)-psi(N+2))';