function b=BSERIES(N,k,alpha,nmax)
b=zeros(1,nmax);
a=1-alpha;
for n=1:nmax
    j=n-k;
    if j<0
        continue
    end
    p=1;
    for i=1:j
        p=p*(k+i)/i;
    end
    for i=0:N-1
        p=p*(k*a+i)/((k+j)*a+i);
    end
    b(n)=p;
end