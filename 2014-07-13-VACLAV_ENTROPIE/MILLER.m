function Tn=MILLER(n)
L=length(n);
N=sum(n);
Tn=SHANNON(n/N)+(L-1)/2/N;