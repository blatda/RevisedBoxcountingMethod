function [ X, dim ] = FRAC23b( h )
%FRAC43 

X = 1;
for i=1:h
    X = [X, 0*X, 0*X; 0*X, 0*X, 0*X; 0*X, 0*X, X];    
end

dim = log(2)/log(3);

end

