function [ X, dim ] = FRAC53g( h )
%FRAC53g

X = 1;
for i=1:h
    X = [X, X, 0*X; 0*X, 0*X, X; X, 0*X, X];    
end

dim = log(5)/log(3);

end

