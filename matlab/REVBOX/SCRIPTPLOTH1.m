% SCRIPTPLOTH1
clear all; close all; clc;

[ X, dim ] = FRAC43( 7 );
%[ X, dim ] = FRAC32( 11 );
%[ X, dim ] = FRAC53( 7 );
%[ X, dim ] = FRAC83( 7 ); %koberec

X = X(2:end-1,2:end-1);

A = 30:6:60;
%A = 20:1:28;
%A = 10:1.7:50;
%A = 10:2:250; <= this
%A = 10:50:250;
%A = 10:0.7:22;
%A = [5 7 11 13 17 19 23 25];
%A = [1 3 9 27 81 243];
%A = primes(500);

en = 3; % entropy number
rn = 10; % random number
alpha = 0.5;

R = zeros(rn, length(A), en);

[X] = COORDINATES(X);
RN = MYRANDNUMS(rn);

disp(['celkem probehne pruchodu: ' num2str(length(A)) ]);
for i=1:length(A)
    disp(['  ' num2str(i) '. zacinam pocitat pro A: ' num2str(A(i))]);
    for j=1:rn
        Y = RANDROTTRAN( X, RN(j,1), RN(j,2), RN(j,3) );
        Nvec = BOXCOUNTPIX2( Y, A(i));
        
        zerosnum = ceil(max(X(:,1))/A(i))*ceil(max(X(:,2))/A(i)) - size(Nvec,1); %???
        
        %semi Jeff
        %Nvec = Nvec + 1/2; %???
        
        Nvec = [Nvec; zeros(zerosnum, 1)]; 
        
        K = size(Nvec,1); %???
        N = sum(Nvec);
        R(j,i,1) = SHANNON(Nvec./N);                    %naive
        R(j,i,2) = R(j,i,1) + (K-zerosnum-1)/(2*N);     %Miller
        R(j,i,3) = SHANNONBAYES(Nvec);
    end
end

H = squeeze(mean(R, 1));

disp(dim);
hold on
cmap = hsv(en+1);
cmap = cmap([1,3:end],:);
for i = 1:en
  plot(log(A),H(:,i),'-','Color',cmap(i,:));
  X = MNCLIN( log(A)', H(:,i) );
  disp(-X(1));
  
%   switch i
%     case 1 
%         [ aa, bb ] = GLS( H1, A );
%     case 2
%         [ aa, bb ] = GLS( H2, A );
%     case 3
%         [ aa, bb ] = GLS( H3, A );
%   end
%   disp(bb);
  
end

zacatek = 2;
bod = [log(A(zacatek)), H(zacatek,en)];
od = 0;
do = 5;
plot([od, do], [bod(2) + dim*bod(1) - dim*od, bod(2) + dim*bod(1) - dim*do], 'k--', 'LineWidth',1);
xlabel('ln{\it a}','FontSize',10)
ylabel('H_{0}','FontSize',10)
%axis([1.5 3 7.5 9.5])
%axis([1.5 3 7.5 9.5])
pe = -0.1;
axis([log(A(1))-pe log(A(end))+pe min(H(end,:))-pe max(H(1,:))+pe])
legend('H_{1,NAIVE}','H_{1,MILLER}','H_{1,BAYES}','theoretic');
hold off


[ R, SSQ] = EXPLORE(H(:,[1, 3]), A, 5, dim );


