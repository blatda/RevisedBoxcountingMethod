function H1=SHANNONFIXED(Nvec)
N=sum(Nvec);
n=length(Nvec);
H1=((Nvec+1)/(N+n))'*(psi(N+n+1)-psi(Nvec+2));