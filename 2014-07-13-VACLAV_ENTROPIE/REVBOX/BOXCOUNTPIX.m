function [ counter ] = BOXCOUNTPIX( X, a, met)
% X   - binarni ctvercova (krychlova) matice 
% a   - rozliseni v pixelech
% met - metoda pocitani 

if nargin==2
    met = 1;
end


switch met
    case 1
        switch size(X,2)
            case 1
                counter = zeros(ceil(max(X(:,1))/a));
                for i=1:size(X,1)
                    counter(ceil(X(i,1)/a)) = counter(ceil(X(i,1)/a)) + 1;
                end
            case 2
                counter = zeros(ceil(max(X(:,1))/a), ceil(max(X(:,2))/a));
                for i=1:size(X,1)
                    counter(ceil(X(i,1)/a),ceil(X(i,2)/a)) = counter(ceil(X(i,1)/a),ceil(X(i,2)/a)) + 1;
                end
            case 3
                counter = zeros(ceil(max(X(:,1))/a), ceil(max(X(:,2))/a), ceil(max(X(:,3))/a));
                for i=1:size(X,1)
                    counter(ceil(X(i,1)/a),ceil(X(i,2)/a),ceil(X(i,3)/a)) = counter(ceil(X(i,1)/a),ceil(X(i,2)/a),ceil(X(i,3)/a)) + 1;
                end
        end
end

counter = counter(:);
counter = counter(counter~=0);

end

