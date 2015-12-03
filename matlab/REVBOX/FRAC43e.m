function [ X, dim ] = FRAC43e( h )
%FRAC43e 

X = 1;
for i=1:h
    X = [X, X, X; 0*X, 0*X, 0*X; 0*X, 0*X, X];    
end

dim = log(4)/log(3);

end