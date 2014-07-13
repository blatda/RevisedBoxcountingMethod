function [ X, dim ] = FRAC83( h )
%FRAC83

X = 1;
for i=1:h
    X = [X, X, X; X, 0*X, X; X, X, X];    
end

dim = log(8)/log(3);

end

