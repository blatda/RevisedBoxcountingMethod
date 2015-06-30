% SCRIPTTABLE
clear all; close all; clc;

[ X, dim ] = FRAC43(7);
%[ X, dim ] = FRAC32( 11 );
%[ X, dim ] = FRAC53( 7 );
%[ X, dim ] = FRAC83( 6 ); %koberec

X = X(2:end-1,2:end-1);

A = [5 7 10 15 20 30 50 70 100];
%A = 5:5:50;
%A = 20:1:28;
%A = 10:1.7:50;
%A = 10:2:250; <= this
%A = 10:50:250;
%A = 10:0.7:22;
%A = [5 7 11 13 17 19 23 25];
%A = [1 3 9 27 81 243];
%A = primes(500);

en = 2;  % number of estimates types
rn = 10; % number of random rotation
alpha = 0.5 : 0.5 : 5;
alphaLen = length(alpha);

R = zeros(rn, length(A), alphaLen, en); % help matrix

X = COORDINATES(X);
RN = MYRANDNUMS(rn);
disp(['celkem probehne pruchodu: ' num2str(length(A)) ]);
for j=1:rn  
    disp(['  zacinam pocitat pro rotaci: ' num2str(j)]);
    Y = RANDROTTRAN( X, RN(j,1)*2*pi, RN(j,2), RN(j,3) );
    for i=1:length(A) 
        Nvec = BOXCOUNTPIX2( Y, A(i));        
        K = sum(Nvec>0); N = sum(Nvec);        
        R(j, i, :, 1) = log(K)*ones(alphaLen,1);                        %naive
        [R(j, i, :, 2),he,iter] = HARTLEYBAYES(Nvec, alpha');
        [HA,he2,iter2] = HARTLEYBAYES_o(Nvec); %volání staré verze pro ovìøení
        disp(['     ' num2str(i) '. mrizka velikosti: ' num2str(A(i)) '. HARTLEYBAYES: ' num2str(R(j, i, :, end))]);
    end
end
H = squeeze(mean(R, 1));

%GLSmatrix = zeros(alphaLen, 4);
MNCmatrix = zeros(alphaLen, 4);

disp(dim);
for i = 1:en
    for j = 1:alphaLen
      [ b, se, s2 ] = MNCLIN( A, R(:,:,j,i) );
      %[ b2, se2, s22, cb1, cb2, T ] = GLS( A, R(:,:,j,i), 0 );
      MNCmatrix(j,i*2-1) = s2;
      MNCmatrix(j,i*2) = b(2);
      %GLSmatrix(j,i*2-1) = s22;
      %GLSmatrix(j,i*2) = b2(2);
      disp(['alpha: ' alpha(j) ' MNC - ' 'b1: ' num2str(b(1)) '  b2: ' num2str(b(2)) ' se: ' num2str(se)  ' s2: ' num2str(s2) ]);
      %disp(['alpha: ' alpha(j) ' GLS - ' 'b1: ' num2str(b2(1)) '  b2: ' num2str(b2(2)) ' se: ' num2str(se2)  ' s2: ' num2str(s22) '  cb1: ' num2str(cb1) ' cb2: ' num2str(cb2)]);
    end
end
