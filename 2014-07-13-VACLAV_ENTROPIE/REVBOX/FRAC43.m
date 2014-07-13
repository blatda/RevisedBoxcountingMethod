function [ X, dim ] = FRAC43( h )
%FRAC43 

X = 1;
for i=1:h
    X = [X, 0*X, X; 0*X, 0*X, 0*X; X, 0*X, X];    
end

dim = log(4)/log(3);

end

