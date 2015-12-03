function [ X, dim ] = FRAC43d( h )
%FRAC43d 

X = 1;
for i=1:h
    X = [X, X, X; 0*X, 0*X, 0*X; 0*X, X, 0*X];    
end

dim = log(4)/log(3);

end