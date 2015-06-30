function [b, se, s2] = MNCLIN( A, H )
%MNCLIN
% y = bX + e
% H(m x n) - m poèet otoèení, n poèet rozmìrù møížky

[m, n] = size(H);
y = mean(H,1)';
X = [ones(n,1), -log(A)'];
b = X\y;

Varb = inv(X'*X);

e = X*b-y;
ssq  = e'*e;
se = sqrt(ssq/(n-2));
s2 = se*sqrt(Varb(2,2));
end