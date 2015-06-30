function [ X, dim ] = FRAC23a( h )
%FRAC43 

X = 1;
for i=1:h
    X = [X, 0*X, 0*X; 0*X, 0*X, X; 0*X, 0*X, 0*X];    
end

dim = log(2)/log(3);

end

