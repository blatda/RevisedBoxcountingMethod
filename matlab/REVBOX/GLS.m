function [ a, b, cb1, cb2 ] = GLS( H, A )
% GLS

N = length(A);
C = cov(H);

%ccc=cond(C)

Y = mean(H,1)';
X = [ones(N,1), -log(A)'];

S = X'*pinv(C)*X;
Sinv = pinv(S);
r = X'*pinv(C)*Y;
B = Sinv*r;

%pinv(S)

e = X*B-Y;
ssq  = sum(e.^2);
s2 = ssq/(N-2);
varb2 = Sinv(2,2)*s2;
int = STUDENTTABLE( N-2 )*sqrt(varb2);
cb1 = B(2) - int;
cb2 = B(2) + int;



a = B(1);
b = B(2);
end

