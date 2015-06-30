function [ counter ] = BOXCOUNTPIX2( X, a, met)
% X   - binarni ctvercova (krychlova) matice 
% a   - rozliseni v pixelech
% met - metoda pocitani 

if nargin==2
    met = 1;
end


switch met
    case 1
        t = ceil(max(X)/a)+1;
        subCell = num2cell(t);
        counter = zeros(subCell{:});
        for i=1:size(X,1)
            t = ceil(X(i,:)/a)+1;   %t nesmí být 0, proto pøiètena 1         
            subCell = num2cell(t);
            counter(subCell{:}) = counter(subCell{:}) + 1;
        end
end

counter = counter(:);
%counter = counter(counter~=0);

end