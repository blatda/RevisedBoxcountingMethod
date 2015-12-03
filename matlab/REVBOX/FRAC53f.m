function [ X, dim ] = FRAC53f( h )
%FRAC53f

X = 1;
for i=1:h
    X = [X, X, 0*X; 0*X, X, 0*X; X, 0*X, X];    
end

dim = log(5)/log(3);

end

