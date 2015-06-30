function [ X, dim ] = FRAC53a( h )
%FRAC53a

X = 1;
for i=1:h
    X = [X, 0*X, X; 0*X, X, 0*X; X, 0*X, X];    
end

dim = log(5)/log(3);

end

