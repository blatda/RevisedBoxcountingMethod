function [H0,sH0]=HARTLEY(k,N)
if nargin == 1
    N=sum(k);
    k=sum(k>0);
end
if k>N-2
    H0=NaN;
    sH0=NaN;
    return
end
p=1;
for j=1:k-1
    p=p*(N-j)/(N+j);
end
q=p;
bay=p;
H0=p*log(k);
sH0=p*log(k)^2;
for j=k+1:1000000
    p=p*j*(j-1)/(j-k)/(N+j-1);
    q=max(q,p);
    bay=bay+p;
    H0=H0+p*log(j);
    sH0=sH0+p*log(j)^2;
    if p/q < 1e-20
        break
    end
end
H0=H0/bay;
sH0=sH0/bay;
sH0=sqrt(sH0-H0^2);
end
    