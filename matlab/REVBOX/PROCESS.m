close all
clear all

load Init 
load Init2

%minDist = [sqrt(2) 1 1 1]; %todo
%maxDist = Dist.*Base.^Depth;%[sqrt(2)*3^7, 1*2^11, 1*3^7, 1*3^7]; %todo
Size = Base.^Depth; %q = maxDist./minDist

Table = zeros(nAlpha, 7, nFRAC); %sloupce alpha, se, sD, D, D-D_theoretical

bestAlpha = zeros(nFRAC,1);

for k=1:nFRAC 
    H = load(['H' num2str(k) '.mat']);
    sA = A >= Dist(k)*Size(k)^(1/3) & A <= Dist(k)*Size(k)^(2/3); 
    %cellH = cellH.cellH;
    %Hnaive = cell2mat(cellH(:,:,1)); %dim = [nR nA]
    %Hnaive = permute(Hnaive,[3 2 1]); %dim = [1 nA nR]
    %HnaiveMean = squeeze(mean(Hnaive,3)); %dim = [1 nA]
    
    %Hbayes = cell2mat(cellH(:,:,2)); %dim = [nRxnAplha nA]
    %Hbayes = reshape(Hbayes,[nAlpha,nR,nA-3]);  %dim = [nAplha nR nA]
    %Hbayes = permute(Hbayes,[1 3 2]); %dim = [nAplha nA nR]
    %HbayesMean = squeeze(mean(Hbayes,3)); 
    
    %HMean = [HnaiveMean; HbayesMean];
    HMean = mean(H.H,3);   
       
    
    %graph
    %figure
    %plot( log(A(sA)), HMean(sAlpha, sA) + Dim(k) * ones(sum(sAlpha),1)*log(A(sA)) );
    
    %table
    loadedAlpha = load(['Alpha' num2str(k) '.mat']);
    loadedAlpha = loadedAlpha.Alpha;
    nAlpha = size(HMean,1);
    for a=1:nAlpha
        nextAlpha = loadedAlpha(a);
        if(a>1 && nextAlpha == 0)
            continue
        end
        Table(a,1,k) = loadedAlpha(a);
        [ b, se, s2 ] = MNCLIN( A(sA), HMean(a,sA) );
        Table(a,2,k) = se;
        Table(a,3,k) = s2;
        Table(a,4,k) = b(2);
        Table(a,5,k) = abs(b(2)-Dim(k));
        Table(a,6,k) = Table(a,5,k)/Table(a,3,k);
        Table(a,7,k) = 2 - 2*tcdf(Table(a,6,k), sum(sA)-2);
        bestAlpha(k) = Table(a,1,k);
    end
    
  %  Table2 = Table(2:end,:,:);
    
   % bestAlpha(k) = interp1(Table(2:end,4,k), Table(2:end,1,k), Dim(k));
    
%     figure
%     hold on
%     plot( log(Table(:,1,k)), log(Table(:,4,k)), 'b-' );
%     plot( log(Table(:,1,k)), log(Dim(k)), 'ko-');
%     title([num2str(k) '. FRAC - log(alpha) vs. log(D)']); xlabel('log(alpha)'); ylabel('log(D)');
%     grid on
%     hold off
%     
%     figure   
%     plot( log(Table(:,1,k)), log(Table(:,3,k)) );
%     title([num2str(k) '. FRAC - log(alpha) vs. log(s_D)']); xlabel('log(alpha)'); ylabel('log(s_D)');
end


%bod = [log(A(nA)), min(HMean(:))];
%od = 0;
%do = 7;
%plot([od, do], [bod(2) + dim*bod(1) - dim*od, bod(2) + dim*bod(1) - dim*do], 'k--', 'LineWidth',1); %theoretic
%xlabel('ln{\it a}','FontSize',10)
%ylabel('H_{0}','FontSize',10)