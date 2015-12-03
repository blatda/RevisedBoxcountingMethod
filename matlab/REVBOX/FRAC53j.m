function [ X, dim ] = FRAC53j( h )
%FRAC53j

X = 1;
for i=1:h
    X = [0*X, X, 0*X; 0*X, X, 0*X; X, X, X];    
end

dim = log(5)/log(3);

end

