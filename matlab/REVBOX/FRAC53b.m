function [ X, dim ] = FRAC53b( h )
%FRAC53b

X = 1;
for i=1:h
    X = [0*X, X, 0*X; X, X, X; 0*X, X, 0*X];    
end

dim = log(5)/log(3);

end

