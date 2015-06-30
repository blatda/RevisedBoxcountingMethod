% SCRIPTPLOTH
clear all; close all; clc;

[ X, dim ] = FRAC43(7);
%[ X, dim ] = FRAC32( 11 );
%[ X, dim ] = FRAC53( 7 );
%[ X, dim ] = FRAC83( 7 ); %koberec

X = X(2:end-1,2:end-1);

A = [5 7 10 15 20 30 50 70 100 150 200 300 500 700 1000];
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
alpha = 1;%0.5 : 0.5 : 10;

R = zeros(rn, length(A), en); % help matrix

X = COORDINATES(X);
RN = MYRANDNUMS(rn);

disp(['celkem probehne pruchodu: ' num2str(length(A)) ]);
 for j=1:rn  
    disp(['  zacinam pocitat pro rotaci: ' num2str(j)]);
    Y = RANDROTTRAN( X, RN(j,1)*2*pi, RN(j,2), RN(j,3) );
    for i=1:length(A) 
        Nvec = BOXCOUNTPIX2( Y, A(i));        
        K = sum(Nvec>0); N = sum(Nvec);        
        R(j, i, 1) = log(K);                        %naive
        R(j, i, 2) = HARTLEYBAYES(Nvec, alpha);
        disp(['     ' num2str(i) '. mrizka velikosti: ' num2str(A(i)) '. HARTLEYBAYES: ' num2str(R(j, i, end))]);
    end
end
H = squeeze(mean(R, 1));

disp(dim);
hold on
cmap = hsv(en+1);
cmap = cmap([1,3:end],:);
for i = 1:en
  plot(log(A),H(:,i),'.-','Color',cmap(i,:));
  [ b, se, s2 ] = MNCLIN( A, R(:,:,i) );
  [ b2, se2, s22, cb1, cb2, T ] = GLS( A, R(:,:,i), 0 );
  %coeff = fgls([ones(size(A')), -log(A)'],H(:,i),'display','final');
  %plot(T*log(A)',T*H(:,i),':','Color',cmap(i,:));
  disp(['MNC - ' 'b1: ' num2str(b(1)) '  b2: ' num2str(b(2)) ' se: ' num2str(se)  ' s2: ' num2str(s2) ]);
  disp(['GLS - ' 'b1: ' num2str(b2(1)) '  b2: ' num2str(b2(2)) ' se: ' num2str(se2)  ' s2: ' num2str(s22) '  cb1: ' num2str(cb1) ' cb2: ' num2str(cb2)]);
end

zacatek = length(A); 
bod = [log(A(zacatek)), H(zacatek,en)];
od = 0;
do = 5;
plot([od, do], [bod(2) + dim*bod(1) - dim*od, bod(2) + dim*bod(1) - dim*do], 'k--', 'LineWidth',1); %theoretic
xlabel('ln{\it a}','FontSize',10)
ylabel('H_{0}','FontSize',10)
%axis([1.5 3 7.5 9.5])
%axis([1.5 3 7.5 9.5])
pe = -0.1;
axis([log(A(1))-pe log(A(end))+pe min(H(end,:))-pe max(H(1,:))+pe])
legend('H_{0,NAIVE}', 'H_{0,BAYES}','theoretic');
title(['alpha: ' num2str(alpha(1))])
hold off

% best = inf;
% bestSSQ = inf;
% for i=10:10
%    
%     [RES, SSQ] = EXPLORE(H(:,[1, 5]), A, i, dim, 0 );
%     %for j=1:size(SSQ,2)
%         if min(SSQ(1,:) - SSQ(2,:)) < bestSSQ
%             bestSSQ = min(SSQ(1,:) - SSQ(2,:));
%             best = i;
%         end
%     %end   
%     
% end
% 
% [ R, SSQ] = EXPLORE(H(:,[1, 5]), A, best, dim );


%EXPLORE(H(:,[1, 5]), A, 2, dim )
%EXPLORE(H(:,[1, 5]), A, 10, dim )