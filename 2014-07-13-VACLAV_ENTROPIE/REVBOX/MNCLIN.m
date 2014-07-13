function [ a, b ] = MNCLIN( x, y )
%MNCLIN
%  y = ax + b

sx = sum(x);
sy = sum(y);
sx2 = sum(x.^2);
sxy = sum(x.*y);
n = length(x);

A = [sx2, sx; sx, n];
b = [sxy; sy];

v = linsolve(A,b);

a = v(1);
b = v(2);


end

