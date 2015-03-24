function [ RT ] = RANDROTTRAN( X, alpha, movex, movey )
%RANDROTTRAN 
% X .. [n, 2]

if nargin==1 
    alpha = rand*2*pi;
    movex = rand;
    movey = rand;
end

%change to homogenous coordinates
X = [X, ones(length(X),1)]';

%transform matrix
T = [cos(alpha) -sin(alpha) movex; sin(alpha) cos(alpha) movey; 0 0 1];

%apply transformation
RT = T * X;

%back to original coordinates
RT = RT(1:2, :)';

m = min(RT(:,1));
if m < 0 
    RT(:,1) = RT(:,1) - m;
end

m = min(RT(:,2));
if m < 0 
    RT(:,2) = RT(:,2) - m;
end

end
