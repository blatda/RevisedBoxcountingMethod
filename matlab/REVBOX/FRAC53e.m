function [ X, dim ] = FRAC53e( h )
%FRAC53e

X = 1;
for i=1:h
    X = [X, X, 0*X; 0*X, 0*X, X; X, X, 0*X];    
end

dim = log(5)/log(3);

end

