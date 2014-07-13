function [Edelta,sdelta,delta]=DIRICHLETGEN(L,M,N,fT,fTn)
delta=zeros(1,M);
for k=1:M
   p=gamrnd(1,1,1,L);
   p=p/sum(p);
   delta(k)=MULTINOMGEN(p,N,fT,fTn);
end
Edelta=mean(delta);
sdelta=std(delta)/sqrt(M);