function [ RT ] = RANDROTTRAN( X, alpha, movex, movey )
%RANDROTTRAN 
% X .. [n, 2]

if nargin==1 
    alpha = rand(1)*2*pi;
    movex = rand(1);
    movey = rand(1);
end

s = sin(alpha);
c = cos(alpha);

RT = zeros(size(X,1), 2);

for i=1:size(X,1)
    RT(i,1) = X(i,1)*c - X(i,2)*s;
    RT(i,2) = X(i,1)*s + X(i,2)*c;
end

m = min(RT(:,1));
if m < 0 
    RT(:,1) = RT(:,1) - m;
end

m = min(RT(:,2));
if m < 0 
    RT(:,2) = RT(:,2) - m;
end

RT(:,1) = RT(:,1) + movex;
RT(:,2) = RT(:,2) + movey;

end

