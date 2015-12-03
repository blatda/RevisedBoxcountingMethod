%GENERATE
%generates the fractals and their rotations

clear all

load('Init.mat','Dim')

A = [12:4:100 120:20:500]; %grid sizes
nA = length(A);
nR = 20; % number of random rotations
nFRAC = 27;
FRAC = cell(1,nFRAC);
Dim = zeros(1,nFRAC);

Depth = ones(1,nFRAC)*7;
Base = ones(1,nFRAC)*3;
Dist = ones(1,nFRAC);

FRAC{1}  = @FRAC32;  Depth(1) = 11; Base(1) = 2;
FRAC{2}  = @FRAC23a;                                Dist(2) = sqrt(5);
FRAC{3}  = @FRAC23b;                                Dist(3) = sqrt(8);
FRAC{4}  = @FRAC33b;
FRAC{5}  = @FRAC33c;
FRAC{6}  = @FRAC33d;
FRAC{7}  = @FRAC33e;                                Dist(7) = sqrt(2);
FRAC{8}  = @FRAC33f;                                Dist(8) = 2;
FRAC{9}  = @FRAC33g;                                Dist(9) = 2;
FRAC{10} = @FRAC33h;                                Dist(10) = sqrt(2);
FRAC{11} = @FRAC43a;                                Dist(11) = 2;
FRAC{12} = @FRAC43b;                                Dist(12) = sqrt(2);
FRAC{13} = @FRAC43c;                                Dist(13) = 2;
FRAC{14} = @FRAC43d;                                Dist(14) = 2;
FRAC{15} = @FRAC43e;                                Dist(15) = 2;
FRAC{16} = @FRAC53a;                                Dist(16) = sqrt(2);
FRAC{17} = @FRAC53b;    
FRAC{18} = @FRAC53c;
FRAC{19} = @FRAC53d;
FRAC{20} = @FRAC53e;                            
FRAC{21} = @FRAC83; 
FRAC{22} = @FRAC53f;
FRAC{23} = @FRAC53g;
FRAC{24} = @FRAC53h;
FRAC{25} = @FRAC53i;
FRAC{26} = @FRAC53j;
FRAC{27} = @FRAC53k;

cellNvec = cell(nR, nA);

for k=1:nFRAC
    [ X, Dim(k) ] = feval(FRAC{k},Depth(k));
%     X = X(2:end-1,2:end-1);
%     X = COORDINATES(X);
%     RN = MYRANDNUMS(nR); %random numbers
% 
%     disp(['fraktal: ' num2str(k) ', rozmeru mrizek: ' num2str(nA) '  rotaci: ' num2str(nR)]);
%     for j=1:nR
%       Y = RANDROTTRAN( X, RN(j,1)*2*pi, RN(j,2), RN(j,3) );
%       parfor i=1:nA
%            Nvec = BOXCOUNTPIX2( Y, A(i)); 
%            cellNvec(j,i) = {Nvec};
%            disp(['    rotace: ' num2str(j) ', mrizka velikosti: ' num2str(A(i))]);
%       end
%     end
%      
%     save(['cellNvec' num2str(k) '.mat'], 'cellNvec');
end

save Init Dim nFRAC nR A nA Depth Base Dist
