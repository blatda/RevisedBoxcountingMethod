function [delta,T,Tn]=MULTINOMGEN(p,N,fT,fTn)
p=p/sum(p);
T=feval(fT,p);
n=0*p;
p=cumsum(p);
for k=1:N
   r=unifrnd(0,1);
   index=find(r<=p,1,'first');
   n(index)=n(index)+1;
end
L=length(n);
n=[n(n>0),0];
if length(n)>L
    n=n(1:L);
end
Tn=feval(fTn,n);
delta=Tn-T;