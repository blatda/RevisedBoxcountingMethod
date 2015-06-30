function [b, se, s2, cb1, cb2, T ] = GLS( A, H, lambda )
% GLS
% y = bX + e
% H(m x n) - m poèet otoèení, n poèet rozmìrù møížky

[m, n] = size(H); 
y = mean(H,1)';
X = [ones(n,1), -log(A')];
V = cov(H)+eye(n)*lambda; 
G = pinv(V);
Varb = inv(X'*G*X);
b = Varb*X'*G*y;

T = sqrtm(G);
%T = pinv(real(TT));



e = X*b-y;
ssq  = e'*e;
se = sqrt(ssq/(n-2));
s2 = se*sqrt(Varb(2,2));

int = STUDENTTABLE( n-2 )*s2;
cb1 = b(2) - int;
cb2 = b(2) + int;
end