function [ X, dim ] = FRAC33e( h )
%FRAC33e 

X = 1;
for i=1:h
    X = [X, 0*X, X; 0*X, X, 0*X; 0*X, 0*X, 0*X];    
end

dim = log(3)/log(3);

end

