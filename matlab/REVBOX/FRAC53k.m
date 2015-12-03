function [ X, dim ] = FRAC53k( h )
%FRAC53k

X = 1;
for i=1:h
    X = [0*X, X, 0*X; 0*X, X, X; X, X, 0*X];    
end

dim = log(5)/log(3);

end

