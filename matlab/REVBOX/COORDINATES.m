function [X] = COORDINATES(dB)

switch ndims(dB) %number of dimensions
    case 1
        X = find(dB);
    case 2
        [i,j] = find(dB);
        X = [i,j];
    case 3
        %[i,j,k] = find(dB);
        [i,j,k] = ind2sub(size(dB),find(dB));
        X = [i,j,k];
end

end

