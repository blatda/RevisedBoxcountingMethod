% SCRIPTPLOTH

[ X, dim ] = FRAC43( 7 );
%[ X, dim ] = FRAC32( 11 );
%[ X, dim ] = FRAC53( 7 );
%[ X, dim ] = FRAC83( 7 ); %koberec

X = X(2:end-1,2:end-1);

%A = 2:30;
%A = 20:1:28;
%A = 10:1.7:50;

%A = 10:2:250;



%A = 10:2:250; <= this
A = 10:50:250;

%A = 10:0.7:22;

%A = [5 7 11 13 17 19 23 25];
%A = [1 3 9 27 81 243];
%A = primes(500);

en = 5; % entropy number


rn = 10; % random number
RN = MYRANDNUMS(rn);


R = zeros(rn, en);

H = zeros(length(A),en);
H1 = zeros(rn,length(A));
H2 = zeros(rn,length(A));
H3 = zeros(rn,length(A));
H4 = zeros(rn,length(A));
H5 = zeros(rn,length(A));

[X] = COORDINATES(X);

disp('celkem pruchodu ');
disp(length(A));
for i=1:length(A)
    if mod(i,5) == 0
        disp(i);
    end
    
    for j=1:rn
        Y = RANDROTTRAN( X, RN(j,1), RN(j,2), RN(j,3) );
        [ counter ] = BOXCOUNTPIX2( Y, A(i));
        k = size(counter,1);
        N = sum(counter);
        R(j,1) = log(k);
        R(j,2) = log(k) + (k*(k+1)*log(1+1/k))/N;
        R(j,3) = log(k) + (k*(k+1)*log(1+1/k))/N + (1/2)*(k*(k+2)*(k+1)*(log(k+2)-log(k)-2*k*log(k+1)+k*log(k+2)+k*log(k)))/N^2;
        R(j,4) = log(k) + log(N/(N-k)); 
        R(j,5) = HARTLEYBAYES(N,k);
    end
    H1(:,i) = R(:,1); 
    H2(:,i) = R(:,2); 
    H3(:,i) = R(:,3); 
    H4(:,i) = R(:,4); 
    H5(:,i) = R(:,5); 
    
    H(i,1) = mean(R(:,1));
    H(i,2) = mean(R(:,2));
    H(i,3) = mean(R(:,3));
    H(i,4) = mean(R(:,4)); 
    H(i,5) = mean(R(:,5));
end

disp(dim);
hold on
cmap = hsv(en+1);
cmap = cmap([1,3:end],:);
for i = [1, en] %1:en
  plot(log(A),H(:,i),'-','Color',cmap(i,:));
  [ aa, bb ] = MNCLIN( log(A), H(:,i)' );
  disp(-aa);
  
%   switch i
%     case 1 
%         [ aa, bb, cb1, cb2 ] = GLS( H1, A );
%     case 2
%         [ aa, bb, cb1, cb2 ] = GLS( H2, A );
%     case 3
%         [ aa, bb, cb1, cb2 ] = GLS( H3, A );
%     case 4
%         [ aa, bb, cb1, cb2 ] = GLS( H4, A );
%     case 5
%         [ aa, bb, cb1, cb2 ] = GLS( H5, A );
%   end
%   fprintf('%f \n < %f , %f > (+- %f) \n \n', bb, cb1, cb2, (cb2-cb1)/2 );
end


% plot(log(A),H(:,1),'k-');
% plot(log(A),H(:,2),'g-');
% plot(log(A),H(:,3),'b-');
% plot(log(A),H(:,4),'r-');
% plot(log(A),H(:,5),'k-');
% plot(log(A),H(:,6),'g-');
zacatek = length(A); 
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
legend('H_{0,NAIVE}','H_{0,1}','H_{0,2}','H_{0,LOW}','H_{0,BAYES}','theoretic');
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


