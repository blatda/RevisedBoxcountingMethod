%ENTROPSCRIPT
clc

%p=ones(1,6);
L=5;
M=1000;
N=10;
fT='SHANNON';
fTn='MILLER';
%[delta,T,Tn]=MULTINOMGEN(p,N,fT,fTn)
[Edelta,sdelta,delta]=DIRICHLETGEN(L,M,N,fT,fTn)
pvalue=2-2*normcdf(abs(Edelta)/sdelta)