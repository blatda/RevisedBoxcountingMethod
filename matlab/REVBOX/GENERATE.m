%GENERATE
%generates the fractals and their rotations

clear all

A = [12:4:100 120:20:500]; %grid sizes
nA = length(A);
nR = 20; % number of random rotations
nFRAC = 17;
FRAC = cell(1,nFRAC);
Dim = zeros(1,nFRAC);

Depth = ones(1,nFRAC)*7;
Base = ones(1,nFRAC)*3;
Dist = ones(1,nFRAC);

FRAC{1}  = @FRAC22;  Depth(1) = 11; Base(1) = 2;    Dist(1) = sqrt(2);
FRAC{2}  = @FRAC32;  Depth(2) = 11; Base(2) = 2;
FRAC{3}  = @FRAC23a;                                Dist(3) = sqrt(5);
FRAC{4}  = @FRAC23b;                                Dist(4) = sqrt(8);
FRAC{5}  = @FRAC33a;                                Dist(5) = sqrt(2);
FRAC{6}  = @FRAC33b;
FRAC{7}  = @FRAC33c;
FRAC{8}  = @FRAC33d;
FRAC{9}  = @FRAC33e;                                Dist(9) = sqrt(2);
FRAC{10} = @FRAC33f;                                Dist(10) = 2;
FRAC{11} = @FRAC33g;                                Dist(11) = 2;
FRAC{12} = @FRAC33h;                                Dist(12) = sqrt(2);
FRAC{13} = @FRAC43a;                                Dist(13) = 2;
FRAC{14} = @FRAC43b;                                Dist(14) = sqrt(2);
FRAC{15} = @FRAC53a;                                Dist(15) = sqrt(2);
FRAC{16} = @FRAC53b;                                
FRAC{17} = @FRAC83; 

cellNvec = cell(nR, nA);

for k=1:nFRAC
    [ X, Dim(k) ] = feval(FRAC{k},Depth(k));
    X = X(2:end-1,2:end-1);
    X = COORDINATES(X);
    RN = MYRANDNUMS(nR); %random numbers

    disp(['celkem rozmeru mrizek: ' num2str(nA) '  celkem rotaci: ' num2str(nR)]);
    for j=1:nR  
      disp(['  zacinam pocitat pro rotaci: ' num2str(j)]);
      Y = RANDROTTRAN( X, RN(j,1)*2*pi, RN(j,2), RN(j,3) );
      for i=1:nA
           Nvec = BOXCOUNTPIX2( Y, A(i)); 
           cellNvec(j,i) = {Nvec};
           disp(['     ' num2str(i) '. mrizka velikosti: ' num2str(A(i))]);
      end
    end
     
    save(['cellNvec' num2str(k) '.mat'], 'cellNvec');
end

save Init Dim nFRAC nR A nA Depth Base Dist
