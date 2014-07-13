function [ X, dim ] = FRAC32( h )
%FRAC32

X = 1;
for i=1:h
    X = [X, 0*X; X, X];    
end

dim = log(3)/log(2);

end

