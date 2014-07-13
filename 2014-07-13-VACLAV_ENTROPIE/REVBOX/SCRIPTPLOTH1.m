% SCRIPTPLOTH1


[ X, dim ] = FRAC43( 7 );
%[ X, dim ] = FRAC32( 11 );
%[ X, dim ] = FRAC53( 7 );
%[ X, dim ] = FRAC83( 7 ); %koberec

X = X(2:end-1,2:end-1);

%A = 5:30;
A = 10:50:250;
%A = 10:4:50;

%A = [5 7 11 13 17 19 23 25];
%A = [1 3 9 27 81 243];
%A = primes(500);

en = 3; % entropy number



rn = 100; % random number
RN = MYRANDNUMS(rn);

R = zeros(rn, en);


H = zeros(length(A),en);
H1 = zeros(rn,length(A));
H2 = zeros(rn,length(A));
H3 = zeros(rn,length(A));


[X] = COORDINATES(X);

disp('celkem pruchodu ');
disp(length(A));
for i=1:length(A)
    if mod(i,5) == 0
        disp(i);
    end
    
    for j=1:rn
        Y = RANDROTTRAN( X, RN(j,1), RN(j,2), RN(j,3) );
        [ counter ] = BOXCOUNTPIX( Y, A(i));
        
        zerosnum = ceil(max(X(:,1))/A(i))*ceil(max(X(:,2))/A(i)) - size(counter,1);
        
        %semi Jeff
        counter = counter + 1/2;
        
        counter = [counter; zeros(zerosnum, 1)]; 
        
        k = size(counter,1);
        N = sum(counter);
        R(j,1) = SHANNON(counter./N);
        R(j,2) = SHANNON(counter./N) + (k-zerosnum-1)/(2*N);
        R(j,3) = SHANNONBAYES(counter');
    end
    H1(:,i) = R(:,1); 
    H2(:,i) = R(:,2); 
    H3(:,i) = R(:,3); 
    
    H(i,1) = mean(R(:,1));
    H(i,2) = mean(R(:,2));
    H(i,3) = mean(R(:,3));
end

disp(dim);
hold on
cmap = hsv(en+1);
cmap = cmap([1,3:end],:);
for i = 1:en
  plot(log(A),H(:,i),'-','Color',cmap(i,:));
  [ aa, bb ] = MNCLIN( log(A), H(:,i)' );
  disp(-aa);
  
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


% plot(log(A),H(:,1),'k-');
% plot(log(A),H(:,2),'g-');
% plot(log(A),H(:,3),'b-');
% plot(log(A),H(:,4),'r-');
% plot(log(A),H(:,5),'k-');
% plot(log(A),H(:,6),'g-');
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


