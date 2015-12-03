%ESTIMATE
%estimate entropy of the fractals
clear all

load Init
Size = Base.^Depth;

Alpha = load('AlphaNeeded.mat');
Alpha = Alpha.Alpha;
kk = 0;
indeces = 21;%[1,4:13,16:19,22:27];
Table = zeros(3,7,length(indeces));
for k = indeces %[1,4:20,22:27,21]
    kk = kk + 1;
    sA = A >= Dist(k)*Size(k)^(1/3) & A <= Dist(k)*Size(k)^(2/3); 
    nAlpha = 3;
     cellNvec = load(['MatcellNvec\cellNvec' num2str(k) '.mat']);
     cellNvec = cellNvec.cellNvec;
    disp(['celkem rozmeru mrizek: ' num2str(nA) '  celkem rotaci: ' num2str(nR)]);
    for a=1:nAlpha               
         HMean = ESTIMATE_03_H(cellNvec, nA, A, nR, Alpha(kk, a));
         [b, se, s2] = MNCLIN( A(sA), HMean(sA) );  
         Table(a,1,kk) = Alpha(kk, a);
         Table(a,2,kk) = se;
         Table(a,3,kk) = s2;
         Table(a,4,kk) = b(2);
         Table(a,5,kk) = abs(b(2)-Dim(k));
         Table(a,6,kk) = Table(a,5,kk)/Table(a,3,kk);
         Table(a,7,kk) = 2 - 2*tcdf(Table(a,6,kk), sum(sA)-2);
    end
    save(['Table' num2str(kk) '.mat'], 'Table');
end